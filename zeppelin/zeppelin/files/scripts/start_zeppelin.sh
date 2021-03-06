#!/bin/bash

#Require NOTEBOOK_BASE_PORT, default value was 8030
#Require DATADIR environment variable
#Require SPARK_EGO_USER environment variable
export SPARK_MASTER=$1
export DATADIR=/opt/data
export DEPLOY_UNTAR_TOP=/opt/zeppelin-0.5.0-incubating-bin-spark-1.4.0_hadoop-2.3/zeppelin-0.5.0-incubating
export DEBUG=$DATADIR/debug
export NOTEBOOK_PORT_FILE=${DATADIR}/ports

mkdir -p $DATADIR/notebooks/
cp -r $DEPLOY_UNTAR_TOP/conf/  $DATADIR/

cd $DATADIR/conf/
cp zeppelin-env.sh.template zeppelin-env.sh
cp zeppelin-site.xml.template zeppelin-site.xml
export CONFIG_FILE=zeppelin-env.sh
export SITE_FILE=zeppelin-site.xml
PORT_FILE=$DATADIR/ports
echo $NOTEBOOK_BASE_PORT > $PORT_FILE
echo $NOTEBOOK_WEBSOCKET_PORT >> $PORT_FILE

# Set JAVAHOME
sed -i "s,# export JAVA_HOME=.*$,export JAVA_HOME=$JAVA_HOME,g" $CONFIG_FILE
# Set master url
masterurl=spark://$SPARK_MASTER:$SPARK_MASTER_PORT
sed -i "s,# export MASTER=.*$,export MASTER=$masterurl,g" $CONFIG_FILE
# check whether the interpreter.json file exists, if exists, update its masterurl 
if [ -f "interpreter.json" ];  then
    sed -i "s,\"master\":.*$,\"master\": \"$masterurl\"\,,g" interpreter.json
fi

#ZEPPELIN_NOTEBOOK_DIR
notebookdir=$DATADIR/notebooks/
sed -i "s,# export ZEPPELIN_NOTEBOOK_DIR.*$,export ZEPPELIN_NOTEBOOK_DIR=$notebookdir,g" $CONFIG_FILE

#ZEPPELIN_IDENT_STRING
identstring=$SPARK_EGO_USER
sed -i "s,# export ZEPPELIN_IDENT_STRING.*$,export ZEPPELIN_IDENT_STRING=$identstring,g" $CONFIG_FILE

#ZEPPELIN_PID_DIR
mkdir -p $DATADIR/run/
piddir=$DATADIR/run/
sed -i "s,# export ZEPPELIN_PID_DIR.*$,export ZEPPELIN_PID_DIR=$piddir,g" $CONFIG_FILE

#SPARK_HOME
echo export SPARK_HOME=$SPARK_HOME >> $CONFIG_FILE
Folder="${SPARK_HOME}/lib/ego"
for file in ${Folder}/*; do
    file_name=`basename $file`
    CLASSPATH_TEMP=${SPARK_HOME}/lib/ego/${file_name}:${CLASSPATH_TEMP}
done
echo CLASSPATH=${CLASSPATH_TEMP}${CLASSPATH} >> $CONFIG_FILE

#read from ports
k=1
while read line;do
portarray[k]=$line
((k++))
done < $PORT_FILE

#ZEPPELIN_PORT
sed -i "s,8080,${portarray[1]},g" $SITE_FILE

#WEBSOCKET_PORT
sed -i "s,-1,${portarray[2]},g" $SITE_FILE

# apply spark on ego config
sparkonego_conf_dir=$SPARK_HOME/conf
if [ -f "${sparkonego_conf_dir}/spark-env.sh" ]; then
  # Promote all variable declarations to environment (exported) variables
  set -a
  . "${sparkonego_conf_dir}/spark-env.sh"
  set +a
fi

$DEPLOY_UNTAR_TOP/bin/zeppelin-daemon.sh --config $DATADIR/conf/ start
while [ 1 ];
do
	sleep 5
done


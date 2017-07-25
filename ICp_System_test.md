## ICp System Test High Level Test Plan



### Environment

Following hardware and software resource needed.**1. Environment:**

* Icp:  
        
        3 master nodes + 300 x86 workers.

        3 master nodes + 300 ppc64le workers.

* Docker: 1.17.06-ce

* OS: Ubuntu 16.04 LTS

* Network: Calico

* Storage: GlusterFS/GPFS/etc（need storage&network squad input）
		      
		      
		      
### Scalability Test.

**Scalability Test Criteria:**

| Priority | Scalability Metric| Criteria  | Comments |
|------|------|------|------|
| P1 | ICp Master nodes| 3 | |
| P1 | ICp worker nodes|300| |
| P1 | ICp workloads | 9000 |30 pods per node|
| P1 | ICp services | 900 | 1 service match 10 pods|
| P1 | Ingress service | 100 | |
| P1 | Users | 10000 | the number was from SuperVessel|
| P2 | Namespace | 10000 | the numer was from SuperVessel |
| P1 | Network | | need network&storage squad input|
| P1 | Storage | | need network&storage squad input |




**Test Strategy**:

The scalability test will be devided into each Sprint and each of squad need to handle their part in each Sprint.


**Test Sprint1**:
  
  * Infrastructure squad draft the test plan and collect the environment requirement from other squad.
  * Infrastructure squad prepare the environment based on the current environment.
  * Each squad draft the scalability test criteria, test cases, test scripts in this sprint. 


**Test Sprint2**:

  * Below cases will be handled by Infrastructure squad in Sprint 2:
      
       1) Deploy 300 worker nodes in ICp
       
       2) Deploy 9000 pods(1 pods per 9000 deployments)
       
       3) Deploy 9000 pods(10 pods per 900 deployments) (P2)
       
       4) Deploy 9000 pods(100 pods per 90 deployments) (P2)
       
       5) Deploy 9000 pods(1000 pods per 9 deployments)
   
  * Below cases need to be handled by other squad in Sprint 2:

       1) **TBD**

**Test Sprint3**

* Below cases will be handled by Infrastructure squad in Sprint 3:

      1) Create 10000 users in ICp
      
      2) Create 10000 namespaces in ICp
      
      3) Create 900 services resource in ICp
      
* Below cases need to be handled by other squad in Sprint 3:
      
      1) **TBD**
      
**Test Sprint4**

* Bug retest related to scalability test

* Patch the Sprint3 features and do the related scalability test.



### Performance Test

The performance test will be executed in each Sprint and each of the squard should test their own performance cases.


**Performance Test Criteria:**

| Priority | Performance Metric| Criteria  | Comments |
|------|------|------|------|
| P1 | cli/api response | ~1s | |
| P1 | GUI response |  | need platform-ui squad input|
| P1 | Pod start time | ~500s | 95% pod ready |
| P1 | Service discover time | ~2s | |
| P1 | CRUD users | api response time within 1s| |
| P2 | CRUD namespace | api response time within 1s | |
| P1 | Network TPS | | need network&storage squad input |
| P1 | Disk I/O | | need network&storage squad input |
| P1 | Application QPS | | need service squad input |
| P1 | Concurrent users| | need platform-ui squad input | 
| P2 | Installation | | monitor the time of environment ready|
| ... | ... | ... | ...|



**Test Sprint1**

* Below cases will be handled by Infrastructure squad in Sprint 1:

	1) monitor the Installation time of each installer component/tasks.
	
	2) monitor the time of 300 nodes register in ICp.

**Test Sprint2**

* Below cases will be handled by Infrastructure squad in Sprint 2:

   1) Monitor the pod start time, record the time of 50% ready time, 85% ready time, 95% ready time to ensure the time match the performance criteria.
   
   2) Monitor the CLI response time to ensure the time match the performance criteria.
   
   3) Monitor the API response time(kubernetes api, keystone auth api) to ensure the time match the performance criteria.
      
   
* Below cases will be handled by other squad in Sprint 2:

   1) Network TPS comparation test(network&storage squad):
      
        a. compare the container to container network TPS with container to host
        
        b. compare the container to container network TPS with host to host
        
        c. compare the network TPS with ipip_enable and ipip_disable
        
        d. compare the different network solution with other vendor 
        

   2) Disk I/O(network&storage squad)
        
         need other squad input
         
   3) Service comparation test(need service squad input)
   
        a. compare the service performance in ICp and out of ICp(put the service out of the docker/ICp)
 

**Test Sprint3**

* Below cases will be handle by Infrastructure squad in Sprint 3.
 
   1) Monitor the time of service discover time to ensure the performance match the performance criteria
   
   2) Monitor the time of delete deployments/pods/service response time to ensure the performance data match the performance criteria
   
   
  
* Below cases will be handled by platform-ui squad in Sprint 4.

  1) Concurrent users use Jmeter/load runner to ensure the performance match the performance criteria.
  
  2) page response time.
  
 
* Below cases will be handled by service squad in Sprint 4.

   1) Service performance(use some tools like Jmeter/load runner/Vegeta to simulate the client call to esure the service performance match the performance criteria)

  
**Test Sprint4**

* Bug retest which related to performance test.

* Patch the Sprint3 features and do the related performance cases.



### Reliability Test

The test will be handled in test Sprint 3 before external release and Oct release.

* And below cases will be handled by Infrastructure squad:

    1). ICp master HA

    2). ICp System service and management service recover

    3). ICp workloads recover


* Below cases will be handled by storage&network squad(need storage&network squad input):

    1). Network reliability
    
    2). Storage reliability
    
* Below cases will be handled by service squad(need service squad input)
    
	 1). Service reliability(start concurrent client to send request, and during the service recive the request, shutdown some of pods to see the error request percentage.)
    

### Longevity and Stress Test


The Longevity and Stress test will started from Sprint 1 and finished before RC sanity check, and each test cycle will run in 7*24 hours.

And the main focus was on cluster healty like: monitory the cluster resource usage like cpu/memory usage to ensure no leak.


* The Longevity test cases will be finalized at the end of Sprint 1.

* Each squad need to prepare the test cases, test scripts and other scripts which used to monitor the system load in each sprint and patch their cases in the Longevity test environment in each test cycle.

* Before new sprint started, the longevity test environment need to be patched with the latest build(each sprint will have a small release, so we can use the release packages in Longevity test) and re-run in 7*24 hours.

* Need platform-ui provide the UI automation tools in longevity test.(need platform-ui squad input)

* Any longevity cases with service?(need service squad input)

### Feature integration Test

* Each of squad focal should go through the new features delivery in each sprint and consider which features have interaction with others, pick them out and do interaction test to make sure the interaction quality.
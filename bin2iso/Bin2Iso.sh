#!/bin/bash

echo FILE ”$1.bin” BINARY >> $1.cue
echo TRACK 01 MODE1/2352 >> $1.cue
echo INDEX 01 00:00:00 >> $1.cue
bchunk $1.bin $1.cue $1_
rm $1.cue

#!/bin/bash


SVRLIST=`cat mgr/aisvrlistAll.txt`
if [[ $1 == "single" ]]; then
SVRLIST=`cat mgr/aisvrlistSingle.txt`
elif  [[ $1 == "group1" ]]; then
SVRLIST=`cat mgr/aisvrlistGroup1.txt`
elif  [[ $1 == "group2" ]]; then
SVRLIST=`cat mgr/aisvrlistGroup2.txt`
fi
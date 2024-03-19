#!/bin/bash


SVRLIST=`cat aisvrlistAll.txt`
if [[ $1 == "single" ]]; then
SVRLIST=`cat aisvrlistSingle.txt`
elif  [[ $1 == "group1" ]]; then
SVRLIST=`cat aisvrlistGroup1.txt`
elif  [[ $1 == "group2" ]]; then
SVRLIST=`cat aisvrlistGroup2.txt`
fi
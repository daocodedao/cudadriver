#!/bin/bash
# 拷贝python环境到所有机器

SRCDIR=`pwd`
PARENT_SRCDIR=$(dirname "$(pwd)")

. ${SRCDIR}/colors.sh

. readServer.sh $1

localIp=`ifconfig eth0 | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'`

for i in $SVRLIST
do

if [[ $i != $localIp ]]; then
echo -e
echo -e
echo -e
echo "${YELLOW}$i${NOCOLOR}"
ssh $i mkdir -p ${PARENT_SRCDIR}
scp -r ${PARENT_SRCDIR}/dirvers/ fxbox@$i:${PARENT_SRCDIR}/roop/cudadriver

fi

done;
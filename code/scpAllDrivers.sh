#!/bin/bash
# copy drivers to all machine

SRCDIR=`pwd`
PARENT_SRCDIR=$(dirname "$(pwd)")

echo $SRCDIR
echo $PARENT_SRCDIR

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
scp -r ${PARENT_SRCDIR}/drivers/ fxbox@$i:${PARENT_SRCDIR}

fi

done;

#!/bin/bash
# 拷贝代码到所有机器

SRCDIR=`pwd`
. ${SRCDIR}/colors.sh

. readServer.sh $1

for i in $SVRLIST
do
echo -e
echo -e
echo -e
echo "${YELLOW}$i${NOCOLOR}"
ssh $i mkdir -p ${SRCDIR}
scp -r ${SRCDIR} fxbox@$i:/data/work

done;

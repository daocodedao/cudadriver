#!/bin/bash
# copy code to all machine

SRCDIR=`pwd`
PARENT_SRCDIR=$(dirname "$(pwd)")

echo $SRCDIR
echo $PARENT_SRCDIR

. ${SRCDIR}/colors.sh

. readServer.sh $1

for i in $SVRLIST
do
echo -e
echo -e
echo -e
echo "${YELLOW}$i${NOCOLOR}"
ssh $i mkdir -p ${SRCDIR}
scp -r ${SRCDIR} fxbox@$i:$PARENT_SRCDIR

done;

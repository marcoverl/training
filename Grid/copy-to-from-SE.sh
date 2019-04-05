#!/bin/bash
source /cvmfs/grid.cern.ch/etc/profile.d/setup-cvmfs-ui.sh
export VOMS_USERCONF=`pwd`/etc/grid-security/vomses
export X509_VOMS_DIR=`pwd`/etc/grid-security/vomsdir
voms-proxy-init -voms euindia
sudo yum -y install libtool-ltdl
export LCG_GFAL_INFOSYS=lcg-bdii.cern.ch:2170
FILE=test-$(date +%d-%m-%Y-$RANDOM).txt
echo test>$FILE
lcg-cp file:///`pwd`/$FILE srm://grid2.fe.infn.it:8444/euindia/training/$FILE
lcg-ls -l srm://grid2.fe.infn.it:8444/euindia/training/
lcg-cp srm://grid2.fe.infn.it:8444/euindia/training/$FILE file:///`pwd`/copy-of-$FILE
ls -l copy-of-$FILE
lcg-del -l srm://grid2.fe.infn.it:8444/euindia/training/$FILE
lcg-ls -l srm://grid2.fe.infn.it:8444/euindia/training/$FILE
rm -f $FILE copy-of-$FILE

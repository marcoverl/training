#!/bin/bash
mkdir -p etc/grid-security/vomses
mkdir -p etc/grid-security/vomsdir/euindia
ln -s /cvmfs/grid.cern.ch/etc/grid-security/vomsdir/*  etc/grid-security/vomsdir/
ln -s /cvmfs/grid.cern.ch/etc/grid-security/vomses/*  etc/grid-security/vomses/
export VOMS_USERCONF=`pwd`/etc/grid-security/vomses
export X509_VOMS_DIR=`pwd`/etc/grid-security/vomsdir
#
cat<<EOF>etc/grid-security/vomses/euindia-voms2.cnaf.infn.it
"euindia" "voms2.cnaf.infn.it" "15010" "/C=IT/O=INFN/OU=Host/L=CNAF/CN=voms2.cnaf.infn.it" "euindia"
EOF
cat<<EOF>etc/grid-security/vomses/euindia-voms-02.pd.infn.it
"euindia" "voms-02.pd.infn.it" "15010" "/DC=org/DC=terena/DC=tcs/C=IT/L=Frascati/O=Istituto Nazionale di Fisica Nucleare/CN=voms-02.pd.infn.it" "euindia"
EOF
cat<<EOF>etc/grid-security/vomsdir/euindia/voms2.cnaf.infn.it.lsc
/C=IT/O=INFN/OU=Host/L=CNAF/CN=voms2.cnaf.infn.it
/C=IT/O=INFN/CN=INFN Certification Authority
EOF
cat<<EOF>etc/grid-security/vomsdir/euindia/voms-02.pd.infn.it.lsc
/DC=org/DC=terena/DC=tcs/C=IT/L=Frascati/O=Istituto Nazionale di Fisica Nucleare/CN=voms-02.pd.infn.it
/C=NL/ST=Noord-Holland/L=Amsterdam/O=TERENA/CN=TERENA eScience SSL CA 3
EOF

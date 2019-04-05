#!/bin/bash
yum -y install http://repository.egi.eu/sw/production/umd/4/centos7/x86_64/updates/umd-release-4.1.3-1.el7.centos.noarch.rpm
yum -y install cvmfs cvmfs-config-default
cat<<EOF>/etc/cvmfs/default.local
CVMFS_REPOSITORIES=wenmr.egi.eu,west-life.egi.eu,dirac.egi.eu,grid.cern.ch
CVMFS_CACHE_BASE=/var/lib/cvmfs
CVMFS_QUOTA_LIMIT=10000
CVMFS_HTTP_PROXY="http://squid-01.pd.infn.it:3128|http://squid-02.pd.infn.it:3128"
EOF
cvmfs_config setup
cvmfs_config chksetup
cvmfs_config probe

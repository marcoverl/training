# Testing lcg-* commands with SRM Storage Elements
Once logged in your CentOS7 Virtual Machine on CloudVeneto.it, follow the instructions below: 
```
# copy sources:
$ sudo yum install git -y
$ git clone https://github.com/marcoverl/training.git
$ cd training/Grid
#
# set up CMVFS and VO:
$ sudo ./setup-cvmfs.sh
$ ./setup-euindia-vo.sh
#
# import your credentials:
$ ./setup-x509.sh
## manually copy your x509 personal certificate <your-cert>.p12 in ~/.globus/ and then execute:
$ WD=$PWD; cd ~/.globus; ./makepems.sh <your-cert>.p12; cd $WD
#
# set up the grid UI environment:
$ sudo yum install libtool-ltdl -y
$ source /cvmfs/grid.cern.ch/etc/profile.d/setup-cvmfs-ui.sh
$ export VOMS_USERCONF=$PWD/etc/grid-security/vomses X509_VOMS_DIR=$PWD/etc/grid-security/vomsdir 
$ export LCG_GFAL_INFOSYS=lcg-bdii.cern.ch:2170
$ voms-proxy-init -voms euindia
#
# playing with the SE
$ ./copy-to-from-SE.sh
```

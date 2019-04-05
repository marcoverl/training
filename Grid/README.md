# Testing lcg-* commands with SRM Storage Elements
Once logged in your CentOS7 Virtual Machine on CloudVeneto.it, follow the instructions below: 
```
$ sudo yum install git -y
$ git clone https://github.com/marcoverl/training.git
$ cd training/Grid
$ sudo ./setup-cvmfs.sh
$ ./setup-euindia-vo.sh
$ ./setup-x509.sh
# copy your x509 personal certificate <your-cert>.p12 in ~/.globus/ and then execute:
$ WD=`pwd`; cd ~/.globus; ./makepems.sh <your-cert>.p12; cd $WD
$ ./copy-to-from-SE.sh
```

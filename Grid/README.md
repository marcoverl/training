Once logged in your CentOS7 Vitual Machine on CloudVeneto.it, follow the instructions below: 
```
$ sudo ./setup-cvmfs.sh
$ ./setup-euindia-vo.sh
$ ./setup-x509.sh
# copy your x509 personal certificate <your-cert>.p12 in ~/.globus/ and the execute:
$ cd .globus; ./makepems.sh <your-cert>.p12; cd
$ ./copy-to-from-SE.sh
```

# Example of direct jobs submission to a ARC-CE
ARC client can be installed e.g. on CentOS7 by doing:
```
$ yum install http://repository.egi.eu/sw/production/umd/4/centos7/x86_64/updates/umd-release-4.1.3-1.el7.centos.noarch.rpm
$ yum install nordugrid-arc-client-tools
```
Then for submitting/monitoting/getting output of a job use e.g.:
```
$ arcproxy --voms enmr.eu
$ arcsub --debug --direct -c arc-6-kit.gridka.de helloworld.jsdl
$ arcstat -a
$ arcget <job ID>
```

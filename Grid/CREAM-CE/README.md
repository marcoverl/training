# Example of direct jobs submission to a CREAM-CE
```
$ voms-proxy-init --voms enmr.eu
$ glite-ce-job-submit -a -o jid -r ce06.ncg.ingrid.pt:8443/cream-sge-gridq cream.jdl
$ glite-ce-job-status -i jid
$ glite-ce-job-output -i jid
```

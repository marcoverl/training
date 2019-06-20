Example of direct jobs submission to a CREAM-CE:
$ glite-ce-job-submit -a -o jid -r  ice.esc.qmul.ac.uk:8443/cream-slurm-sl6_lcg_gpu cream.jdl
$ glite-ce-job-status -i jid
$ glite-ce-job-output -i jid

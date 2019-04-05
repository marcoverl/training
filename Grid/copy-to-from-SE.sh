#!/bin/bash
FILE=test-$(date +%d-%m-%Y-$RANDOM).txt
echo test>$FILE
lcg-cp file:///`pwd`/$FILE srm://grid2.fe.infn.it:8444/euindia/training/$FILE
lcg-ls -l srm://grid2.fe.infn.it:8444/euindia/training/
lcg-cp srm://grid2.fe.infn.it:8444/euindia/training/$FILE file:///`pwd`/copy-of-$FILE
ls -l copy-of-$FILE
lcg-del -l srm://grid2.fe.infn.it:8444/euindia/training/$FILE
lcg-ls -l srm://grid2.fe.infn.it:8444/euindia/training/$FILE
rm -f $FILE copy-of-$FILE

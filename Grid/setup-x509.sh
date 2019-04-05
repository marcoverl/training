#!/bin/bash
mkdir .globus
cat<<EOF>.globus/makepems.sh
if [ "x\$1" = "x" ]; then
  SUPP_CERTS=\$(ls *.p12)
  echo "ERROR: certificate.p12 not specified"
  echo
  echo "USAGE: $0 <certificate.p12>"
  echo "       Supported certs: \$SUPP_CERTS "
  echo "Exit."
  echo
  exit 1
else
  CERT=\$1
fi
openssl pkcs12 -clcerts -nokeys -in \$CERT -out usercert.pem
openssl pkcs12 -nocerts -in \$CERT -out userkey.pem
chmod 400 usercert.pem userkey.pem
EOF
chmod u+x .globus/makepems.sh
# copy in .globus directory your x509 personal certificate in .p12 format an then execute ./makepems.sh

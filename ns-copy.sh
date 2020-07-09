#!/bin/bash

DOMAIN=$1

CERTPATH=/etc/letsencrypt/live/$DOMAIN
CERTFILE=$CERTPATH/cert.pem
KEYFILE=$CERTPATH/privkey.pem
CHAINFILE=$CERTPATH/chain.pem

openssl rsa -outform der -in $KEYFILE -out ./tmp/$DOMAIN-key.key
openssl x509 -outform der -in $CERTFILE -out ./tmp/$DOMAIN-cert.cer
openssl x509 -outform der -in $CHAINFILE -out ./tmp/$DOMAIN-chain.cer

./ns-copytons.py save ./tmp/$DOMAIN-cert.cer ./tmp/$DOMAIN-key.key ./tmp/$DOMAIN-chain.cer $DOMAIN

rm ./tmp/$DOMAIN-key.key
rm ./tmp/$DOMAIN-cert.cer
rm ./tmp/$DOMAIN-chain.cer

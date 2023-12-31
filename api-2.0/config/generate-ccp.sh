#!/bin/bash

function one_line_pem {
    echo "`awk 'NF {sub(/\\n/, ""); printf "%s\\\\\\\n",$0;}' $1`"
}


function json_ccp {
    local PP=$(one_line_pem $4)
    local CP=$(one_line_pem $5)
    local PP1=$(one_line_pem $6)
    sed -e "s/\${ORG}/$1/" \
        -e "s/\${P0PORT}/$2/" \
        -e "s/\${CAPORT}/$3/" \
        -e "s#\${PEERPEM}#$PP#" \
        -e "s#\${CAPEM}#$CP#" \
        -e "s#\${PEERPEM1}#$PP1#" \
        -e "s#\${P0PORT1}#$7#" \
        ./ccp-template.json
}
ORG=1
P0PORT=7051
P0PORT1=8051
CAPORT=7054
PEERPEM=../../artifacts/channel/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/tlscacerts/tls-localhost-7054-ca-org1-example-com.pem
PEERPEM1=../../artifacts/channel/crypto-config/peerOrganizations/org1.example.com/peers/peer1.org1.example.com/tls/tlscacerts/tls-localhost-7054-ca-org1-example-com.pem
CAPEM=../../artifacts/channel/crypto-config/peerOrganizations/org1.example.com/msp/tlscacerts/ca.crt

echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM $PEERPEM1 $P0PORT1)" > connection-org1.json

ORG=2
P0PORT=9051
P0PORT1=10051
CAPORT=8054
PEERPEM=../../artifacts/channel/crypto-config/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/tlscacerts/tls-localhost-8054-ca-org2-example-com.pem
PEERPEM1=../../artifacts/channel/crypto-config/peerOrganizations/org2.example.com/peers/peer1.org2.example.com/tls/tlscacerts/tls-localhost-8054-ca-org2-example-com.pem
CAPEM=../../artifacts/channel/crypto-config/peerOrganizations/org2.example.com/msp/tlscacerts/ca.crt

echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM $PEERPEM1 $P0PORT1)" > connection-org2.json

ORG=3
P0PORT=11051
P0PORT1=12051
CAPORT=10054
PEERPEM=../../artifacts/channel/crypto-config/peerOrganizations/org3.example.com/peers/peer0.org3.example.com/tls/tlscacerts/tls-localhost-10054-ca-org3-example-com.pem
PEERPEM1=../../artifacts/channel/crypto-config/peerOrganizations/org3.example.com/peers/peer1.org3.example.com/tls/tlscacerts/tls-localhost-10054-ca-org3-example-com.pem
CAPEM=../../artifacts/channel/crypto-config/peerOrganizations/org3.example.com/msp/tlscacerts/ca.crt


echo "$(json_ccp $ORG $P0PORT $CAPORT $PEERPEM $CAPEM $PEERPEM1 $P0PORT1)" > connection-org3.json

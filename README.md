1.clone the Repo
-->git clone https://github.com/AshokkumarMdx/Hlf-3OrgNetwork.git
2.Move to  channel directory from the Home directory
-->cd artifacts/channel
3.Run the command
--->./create-artifacts.sh
4.cd .. (Move to artifacts directory Run the docker-images)
--->docker-compose up -d
5.cd ..(Move to Main directory Run the channel creation file)
-->./createChannel.sh
6.Run the chaincode-deployment file
./deployChaincode1.sh
 

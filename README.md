clone the Repo
git clone https://github.com/AshokkumarMdx/Hlf-3OrgNetwork.git
Move to  channel directory from the Home directory
cd artifacts/channel
Run the command ./create-artifacts.sh
cd .. (Move to artifacts directory)
Run the docker-images
docker-compose up -d
cd ..(Move to Main directory)
Run the channel create file
./createChannel.sh
Run the chaincode-deployment file
./deployChaincode1.sh
 

FROM maven:3.6.3-openjdk-11-slim

ADD lib/install_baseimage.sh /root/quorum-maker/install_baseimage.sh
RUN /root/quorum-maker/install_baseimage.sh

ADD staging/tessera/tessera-app/target/tessera-app.jar /tessera/tessera-app.jar

ADD staging/quorum/build/bin/geth /usr/local/bin
ADD staging/quorum/build/bin/bootnode /usr/local/bin

ADD staging/quorum-maker-nodemanager/quorum-maker-nodemanager /root/quorum-maker/NodeManager
ADD staging/quorum-maker-ui/webApp/dist /root/quorum-maker/NodeManagerUI/qm

ADD lib/start_nodemanager.sh /root/quorum-maker/start_nodemanager.sh
RUN chmod +x /root/quorum-maker/start_nodemanager.sh

ADD lib/reset_chain.sh /root/quorum-maker/reset_chain.sh
RUN chmod +x /root/quorum-maker/reset_chain.sh

ADD staging/quorum-maker-nodemanager/NetworkManagerContract.sol /root/quorum-maker/NetworkManagerContract.sol
ADD staging/quorum-maker-nodemanager/NodeUnavailableTemplate.txt /root/quorum-maker/NodeUnavailableTemplate.txt
ADD staging/quorum-maker-nodemanager/JoinRequestTemplate.txt /root/quorum-maker/JoinRequestTemplate.txt
ADD staging/quorum-maker-nodemanager/TestMailTemplate.txt /root/quorum-maker/TestMailTemplate.txt
ADD staging/quorum-maker-nodemanager/nmcBytecode /root/quorum-maker/nmcBytecode

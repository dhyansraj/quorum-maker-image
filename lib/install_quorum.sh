#!/bin/bash

source qm.variables
source lib/common.sh 

echo $CYAN"Building Quorum, "$quorum_version"..."$COLOR_END

rm -rf staging/quorum

docker run -ti --rm -v ${HOME}:/root -v $(pwd)/staging:/git alpine/git clone https://github.com/jpmorganchase/quorum.git
docker run -ti --rm -v ${HOME}:/root -v $(pwd)/staging:/git -w /git/quorum alpine/git checkout $quorum_version
docker run -it --rm -v $(pwd)/staging/quorum:/quorum -w /quorum golang:1.15 make all

## Change the owneship of quorum directory
chownDir 'staging/quorum'

echo $CYAN"Building Quorum, "$quorum_version" Completed."$COLOR_END

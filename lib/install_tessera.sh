#!/bin/bash

source qm.variables
source lib/common.sh 

echo $CYAN"Downloading Tessera, "$tessera_version"..."$COLOR_END

rm -rf staging/tessera

## Change the owneship of tessera directory
chownDir 'staging/tessera'

mkdir -p staging/tessera/tessera-app/target

wget https://oss.sonatype.org/service/local/repositories/releases/content/com/jpmorgan/quorum/tessera-app/0.10.6/tessera-app-${tessera_version}-app.jar \
     -O staging/tessera/tessera-app/target/tessera-app.jar

echo $CYAN"Downloading Tessera, "$tessera_version" Completed."$COLOR_END

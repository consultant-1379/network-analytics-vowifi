#!/bin/bash
 
if [ "$2" == "" ]; then
    	echo usage: $0 \<Branch\> \<RState\>
    	exit -1
else
	versionProperties=install/version.properties
	theDate=\#$(date +"%c")
	module=$1
	branch=$2
	workspace=$3
fi
#added a test comment
#added a comment
function getProductNumber {
        product=`cat $PWD/build.cfg | grep $module | awk -F " " '{print $3}'`
}
function setRstate {
        revision=`cat $PWD/build.cfg | grep $module | awk -F " " '{print $4}'`
	
	#if git tag | grep $product-$revision; then
        	#rstate=`git tag | grep ${product}-${revision} | tail -1 | sed s/.*-// | perl -nle 'sub nxt{$_=shift;$l=length$_;sprintf"%0${l}d",++$_}print $1.nxt($2) if/^(.*?)(\d+$)/';`
			#rstate=02
        #else
		ammendment_level=33
	        rstate=$revision$ammendment_level
	#fi
	mv vowifi/build/feature-release.xml vowifi/build/feature-release.${rstate}.xml
		echo "Building rstate:$rstate"
		echo "$rstate" > params.txt
		echo "$product" >> params.txt
}
getProductNumber
setRstate

#!/bin/bash

#This will show you a simple example on how to use command passed in
# arguments in your bash script
#This is about the $@ and $* argument call in bash


function quoted_at {

	echo "$@"
}

function not_quoted_at {
	echo $@

}

function quoted_star {
	echo "$*"
}

function not_quoted_star {
	echo $*
}

## Now we will call the Functions on after the Other

echo "####### function quoted_at #######"
 quoted_at "one" "two" "five and six"

echo "###### function not_quoted_at #####"
 not_quoted_at  one two five and six

echo "###### function quoted_star ######"
 quoted_star "one" "two" "five and six"

echo " ##### function not_quoted_star ###"

 not_quoted_star one two five and six

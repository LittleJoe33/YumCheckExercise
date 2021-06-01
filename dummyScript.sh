File="RPMListDummyChallengeSan.txt"
Lines=$(cat $File)
RPM=$1

# FORMAT FOR REGEXP = vcg-iid-simulator-1.75.1-425.el7.x86_64.rpm 
# FORMAT FOR REGEXP = vcg-iid-simulator-((VERSION)).el7.x86_64.rpm

#regex='-(([[:digit:]]+)\.([[:digit:]]+)\.([[:digit:]]+))\-'

regex='-(([[:digit:]]+)\.([[:digit:]]+)\.([[:digit:]]+)\-([[:digit:]]+))\.'

[[ "$RPM" =~ $regex ]]

echo "${BASH_REMATCH[1]}"
echo "${BASH_REMATCH[2]}"
echo "${BASH_REMATCH[3]}"
echo "${BASH_REMATCH[4]}"
echo "${BASH_REMATCH[5]}"

##[[ "$RPM" =~ $regex ]]

truncate -s 0 matches.txt
truncate -s 0 nonMatches.txt

for Line in $Lines
    do
        if [[ "$RPM" == "$Line" ]]; then
            echo "$Line" >> matches.txt
        else
            echo "$Line" >> nonMatches.txt
        fi
    done
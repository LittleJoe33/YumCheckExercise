File="RPMListDummyChallengeSan.txt"
Lines=$(cat $File)
RPM=$1

# FORMAT FOR REGEXP = vcg-iid-simulator-1.75.1-425.el7.x86_64.rpm 
# FORMAT FOR REGEXP = vcg-iid-simulator-((VERSION)).el7.x86_64.rpm 
# Comment to test GIT
 
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
File="RPMListDummyChallengeSan.txt"
Lines=$(cat $File)
RPM=$1

truncate -s 0 matches.txt
truncate -s 0 nonMatches.txt

for Line in $Lines
    do
        echo "$RPM"
        echo "$Line"
        if [[ "$RPM" == "$Line" ]]; then
            #echo 'match'
            echo "$Line" >> matches.txt
        else
            #echo "no"
            echo "$Line" >> nonMatches.txt
        fi
    done
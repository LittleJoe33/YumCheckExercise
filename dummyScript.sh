File="RPMListDummyChallengeSan.txt"
Lines=$(cat $File)
RPM=$1

regex='-(([[:digit:]]+)\.([[:digit:]]+)\.([[:digit:]]+)\-([[:digit:]]+))\.'

[[ "$RPM" =~ $regex ]]

uversion="${BASH_REMATCH[1]}"
umajor="${BASH_REMATCH[2]}"
uminor="${BASH_REMATCH[3]}"
upatch="${BASH_REMATCH[4]}"
ubuild="${BASH_REMATCH[5]}"
 
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

for Line in $Lines
    do
        [[ "$Line" =~ $regex ]]
        iversion="${BASH_REMATCH[1]}"
        imajor="${BASH_REMATCH[2]}"
        iminor="${BASH_REMATCH[3]}"
        ipatch="${BASH_REMATCH[4]}"
        ibuild="${BASH_REMATCH[5]}"
        if [[ "$imajor" > "$umajor" ]]; then
        ##TO-DO APPEND TO NEW, OLD AND SAME FILES AS ABOVE
        #TO-DO, CHECK FOR PERFECT MATCH FIRST AND ADD ERROR MESSAGE AT END
            echo "new version found"
        elif [[ "$imajor" < "$umajor" ]]; then
            echo "older version found"
        elif [[ "$iminor" > "$uminor" ]]; then
            echo "new version found"
        elif [[ "$iminor" < "$uminor" ]]; then
            echo "older version found" 
        elif [[ "$ipatch" > "$upatch" ]]; then
           echo "new version found" 
        elif [[ "$ipatch" < "$upatch" ]]; then
           echo "older version found" 
        elif [[ "$ibuild" > "$ubuild" ]]; then
            echo "new version found" 
        elif [[ "$ibuild" < "$ubuild" ]]; then
            echo "older version found" 
        else
            echo "same version"
        fi
    done
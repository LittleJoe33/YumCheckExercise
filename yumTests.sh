RPMname=$1
RPMver=$2

#checks args are not null
if [[ -z "$1" ]] ; then
    echo "No package name supplied"
    #echo 'No argument supplied. Expected format is "vcg-iid-simulator-MAJ.MIN.PATCH-BUILD.el7.x86_64.rpm"'
    exit 1
fi

if [[ -z "$2" ]] ; then
    echo "No version supplied"
    exit 1
fi

regex='-(([[:digit:]]+)\.([[:digit:]]+)\.([[:digit:]]+)\-([[:digit:]]+))\.'

[[ "$RPMver" =~ $regex ]]

nversion="${BASH_REMATCH[1]}"
nmajor="${BASH_REMATCH[2]}"
nminor="${BASH_REMATCH[3]}"
npatch="${BASH_REMATCH[4]}"
nbuild="${BASH_REMATCH[5]}"

echo "$nversion"
echo "$nmajor"
echo "$nminor"
echo "$npatch"
echo "$nbuild"

#throws error if regex is not found within arg. Might go back and do this in a cleaner way but it works.
 if [[ -z "${BASH_REMATCH[1]}" ]] ; then
    echo 'Error recognising version inputted'
    exit 1
fi

sudo yum clean all
sudo yum list installed "$RPMname" > temp.txt

#File="temp.txt"
#Lines=$(cat $File)

if grep -Fq "$RPMname" temp.txt 
then
    echo "yes"
else
    echo "no"
fi
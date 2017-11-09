#!/bin/bash
# Witen by
# Andrew Price
# For Dimention Data MEA RIM
# move to the first argument
dest="/root/"
#dest="/tmp/test/to/"
# move from the second argument or .
source="/opt/APG/Collecting/FailOver-Filter/Default/tmp/"
#source="/tmp/test/from/"
# move the file count in the third argument or 20
limit="6"

while IFS= read -r -d $'\0' line ; do
    file="${line#* }"
    echo mv "$file" "$dest"
    mv "$file" "$dest"
    let limit-=1
    [[ $limit -le 0 ]] && break
done < <(find "$source" -maxdepth 1 -printf '%T@ %p\0' \
    2>/dev/null | sort -z -n)i


df -h; service apg-services restart; df -h

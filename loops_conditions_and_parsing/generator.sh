#!/usr/bin/env bash

# 5-4_bad_luck_8_is_your_chance
cat > 5-4_bad_luck_8_is_your_chance << 'EOF'
#!/usr/bin/env bash
#Comment
count=1
while [ $count -le 10 ]
do
    if [ $count -eq 4 ]
    then
        echo "bad luck"
    elif [ $count -eq 8 ]
    then
        echo "good luck"
    else
        echo "Best School"
    fi
    count=$((count + 1))
done
EOF


# 6-superstitious_numbers
cat > 6-superstitious_numbers << 'EOF'
#!/usr/bin/env bash
#Comment
count=1
while [ $count -le 20 ]
do
    echo "$count"
    case $count in
        4) echo "bad luck from China" ;;
        9) echo "bad luck from Japan" ;;
        17) echo "bad luck from Italy" ;;
    esac
    count=$((count + 1))
done
EOF


# 7-clock
cat > 7-clock << 'EOF'
#!/usr/bin/env bash
#Comment
hour=0
while [ $hour -le 12 ]
do
    echo "Hour: $hour"
    minute=1
    while [ $minute -le 59 ]
    do
        echo "$minute"
        minute=$((minute + 1))
    done
    hour=$((hour + 1))
done
EOF


# 8-for_ls
cat > 8-for_ls << 'EOF'
#!/usr/bin/env bash
#Comment
for file in *
do
    echo "$file" | cut -d '-' -f 2-
done
EOF


# 9-to_file_or_not_to_file
cat > 9-to_file_or_not_to_file << 'EOF'
#!/usr/bin/env bash
#Comment
file="school"
if [ -e "$file" ]
then
    echo "school file exists"
    if [ -s "$file" ]
    then
        echo "school file is not empty"
    else
        echo "school file is empty"
    fi
    if [ -f "$file" ]
    then
        echo "school is a regular file"
    fi
else
    echo "school file does not exist"
fi
EOF


# 10-fizzbuzz
cat > 10-fizzbuzz << 'EOF'
#!/usr/bin/env bash
#Comment
count=1
while [ $count -le 100 ]
do
    if [ $((count % 3)) -eq 0 ] && [ $((count % 5)) -eq 0 ]
    then
        echo "FizzBuzz"
    elif [ $((count % 3)) -eq 0 ]
    then
        echo "Fizz"
    elif [ $((count % 5)) -eq 0 ]
    then
        echo "Buzz"
    else
        echo "$count"
    fi
    count=$((count + 1))
done
EOF


# 11-read_and_cut
cat > 11-read_and_cut << 'EOF'
#!/usr/bin/env bash
#Comment
while IFS=: read -r username _ uid _ _ home _
do
    echo "$username:$uid:$home"
done < /etc/passwd
EOF


# 12-tell_the_story_of_passwd
cat > 12-tell_the_story_of_passwd << 'EOF'
#!/usr/bin/env bash
#Comment
while IFS=: read -r username password uid gid info home shell
do
    echo "The user $username is part of the $gid gang, lives in $home and rides $shell. $uid's place is protected by the passcode $password, more info about the user here: $info"
done < /etc/passwd
EOF


# 13-lets_parse_apache_logs
cat > 13-lets_parse_apache_logs << 'EOF'
#!/usr/bin/env bash
#Comment
file="apache-access.log"

if [ ! -f "$file" ]
then
    echo "File not found!"
    exit 1
fi

awk '{print $1, $9}' "$file"
EOF


# 14-dig_the-data
cat > 14-dig_the-data << 'EOF'
#!/usr/bin/env bash
# 14-dig_the-data

awk '{count[$1" "$9]++} END {for (key in count) printf "%7d %s\n", count[key], key}' apache-access.log | sort -nr
EOF


# Make everything executable
chmod +x 5-4_bad_luck_8_is_your_chance
chmod +x 6-superstitious_numbers
chmod +x 7-clock
chmod +x 8-for_ls
chmod +x 9-to_file_or_not_to_file
chmod +x 10-fizzbuzz
chmod +x 11-read_and_cut
chmod +x 12-tell_the_story_of_passwd
chmod +x 13-lets_parse_apache_logs
chmod +x 14-dig_the-data

echo "All scripts generated and made executable successfully!"


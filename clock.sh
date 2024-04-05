#!/bin/bash

declare -a tim
declare -a day
declare -a l1
declare -a l2
declare -a l3
declare -a l4
declare -a l5
l1=('  ---  ' '     . ' '  ---  ' '  ---  ' ' .   . ' '  ---  ' '  ---  ' '  ---  ' '  ---  ' '  ---  ' ' ')
l2=(' |   | ' '     | ' '     | ' '     | ' ' |   | ' ' |     ' ' |     ' '     | ' ' |   | ' ' |   | ' 'o')
l3=(' |   | ' '     | ' '  ---  ' '  ---| ' '  ---| ' '  ---  ' '  ---  ' '     | ' '  ---  ' '  ---| ' ' ')
l4=(' |   | ' '     | ' ' |     ' '     | ' '     | ' '     | ' ' |   | ' '     | ' ' |   | ' '     | ' 'o')
l5=('  ---  ' '     . ' '  ---  ' '  ---  ' '     . ' '  ---  ' '  ---  ' '     . ' '  ---  ' '  ---  ' ' ')
n=0


stty intr ^M  #disables control + c to terminate and replaces with enter key
while [ $n -le 100000 ]; do 

day=(`date +"%A %d %B %Y"`)
tim=(`date +"%I %M %S"`)
am=(`date +"%p"`)
i=0
space=''
col=$((COLUMNS/2-47/2))
row=$((LINES/2-4))
while [ $i -le $col ]; do
space+=' '
i=$((i+1))
done
i=0
while [ $i -lt $row ]; do
echo ''
i=$((i+1))
done

h=$((10#${tim[0]}))
mt=$((10#${tim[1]}/10))
mu=$((10#${tim[1]}%10))
st=$((10#${tim[2]}/10))
su=$((10#${tim[2]}%10))
echo "$space${day[@]}"
temp="$space"
temp+="+---------------------------------------------+"
echo "$temp"

temp=''
temp="$space"
temp+="| "
temp+="${l1[h]}"
temp+="   "
temp+="${l1[mt]}"
temp+="${l1[mu]}"
temp+="   "
temp+="${l1[st]}"
temp+="${l1[su]}"
temp+="   |"
echo "$temp"
temp=''
temp="$space"
temp+="| "
temp+="${l2[h]}"
if [ $(($n%2)) -eq 0 ]; then
temp+=" o "
else
temp+="   "
fi
temp+="${l2[mt]}"
temp+="${l2[mu]}"
if [ $(($n%2)) -eq 0 ]; then
temp+=" o "
else
temp+="   "
fi
temp+="${l2[st]}"
temp+="${l2[su]}"
temp+="   |"
echo "$temp"
temp=''
temp="$space"
temp+="| "
temp+="${l3[h]}"
temp+="   "
temp+="${l3[mt]}"
temp+="${l3[mu]}"
temp+="   "
temp+="${l3[st]}"
temp+="${l3[su]}"
temp+="   |"
echo "$temp"
temp=''
temp="$space"
temp+="| "
temp+="${l4[h]}"
if [ $(($n%2)) -eq 0 ]; then
temp+=" o "
else
temp+="   "
fi
temp+="${l4[mt]}"
temp+="${l4[mu]}"
if [ $(($n%2)) -eq 0 ]; then
temp+=" o "
else
temp+="   "
fi
temp+="${l4[st]}"
temp+="${l4[su]}"
temp+="   |"
echo "$temp"
temp=''
temp="$space"
temp+="| "
temp+="${l5[h]}"
temp+="   "
temp+="${l5[mt]}"
temp+="${l5[mu]}"
temp+="   "
temp+="${l5[st]}"
temp+="${l5[su]}"
temp+=" $am|"
echo "$temp"
temp=''
temp="$space"
temp+="+---------------------------------------------+"
echo "$temp"
sleep 1
clear
n=$((n+1))
done

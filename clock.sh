#!/bin/bash

#code is mainly working on my pc but sometimes it stops working. In such a case try re running the code few times



declare -a tim
declare -a day
declare -a arr
declare -a l1
declare -a l2
declare -a l3
declare -a l4
declare -a l5
l1=(' --- ' '    .' ' --- ' ' --- ' '.   .' ' --- ' ' --- ' ' --- ' ' --- ' ' --- ' ' ')
l2=('|   |' '    |' '    |' '    |' '|   |' '|    ' '|    ' '    |' '|   |' '|   |' 'o')
l3=('|   |' '    |' ' --- ' ' ---|' ' ---|' ' --- ' ' --- ' '    |' ' --- ' ' ---|' ' ')
l4=('|   |' '    |' '|    ' '    |' '    |' '    |' '|   |' '    |' '|   |' '    |' 'o')
l5=(' --- ' '    .' ' --- ' ' --- ' '    .' ' --- ' ' --- ' '    .' ' --- ' ' --- ' ' ')
n=0
echo_c()
{
  w=$(stty size | cut -d" " -f2)       # width of the terminal
  
  l=${#1}                              # length of the string
  line=`tput lines`
  line=$((line/2))
  n=1
  while [ $n -le $line ]; do
  printf "\n"
  n=$((n+1))
  done
  printf "%"$((l+(w-l)/2))"s" "$1"   # print string padded to proper width (%Ws)
}

stty intr ^M
while [ $n -le 100000 ]; do 
arr=(`date +"%A %d %B %Y %I %M %S %p"`)
if [ $((n%2)) -eq 0 ];then
arr=(${arr[@]:0:6}:${arr[@]:6})
arr=(${arr[@]:0:5}:${arr[@]:5})
fi
day=(`date +"%A %d %B %Y"`)
tim=(`date +"%I %M %S"`)
am=(`date +"%p"`)
# i=0
i=0
space=''
col=$((COLUMNS/2-33/2))
row=$((LINES/2-4))
while [ $i -le $col ]; do
space+=' '
i=$((i+1))
done
i=0
while [ $i -le $row ]; do
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
temp+="+-------------------------------+"
echo "$temp"

temp=''
temp="$space"
temp+="| "
temp+="${l1[h]}"
temp+=" "
temp+="${l1[mt]}"
temp+="${l1[mu]}"
temp+=" "
temp+="${l1[st]}"
temp+="${l1[su]}"
temp+="   |"
echo "$temp"
temp=''
temp="$space"
temp+="| "
temp+="${l2[h]}"
if [ $(($n%2)) -eq 0 ]; then
temp+="o"
else
temp+=" "
fi
temp+="${l2[mt]}"
temp+="${l2[mu]}"
if [ $(($n%2)) -eq 0 ]; then
temp+="o"
else
temp+=" "
fi
temp+="${l2[st]}"
temp+="${l2[su]}"
temp+="   |"
echo "$temp"
temp=''
temp="$space"
temp+="| "
temp+="${l3[h]}"
temp+=" "
temp+="${l3[mt]}"
temp+="${l3[mu]}"
temp+=" "
temp+="${l3[st]}"
temp+="${l3[su]}"
temp+="   |"
echo "$temp"
temp=''
temp="$space"
temp+="| "
temp+="${l4[h]}"
if [ $(($n%2)) -eq 0 ]; then
temp+="o"
else
temp+=" "
fi
temp+="${l4[mt]}"
temp+="${l4[mu]}"
if [ $(($n%2)) -eq 0 ]; then
temp+="o"
else
temp+=" "
fi
temp+="${l4[st]}"
temp+="${l4[su]}"
temp+="   |"
echo "$temp"
temp=''
temp="$space"
temp+="| "
temp+="${l5[h]}"
temp+=" "
temp+="${l5[mt]}"
temp+="${l5[mu]}"
temp+=" "
temp+="${l5[st]}"
temp+="${l5[su]}"
temp+=" $am|"
echo "$temp"
temp=''
temp="$space"
temp+="+-------------------------------+"
echo "$temp"
# echo ${arr[@]}
# echo $n
sleep 0.5
clear
n=$((n+1))
done


# arr=(`date +"%A %d %B %Y %I %M %S %p"`)
# echo ${arr[@]}



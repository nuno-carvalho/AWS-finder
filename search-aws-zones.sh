#!/bin/bash
 
declare -a StringArray=(
"s3" "us-east-2" "us-east-1"
"us-west-1" "us-west-2"
"af-south-1" "ap-east-1"
"ap-south-1"  "ap-northeast-3"
"ap-northeast-1" "ap-southeast-1"
"ap-southeast-2" "ap-northeast-1"
"ca-central-1" "cn-north-1"
"cn-northwest-1" "eu-central-1"
"eu-west-1" "eu-west-2"
"eu-south-1" "eu-west-3"
"eu-north-1" "me-south-1"
"sa-east-1" "us-gov-east-1"
"us-gov-west-1")


cat << "EOF"
    ___      _____    __ _         _
   /_\ \    / / __|  / _(_)_ _  __| |___ _ _ 
  / _ \ \/\/ /\__ \ |  _| | ' \/ _` / -_) '_|
 /_/ \_\_/\_/ |___/ |_| |_|_||_\__,_\___|_|  

EOF

read -p 'Enter AWS bucket name: ' bucket

for val_zone in ${StringArray[@]}; do
     url="https://$bucket.s3.$val_zone.amazonaws.com/"
    # echo "$url"
     if curl --output /dev/null --silent --head --fail "$url"; then
         echo -e "\e[92m[+]\e[0m URL exists: $url"
     else
         echo -e "\e[31m[-]\e[0m URL does not exist: $url"
     fi
done

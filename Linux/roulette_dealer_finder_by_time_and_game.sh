#!bin/bash

if [ "$3" = "Blackjack" ];
then
  grep -i "$2" $1_Dealer_schedule | awk " "'{print $1, $2, $3, $4}'		
elif [ "$3" = "Roulette" ];
then
  grep -i "$2" $1_Dealer_schedule | awk " "'{print $1, $2, $5, $6}'
else
  grep -i "$2" $1_Dealer_schedule | awk " "'{print $1, $2, $7, $8}'
fi




#!/bin/bash

grep $3 ../Dealer_Analysis/$2_Dealer_schedule | grep -i $4 | {
if [ $1 = 'Blackjack' ]
then
awk -F" " '{ print $3,$4}'
elif [ $1 = 'Roulette' ]
then
awk -F" " '{ print $5,$6}'
elif [ $1 = 'Texas' ]
then
awk -F" " '{ print $7,$8}'
else echo "wrong game"
fi
}




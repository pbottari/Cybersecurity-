#!/bin/bash

grep $1 ../Dealer_Analysis/03* | grep AM | awk '{print $1,$2,$5,$6}'
grep $2 ../Dealer_Analysis/03* | grep AM | awk '{print $1,$2,$5,$6}'
grep $3 ../Dealer_Analysis/03* | grep PM | awk '{print $1,$2,$5,$6}'
grep $4 ../Dealer_Analysis/0310_Dealer_schedule ../Dealer_Analysis/0312_Dealer_schedule | grep PM | awk '{print $1,$2,$5,$6}'
grep $5 ../Dealer_Analysis/0310_Dealer_schedule ../Dealer_Analysis/0312_Dealer_schedule | grep PM | awk '{print $1,$2,$5,$6}'



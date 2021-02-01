#!/bin/bash

grep $2 ../Dealer_Analysis/$1_Dealer_schedule | grep -i $3 | awk '{print $5,$6}'

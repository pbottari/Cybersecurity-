#!/bin/bash

grep $1 ../Dealer_Analysis/0310_Dealer_schedule | grep -i $2 | awk '{print $1,$2,$5,$6}'




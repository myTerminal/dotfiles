#!/bin/bash

sudo ifdown wlp1s0
# sudo iwconfig wlp1s0 mode managed
sudo ifup wlp1s0

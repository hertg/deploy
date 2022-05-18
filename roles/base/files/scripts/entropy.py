#!/bin/python3

# calculates the entropy of a TRUELY random generated password

import sys
import math

length=int(sys.argv[1])
base=int(sys.argv[2])
combinations=pow(base, length)
entropy=round(math.log2(combinations), 2)

print("entropy of", entropy, "bits")

if(entropy > 256):
    print("incredibly strong (overkill)")
elif(entropy > 128):
    print("very strong")
elif(entropy > 112):
    print("strong")
elif(entropy > 80):
    print("reasonable")
elif(entropy > 64):
    print("weak")
else:
    print("very weak")

#!/bin/sh

for d in ./*/ ; do (echo "$d" && cd "$d" && git gc --aggressive); done

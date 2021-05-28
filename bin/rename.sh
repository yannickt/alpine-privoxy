#!/bin/sh

for file in /etc/privoxy/*.new ; do mv -v ${file} /etc/privoxy/$(basename ${file} .new); done

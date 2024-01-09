#!/bin/sh -l

make -e FIXTURE=$1

echo status=$? >> $GITHUB_OUTPUT

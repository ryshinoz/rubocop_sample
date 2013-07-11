#!/bin/bash
grep -p '^-' README.md | cut -b3- | awk -F " - " '{ print $1,$2}' | sed -e 's/`//g' -e 's/ /,/' > coding.csv

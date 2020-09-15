#!/bin/bash
# Use the code guideline, https://www.sei.cmu.edu/research-capabilities/all-work/display.cfm?customel_datapageid_4050=21274  to check 
# arguments is the list of folder you want to check.
# base domains drivers foundation kernel/liteos_a kernel/liteos_m utils vendor
for dir in $@
do
	name=$( basename $dir )
	cppcheck --addon=cert.py --xml  --bug-hunting --enable=all --max-ctu-depth=6  --output-file=${name}_report.xml -I . --config-exclude=third_party/ ${dir}
	echo $dir >> analysis.log
done


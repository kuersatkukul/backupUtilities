#!/usr/bin/bash

# **********************************************************************
# Use this script to give it a pdf file and specify page numbers to 
# output a pdf which contains pages with input pages a quarersized output pages
# **********************************************************************

inputPdf="$1"
pageNumbers="$2"
outputFilePath="$3"

if [[ $# -eq 0 ]] ; then
    echo "Usage: ./concatto4erpdf.sh <inputPdf> <\"pagenumbers space seperated\">" "<Absolute outputFilePath>"
    exit 0
fi

if [[ -f "$inputPdf" ]]; then
	fileNames=""
	for pagenum in $pageNumbers; do
		pdftk $inputPdf cat $pagenum output "$pagenum.pdf"
		fileNames+="${pagenum}.pdf "
	done
	pdfjam $fileNames --nup 2x2 --landscape --outfile $outputFilePath
	for pagenum in $pageNumbers; do
		rm "$pagenum.pdf"
	done
else
	echo "$inputPdf doesnt exist"
	exit -1
fi

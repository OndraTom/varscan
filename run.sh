#!/bin/bash

# Let's iterate all input mpileup files
for file_path in /data/in/files/*.mpileup.samtools; do

    # Let's extract the filename from the path
    filename=$(basename ${file_path})

    # Let's remove the file extension
    filename=${filename:0:-17}

    # Execute the samtools on input file and save the output as .vcf file
    echo "Executing java -jar /app/VarScan.v2.4.3.jar mpileup2snp ${file_path} --strand-filter 0 --p-value 0.95 --min-coverage 50 --min-reads2 8 --min-avg-qual 25 --min-var-freq 0.01 --output-vcf  > /data/out/files/${filename}.vcf"
    java -jar /app/VarScan.v2.4.3.jar mpileup2snp ${file_path} --strand-filter 0 --p-value 0.95 --min-coverage 50 --min-reads2 8 --min-avg-qual 25 --min-var-freq 0.01 --output-vcf  > /data/out/files/${filename}.vcf
done
#!/binbash
# Shell script for R scripts that run once a day at 7pm

cd ~/web-data

R CMD BATCH download/nz-carbon.R
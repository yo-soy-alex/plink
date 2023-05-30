system("plink")

# Read text file into string
# If working with binary files use --bfile, otherwise use --file
#normal for genome is 0.9

system("plink --bfile genotipos --cow --no-fid  --no-parents --no-sex --no-pheno --geno 0.95 --mind 0.95 --maf 0.01  --distance ")

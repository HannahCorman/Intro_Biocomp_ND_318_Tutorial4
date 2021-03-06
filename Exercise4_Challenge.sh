#Challenge in Exercise4 using GitHub

cat wages.csv | sed 's/,/ /g' | sort -k 1,1 -k 2,2n -s | cut -d " " -f 1,2 > Gender_Experience.txt

echo "Highest Earner"
cat wages.csv | grep -v "gender" | tr "," " " | sort -n -k 4 | tail -n 1 | cut -d " " -f 1,2,4 
echo "Lowest Earner"
cat wages.csv | grep -v "gender" | tr "," " " | sort -n -k 4 | head -n 1 | cut -d " " -f 1,2,4
echo "Number of Female Earners in Top 10"
cat wages.csv | grep -v "gender" | tr "," " " | sort -n -k 4 | tail -n 10 | cut -d " " -f 1,2,4 | grep "female" | wc -l 

echo "Lowest wages for high school and college"
cat wages.csv | sed 's/,/ /g' | cut -d " " -f 3,4 | grep -e "12 " -e "16 " | sort -nk2 | sort -u -k1,1

echo "Difference between lowest wages for college and high school"
VAL1=$(cat wages.csv | sed 's/,/ /g' | cut -d " " -f 3,4 | grep "12 " | sort -n -k 2 | head -n 1 | cut -d " " -f 2)                                                                                                                                 
VAL2=$(cat wages.csv | sed 's/,/ /g' | cut -d " " -f 3,4 | grep "16 " | sort -n -k 2 | head -n 1 | cut -d " " -f 2)
echo "$VAL2-$VAL1" | bc


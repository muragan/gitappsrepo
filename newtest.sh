echo "enter number"
read no
rem=0
div=0
sum
While [ $no -gt 0 ]
do 
rem= `expr $no % 10`
div= `expr $no / 10`
sum= `expr $rem + $div`
done
echo "sum of entered didgis: $sum"
echo "this changes done in master"

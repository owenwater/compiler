n=2
for ((i=1;i<=2;i++))
do
	echo "Tesing $i... "
	./a < test$i > a$i.s 2>err$i
	spim -file a$i.s
	echo ""
done

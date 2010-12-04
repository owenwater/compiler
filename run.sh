n=6
for ((i=1;i<=n;i++))
do
	echo "Tesing $i... "
	./a < test$i > a$i.s 2>err$i
	touch input$i
	spim -file a$i.s < input$i
	echo ""
done

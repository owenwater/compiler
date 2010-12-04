b=1
n=10
test_dir=test
for ((i=b;i<=n;i++))
do
	echo "Tesing $i... "
	./a < $test_dir/test$i >$test_dir/a$i.s 2>$test_dir/err$i
	touch $test_dir/input$i
	spim -file $test_dir/a$i.s < $test_dir/input$i
	echo ""
done

b=1
n=22
test_dir=test
for ((i=b;i<=n;i++))
do
	echo "Tesing $i... "
	./a < $test_dir/test$i >$test_dir/a$i.s 2>$test_dir/err$i
	touch $test_dir/input$i
	spim -file $test_dir/a$i.s < $test_dir/input$i
	echo ""
done
./a <$test_dir/quicksort.decaf > $test_dir/quicksort.s 2> $test_dir/quicksort.err
spim -file $test_dir/quicksort.s < $test_dir/quicksort.in > $test_dir/quicksort.out
./a <$test_dir/fun_pointer.decaf > $test_dir/fun_pointer.s 2> $test_dir/quicksort.err
spim -file $test_dir/fun_pointer.s



if __name__=="__main__":
	f1 = open("old_decaflex.y");
	f2 = open("decaflex.y", "w");
	data = f1.readlines();
	for line in data:
		flag = 0
		for i in range(0,len(line)):
			if line[i] == '$' and line[i+1] == '$' and flag == 0:
				flag = 1
				f2.write("/*")
			f2.write(line[i])
			if flag == 1 and line[i] == ';':
				flag = 0
				f2.write("*/")

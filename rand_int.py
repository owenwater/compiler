import sys
import random
if __name__=="__main__":
	random.seed()
	n = int(sys.stdin.readline())
	print n
	for i in xrange(0,n):
		print random.randint(0,10000)

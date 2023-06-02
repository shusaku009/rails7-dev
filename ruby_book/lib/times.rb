sum = 0
# 処理を5回繰り返す
5.times{|n| sum += n }
sum

sum = 0
# sumに1を加算する処理を5回繰り返す
5.times{ sum += 1 }
sum

a = []
10.upto(14) { |n| a << n }
a

a = []
1.step(10,2){ |n| a << n }
a

a = []
10.step(1, -2){ |n| a << n }
a
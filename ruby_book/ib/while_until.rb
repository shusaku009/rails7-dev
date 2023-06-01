a = []
while a.size < 5
  a << 1
end
a

a = []
while a.size < 5 do a << 1 end
a

a = []
a << 1 while a.size < 5
a

a = [] 

while false
  a << 1
end
a

begin
  a << 1
end while false
a

a = [10, 20, 30, 40, 50]
until a.size <= 3
  a.delete_at(-1)
end
a
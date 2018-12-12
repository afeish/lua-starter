-- comments
--[[
multi-line comments
]]
x = 10
name = 'Derek'

print('hello world', x)

io.write("size of string is: ", #name, ", name type is ", type(name), "\n")

name = 4

print('name type is ', type(name))

-- float precision is 13
floatPrecision = 1.999999999999 + 0.00000000005

io.write(floatPrecision, '\n')

longString = [[
I am a very very
very very string that goes on
forever
]]

-- concat two string as one
longString = longString .. name

io.write(longString, '\n')


isAbleToDrive = true
io.write(type(isAbleToDrive), "\n")

-- madeupVar is not defined, by default it will be nil
io.write(type(madeupVar), "\n")


-- math function
io.write("5 + 3 = ", 5 + 3, "\n")
io.write("5 - 3 = ", 5 - 3, "\n")
io.write("5 * 3 = ", 5 * 3, "\n")
io.write("5 / 3 = ", 5 / 3, "\n")
io.write("5 % 3 = ", 5 % 3, "\n")

-- short operend not working
-- name ++

io.write("math.floor(2.2323) = ", math.floor(2.2323), "\n")

-- rand number
io.write('math.random(): ', math.random(), "\n")
io.write('math.random(10): ', math.random(10), "\n")
io.write('math.random(4,8): ', math.random(4,8), "\n")

--  set the seed of random
math.randomseed(os.time())

print(string.format("Pi = %.10f", math.pi))

age = 12
if age < 16 then
  io.write('you can go to school', "\n")
  local localVar = 0
elseif (age < 16) and (age < 18) then
  io.write('you can drive')
elseif (age < 20) or (age > 70) then
  io.write('either age too young or too old')
else
  io.write('you can votge', "\n")
end


print(string.format("not true = %s", tostring(not true)))

-- canVote = age > 18 ? true : false

canVote = age > 18 and true or false
io.write('can i vote: ', tostring(canVote), "\n")


quote = " I changed my password to incorrect."
io.write('quote length: ', string.len(quote), "\n")
io.write('quote length: ', #quote, "\n") -- #quote length

io.write('Replace I with me: ', string.gsub(quote, "I", "me"), "\n") -- #gsub replace string

io.write('quote index of my: ', string.find(quote, "my"), "\n") -- #quote find index
io.write('quote uppercase of my: ', string.upper(quote, "my"), "\n") -- #quote find index
io.write('quote lowercase of my: ', string.lower(quote, "my"), "\n") -- #quote find index


-- while loop
i = 1
while ( i < 10) do
  io.write(i)

  if ( i== 5) then
    break
  end

  i = i + 1
end

print("\n")

-- repeat do while
repeat
  io.write('Enter your guees: ')
  guess = io.read()
until tonumber(guess) == 5

-- for loop
for i = 1, 10, 1 do
  io.write(i)
end
print("\n")


months = {"January", "Feburary", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"}

for k, v in pairs(months) do
  io.write(k, " ---->  ", v, "\n")
end


-- table
aTable = {}
for i= 1, 10 do
  aTable[i] = i
end

io.write('First: ', aTable[1], "\n")
io.write('Number of items: ', #aTable, "\n")

table.insert(aTable, 1, 0)
io.write('First changed: ', aTable[1], "\n")

print(table.concat(aTable, ", "))


table.remove(aTable, 1)
print(table.concat(aTable, ", "))

aMultiTable = {}
for i=0, 9 do
  aMultiTable[i] = {}
  for j = 0, 9 do
    aMultiTable[i][j] = tostring(i) .. tostring(j)
  end
end

io.write('Table[0][0]: ', aMultiTable[0][0], "\n")

for i = 0, 9 do
  for j = 0, 9 do
    io.write(aMultiTable[i][j], " : ")
  end
  print()
end


-- functions
function getSum(num1, num2)
  return num1 + num2
end

print(string.format("5 + 2 is ", getSum(5, 2)))

function splitStr(theString)
  stringTbl = {}

  local i = 1

  for word in string.gmatch(theString, "[^%s]+") do
    stringTbl[i] = word
    i = i + 1
  end

  return stringTbl, i
end

splitStrTable, numOfStr = splitStr("The turtle")

print(table.concat(splitStrTable, ","))
print(numOfStr, type(numOfStr))


for j = 1, numOfStr-1 do
  print(string.format("%d: %s", j, splitStrTable[j]))
end

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


--- vararg
--[[
  varargs
]]
function getSumMore(...)
  local sum = 0
  for k, v in pairs{...} do
    sum = sum + v
  end
  return sum
end

io.write('Sum ', getSumMore(1,2,3,4,5,6), '\n')


-- inline function
doubleIt = function(x) return x * 2 end

io.write('Double of 3 is: ', doubleIt(3), '\n')

function outerFunc()
  local i = 0
  return function()
    i = i + 1
    return i
  end
end

getI = outerFunc()
print('closure function 1st call is ', getI())
print('closure function 2end call is ', getI())

co = coroutine.create(function ()
        for i=1,10,1 do
          print("co", i)
          if i == 5 then
            coroutine.yield()
          end
        end
      end)

co1 = coroutine.create(function()
    for i=1001, 1010, 1 do
      print('co1 ', i)
    end end
  )

print('co status is ', coroutine.status(co))
coroutine.resume(co)
print('co status is ',coroutine.status(co))

coroutine.resume(co1)
print('co1 status is ',coroutine.status(co1))

coroutine.resume(co)
print('co status is ',coroutine.status(co))


co2 = coroutine.create(function (a,b,c)
          print("co2", a,b,c)
        end)
coroutine.resume(co2, 1, 2, 3)

co3 = coroutine.create(function (a,b)
    coroutine.yield(a + b, a - b)
        end)
print(coroutine.resume(co3, 20, 10))

co4 = coroutine.create (function ()
       print("co4", coroutine.yield())
     end)

print('co4 status is ',coroutine.status(co4))
coroutine.resume(co4)
print('co4 status is ',coroutine.status(co4))
coroutine.resume(co4)
print('co4 status is ',coroutine.status(co4))

-- coroutine.resume(co4, 4, 5)

--[[
different ways to work with files
r: Read only(default)
w: Overwrite or create a new file
a: Append or create a new file
r+: Read & write existing file
w+: Overwrite read or create a new file
a+: Append read or create file
]]

file = io.open('test.txt', 'w+')
file:write('Random string of text\n')
file:write('Some more text\n')
file:seek('set', 0)
print(file:read('*a'))
file:close()


file = io.open('test.txt', 'a+')
file:write('Even more text\n')
file:seek('set', 0)
print(file:read('*a')) -- all the data
file:close()

--[[
Modules

-- convert.lua
local convert = {}

function convert.ftToCm(feet)
  return feet + 30.48
end

return convert

]]

convertModule = require('convert')
print(string.format('%.3f cm', convertModule.ftToCm(12)))

--[[
meta table

]]
aTable = {}
for i=1, 10 do
  aTable[i] = i
end

mt = {
  __add = function(table1, table2)
    sumTable = {}
    for j = 1, #table1 do
      if table1[j] ~= nil and table2[j] ~= nil then
        sumTable[j] = table1[j] + table2[j]
      else
        sumTable[j] = 0
      end

    end

    return sumTable
 end,

 __eq = function(table1, table2)
   return table1.value == table2.value
 end,

}

setmetatable(aTable, mt) -- setmetatable to link the table and meta definition

print(aTable == aTable)

addTable = {}

addTable = aTable + aTable
for i=1, #addTable do
  print(addTable[i])
end

print(getmetatable(aTable))

--[[
class
]]

Animal = {height=0, weight=0, name='no name', age=0}
function Animal:new(height, weight, name, age)
  setmetatable({}, Animal)
  print("initialize Animal new")
  self.height = height
  self.weight = weight
  self.name = name
  self.age = age
  return self
end

function Animal:toString()
  str = string.format('height: %d, weight:%d pounds, name: %s, age: %d', self.height, self.weight, self.name, self.age)
  return str
end

animal = Animal:new(30, 20, 'Ant', 3)
print(animal:toString())

Cat = Animal:new()

function Cat:new (height, weight, name, age, favFood)
  setmetatable({}, Cat)
  print("initialize cat new")
  self.height = height
  self.weight = weight
  self.name = name
  self.age = age
  self.favFood = favFood
  return self
end
function Cat:toString()
  str = string.format('height: %d, weight:%d pounds, name: %s, age: %d, favFood: %s', self.height, self.weight, self.name, self.age, self.favFood)
  return str
end

cat = Cat:new(30, 20, 'Tommy', 3, 'Chrisp')
print(cat:toString())


-- Create a new instance of LibDeque
local deque = LibDeque:New()

local data = { "three", "four", "five" }
deque:ExtendLast(data)
-->> elements order: "three", "four", "five"

local REVERSE_INPUT = true
local reverseData = { "seven", "six" }
deque:ExtendLast(data, REVERSE_INPUT)
-->> elements order: "three", "four", "five", "six", "seven"

local data = { "one", "two" }
deque:ExtendFirst(data)
-->> elements order: "one", "two", "three", "four", "five", "six", "seven"

deque:PushLast("eight")
-->> elements order: "one", "two", "three", "four", "five", "six", "seven", "eight"

deque:PushFirst("zero")
-->> elements order: "zero", "one", "two", "three", "four", "five", "six", "seven", "eight"

deque:PopFirst()
-->> elements order: "one", "two", "three", "four", "five", "six", "seven", "eight"
-->> Return: "zero"

deque:PopLast()
-->> elements order: "one", "two", "three", "four", "five", "six", "seven"
-->> Return: "eight"

deque:PeekFirst()
-->> elements order: "one", "two", "three", "four", "five", "six", "seven"
-->> Return: "one"

deque:PeekLast()
-->> elements order: "one", "two", "three", "four", "five", "six", "seven"
-->> Return: "seven"

deque:Len()
-->> elements order: "one", "two", "three", "four", "five", "six", "seven"
-->> Return: 7

deque:IsEmpty()
-->> elements order: "one", "two", "three", "four", "five", "six", "seven"
-->> Return: false

for element in deque:Iterator() do
	d(element)
end
-->> elements order:
-->> Chat output: "one", "two", "three", "four", "five", "six", "seven"

local function Test() d("This is an element") end
local data = { "one", "two", "three", "four", "five", "six", "seven", Test }
deque:ExtendLast(data)
-->> elements order: "one", "two", "three", "four", "five", "six", "seven", Test

deque:PushLast(8)
-->> elements order: "one", "two", "three", "four", "five", "six", "seven", Test, 8

deque:PushLast({ true })
-->> elements order: "one", "two", "three", "four", "five", "six", "seven", Test, 8, { [1] = true }

local function NewTest(element)
	local elementType = type(element)
	if elementType == "string" then
		d(element)
	elseif elementType == "number" then
		df("current number: %d", element)
	elseif elementType == "function" then
		d("element is a function")
	else
		d("element not defined")
	end
end
deque:Run(NewTest)
-->> elements order:
-->> Chat output: "one", "two", "three", "four", "five", "six", "seven", "element is a function", "current number: 8", "element not defined"

local data = { "one", "two", "three", "four", "five", "six", "seven" }
deque:ExtendLast(data)
-->> elements order: "one", "two", "three", "four", "five", "six", "seven"

deque:Rotate(-2)
-->> elements order: "three", "four", "five", "six", "seven", "one", "two"

deque:Rotate(3)
-->> elements order: "seven", "one", "two", "three", "four", "five", "six"

deque:Reverse()
-->> elements order: "six", "five", "four", "three", "two", "one", "seven"

deque:Clear()
-->> elements order:

local data = { "three", "four", "five" }
deque:ExtendLast(data)
-->> elements order: "three", "four", "five"

local newDeque = deque:Copy()
-->> elements order: "three", "four", "five"

d(newDeque:Count("four"))
-->> elements order: "three", "four", "five"
-->> Chat output: 1

d(newDeque:Index("four"))
-->> elements order: "three", "four", "five"
-->> Chat output: 2

newDeque:Insert(2, "new")
-->> elements order: "three", "new", "four", "five"

newDeque:PushLast("new")
-->> elements order: "three", "new", "four", "five", "new"

newDeque:Remove("new")
-->> elements order: "three", "four", "five", "new"

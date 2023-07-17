LibDeque = ZO_Object:Subclass()

function LibDeque:New()
    local object = ZO_Object.New(self)
    object:Initialize()    
    return object
end

-- make it callable with 'local dq = LibDeque()'
-- instead of 'local dq = LibDeque:New()'
setmetatable(LibDeque, { __call = function() return LibDeque:New() end })


local ZO_NumericallyIndexedTableIterator, ZO_NumericallyIndexedTableReverseIterator = ZO_NumericallyIndexedTableIterator, ZO_NumericallyIndexedTableReverseIterator
local zo_decimalsplit, zo_floor, zo_abs = zo_decimalsplit, zo_floor, zo_abs


local function TableCompare(left, right)
	local MAX_TABLES = 16 -- arbitrary cap
	return ZO_DeepAcyclicTableCompare(left, right, MAX_TABLES)
end

local function NonTableCompare(left, right)
	return left == right
end

local function GetCompareFunction(element)
	local luaType = type(element)
	return (luaType == "table" or luaType == "userdata") and TableCompare or NonTableCompare
end

local function NegativeRotation(self)
	self:PushLast(self:PopFirst())
end

local function PositiveRotation(self)
	self:PushFirst(self:PopLast())
end

local DEFAULT_FIRST = 0
local DEFAULT_LAST = -1


function LibDeque:Initialize()
	self.first = DEFAULT_FIRST
	self.last = DEFAULT_LAST
	self.elements = { }
end

---------
-- API --
---------

-- Adds an element to the last
function LibDeque:PushLast(element)
	if not element then
		return
	end
	local last = self.last + 1
	self.last = last
	self.elements[last] = element
end

-- Pops the first element
-- @return nilable:string|number|boolean|table|function|userdata
function LibDeque:PopFirst()
	if self:IsEmpty() then
		return
	end
	local first = self.first
	local element = self.elements[first]
	self.elements[first] = nil
	self.first = first + 1
	return element
end

-- Adds an element to the first
function LibDeque:PushFirst(element)
	if not element then
		return
	end
	local first = self.first - 1
	self.first = first
	self.elements[first] = element
end

-- Pops the last element
-- @return nilable:string|number|boolean|table|function|userdata
function LibDeque:PopLast()
	if self:IsEmpty() then
		return
	end
	local last = self.last
	local element = self.elements[last]
	self.elements[last] = nil
	self.last = last - 1
	return element
end

-- Peek the first element, without Pop it
-- @return nilable:element - string|number|boolean|table|function|userdata
function LibDeque:PeekFirst()
	return self.elements[self.first]
end

-- Peek the last element, without Pop it
-- @return nilable:element - string|number|boolean|table|function|userdata
function LibDeque:PeekLast()
	return self.elements[self.last]
end

-- Extend the last-side of the deque by appending elements from the elements argument.
-- reverseInput = nil|false -> elements[#elements] will be the the new last
-- reverseInput = true -> elements[1] will be the the new last
-- @param elements - table (indexed)
-- @param reverseInput - boolean:nilable
function LibDeque:ExtendLast(elements, reverseInput)
	local iterator = reverseInput ~= nil and ZO_NumericallyIndexedTableReverseIterator or ZO_NumericallyIndexedTableIterator
	for _, element in iterator(elements) do
		self:PushLast(element)
	end
end

-- Extend the first-side of the deque by appending elements from the elements argument.
-- reverseInput = nil|false -> elements[1] will be the the new first
-- reverseInput = true -> elements[#elements] will be the the new first
-- @param elements - table (indexed)
-- @param reverseInput - boolean:nilable
function LibDeque:ExtendFirst(elements, reverseInput)
	local iterator = reverseInput ~= nil and ZO_NumericallyIndexedTableIterator or ZO_NumericallyIndexedTableReverseIterator
	for _, element in iterator(elements) do
		self:PushFirst(element)
	end
end

-- Reverse the order of the elements
function LibDeque:Reverse()
	if self:Len() <= 1 then
		return
	end
	local elements = self.elements
	local last = self.last
	-- Only have to iterate over n/2 instead of n.
	for i = self.first, last / 2 do
		elements[i], elements[last] = elements[last], elements[i]
		last = last - 1
	end
end

-- Return the length of a table (the number of elements in a table)
-- @return number
function LibDeque:Len()
	return self.last - self.first + 1
end

-- Check if elements are empty
-- @return boolean
function LibDeque:IsEmpty()
	return self:Len() == 0
end

-- Iterator from first-side. (First In - First Out)
-- @return element - string|number|boolean|table|function|userdata
function LibDeque:Iterator()
	return function()
		return self:PopFirst()
	end
end

-- Iterator from last-side. (Last In - First Out)
-- @return element - string|number|boolean|table|function|userdata
function LibDeque:ReversedIterator()
	return function()
		return self:PopLast()
	end
end

-- Pop all elements from first to last (useReverseIterator == false|nil) or last to first (useReverseIterator == true).
-- @param callback - function
-- @param useReverseIterator - boolean:nilable
function LibDeque:Run(callback, useReverseIterator)
	local iterator = useReverseIterator ~= nil and self.ReversedIterator or self.Iterator
	for element in iterator(self) do
		callback(element)
	end
end

-- Count the number of elements equal to the element.
-- @param element - string|number|boolean|table|function|userdata
-- @return count - number
function LibDeque:Count(element)
	if self:IsEmpty() then
		return 0
	end
	local isEqual = GetCompareFunction(element)
	local count = 0
	for i = self.first, self.last do
		if isEqual(self.elements[i], element) then
			count = count + 1
		end
	end
	return count
end

-- Rotate the elements in positive or negative direction.
-- Negative steps will bring the first element to last and positive steps will bring the last element to first.
-- @param steps - number (integer)
-- @return success - boolean:nilable
function LibDeque:Rotate(steps)
	local numElements = self:Len()
	if not steps or numElements <= 1 then
		return
	end

	-- Reduce steps if steps are higher than numElements.
	-- If steps became 0, which is one full rotation, we don't need to continue.
	local fractional = select(2, zo_decimalsplit(steps / numElements))
	steps = numElements * fractional
	if steps == 0 then
		return
	end

	-- If the steps are higher than the half list of elements, we'll change direction to avoid unnecessary steps.
	if zo_abs(steps) > numElements / 2 then
		if steps > 0 then
			steps = steps - numElements
		else
			steps = steps + numElements
		end
	end

	-- Let's rotate the elements in the appropriate direction.
	local rotate = steps < 0 and NegativeRotation or PositiveRotation
	for i = 1, zo_abs(steps) do
		rotate(self)
	end
	return true
end

-- Return the position of element in the deque (at or after index start and before index stop).
-- Important: The index always starts with 1 and does not refer to self.first or self.last!
-- The same goes for start and stop, they are based on the index and not on the table key!
-- @param element - string|number|boolean|table|function|userdata
-- @param start - number
-- @param end - number
-- @return index - number:nilable
function LibDeque:Index(element, start, stop)
	local first
	if start then
		first = zo_abs(start) - 1
	else
		first = self.first
	end

	local numElements = self:Len()
	if numElements <= 0 or first > numElements then
		return
	end

	local isEqual = GetCompareFunction(element)
	if numElements > 1 then
		local last
		if stop and stop <= numElements then
			last = stop
		else
			last = self.last
		end

		for i = first, last do
			if isEqual(self.elements[i], element) then
				return i + 1
			end
		end
	else
		return isEqual(self:PeekFirst(), element) and 1 or nil
	end
end

-- Insert element into the deque at position index.
-- @param index - number
-- @param element - string|number|boolean|table|function|userdata
-- @return success - boolean:nilable
function LibDeque:Insert(index, element)
	if index < 1 or index > self:Len() then
		return
	end
	local steps = index - 1
	self:Rotate(-steps)
	self:PushFirst(element)
	self:Rotate(steps)
	return true
end

-- Remove the first occurrence of value.
-- @param element - string|number|boolean|table|function|userdata
-- @return success - boolean:nilable
function LibDeque:Remove(element)
	if self:IsEmpty() then
		return
	end
	local isEqual = GetCompareFunction(element)
	local index = 0
	for i = self.first, self.last do
		index = index + 1
		if isEqual(self.elements[i], element) then
			local steps = index - 1
			self:Rotate(-steps)
			self:PopFirst()
			self:Rotate(steps)
			return true
		end
	end
end

-- Creates a new instance by copying all elements from the source table.
-- @return instance
function LibDeque:Copy()
	return ZO_DeepTableCopy(self, LibDeque:New())
end

-- Clears all elements and reset to default.
-- Attention: Be aware, collectGarbage can cause frame drops. Use it wisely!
-- @param collectGarbage - boolean:nilable
-- @return success - boolean:nilable
function LibDeque:Clear(collectGarbage)
	ZO_ClearTable(self.elements)
	self.first = DEFAULT_FIRST
	self.last = DEFAULT_LAST
	if collectGarbage then
		collectgarbage()
	end
	return true
end

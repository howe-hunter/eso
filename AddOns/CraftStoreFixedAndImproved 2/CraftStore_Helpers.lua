CraftStoreFixedAndImprovedLongClassName = {}

local CS = CraftStoreFixedAndImprovedLongClassName

function CS.SplitLink(link,nr)
  local split = {SplitString(':', link)}
  if split[nr] then return tonumber(split[nr]) else return false end
end

function CS.SetLinkValue(link,nr,value)
  local split = {SplitString(':', link)}
  if split[nr+2] then 
    split[nr+2] = value
  end
  return table.concat(split, ":")
end

function CS.ToChat(message)
  local chat = CHAT_SYSTEM.textEntry:GetText()
  StartChatInput(chat..message)
end

function CS.Set(list)
  local set = {}
  for _, l in ipairs(list) do set[l] = true end
  return set
end

function CS.StripLink(link)
  if CanItemLinkBeVirtual(link) then return CS.NakedLink(link) end
  
  local split = {SplitString(':', link)}  
  --Highlight
  if split[1] then 
    split[1] = "|H0"
  end
  --Crafted
  if split[19] then 
    split[19] = 0
  end
  --Bound
  if split[20] then 
    split[20] = 0
  end
  --Stolen
  if split[21] then 
    split[21] = 0
  end
  --Durability
  if split[22] then 
    split[22] = "0"
  end
  return table.concat(split, ":")
end

function CS.NakedLink(link)
  local split = {SplitString(':', link)} 
  return  "|H0:item:"..split[3]..":0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0:0|h|h"
end

function CS.Texture(link,width,height)
	width = width == nil and 18 or width
	height = height == nil and width or height
	return '|t'..width..':'..height..':'..link..'|t'
end	

function CS.UpdateMatsInfo(link)
  local itemType = GetItemLinkItemType(link)
  if CS.RawItemTypes[itemType] and not CS.Account.materials[link] then
    local refinedLink = CS.NakedLink(GetItemLinkRefinedMaterialItemLink(link,0))
    CS.Account.materials[link] = {raw=true,link=refinedLink}
    CS.Account.materials[refinedLink] = {raw=false,link=link}
  end
end

function CS.Switch(t)
  t.case = function (self,x)
    local f=self[x] or self.default
    if f then
      if type(f)=="function" then
        f(x,self)
      else
        error("case "..tostring(x).." not a function")
      end
    end
  end
  return t
end

-- checks if a value is nil, returns default if it is
function CS.NilCheck(root,default,...)
    local args = {...}
	for i=1,#args do
		if root[args[i]] == nil then return default end
		root = root[args[i]]
	end
	
	return root
end

-- checks if a value is nil and sets it regardless
function CS.NilCheckSet(root,set,...)
    local args = {...}
	for i=1,#args do
		if root[args[i]] == nil then 
			root[args[i]] = i ~= #args and {} or set
		end	
		if i == #args then 
			root[args[i]] = set
			return root[args[i]]
		end	
		root = root[args[i]]
	end
	
	return root
end

-- checks if a value is nil and sets default if it is
function CS.NilCheckSetIfNil(root,default,...)
    local args = {...}
	for i=1,#args do
		if root[args[i]] == nil then 
			root[args[i]] = i ~= #args and {} or default
		end	
		if i == #args then 
			return root[args[i]]
		end	
		root = root[args[i]]
	end
	
	return root
end

CS.Chat = {}

function CS.Chat:Print(str)
	if str == nil then return end
	d("|cEEEE00[CraftStore]|r ".. str)
end

-- use libchatmessage if available
if LibChatMessage then
	CS.Chat = LibChatMessage("CraftStore", "CS")
end
--[[
    LuiExtended
    License: The MIT License (MIT)
--]]

LUIE.CombatTextPoolManager = ZO_Object:Subclass()
local CombatTextPoolManager = LUIE.CombatTextPoolManager

function CombatTextPoolManager:New()
    local obj = ZO_Object:New(self)
    self.pools = {}
    return obj
end

function CombatTextPoolManager:RegisterPool(poolType, pool)
    self.pools[poolType] = pool
end

function CombatTextPoolManager:GetPoolObject(poolType)
    return self.pools[poolType]:AcquireObject()
end

function CombatTextPoolManager:ReleasePoolObject(poolType, objectKey)
    self.pools[poolType]:ReleaseObject(objectKey)
end

function CombatTextPoolManager:TotalFree()
    local count = 0
    for k, _ in pairs(self.pools) do
        count = count + self.pools[k]:GetFreeObjectCount()
    end
    return count
end

function CombatTextPoolManager:TotalInUse()
    local count = 0
    for k, _ in pairs(self.pools) do
        count = count + self.pools[k]:GetActiveObjectCount()
    end
    return count
end

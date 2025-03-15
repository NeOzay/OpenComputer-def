---@meta

---@class database:ProxyBase
local database = {}

--- Clears the specified slot. Returns true if there was something in the slot before.
---@param slot number
---@return boolean
function database.clear(slot) end

--- Copies the data stored in this database to another database with the specified address.
---@param address string
---@return number
function database.clone(address) end

--- Get the representation of the item stack stored in the specified slot.
---@param slot number
---@return ItemStack
function database.get(slot) end

--- Copies an entry to another slot, optionally to another database. Returns true if something was overwritten.
---@param fromSlot number
---@param toSlot number
---@param address? string
---@return boolean
function database.copy(fromSlot, toSlot, address) end

--- Computes a hash value for the item stack in the specified slot.
---@param slot number
---@return string
function database.computeHash(slot) end

--- Get the index of an item stack with the specified hash. Returns a negative value if no such stack was found.
---@param hash string
---@return number
function database.indexOf(hash) end

--- Set an item into the specified database slot. NBT tag is expected in JSON format.
---@param slot number
---@param id string
---@param damage number
---@param nbt string?
---@return boolean
function database.set(slot, id, damage, nbt) end

database.type = "database"

return database

---@meta _

---@class me_interface:ProxyBase
local me_interface = {}

--- Retrieves the stored item in the network by its unlocalized name.
---@param name string
---@param damage? number
---@param nbt? string
---@return ItemStack
function me_interface.getItemInNetwork(name, damage, nbt) end

--- Get a list of the stored essentia in the network.
---@return table
function me_interface.getEssentiaInNetwork() end

--- Get the average power injection into the network.
---@return number
function me_interface.getAvgPowerInjection() end

--- Store pattern input at the given index to the database entry.
---@param slot number
---@param index number
---@param database string
---@param entry number
---@return boolean
function me_interface.storeInterfacePatternInput(slot, index, database, entry) end

--- Get the configuration of the interface.
---@param slot? number
---@return table
function me_interface.getInterfaceConfiguration(slot) end

--- Get a list of tables representing the available CPUs in the network.
---@return table
function me_interface.getCpus() end

--- Get the average power usage of the network.
---@return number
function me_interface.getAvgPowerUsage() end

--- Get the idle power usage of the network.
---@return number
function me_interface.getIdlePowerUsage() end

--- Get a list of known item recipes.
---@param filter? table
---@return table
function me_interface.getCraftables(filter) end

--- Get the given pattern in the interface.
---@param slot? number
---@return table
function me_interface.getInterfacePattern(slot) end

--- Get a list of the stored fluids in the network.
---@return table
function me_interface.getFluidsInNetwork() end

--- Get the maximum stored power in the network.
---@return number
function me_interface.getMaxStoredPower() end

--- Clear pattern output at the given index.
---@param slot number
---@param index number
---@return boolean
function me_interface.clearInterfacePatternOutput(slot, index) end

--- Store items in the network matching the specified filter.
---@param filter table
---@param dbAddress string
---@param startSlot? number
---@param count? number
---@return boolean
function me_interface.store(filter, dbAddress, startSlot, count) end

--- Get a list of the stored items in the network.
---@param filter? table
---@return table
function me_interface.getItemsInNetwork(filter) end

--- Set the pattern input at the given index.
---@param slot number
---@param database string
---@param entry number
---@param size number
---@param index number
---@return boolean
function me_interface.setInterfacePatternInput(slot, database, entry, size, index) end

--- Store pattern output at the given index to the database entry.
---@param slot number
---@param index number
---@param database string
---@param entry number
---@return boolean
function me_interface.storeInterfacePatternOutput(slot, index, database, entry) end

--- Set the pattern output at the given index.
---@param slot number
---@param database string
---@param entry number
---@param size number
---@param index number
---@return boolean
function me_interface.setInterfacePatternOutput(slot, database, entry, size, index) end

--- Clear pattern input at the given index.
---@param slot number
---@param index number
---@return boolean
function me_interface.clearInterfacePatternInput(slot, index) end

--- Get a list of the stored items in the network matching the filter.
---@param filter table
---@return table
function me_interface.getItemsInNetworkById(filter) end

--- Get the stored power in the network.
---@return number
function me_interface.getStoredPower() end

--- Configure the interface.
---@param slot? number
---@param database? string
---@param entry? number
---@param size? number
---@return boolean
function me_interface.setInterfaceConfiguration(slot, database, entry, size) end

--- Get an iterator object for the list of the items in the network.
---@return fun():ItemStack
function me_interface.allItems() end

me_interface.type = "me_interface"

return me_interface

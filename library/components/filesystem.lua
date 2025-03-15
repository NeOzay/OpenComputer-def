---@meta _

---@class filesystem:ProxyBase
local disk = {}

---The currently used capacity of the file system, in bytes.
---@return number
function disk.spaceUsed() end

---Opens a new file descriptor and returns its handle.
---@param path string
---@param mode? string
---@return number
function disk.open(path, mode) end

---Seeks in an open file descriptor with the specified handle. Returns the new pointer position.
---@param handle number
---@param whence string
---@param offset number
---@return number
function disk.seek(handle,whence,offset) end

---Creates a directory at the specified absolute path in the file system. Creates parent directories, if necessary.
---@param path string
---@return boolean
function disk.makeDirectory(path) end

---Returns whether an object exists at the specified absolute path in the file system.
---@param path string
---@return boolean
function disk.exists(path)end

---Returns whether the file system is read-only.
---@return boolean
function disk.isReadOnly() end

---Writes the specified data to an open file descriptor with the specified handle.
---@param handle number
---@param value string
---@return boolean
function disk.write(handle,value) end

---The overall capacity of the file system, in bytes.
---@return number
function disk.spaceTotal() end

---Returns whether the object at the specified absolute path in the file system is a directory.
---@param path string
---@return boolean
function disk.isDirectory(path) end

---Renames/moves an object from the first specified absolute path in the file system to the second.
---@param from string
---@param to string
function disk.rename(from, to) end

---Returns a list of names of objects in the directory at the specified absolute path in the file system.
---@param path string
---@return string[]
function disk.list(path) end

---Returns the (real world) timestamp of when the object at the specified absolute path in the file system was modified.
---@param path string
---@return number
function disk.lastModified(path) end

---Get the current label of the file system.
---@return string
function disk.getLabel() end

---Removes the object at the specified absolute path in the file system.
---@param path string
---@return boolean
function disk.remove(path)end

---Closes an open file descriptor with the specified handle.
---@param handle number
function disk.close(handle)end

---Returns the size of the object at the specified absolute path in the file system.
---@param path string
---@return number
function disk.size(path) end

---Reads up to the specified amount of data from an open file descriptor with the specified handle. Returns nil when end of file is reached.
---@param handle number
---@param count number
---@return string?
function disk.read(handle,count) end


---Sets the label of the file system. Returns the new value, which may be truncated.
---@param value string
---@return string
function disk.setLabel(value) end
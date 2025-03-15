---@meta event

---@class eventLib
local event = {}

---Register a new event listener that should be called for events with the specified name.
---@param event string @name of the signal to listen to.
---@param callback function @the function to call if this signal is received. The function will receive the event name it was registered for as first parameter, then all remaining parameters as defined by the signal that caused the event.
---@return number id @the event id which can be canceled via event.cancel, if the event was successfully registered, false if this function was already registered for this event type.
---@overload fun(event: "component_added", callback: fun(name: "component_added", address: string, componentType: string)): number
---@overload fun(event: "component_removed", callback: fun(name: "component_removed", address: string, componentType: string)): number
---@overload fun(event: "component_available", callback: fun(name: "component_available", componentType: string)): number
---@overload fun(event: "component_unavailable", callback: fun(name: "component_unavailable", componentType: string)): number
---@overload fun(event: "term_available", callback: fun(name: "term_available")): number
---@overload fun(event: "term_unavailable", callback: fun(name: "term_unavailable")): number
---@overload fun(event: "screen_resized", callback: fun(name: "screen_resized", screenAddress: string, newWidth: number, newHeight: number)): number
---@overload fun(event: "touch", callback: fun(name: "touch", screenAddress: string, x: number, y: number, button: number, playerName: string)): number
---@overload fun(event: "drag", callback: fun(name: "drag", screenAddress: string, x: number, y: number, button: number, playerName: string)): number
---@overload fun(event: "drop", callback: fun(name: "drop", screenAddress: string, x: number, y: number, button: number, playerName: string)): number
---@overload fun(event: "scroll", callback: fun(name: "scroll", screenAddress: string, x: number, y: number, direction: number, playerName: string)): number
---@overload fun(event: "walk", callback: fun(name: "walk", screenAddress: string, x: number, y: number, playerName: string?)): number
---@overload fun(event: "key_down", callback: fun(name: "key_down", keyboardAddress: string, char: number, code: number, playerName: string)): number
---@overload fun(event: "key_up", callback: fun(name: "key_up", keyboardAddress: string, char: number, code: number, playerName: string)): number
---@overload fun(event: "clipboard", callback: fun(name: "clipboard", keyboardAddress: string, value: string, playerName: string)): number
---@overload fun(event: "motion", callback: fun(name:"motion", address: string, relativeX: number, relativeY: number, relativeZ: number, entityName: string)): number
---@overload fun(event: "modem_message", callback: fun(name: "modem_message", receiverAddress: string, senderAddress: string, port: number, distance: number, ...)): number
---@overload fun(event: "inventory_changed", callback:fun(name: "inventory_changed", slot: number)):number
function event.listen(event,callback) end

---Unregister a previously registered event listener.
---Note: An event listeners may return false to unregister themselves, which is equivalent to calling event.ignore and passing the listener with the event name it was registered for.
---@param event string @name of the signal to unregister.
---@param callback function @the function that was used to register for this event.
---@return boolean @true if the event was successfully unregistered, false if this function was not registered for this event type.
function event.ignore(event,callback) end

---Starts a new timer that will be called after the time specified in interval.
---
---Note: the timer resolution can vary. If the computer is idle and enters sleep mode, it will only be woken in a game tick, so the time the callback is called may be up to 0.05 seconds off.
---@param interval number @time in seconds between each invocation of the callback function. Can be a fraction like 0.05.
---@param callback function @the function to call.
---@param times? number @how many times the function will be called. If omitted the function will be called once. Pass math.huge for infinite repeat.
---@return number id @timer ID that can be used to cancel the timer at any time.
function event.timer(interval, callback, times) end

---Cancels a timer previously created with event.timer.
---@param timerId number timer ID as returned by event.timer.
---@return boolean @true if the timer was stopped, false if there was no timer with the specified ID.
function event.cancel(timerId) end

---Pulls and returns the next available event from the queue, or waits until one becomes available.
---
---timeout - if passed the function will wait for a new event for this many seconds at maximum then returns nil if no event was queued during that time.
---
---name - an event pattern that will act as a filter. If given then only events that match this pattern will be returned. Can be nil in which case the event names will not be filtered. See string.match on how to use patterns.
---
---… - any number of parameters in the same order as defined by the signal that is expected. Those arguments will act as filters for the additional arguments returned by the signal. Direct equality is used to determine if the argument is equal to the given filter. Can be nil in which case this particular argument will not be filtered.
---
---Filter example:
---
---The touch signal (when a player clicks on a tier two or three screen) has the signature screenX: number, screenY: number, playerName: string
---
---To only pull clicks by player “Steve” you'd do:\
---local _, x, y = event.pull("touch", nil, nil, "Steve")
---@return string name
---@return any ...
---@overload fun(name: "component_added", address?: string, componentType?: string): (name: "component_added", address: string, componentType: string)
---@overload fun(name: "component_removed", address?: string, componentType?: string): (name: "component_removed", address: string, componentType: string)
---@overload fun(name: "component_available", componentType?: string): (name: "component_available", componentType: string)
---@overload fun(name: "component_unavailable", componentType?: string): (name: "component_unavailable", componentType: string)
---@overload fun(name: "term_available"): (name: "term_available")
---@overload fun(name: "term_unavailable"): (name: "term_unavailable")
---@overload fun(name: "screen_resized", screenAddress?: string, newWidth?: number, newHeight?: number): (name: "screen_resized", screenAddress: string, newWidth: number, newHeight: number)
---@overload fun(name: "touch", screenAddress?: string, x?: number, y?: number, button?: number, playerName?: string): (name: "touch", screenAddress: string, x: number, y: number, button: number, playerName: string)
---@overload fun(name: "drag", screenAddress?: string, x?: number, y?: number, button?: number, playerName?: string): (name: "drag", screenAddress: string, x: number, y: number, button: number, playerName: string)
---@overload fun(name: "drop", screenAddress?: string, x?: number, y?: number, button?: number, playerName?: string): (name: "drop", screenAddress: string, x: number, y: number, button: number, playerName: string)
---@overload fun(name: "scroll", screenAddress?: string, x?: number, y?: number, direction?: number, playerName?: string): (name: "scroll", screenAddress: string, x: number, y: number, direction: number, playerName: string)
---@overload fun(name: "walk", screenAddress?: string, x?: number, y?: number, playerName?: string): (name: "walk", screenAddress: string, x: number, y: number, playerName: string?)
---@overload fun(name: "key_down", keyboardAddress?: string, char?: number, code?: number, playerName?: string): (name: "key_down", keyboardAddress: string, char: number, code: number, playerName: string)
---@overload fun(name: "key_up", keyboardAddress?: string, char?: number, code?: number, playerName?: string): (name: "key_up", keyboardAddress: string, char: number, code: number, playerName: string)
---@overload fun(name: "clipboard", keyboardAddress?: string, value?: string, playerName?: string): (name: "clipboard", keyboardAddress: string, value: string, playerName: string)
---@overload fun(name: "motion", address?:string, relativeX?:number, relativeY?:number, relativeZ?:number, entityName?:string): (name:"motion", address:string, relativeX:number, relativeY:number, relativeZ:number, entityName:string)
---@overload fun(name: "modem_message", receiverAddress?: string, senderAddress?: string, port?: number, distance?: number, ...): (name: "modem_message", receiverAddress: string, senderAddress: string, port: number, distance: number, ...)
---@overload fun(name: "inventory_changed", slot?: number): (name: "inventory_changed", slot: number)
function event.pull() end

---@param timeout number
---@return string name
---@return any ...
---@overload fun(timeout:number, name: "component_added", address?: string, componentType?: string): (name: "component_added", address: string, componentType: string)
---@overload fun(timeout:number, name: "component_removed", address?: string, componentType?: string): (name: "component_removed", address: string, componentType: string)
---@overload fun(timeout:number, name: "component_available", componentType?: string): (name: "component_available", componentType: string)
---@overload fun(timeout:number, name: "component_unavailable", componentType?: string): (name: "component_unavailable", componentType: string)
---@overload fun(timeout:number, name: "term_available"): (name: "term_available")
---@overload fun(timeout:number, name: "term_unavailable"): (name: "term_unavailable")
---@overload fun(timeout:number, name: "screen_resized", screenAddress?: string, newWidth?: number, newHeight?: number): (name: "screen_resized", screenAddress: string, newWidth: number, newHeight: number)
---@overload fun(timeout:number, name: "touch", screenAddress?: string, x?: number, y?: number, button?: number, playerName?: string): (name: "touch", screenAddress: string, x: number, y: number, button: number, playerName: string)
---@overload fun(timeout:number, name: "drag", screenAddress?: string, x?: number, y?: number, button?: number, playerName?: string): (name: "drag", screenAddress: string, x: number, y: number, button: number, playerName: string)
---@overload fun(timeout:number, name: "drop", screenAddress?: string, x?: number, y?: number, button?: number, playerName?: string): (name: "drop", screenAddress: string, x: number, y: number, button: number, playerName: string)
---@overload fun(timeout:number, name: "scroll", screenAddress?: string, x?: number, y?: number, direction?: number, playerName?: string): (name: "scroll", screenAddress: string, x: number, y: number, direction: number, playerName: string)
---@overload fun(timeout:number, name: "walk", screenAddress?: string, x?: number, y?: number, playerName?: string): (name: "walk", screenAddress: string, x: number, y: number, playerName: string?)
---@overload fun(timeout:number, name: "key_down", keyboardAddress?: string, char?: number, code?: number, playerName?: string): (name: "key_down", keyboardAddress: string, char: number, code: number, playerName: string)
---@overload fun(timeout:number, name: "key_up", keyboardAddress?: string, char?: number, code?: number, playerName?: string): (name: "key_up", keyboardAddress: string, char: number, code: number, playerName: string)
---@overload fun(timeout:number, name: "clipboard", keyboardAddress?: string, value?: string, playerName?: string): (name: "clipboard", keyboardAddress: string, value: string, playerName: string)
---@overload fun(timeout:number, name: "motion", address?:string, relativeX?:number, relativeY?:number, relativeZ?:number, entityName?:string): (name:"motion", address:string, relativeX:number, relativeY:number, relativeZ:number, entityName:string)
---@overload fun(timeout:number, name: "modem_message", receiverAddress?: string, senderAddress?: string, port?: number, distance?: number, ...): (name: "modem_message", receiverAddress: string, senderAddress: string, port: number, distance: number, ...)
---@overload fun(timeout:number, name: "inventory_changed", slot?: number): (name: "inventory_changed", slot: number)
function event.pull(timeout)  end

---returns the next available event from the queue, or waits until one becomes available but allows filtering by specifying filter function. timeout - if passed the function will wait for a new event for this many seconds at maximum then returns nil if no event was queued during that time.
---
---filter - if passed the function will use it as a filtering function of events. Allows for advanced filtering.
---@param filter function
---@return string, ...
---@overload fun(timeout: number, filter: function, ...): string, ...
function event.pullFiltered(filter)  end

---As its arguments pullMultiple accepts multiple event names to be pulled, allowing basic filtering of multiple events at once.
---@param ... string
---@return any ...
function event.pullMultiple(...) end

---Global event callback error handler. If an event listener throws an error, we handle it in this function to avoid it bubbling into unrelated code (that only triggered the execution by calling event.pull). Per default, this logs errors into a file on the temporary file system.
---
---You can replace this function with your own if you want to handle event errors in a different way.
---@param message any
function event.onError(message) end

---This is only an alias to computer.pushSignal. This does not modify the arguments in any way. It seemed logical to add the alias to the event library because there is also an event.pull for signals.
---@param name string
---@overload fun(name: string, ...)
function event.push(name) end

return event








local M = {}

function M:new()
	local o = {}

	setmetatable(o, self)
	self.__index = self

	return o
end

function M:set_config(config)
	self.filter_func = config or function(windows)
		return windows
	end
end

function M:filter_windows(windows)
	if type(self.filter_func) ~= 'function' then
		return windows
	end

	local filtered_windows = self.filter_func(windows)
	return type(filtered_windows) == 'table' and filtered_windows or windows
end

return M

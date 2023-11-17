local M = {}

function M:new(filters)
	local o = {}

	setmetatable(o, self)
	self.__index = self

	o.filter_stack = filters

	return o
end

function M:filter_windows(windows)
	local filtered_windows = windows

	for _, filter in ipairs(self.filter_stack) do
		filtered_windows = filter:filter_windows(filtered_windows)
	end

	return filtered_windows
end

return M

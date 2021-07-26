local module = {}
local http = game:GetService("HttpService")
local api_key = game:GetService("ServerStorage").DB.key.Value or "API_KEY"
local url = game:GetService("ServerStorage").DB.url.Value or "https://api-production-ewox.up.railway.app/"

function module:Find(params, model)
	local data = http:GetAsync(url .. "findone?key="..api_key.."&&model="..model.."&&params=".. http:JSONEncode(params))
	if string.find(string.lower(data), "error") then
		return {success = false}
	else
		data = http:JSONDecode(data)
		data.success = true
		return data
	end
end

function module:Create(params, model)
	local data = http:GetAsync(url .. "create?key="..api_key.."&&model="..model.."&&params=".. http:JSONEncode(params))
	if string.find(string.lower(data), "error") then
		return {success = false}
	else
		data = http:JSONDecode(data)
		data.success = true
		return data
	end
end

function module:Delete(params, model)
	local data = http:GetAsync(url .. "delete?key="..api_key.."&&model="..model.."&&params=".. http:JSONEncode(params))
	if string.find(string.lower(data), "success") then
		return {success = true}
	else
		return {success = false}
	end
end

function module:Update(params, model, update)
	local data = http:GetAsync(url .. "update?key="..api_key.."&&model="..model.."&&params=".. http:JSONEncode(params).."&&update=".. http:JSONEncode(update))
	if string.find(string.lower(data), "error") then
		return {success = false}
	else
		data = http:JSONDecode(data)
		data.success = true
		return data
	end
end

return module

local sw = {}
sw.__index = sw

sw.CombatService = {}

function sw.CombatService:AttackEntity(entity)
	local Players = game:GetService("Players")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local target

	if typeof(entity) == "string" then
		target = Players:FindFirstChild(entity) or Players:WaitForChild(entity)
	elseif typeof(entity) == "Instance" and entity:IsA and entity:IsA("Player") then
		target = entity
	else
		return false, "Invalid entity"
	end

	local remote = ReplicatedStorage:WaitForChild("Kw8"):WaitForChild("93b2718b-2b2a-4859-b36e-fd4614c7f0c9")
	local args = { target }
	remote:FireServer(unpack(args))
	return true
end

return sw

local mc = {}
mc.CombatService = {}

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

function mc.CombatService:AttackEntity(entity, tool)
    if not entity or not entity:FindFirstChild("Head") or not tool then return end
    local Attack = tool.Functions:FindFirstChild("Attack")
    if Attack then
        Attack:InvokeServer({
            [entity.Name] = entity.Head
        })
    end
end

function mc.CombatService:GetEquippedTool()
    local character = player.Character
    if not character then return nil end
    for _, obj in pairs(character:GetChildren()) do
        if obj:IsA("Tool") and obj:FindFirstChild("ActorId") then
            local actorId = obj.ActorId.Value
            local tool = ReplicatedStorage.Runtime.Actors:FindFirstChild(actorId)
            if tool then
                return tool
            end
        end
    end
    return nil
end

return mc

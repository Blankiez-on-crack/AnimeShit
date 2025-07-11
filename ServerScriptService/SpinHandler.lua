local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local CardData = require(ReplicatedStorage:WaitForChild("CardData"))

local SpinCardEvent = ReplicatedStorage:WaitForChild("SpinCardEvent")
local ShowCardPopup = ReplicatedStorage:WaitForChild("ShowCardPopup")
local UpdateBackpack = ReplicatedStorage:WaitForChild("UpdateBackpack")
local EquipCardEvent = ReplicatedStorage:WaitForChild("EquipCard")

local playerData = {}

local function getPlayerData(player)
    if not playerData[player] then
        playerData[player] = {
            Spins = 0,
            Cards = {},
            Equipped = nil,
        }
    end
    return playerData[player]
end

SpinCardEvent.OnServerEvent:Connect(function(player)
	local data = getPlayerData(player)
	data.Spins = data.Spins + 1

	local forceRare = false
	if data.Spins % 10 == 0 then
		forceRare = true
	end

	local card = CardData:GetRandomCard(forceRare)
	table.insert(data.Cards, card)

	ShowCardPopup:FireClient(player, card)
	UpdateBackpack:FireClient(player, data.Cards, data.Equipped, data.Spins)  -- <--- add spins
end)

EquipCardEvent.OnServerEvent:Connect(function(player, cardName)
	local data = getPlayerData(player)
	for i, card in data.Cards do
		if card.Name == cardName then
			data.Equipped = card
			break
		end
	end
	UpdateBackpack:FireClient(player, data.Cards, data.Equipped, data.Spins)  -- <--- add spins
end)


Players.PlayerRemoving:Connect(function(player)
    playerData[player] = nil
end)


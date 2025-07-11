local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

local SpinCardEvent = ReplicatedStorage:WaitForChild("SpinCardEvent")
local ShowCardPopup = ReplicatedStorage:WaitForChild("ShowCardPopup")
local UpdateBackpack = ReplicatedStorage:WaitForChild("UpdateBackpack")
local EquipCardEvent = ReplicatedStorage:WaitForChild("EquipCard")
local CardData = require(ReplicatedStorage:WaitForChild("CardData"))

-- UI Creation (restored layout)
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SpinGameUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Spin Counter & Luck UI
local spinCount = 0
local spinCounterLabel = Instance.new("TextLabel")
spinCounterLabel.Size = UDim2.new(0.14, 0, 0.03, 0)
spinCounterLabel.Position = UDim2.new(0.5, 0, 0.74, 0) -- moved up
spinCounterLabel.AnchorPoint = Vector2.new(0.5, 1)
spinCounterLabel.BackgroundTransparency = 1
spinCounterLabel.Text = "Spins: 0"
spinCounterLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
spinCounterLabel.Font = Enum.Font.GothamBold
spinCounterLabel.TextScaled = true
spinCounterLabel.ZIndex = 3
spinCounterLabel.Parent = screenGui

local luckLabel = Instance.new("TextLabel")
luckLabel.Size = UDim2.new(0.14, 0, 0.024, 0)
luckLabel.Position = UDim2.new(0.5, 0, 0.71, 0) -- moved up
luckLabel.AnchorPoint = Vector2.new(0.5, 1)
luckLabel.BackgroundTransparency = 1
luckLabel.Text = "Luck: 0%"
luckLabel.TextColor3 = Color3.fromRGB(95, 255, 95)
luckLabel.Font = Enum.Font.GothamBold
luckLabel.TextScaled = true
luckLabel.ZIndex = 3
luckLabel.Parent = screenGui

-- Spin Button
local spinButton = Instance.new("TextButton")
spinButton.Size = UDim2.new(0.17, 0, 0.06, 0)
spinButton.Position = UDim2.new(0.5, 0, 0.78, 0)
spinButton.AnchorPoint = Vector2.new(0.5, 0)
spinButton.Text = "Spin for Card!"
spinButton.BackgroundColor3 = Color3.fromRGB(255,215,0)
spinButton.TextColor3 = Color3.fromRGB(30,30,30)
spinButton.Font = Enum.Font.GothamBold
spinButton.TextScaled = true
spinButton.BorderSizePixel = 0
spinButton.AutoButtonColor = true
spinButton.Parent = screenGui
spinButton.ZIndex = 2
spinButton.BackgroundTransparency = 0
spinButton.ClipsDescendants = true
local spinCorner = Instance.new("UICorner")
spinCorner.CornerRadius = UDim.new(0.5,0)
spinCorner.Parent = spinButton

-- Auto Spin Button (moved directly under spin button)
local autoSpinButton = Instance.new("TextButton")
autoSpinButton.Size = UDim2.new(0.17, 0, 0.045, 0)
autoSpinButton.Position = UDim2.new(0.5, 0, 0.85, 0)
autoSpinButton.AnchorPoint = Vector2.new(0.5, 0)
autoSpinButton.Text = "Auto Spin"
autoSpinButton.BackgroundColor3 = Color3.fromRGB(80, 220, 105)
autoSpinButton.TextColor3 = Color3.fromRGB(30,30,30)
autoSpinButton.Font = Enum.Font.GothamBold
autoSpinButton.TextScaled = true
autoSpinButton.BorderSizePixel = 0
autoSpinButton.Parent = screenGui
autoSpinButton.ZIndex = 3
local autoSpinCorner = Instance.new("UICorner")
autoSpinCorner.CornerRadius = UDim.new(0.5,0)
autoSpinCorner.Parent = autoSpinButton

-- Backpack Button (LEFT SIDE)
local backpackButton = Instance.new("TextButton")
backpackButton.Size = UDim2.new(0.09, 0, 0.045, 0)
backpackButton.Position = UDim2.new(0.02, 0, 0.89, 0)
backpackButton.AnchorPoint = Vector2.new(0, 0)
backpackButton.Text = "Backpack"
backpackButton.BackgroundColor3 = Color3.fromRGB(80, 105, 220)
backpackButton.TextColor3 = Color3.fromRGB(255,255,255)
backpackButton.Font = Enum.Font.GothamBold
backpackButton.TextScaled = true
backpackButton.BorderSizePixel = 0
backpackButton.Parent = screenGui
backpackButton.ZIndex = 3
local backpackCorner = Instance.new("UICorner")
backpackCorner.CornerRadius = UDim.new(0.5,0)
backpackCorner.Parent = backpackButton

-- Backpack Popup (CENTERED, BIGGER, NORMALIZED)
local backpackFrame = Instance.new("Frame")
backpackFrame.Size = UDim2.new(0.55, 0, 0.65, 0)
backpackFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
backpackFrame.AnchorPoint = Vector2.new(0.5, 0.5)
backpackFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
backpackFrame.BackgroundTransparency = 0.1
backpackFrame.BorderSizePixel = 0
backpackFrame.Visible = false
backpackFrame.Parent = screenGui
backpackFrame.ZIndex = 100
local backpackFrameCorner = Instance.new("UICorner")
backpackFrameCorner.CornerRadius = UDim.new(0.08,0)
backpackFrameCorner.Parent = backpackFrame

local backpackTitle = Instance.new("TextLabel")
backpackTitle.Size = UDim2.new(0.5, 0, 0.13, 0)
backpackTitle.Position = UDim2.new(0.05, 0, 0, 0)
backpackTitle.BackgroundTransparency = 1
backpackTitle.Text = "Backpack"
backpackTitle.TextColor3 = Color3.fromRGB(230, 230, 255)
backpackTitle.Font = Enum.Font.GothamBold
backpackTitle.TextScaled = true
backpackTitle.ZIndex = 101
backpackTitle.Parent = backpackFrame

local backpackClose = Instance.new("TextButton")
backpackClose.Size = UDim2.new(0.13, 0, 0.13, 0)
backpackClose.Position = UDim2.new(0.87, 0, 0.01, 0)
backpackClose.AnchorPoint = Vector2.new(0, 0)
backpackClose.BackgroundColor3 = Color3.fromRGB(220,80,80)
backpackClose.Text = "X"
backpackClose.TextColor3 = Color3.fromRGB(255,255,255)
backpackClose.Font = Enum.Font.GothamBold
backpackClose.TextScaled = true
backpackClose.BorderSizePixel = 0
backpackClose.ZIndex = 102
backpackClose.Parent = backpackFrame
local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0.4,0)
closeCorner.Parent = backpackClose

-- Sort Buttons (Rarity, Name, Level) SCALE REMOVED
local sortModes = {"Rarity", "Name"}
local sortModeIndex = 1
local sortButton = Instance.new("TextButton")
sortButton.Size = UDim2.new(0.28, 0, 0.11, 0)
sortButton.Position = UDim2.new(0.55, 0, 0.01, 0)
sortButton.AnchorPoint = Vector2.new(0, 0)
sortButton.BackgroundColor3 = Color3.fromRGB(100, 100, 180)
sortButton.Text = "Sort: Rarity"
sortButton.TextColor3 = Color3.fromRGB(255,255,255)
sortButton.Font = Enum.Font.GothamBold
sortButton.TextScaled = true
sortButton.BorderSizePixel = 0
sortButton.ZIndex = 102
sortButton.Parent = backpackFrame
local sortCorner = Instance.new("UICorner")
sortCorner.CornerRadius = UDim.new(0.4,0)
sortCorner.Parent = sortButton

-- Card grid scroll (replaces list) -- square grid
local cardGridFrame = Instance.new("ScrollingFrame")
cardGridFrame.Size = UDim2.new(0.96,0,0.8,0)
cardGridFrame.Position = UDim2.new(0.02,0,0.15,0)
cardGridFrame.BackgroundTransparency = 1
cardGridFrame.ScrollBarThickness = 8
cardGridFrame.CanvasSize = UDim2.new(0,0,0,0)
cardGridFrame.ZIndex = 101
cardGridFrame.Parent = backpackFrame

-- Card details popup (shows on card click)
local cardDetailFrame = Instance.new("Frame")
cardDetailFrame.Size = UDim2.new(0.33, 0, 0.26, 0)
cardDetailFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
cardDetailFrame.AnchorPoint = Vector2.new(0.5, 0.5)
cardDetailFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 55)
cardDetailFrame.BackgroundTransparency = 0.05
cardDetailFrame.Visible = false
cardDetailFrame.Parent = backpackFrame
cardDetailFrame.ZIndex = 200
local detailCorner = Instance.new("UICorner")
detailCorner.CornerRadius = UDim.new(0.13, 0)
detailCorner.Parent = cardDetailFrame

local detailName = Instance.new("TextLabel")
detailName.Size = UDim2.new(0.9, 0, 0.33, 0)
detailName.Position = UDim2.new(0.05, 0, 0.07, 0)
detailName.BackgroundTransparency = 1
detailName.Text = ""
detailName.TextColor3 = Color3.fromRGB(255,255,255)
detailName.Font = Enum.Font.GothamBold
detailName.TextScaled = true
detailName.ZIndex = 201
detailName.Parent = cardDetailFrame

local detailRarity = Instance.new("TextLabel")
detailRarity.Size = UDim2.new(0.9, 0, 0.25, 0)
detailRarity.Position = UDim2.new(0.05, 0, 0.41, 0)
detailRarity.BackgroundTransparency = 1
detailRarity.Text = ""
detailRarity.TextColor3 = Color3.fromRGB(200,200,200)
detailRarity.Font = Enum.Font.Gotham
detailRarity.TextScaled = true
detailRarity.ZIndex = 201
detailRarity.Parent = cardDetailFrame

local detailLevel = Instance.new("TextLabel")
detailLevel.Size = UDim2.new(0.9, 0, 0.25, 0)
detailLevel.Position = UDim2.new(0.05, 0, 0.64, 0)
detailLevel.BackgroundTransparency = 1
detailLevel.Text = ""
detailLevel.TextColor3 = Color3.fromRGB(160,255,255)
detailLevel.Font = Enum.Font.Gotham
detailLevel.TextScaled = true
detailLevel.ZIndex = 201
detailLevel.Parent = cardDetailFrame

local detailClose = Instance.new("TextButton")
detailClose.Size = UDim2.new(0.18, 0, 0.18, 0)
detailClose.Position = UDim2.new(0.8, 0, 0.01, 0)
detailClose.AnchorPoint = Vector2.new(0, 0)
detailClose.BackgroundColor3 = Color3.fromRGB(220,80,80)
detailClose.Text = "X"
detailClose.TextColor3 = Color3.fromRGB(255,255,255)
detailClose.Font = Enum.Font.GothamBold
detailClose.TextScaled = true
detailClose.BorderSizePixel = 0
detailClose.ZIndex = 202
detailClose.Parent = cardDetailFrame
local closeDetailCorner = Instance.new("UICorner")
closeDetailCorner.CornerRadius = UDim.new(0.4,0)
closeDetailCorner.Parent = detailClose

-- Equip Button for card detail
local equipButton = Instance.new("TextButton")
equipButton.Size = UDim2.new(0.5, 0, 0.18, 0)
equipButton.Position = UDim2.new(0.25, 0, 0.85, 0)
equipButton.AnchorPoint = Vector2.new(0, 0)
equipButton.BackgroundColor3 = Color3.fromRGB(80, 220, 105)
equipButton.Text = "Equip"
equipButton.TextColor3 = Color3.fromRGB(30,30,30)
equipButton.Font = Enum.Font.GothamBold
equipButton.TextScaled = true
equipButton.BorderSizePixel = 0
equipButton.ZIndex = 202
equipButton.Parent = cardDetailFrame
local equipCorner = Instance.new("UICorner")
equipCorner.CornerRadius = UDim.new(0.4,0)
equipCorner.Parent = equipButton

equipButton.Visible = false -- Only show when a card is selected

-- For tracking backpack cards and equipped
local backpackCards = {}
local equippedCard = nil
local selectedDetailCard = nil

-- UI helpers
local function updateSpinAndLuckLabels(count)
	spinCount = count or spinCount or 0
	spinCounterLabel.Text = "Spins: " .. tostring(spinCount)

	local pct = 0
	if spinCount > 0 then
		if spinCount >= 1000 then
			pct = 10
		elseif spinCount >= 100 then
			pct = 5
		else
			pct = (spinCount / 100) * 5 -- linearly goes from 0 to 5%
		end
	end
	luckLabel.Text = string.format("Luck: %.1f%%", pct)
end


-- Helper for stacking cards
local function getStackedCards(cards)
	local stackMap = {}
	for i, card in cards do
		local key = card.Name .. "|" .. card.Rarity
		if stackMap[key] == nil then
			-- Shallow copy card and add count
			local c = {}
			for k, v in card do
				c[k] = v
			end
			c._count = 1
			stackMap[key] = c
		else
			stackMap[key]._count = stackMap[key]._count + 1
		end
	end
	-- Make an array
	local arr = {}
	for k, v in stackMap do
		table.insert(arr, v)
	end
	return arr
end

-- Backpack grid refresh with stacking, sorting & grid layout
local function refreshBackpackGrid()
	for i, child in cardGridFrame:GetChildren() do
		if child:IsA("TextButton") or child:IsA("TextLabel") or child:IsA("Frame") then
			child:Destroy()
		end
	end
	-- stack cards (by name+rarity)
	local cards = getStackedCards(backpackCards)

	-- Sorting logic
	local mode = sortModes[sortModeIndex]
	if mode == "Rarity" then
		local rarities = CardData.Rarities
		local rarityIndex = {}
		for i, r in rarities do
			rarityIndex[r] = i
		end
		table.sort(cards, function(a, b)
			local ai, bi = rarityIndex[a.Rarity] or 0, rarityIndex[b.Rarity] or 0
			if ai == bi then
				return a.Name < b.Name
			end
			return ai > bi -- Rarest on left
		end)
	elseif mode == "Name" then
		table.sort(cards, function(a, b)
			return a.Name < b.Name
		end)
	elseif mode == "Level" then
		table.sort(cards, function(a, b)
			if a.Level == b.Level then
				return a.Name < b.Name
			end
			return tostring(a.Level) < tostring(b.Level)
		end)
	end

	-- Grid display
	local gridCols = 5
	local btnPad = 0.01
	local btnSize = 1 / gridCols - 0.02
	local gridRows = math.ceil(#cards / gridCols)
	local totalHeight = gridRows * (btnSize + btnPad)
	for i, card in cards do
		local row = math.floor((i-1)/gridCols)
		local col = (i-1)%gridCols

		local btn = Instance.new("TextButton")
		btn.Size = UDim2.new(btnSize,0,btnSize,0)
		btn.Position = UDim2.new(col*(btnSize+btnPad)+btnPad,0,row*(btnSize+btnPad)+btnPad,0)
		btn.BackgroundColor3 = CardData:GetRarityColor(card.Rarity)
		btn.Text = card.Name -- Only name, no brackets, no scale
		btn.TextColor3 = Color3.fromRGB(30,30,30)
		btn.Font = Enum.Font.GothamBold
		btn.TextScaled = true
		btn.ZIndex = 110
		btn.AutoButtonColor = true
		btn.Parent = cardGridFrame
		local c = Instance.new("UICorner")
		c.CornerRadius = UDim.new(0.25,0)
		c.Parent = btn

		-- Show count indicator if stacked
		if card._count and card._count > 1 then
			local countLbl = Instance.new("TextLabel")
			countLbl.Size = UDim2.new(0.5, 0, 0.33, 0)
			countLbl.Position = UDim2.new(0.5, 0, 0.67, 0)
			countLbl.AnchorPoint = Vector2.new(0,0)
			countLbl.BackgroundTransparency = 1
			countLbl.Text = tostring(card._count).."x"
			countLbl.TextColor3 = Color3.fromRGB(255,255,255)
			countLbl.Font = Enum.Font.GothamBold
			countLbl.TextScaled = true
			countLbl.ZIndex = 111
			countLbl.Parent = btn
		end

		-- Highlight equipped
		if equippedCard and equippedCard.Name == card.Name and equippedCard.Rarity == card.Rarity then
			btn.BackgroundColor3 = Color3.fromRGB(255, 240, 80)
			btn.Text = "E: "..btn.Text
		end

		btn.MouseButton1Click:Connect(function()
			-- Show card details
			detailName.Text = card.Name
			detailRarity.Text = "Rarity: "..card.Rarity
			detailLevel.Text = "Level: "..(card.Level or "?")
			cardDetailFrame.Visible = true
			equipButton.Visible = true
			selectedDetailCard = card
		end)
	end
	-- Set CanvasSize so all rows are visible
	-- We want: CanvasSize.Y = (gridRows * (btnSize + btnPad)) * AbsY of cardGridFrame
	if gridRows > 0 then
		local absY = cardGridFrame.AbsoluteSize.Y
		local defaultRowsVisible = math.floor(1/(btnSize+btnPad))
		if gridRows > defaultRowsVisible then
			cardGridFrame.CanvasSize = UDim2.new(0,0,0,gridRows * absY * (btnSize+btnPad))
		else
			cardGridFrame.CanvasSize = UDim2.new(0,0,0,absY)
		end
	else
		cardGridFrame.CanvasSize = UDim2.new(0,0,0,cardGridFrame.AbsoluteSize.Y)
	end
end

-- Backpack logic
backpackButton.MouseButton1Click:Connect(function()
	backpackFrame.Visible = not backpackFrame.Visible
	cardDetailFrame.Visible = false
	equipButton.Visible = false
	if backpackFrame.Visible then
		refreshBackpackGrid()
	end
end)
backpackClose.MouseButton1Click:Connect(function()
	backpackFrame.Visible = false
	cardDetailFrame.Visible = false
	equipButton.Visible = false
end)

sortButton.MouseButton1Click:Connect(function()
	sortModeIndex = sortModeIndex + 1
	if sortModeIndex > #sortModes then
		sortModeIndex = 1
	end
	sortButton.Text = "Sort: " .. sortModes[sortModeIndex]
	refreshBackpackGrid()
end)

detailClose.MouseButton1Click:Connect(function()
	cardDetailFrame.Visible = false
	equipButton.Visible = false
end)

-- Equip logic for card detail
equipButton.MouseButton1Click:Connect(function()
	if selectedDetailCard then
		EquipCardEvent:FireServer(selectedDetailCard.Name, selectedDetailCard.Rarity)
		cardDetailFrame.Visible = false
		equipButton.Visible = false
	end
end)

-- Spin logic
local spinning = false
local spinPopupFrame = nil
local function doSpin()
	if spinning then return end
	spinning = true
	SpinCardEvent:FireServer()
	task.wait(0.22) -- spin faster!
	spinning = false
end

spinButton.MouseButton1Click:Connect(function()
	doSpin()
end)

-- Keyboard shortcut (spacebar) for spin
UserInputService.InputBegan:Connect(function(input, gpe)
	if gpe then return end
	if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.Space then
		doSpin()
	end
end)
-- Above-head display for equipped card
local function updateAboveHeadDisplay()
	local char = player.Character or player.CharacterAdded:Wait()
	if not char then return end
	-- Remove any existing tag
	for i, child in char:GetChildren() do
		if child:IsA("BillboardGui") and child.Name == "EquippedCardTag" then
			child:Destroy()
		end
	end
	if equippedCard then
		local tag = Instance.new("BillboardGui")
		tag.Name = "EquippedCardTag"
		tag.Size = UDim2.new(0, 200, 0, 40)
		tag.StudsOffset = Vector3.new(0, 3.5, 0)
		tag.AlwaysOnTop = true
		tag.MaxDistance = 100
		tag.Parent = char:FindFirstChild("Head") or char:FindFirstChildWhichIsA("BasePart")
		local label = Instance.new("TextLabel")
		label.Size = UDim2.new(1,0,1,0)
		label.BackgroundTransparency = 1
		label.Text = equippedCard.Name
		label.TextColor3 = CardData:GetRarityColor(equippedCard.Rarity)
		label.Font = Enum.Font.GothamBold
		label.TextScaled = true
		label.Parent = tag
	end
end
-- Auto Spin logic
local autoSpinning = false
autoSpinButton.MouseButton1Click:Connect(function()
	autoSpinning = not autoSpinning
	if autoSpinning then
		autoSpinButton.Text = "Auto: ON"
		spawn(function()
			while autoSpinning do
				doSpin()
				task.wait(0.23) -- spin even faster!
			end
		end)
	else
		autoSpinButton.Text = "Auto Spin"
	end
end)

-- Backpack Update Event
UpdateBackpack.OnClientEvent:Connect(function(cards, equipped, spins)
	backpackCards = cards or {}
	equippedCard = equipped
	print("Backpack updated - Spin count received:", spins)
	if spins ~= nil then
		spinCount = spins
	end
	updateSpinAndLuckLabels(spinCount)
	if backpackFrame.Visible then
		refreshBackpackGrid()
		cardDetailFrame.Visible = false
		equipButton.Visible = false
	end
	-- update above-head display if equipped changed
	updateAboveHeadDisplay()
end)

-- Show popup when card is spun (only one at a time, centered)
ShowCardPopup.OnClientEvent:Connect(function(card)
	if spinPopupFrame and spinPopupFrame.Parent then
		spinPopupFrame:Destroy()
	end
	local popup = Instance.new("Frame")
	popup.Size = UDim2.new(0.32,0,0.13,0)
	popup.Position = UDim2.new(0.5,0,0.5,0)
	popup.AnchorPoint = Vector2.new(0.5,0.5)
	popup.BackgroundColor3 = CardData:GetRarityColor(card.Rarity)
	popup.BackgroundTransparency = 0.1
	popup.ZIndex = 200
	popup.Parent = screenGui
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0.33,0)
	corner.Parent = popup

	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1,0,1,0)
	label.Position = UDim2.new(0,0,0,0)
	label.BackgroundTransparency = 1
	label.Text = "You Spun:\n"..card.Name.." ["..card.Rarity.."]"
	label.TextColor3 = Color3.fromRGB(30,30,30)
	label.Font = Enum.Font.GothamBold
	label.TextScaled = true
	label.ZIndex = 201
	label.Parent = popup

	spinPopupFrame = popup

	task.spawn(function()
		task.wait(2.2)
		if popup.Parent then
			popup:Destroy()
		end
		if spinPopupFrame == popup then
			spinPopupFrame = nil
		end
	end)
end)

-- Listen for character respawn to re-apply above-head display
player.CharacterAdded:Connect(function()
	task.wait(0.2)
	updateAboveHeadDisplay()
end)

-- Init: Request initial backpack
UpdateBackpack:FireServer()

updateSpinAndLuckLabels(spinCount)


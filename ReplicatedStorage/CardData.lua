local CardData = {}

-- List of rarities in order (lowest to highest, "???" at very top)
CardData.Rarities = {
    "Common", "Uncommon", "Rare", "Epic", "Legendary", "Mythic", "Celestial", "Transcendent", "Divine", "Ancient", "Eternal", "Godlike", "Singularity", "???"
}

-- Rarity drop chances (weights out of 1,000,000)
CardData.RarityDropChances = {
    Common = 600000,          -- 60%
    Uncommon = 140000,        -- 14%
    Rare = 70000,             -- 7%
    Epic = 40000,             -- 4%
    Legendary = 26000,        -- 2.6%
    Mythic = 17000,           -- 1.7%
    Celestial = 9000,         -- 0.9%
    Transcendent = 5500,      -- 0.55%
    Divine = 3500,            -- 0.35%
    Ancient = 2000,           -- 0.2%
    Eternal = 1000,           -- 0.1%
    Godlike = 500,            -- 0.05%
    Singularity = 200,        -- 0.025%
    ["???"] = 30,             -- 0.0125%
}

CardData.RarityOdds = {
    Common = "1 in 1.67",
    Uncommon = "1 in 7.14",
    Rare = "1 in 14.29",
    Epic = "1 in 25",
    Legendary = "1 in 38.46",
    Mythic = "1 in 58.82",
    Celestial = "1 in 111.11",
    Transcendent = "1 in 181.82",
    Divine = "1 in 285.71",
    Ancient = "1 in 500",
    Eternal = "1 in 1,000",
    Godlike = "1 in 2,000",
    Singularity = "1 in 5,000",
    ["???"] = "1 in 33,333",
}

CardData.RarityColors = {
    Common = Color3.fromRGB(150, 150, 150),         -- Gray
    Uncommon = Color3.fromRGB(86, 255, 75),         -- Green
    Rare = Color3.fromRGB(36, 112, 255),            -- Blue
    Epic = Color3.fromRGB(162, 58, 255),            -- Purple
    Legendary = Color3.fromRGB(255, 215, 0),        -- Gold
    Mythic = Color3.fromRGB(255, 62, 155),          -- Pink
    Celestial = Color3.fromRGB(0, 255, 255),        -- Cyan
    Transcendent = Color3.fromRGB(255, 80, 240),    -- Magenta
    Divine = Color3.fromRGB(255, 255, 255),         -- White
    Ancient = Color3.fromRGB(255, 124, 36),         -- Orange
    Eternal = Color3.fromRGB(70, 255, 220),         -- Teal
    Godlike = Color3.fromRGB(255, 0, 0),            -- Red
    Singularity = Color3.fromRGB(70, 0, 200),       -- Deep Violet
    ["???"] = Color3.fromRGB(40, 40, 40),           -- Obfuscated Black
}

-- Cards for every rarity, with evolution and support for each anime, plus power scaling
CardData.Cards = {
    -- COMMON (main/supports, lowest forms)
    {Name = "Ichigo (Human)", Rarity = "Common", Level = "Street Level", Scale = 1},      -- Bleach main
    {Name = "Orihime Inoue", Rarity = "Common", Level = "Street Level", Scale = 1},        -- Bleach support
    {Name = "Naruto (Kid)", Rarity = "Common", Level = "Large Mountain", Scale = 1},       -- Naruto main
    {Name = "Sakura Haruno", Rarity = "Common", Level = "Street Level", Scale = 1},        -- Naruto support
    {Name = "Monkey D. Luffy", Rarity = "Common", Level = "Street Level", Scale = 1},      -- One Piece main
    {Name = "Usopp", Rarity = "Common", Level = "Street Level", Scale = 1},                -- One Piece support
    {Name = "Yuji Itadori", Rarity = "Common", Level = "Street Level", Scale = 1},         -- JJK main
    {Name = "Megumi Fushiguro", Rarity = "Common", Level = "Street Level", Scale = 1},     -- JJK support

    -- UNCOMMON (slightly stronger forms)
    {Name = "Ichigo (Sword)", Rarity = "Uncommon", Level = "City Block", Scale = 1.05},
    {Name = "Chad", Rarity = "Uncommon", Level = "Street Level+", Scale = 1.05},
    {Name = "Naruto (Shadow Clone)", Rarity = "Uncommon", Level = "Island", Scale = 1.05},
    {Name = "Rock Lee", Rarity = "Uncommon", Level = "Street Level+", Scale = 1.05},
    {Name = "Luffy (Gum-Gum Bazooka)", Rarity = "Uncommon", Level = "Street Level+", Scale = 1.05},
    {Name = "Nami", Rarity = "Uncommon", Level = "Street Level+", Scale = 1.05},
    {Name = "Yuji (Black Flash)", Rarity = "Uncommon", Level = "Street Level+", Scale = 1.05},
    {Name = "Nobara Kugisaki", Rarity = "Uncommon", Level = "Street Level+", Scale = 1.05},

    -- RARE
    {Name = "Ichigo (Shikai)", Rarity = "Rare", Level = "Multi City Block", Scale = 1.2},
    {Name = "Renji Abarai", Rarity = "Rare", Level = "Building Level", Scale = 1.2},
    {Name = "Naruto (Genin)", Rarity = "Rare", Level = "Large Planetary", Scale = 1.2},
    {Name = "Kakashi Hatake", Rarity = "Rare", Level = "Building Level", Scale = 1.2},
    {Name = "Luffy (Gear 2nd)", Rarity = "Rare", Level = "Building Level", Scale = 1.2},
    {Name = "Zoro", Rarity = "Rare", Level = "Building Level", Scale = 1.2},
    {Name = "Yuji (Sukuna Unleashed)", Rarity = "Rare", Level = "Building Level", Scale = 1.2},
    {Name = "Gojo Satoru", Rarity = "Rare", Level = "Building Level", Scale = 1.2},

    -- EPIC
    {Name = "Ichigo (False)", Rarity = "Epic", Level = "City Level", Scale = 1.4},
    {Name = "Rukia Kuchiki", Rarity = "Epic", Level = "City Level", Scale = 1.4},
    {Name = "Naruto (Sage mode)", Rarity = "Epic", Level = "Star", Scale = 1.4},
    {Name = "Hinata Hyuga", Rarity = "Epic", Level = "City Level", Scale = 1.4},
    {Name = "Luffy (Gear 3rd)", Rarity = "Epic", Level = "City Level", Scale = 1.4},
    {Name = "Sanji", Rarity = "Epic", Level = "City Level", Scale = 1.4},
    {Name = "Maki Zenin", Rarity = "Epic", Level = "City Level", Scale = 1.4},

    -- LEGENDARY
    {Name = "Ichigo (Mask)", Rarity = "Legendary", Level = "Mountain Level", Scale = 1.6},
    {Name = "Uryu Ishida", Rarity = "Legendary", Level = "Mountain Level", Scale = 1.6},
    {Name = "Naruto (KCM1)", Rarity = "Legendary", Level = "Large Star", Scale = 1.6},
    {Name = "Jiraiya", Rarity = "Legendary", Level = "Mountain Level", Scale = 1.6},
    {Name = "Luffy (Gear 4th)", Rarity = "Legendary", Level = "Mountain Level", Scale = 1.6},
    {Name = "Law", Rarity = "Legendary", Level = "Mountain Level", Scale = 1.6},
    {Name = "Toji Fushiguro", Rarity = "Legendary", Level = "Mountain Level", Scale = 1.6},

    -- MYTHIC
    {Name = "Ichigo (Master Mask)", Rarity = "Mythic", Level = "Large Mountain Level", Scale = 1.75},
    {Name = "Yoruichi Shihoin", Rarity = "Mythic", Level = "Country Level", Scale = 1.75},
    {Name = "Naruto (KCM2)", Rarity = "Mythic", Level = "Solar System", Scale = 1.75},
    {Name = "Minato Namikaze", Rarity = "Mythic", Level = "Country Level", Scale = 1.75},
    {Name = "Luffy (Snake Man)", Rarity = "Mythic", Level = "Country Level", Scale = 1.75},
    {Name = "Jinbei", Rarity = "Mythic", Level = "Country Level", Scale = 1.75},
    {Name = "Yuji (Sukuna 10 Fingers)", Rarity = "Mythic", Level = "Country Level", Scale = 1.75},
    {Name = "Nanami Kento", Rarity = "Mythic", Level = "Country Level", Scale = 1.75},

    -- CELESTIAL
    {Name = "Ichigo (Fullbring)", Rarity = "Celestial", Level = "City", Scale = 2},
    {Name = "Isshin Kurosaki", Rarity = "Celestial", Level = "Planetary", Scale = 2},
    {Name = "Naruto (KCM2 Sage Mode)", Rarity = "Celestial", Level = "Galaxy", Scale = 2},
    {Name = "Sasuke (Adult)", Rarity = "Celestial", Level = "Planetary", Scale = 2},
    {Name = "Luffy (Gear 5)", Rarity = "Celestial", Level = "Planetary", Scale = 2},
    {Name = "Shanks", Rarity = "Celestial", Level = "Planetary", Scale = 2},
    {Name = "Yuta Okkotsu", Rarity = "Celestial", Level = "Planetary", Scale = 2},

	-- TRANSCENDENT
	{Name = "Ichigo (Fullbring Bankai)", Rarity = "Celestial", Level = "Large Mountain Level", Scale = 2.5},
    {Name = "Aizen (Captain)", Rarity = "Transcendent", Level = "Planetary", Scale = 2.5},
    {Name = "Naruto (Six Paths Sage Mode)", Rarity = "Transcendent", Level = "Universal+", Scale = 2.5},
    {Name = "Kurama", Rarity = "Transcendent", Level = "Multi-Planetary", Scale = 2.5},
    {Name = "Luffy (Awakened)", Rarity = "Transcendent", Level = "Planetary", Scale = 2.5}, -- Luffy cap at Planetary
    {Name = "Rayleigh", Rarity = "Transcendent", Level = "Planetary", Scale = 2.5},
    {Name = "Kenjaku", Rarity = "Transcendent", Level = "Multi-Planetary", Scale = 2.5},

    -- DIVINE
	{Name = "Ichigo (Dangai)", Rarity = "Divine", Level = "Multi Contienntal", Scale = 2.75},
	{Name = "Aizen (Hollow)", Rarity = "Transcendent", Level = "Star", Scale = 2.75},
    {Name = "Yhwach", Rarity = "Divine", Level = "Galaxy Level", Scale = 2.75},
    {Name = "Naruto (Asura Avatar)", Rarity = "Divine", Level = "Low Multiversal", Scale = 2.75},
    {Name = "Hagoromo (Voice)", Rarity = "Divine", Level = "Galaxy Level", Scale = 2.75},
    {Name = "Luffy (Gear 5 - Nika)", Rarity = "Divine", Level = "Planetary", Scale = 2.75},
    {Name = "Dragon", Rarity = "Divine", Level = "Planetary", Scale = 2.75},
    {Name = "Satoru Gojo (Unbound)", Rarity = "Divine", Level = "Low City", Scale = 2.75},

    -- ANCIENT
	{Name = "Ichigo (Final Getsuga)", Rarity = "Ancient", Level = "Planetary", Scale = 3},
	{Name = "Aizen (Fusion)", Rarity = "Transcendent", Level = "Solar System", Scale = 3},
    {Name = "Original Soul King", Rarity = "Ancient", Level = "Universal", Scale = 3},
    {Name = "Naruto (Boruto Base)", Rarity = "Ancient", Level = "Low Multiversal++", Scale = 3},
    {Name = "Kaguya Otsutsuki", Rarity = "Ancient", Level = "Low Multiversal", Scale = 3},
    {Name = "Luffy (Sun God)", Rarity = "Ancient", Level = "Planetary", Scale = 3},
    {Name = "Imu", Rarity = "Ancient", Level = "Planetary", Scale = 3},
	{Name = "Singular Yuji", Rarity = "Singularity", Level = "Large City+", Scale = 5},
    {Name = "Sukuna (15 Finger)", Rarity = "Ancient", Level = "City", Scale = 3},

    -- ETERNAL
    {Name = "Ichigo (True Shikai)", Rarity = "Eternal", Level = "Universal+", Scale = 3.5},
	{Name = "Soul King (Final)", Rarity = "Eternal", Level = "Low Multiversal", Scale = 3.5},
	{Name = "Aizen (Third)", Rarity = "Ancient", Level = "Galaxy", Scale = 3.5},
    {Name = "Naruto (Hokage SO6P)", Rarity = "Eternal", Level = "Multiversal+", Scale = 3.5},
    {Name = "Hagoromo (Sage)", Rarity = "Eternal", Level = "Low Multiversal", Scale = 3.5},
    {Name = "Luffy (Ultimate)", Rarity = "Eternal", Level = "Planetary", Scale = 3.5},
    {Name = "Joy Boy", Rarity = "Eternal", Level = "Planetary", Scale = 3.5},
    {Name = "Gojo (Limitless)", Rarity = "Eternal", Level = "City Level", Scale = 3.5},

    -- GODLIKE
	{Name = "Ichigo (True Bankai)", Rarity = "Godlike", Level = "Low Multiversal", Scale = 4},
	{Name = "Aizen (War)", Rarity = "Ancient", Level = "Low Multiveral+", Scale = 3},
    {Name = "Soul King (Omni)", Rarity = "Godlike", Level = "Low Multiversal", Scale = 4},
    {Name = "Naruto (Baryon Mode)", Rarity = "Godlike", Level = "Multiversal++", Scale = 4},
    {Name = "Kaguya", Rarity = "Godlike", Level = "Low Multiversal", Scale = 4},
    {Name = "Blackbeard (Darkness)", Rarity = "Godlike", Level = "Planetary", Scale = 4},
    {Name = "Sukuna (Heian)", Rarity = "Godlike", Level = "City+", Scale = 4},

    -- SINGULARITY (beyond all, one per anime)
    {Name = "Soul King", Rarity = "Singularity", Level = "Beyond Multiversal", Scale = 5},
    {Name = "Shibai", Rarity = "Singularity", Level = "Beyond Multiversal", Scale = 5},
	{Name = "Sun God", Rarity = "Singularity", Level = "Star", Scale = 5},
	{Name = "Mahoraga", Rarity = "Singularity", Level = "City Block+", Scale = 5},
	{Name = "Ben 10", Rarity = "Singularity", Level = "Outerversal", Scale = 5},

    -- ??? (mystery, top tier)
	{Name = "???", Rarity = "???", Level = "???", Scale = 6},
	{Name = "Yogiri", Rarity = "???", Level = "Hyperversal", Scale = 6},
	{Name = "Alien X", Rarity = "???", Level = "Boundless", Scale = 6},
}

-- Helper: Compute shifted rarity pool for luck milestones
function CardData:GetShiftedRarityPool(spinCount)
    -- Luck milestones: every 100 spins, up to 1000
    local shiftPercent = 0
    if type(spinCount) == "number" and spinCount > 0 then
        if spinCount % 1000 == 0 then
            shiftPercent = 0.10 -- 10% at 1000
        elseif spinCount % 100 == 0 then
            shiftPercent = 0.05 -- 5% at 100, 200, ..., 900
        end
        -- No shift if not at milestone
        if shiftPercent == 0 then
            -- Return a copy of the base pool
            local base = {}
            for i, rarity in CardData.Rarities do
                local weight = CardData.RarityDropChances[rarity]
                if type(weight) ~= "number" then
                    weight = 0
                end
                base[rarity] = weight
            end
            return base
        end

        -- Shift up to 5% or 10% of each rarity's weight to the next higher rarity
        local rarities = CardData.Rarities
        local shifted = {}
        -- Start with base weights
        for i, rarity in rarities do
            local weight = CardData.RarityDropChances[rarity]
            if type(weight) ~= "number" then
                weight = 0
            end
            shifted[rarity] = weight
        end
        -- Shift up
        for i = #rarities, 2, -1 do
            local lower = rarities[i-1]
            local upper = rarities[i]
            local lowerWeight = shifted[lower]
            if type(lowerWeight) ~= "number" then
                lowerWeight = 0
            end
            local shift = math.floor(lowerWeight * shiftPercent)
            shifted[lower] = math.max(lowerWeight - shift, 0)
            local upperWeight = shifted[upper]
            if type(upperWeight) ~= "number" then
                upperWeight = 0
            end
            shifted[upper] = upperWeight + shift
        end
        return shifted
    else
        -- Not a number or not > 0, just return base pool
        local base = {}
        for i, rarity in CardData.Rarities do
            local weight = CardData.RarityDropChances[rarity]
            if type(weight) ~= "number" then
                weight = 0
            end
            base[rarity] = weight
        end
        return base
    end
end

-- Helper: Get a random card, weighted by rarity drop chances and luck shift
function CardData:GetRandomCard(spinCount)
    local pool = self:GetShiftedRarityPool(spinCount)
    local total = 0
    for i, rarity in CardData.Rarities do
        local weight = pool[rarity]
        if type(weight) ~= "number" then
            weight = 0
        end
        total = total + weight
    end
    if total <= 0 then
        return nil
    end
    local roll = math.random(1, total)
    local accum = 0
    local chosenRarity
    for i, rarity in CardData.Rarities do
        local weight = pool[rarity]
        if type(weight) ~= "number" then
            weight = 0
        end
        accum = accum + weight
        if roll <= accum then
            chosenRarity = rarity
            break
        end
    end
    if not chosenRarity then
        chosenRarity = CardData.Rarities[1]
    end
    -- Get all cards of chosen rarity
    local poolCards = {}
    for i, card in CardData.Cards do
        if card.Rarity == chosenRarity then
            table.insert(poolCards, card)
        end
    end
    if #poolCards == 0 then return nil end
    local idx = math.random(1, #poolCards)
    return poolCards[idx]
end

function CardData:GetRarityOddsText(rarity)
    return CardData.RarityOdds[rarity] or "?"
end

function CardData:GetRarityColor(rarity)
    return CardData.RarityColors[rarity] or Color3.new(1,1,1)
end 

function CardData:FindCard(name, rarity)
    for i, card in CardData.Cards do
        if card.Name == name and card.Rarity == rarity then
            return card
        end
    end
    return nil
end

return CardData


-- Инициализация глобальной базы данных руд
local oreToWorldMap = {
    -- БАЗОВЫЕ И ДОРОГИЕ БЛОКИ МИРОВ
    ["stone"] = {{world = "Home World", layer = 0, prettyName = "Stone"}},
    ["dirt"] = {{world = "Home World", layer = 1, prettyName = "Dirt"}},
    ["mystic stone"] = {{world = "Magic Forest", layer = 0, prettyName = "Mystic Stone"}},
    ["magic stone"] = {{world = "Magic Forest", layer = 0, prettyName = "Magic Stone"}},
    ["space stone"] = {{world = "Space Adventure", layer = 0, prettyName = "Space Stone"}},
    ["prehistoric stone"] = {{world = "Dino Land", layer = 1, prettyName = "Prehistoric Stone"}},
    ["lava block"] = {{world = "Lava World", layer = 0, prettyName = "Lava Block"}},
    ["gem block"] = {{world = "Lava World", layer = 0, prettyName = "Gem Block"}},
    ["flour"] = {{world = "Food Land", layer = 0, prettyName = "Flour"}},
    ["sand"] = {{world = "Toy Land", layer = 0, prettyName = "Sand"}},
    ["sandstone"] = {
        {world = "Atlantis", layer = 0, prettyName = "Sandstone"},
        {world = "The Beach", layer = 0, prettyName = "Sandstone"}
    },
    ["cave stone"] = {{world = "Crystal Cavern", layer = 0, prettyName = "Cave Stone"}},
    ["sugar stone"] = {{world = "Candy Land", layer = 0, prettyName = "Sugar Stone"}},
    ["cyber block"] = {{world = "Cyber", layer = 0, prettyName = "Cyber Block"}},

    -- 1. HOME WORLD
    ["fossils"] = {{world = "Home World", layer = 2, prettyName = "Fossils"}}, 
    ["dinosaur bones"] = {{world = "Home World", layer = 2, prettyName = "Dinosaur Bones"}}, 
    ["skeleton stone"] = {{world = "Home World", layer = 4, prettyName = "Skeleton Stone"}}, 
    ["pezzottaite"] = {{world = "Home World", layer = 5, prettyName = "Pezzottaite"}}, 
    ["shadow stone"] = {{world = "Home World", layer = 9, prettyName = "Shadow Stone"}}, 
    ["illuminite"] = {{world = "Home World", layer = 9, prettyName = "Illuminite"}}, 
    ["rainbowite"] = {{world = "Home World", layer = 9, prettyName = "Rainbowite"}},

    -- 2. MAGIC FOREST
    ["twig ore"] = {{world = "Magic Forest", layer = 2, prettyName = "Twig Ore"}},
    ["magic wand"] = {{world = "Magic Forest", layer = 2, prettyName = "Magic Wand"}},
    ["gold ring ore"] = {{world = "Magic Forest", layer = 2, prettyName = "Gold Ring Ore"}},
    ["lily pad"] = {{world = "Magic Forest", layer = 3, prettyName = "Lily Pad"}},
    ["log ore"] = {{world = "Magic Forest", layer = 5, prettyName = "Log Ore"}},
    ["chest ore"] = {{world = "Magic Forest", layer = 5, prettyName = "Chest Ore"}},
    ["unicorn horn ore"] = {{world = "Magic Forest", layer = 5, prettyName = "Unicorn Horn Ore"}},
    ["mushroom ore"] = {{world = "Magic Forest", layer = 6, prettyName = "Mushroom Ore"}},
    ["orb ore"] = {{world = "Magic Forest", layer = 8, prettyName = "Orb Ore"}},

    -- 3. SPACE ADVENTURE
    ["asteroid rock"] = {{world = "Space Adventure", layer = 1, prettyName = "Asteroid Rock"}},
    ["ice"] = {{world = "Space Adventure", layer = 1, prettyName = "Ice"}},
    ["iron"] = {{world = "Space Adventure", layer = 2, prettyName = "Iron"}},
    ["opals"] = {{world = "Space Adventure", layer = 2, prettyName = "Opals"}},
    ["hematite"] = {{world = "Space Adventure", layer = 3, prettyName = "Hematite"}},
    ["cherry ruby"] = {{world = "Space Adventure", layer = 4, prettyName = "Cherry Ruby"}},
    ["bedrock"] = {{world = "Space Adventure", layer = 4, prettyName = "Bedrock"}},
    ["red beryl"] = {{world = "Space Adventure", layer = 5, prettyName = "Red Beryl"}},
    ["yellow beryl"] = {{world = "Space Adventure", layer = 5, prettyName = "Yellow Beryl"}},
    ["titanium"] = {{world = "Space Adventure", layer = 5, prettyName = "Titanium"}},
    ["amethyst"] = {{world = "Space Adventure", layer = 6, prettyName = "Amethyst"}},
    ["zircon"] = {{world = "Space Adventure", layer = 7, prettyName = "Zircon"}},
    ["blue beryl"] = {{world = "Space Adventure", layer = 7, prettyName = "Blue Beryl"}},

     -- 4. DINO LAND
    ["dinosaur eggs"] = {{world = "Dino Land", layer = 1, prettyName = "Dinosaur Eggs"}},
    ["meat bones"] = {{world = "Dino Land", layer = 2, prettyName = "Meat Bones"}},
    ["amber"] = {{world = "Dino Land", layer = 3, prettyName = "Amber"}},
    ["halite"] = {{world = "Dino Land", layer = 3, prettyName = "Halite"}},
    ["black onyx"] = {{world = "Dino Land", layer = 3, prettyName = "Black Onyx"}},
    ["fish bones"] = {{world = "Dino Land", layer = 4, prettyName = "Fish Bones"}},
    ["pyrite"] = {{world = "Dino Land", layer = 6, prettyName = "Pyrite"}},
    ["skeleton"] = {{world = "Dino Land", layer = 6, prettyName = "Skeleton"}},
    ["jade"] = {{world = "Dino Land", layer = 6, prettyName = "Jade"}},
    ["cannibar"] = {{world = "Dino Land", layer = 7, prettyName = "Cannibar"}},

    -- 5. LAVA WORLD
    ["slate"] = {{world = "Lava World", layer = 1, prettyName = "Slate"}},
    ["talc"] = {{world = "Lava World", layer = 2, prettyName = "Talc"}},
    ["fluorite"] = {{world = "Lava World", layer = 2, prettyName = "Fluorite"}},
    ["amertrine"] = {{world = "Lava World", layer = 2, prettyName = "Amertrine"}},
    ["garnet"] = {{world = "Lava World", layer = 4, prettyName = "Garnet"}},
    ["orpiment"] = {{world = "Lava World", layer = 5, prettyName = "Orpiment"}},
    ["citrine"] = {{world = "Lava World", layer = 5, prettyName = "Citrine"}},
    ["tanzanite"] = {{world = "Lava World", layer = 5, prettyName = "Tanzanite"}},
    ["aquamarine"] = {{world = "Lava World", layer = 5, prettyName = "Aquamarine"}},
    ["black diamond"] = {{world = "Lava World", layer = 8, prettyName = "Black Diamond"}},

    -- 6. FOOD LAND
    ["macaroni"] = {{world = "Food Land", layer = 1, prettyName = "Macaroni"}},
    ["french fries"] = {{world = "Food Land", layer = 2, prettyName = "French Fries"}},
    ["chicken nugget"] = {{world = "Food Land", layer = 2, prettyName = "Chicken Nugget"}},
    ["bananas"] = {{world = "Food Land", layer = 3, prettyName = "Bananas"}},
    ["bacon"] = {{world = "Food Land", layer = 3, prettyName = "Bacon"}},
    ["cookies"] = {{world = "Food Land", layer = 4, prettyName = "Cookies"}},
    ["watermelon"] = {{world = "Food Land", layer = 7, prettyName = "Watermelon"}},
    ["nachos"] = {{world = "Food Land", layer = 7, prettyName = "Nachos"}},
    ["pizza"] = {{world = "Food Land", layer = 8, prettyName = "Pizza"}},
    ["hotdogs"] = {{world = "Food Land", layer = 9, prettyName = "Hotdogs"}},

    -- 7. TOY LAND
    ["plastic"] = {{world = "Toy Land", layer = 1, prettyName = "Plastic"}},
    ["block ore"] = {{world = "Toy Land", layer = 2, prettyName = "Block Ore"}},
    ["gun ore"] = {{world = "Toy Land", layer = 2, prettyName = "Gun Ore"}},
    ["puzzle ore"] = {{world = "Toy Land", layer = 3, prettyName = "Puzzle Ore"}},
    ["car ore"] = {{world = "Toy Land", layer = 4, prettyName = "Car Ore"}},
    ["spaceship ore"] = {{world = "Toy Land", layer = 5, prettyName = "Spaceship Ore"}},
    ["airplane ore"] = {{world = "Toy Land", layer = 5, prettyName = "Airplane Ore"}},
    ["tank ore"] = {{world = "Toy Land", layer = 6, prettyName = "Tank Ore"}},
    ["teddybear ore"] = {{world = "Toy Land", layer = 6, prettyName = "Teddybear Ore"}},

    -- 8. ATLANTIS
    ["ancient stone"] = {{world = "Atlantis", layer = 1, prettyName = "Ancient Stone"}},
    ["seaweed"] = {{world = "Atlantis", layer = 2, prettyName = "Seaweed"}},
    ["kelp"] = {{world = "Atlantis", layer = 3, prettyName = "Kelp"}},
    ["golden coins"] = {{world = "Atlantis", layer = 3, prettyName = "Golden Coins"}},
    ["anchors"] = {{world = "Atlantis", layer = 3, prettyName = "Anchors"}},
    ["starfish"] = {{world = "Atlantis", layer = 3, prettyName = "Starfish"}},
    ["pearls"] = {{world = "Atlantis", layer = 5, prettyName = "Pearls"}},
    ["ancient artifact"] = {{world = "Atlantis", layer = 7, prettyName = "Ancient Artifact"}},
    ["ancient gem"] = {{world = "Atlantis", layer = 8, prettyName = "Ancient Gem"}},

    -- 9. CRYSTAL CAVERN
    ["crystal stone"] = {{world = "Crystal Cavern", layer = 1, prettyName = "Crystal Stone"}},
    ["thermium"] = {{world = "Crystal Cavern", layer = 2, prettyName = "Thermium"}},
    ["bonzanite"] = {{world = "Crystal Cavern", layer = 2, prettyName = "Bonzanite"}},
    ["blood stone"] = {{world = "Crystal Cavern", layer = 3, prettyName = "Blood Stone"}},
    ["chromius"] = {{world = "Crystal Cavern", layer = 3, prettyName = "Chromius"}},
    ["craxium"] = {{world = "Crystal Cavern", layer = 4, prettyName = "Craxium"}},
    ["crystalite"] = {{world = "Crystal Cavern", layer = 6, prettyName = "Crystalite"}},
    ["praxium"] = {{world = "Crystal Cavern", layer = 6, prettyName = "Praxium"}},
    ["royal ore"] = {{world = "Crystal Cavern", layer = 6, prettyName = "Royal Ore"}},
    ["oraxanium"] = {{world = "Crystal Cavern", layer = 7, prettyName = "Oraxanium"}},

    -- 10. THE BEACH
    ["sunscreen ore"] = {{world = "The Beach", layer = 2, prettyName = "Sunscreen Ore"}},
    ["shovel ore"] = {{world = "The Beach", layer = 2, prettyName = "Shovel Ore"}},
    ["sunglasses"] = {{world = "The Beach", layer = 3, prettyName = "Sunglasses"}},
    ["surfboard ore"] = {{world = "The Beach", layer = 4, prettyName = "Surfboard Ore"}},
    ["ice cream"] = {{world = "The Beach", layer = 6, prettyName = "Ice Cream"}},
    ["chlorite"] = {{world = "The Beach", layer = 6, prettyName = "Chlorite"}},
    ["ice pop"] = {{world = "The Beach", layer = 6, prettyName = "Ice Pop"}},
    ["mithril"] = {{world = "The Beach", layer = 7, prettyName = "Mithril"}},
    ["orcalium"] = {{world = "The Beach", layer = 8, prettyName = "Orcalium"}},

    -- 11. CANDY LAND
    ["icing"] = {{world = "Candy Land", layer = 1, prettyName = "Icing"}},
    ["peppermint"] = {{world = "Candy Land", layer = 2, prettyName = "Peppermint"}},
    ["skittles ore"] = {{world = "Candy Land", layer = 3, prettyName = "Skittles Ore"}},
    ["jellybean stone"] = {{world = "Candy Land", layer = 3, prettyName = "Jellybean Stone"}},
    -- ПРОДОЛЖЕНИЕ ТАБЛИЦЫ (Запусти этот кусок вторым)
    ["lollipop ore"] = {{world = "Candy Land", layer = 3, prettyName = "Lollipop Ore"}},
    ["gummy bear ore"] = {{world = "Candy Land", layer = 3, prettyName = "Gummy Bear Ore"}},
    ["gummy ore"] = {{world = "Candy Land", layer = 4, prettyName = "Gummy Ore"}},
    ["candy fish ore"] = {{world = "Candy Land", layer = 5, prettyName = "Candy Fish Ore"}},
    ["candy floss ore"] = {{world = "Candy Land", layer = 5, prettyName = "Candy Floss Ore"}},
    ["heart candy"] = {{world = "Candy Land", layer = 6, prettyName = "Heart Candy"}},
    ["egg candy"] = {{world = "Candy Land", layer = 6, prettyName = "Egg Candy"}},

    -- 12. CYBER WORLD (КИБЕР-ГОРОД)
    ["neon block"] = {{world = "Cyber", layer = 1, prettyName = "Neon Block"}},
    ["cybite"] = {{world = "Cyber", layer = 2, prettyName = "Cybite"}},
    ["techium"] = {{world = "Cyber", layer = 3, prettyName = "Techium"}},
    ["malwarite"] = {{world = "Cyber", layer = 3, prettyName = "Malwarite"}},
    ["trojanite"] = {{world = "Cyber", layer = 3, prettyName = "Trojanite"}},
    ["virusite"] = {{world = "Cyber", layer = 4, prettyName = "Virusite"}},
    ["spamite"] = {{world = "Cyber", layer = 6, prettyName = "Spamite"}},
    ["memorite"] = {{world = "Cyber", layer = 6, prettyName = "Memorite"}},
    ["ransomium"] = {{world = "Cyber", layer = 8, prettyName = "Ransomium"}},
    ["dark memorite"] = {{world = "Cyber", layer = 8, prettyName = "Dark Memorite"}},

    -- СУНДУКИ (CHESTS) И ИХ ДУБЛИКАТЫ
    ["wooden chest"] = {{world = "Home World", layer = 1, prettyName = "Wooden Chest"}},
    ["silver chest"] = {{world = "Home World", layer = 3, prettyName = "Silver Chest"}},
    ["magical chest"] = {{world = "Home World", layer = 5, prettyName = "Magical Chest"}},
    ["mythical chest"] = {{world = "Home World", layer = 5, prettyName = "Mythical Chest"}},
    ["unobtainable chest"] = {{world = "Home World", layer = 6, prettyName = "Unobtainable Chest"}},
    ["shadow chest"] = {{world = "Home World", layer = 6, prettyName = "Shadow Chest"}},
    ["light chest"] = {{world = "Home World", layer = 9, prettyName = "Light Chest"}},
    ["token chest"] = {{world = "Home World", layer = 10, prettyName = "Token Chest"}},
    ["unreal chest"] = {
        {world = "Magic Forest", layer = 8, prettyName = "Unreal Chest"},
        {world = "Crystal Cavern", layer = 8, prettyName = "Unreal Chest"}
    },
    ["crystal chest"] = {
        {world = "Magic Forest", layer = 11, prettyName = "Crystal Chest"},
        {world = "Crystal Cavern", layer = 11, prettyName = "Crystal Chest"}
    },
    ["emerald chest"] = {{world = "Atlantis", layer = 6, prettyName = "Emerald Chest"}},
    ["ruby chest"] = {{world = "Atlantis", layer = 8, prettyName = "Ruby Chest"}},
    ["sapphire chest"] = {{world = "Atlantis", layer = 10, prettyName = "Sapphire Chest"}},
    ["golden chest"] = {
        {world = "Home World", layer = 4, prettyName = "Golden Chest"},
        {world = "Atlantis", layer = 3, prettyName = "Golden Chest"}
    },

    -- ГЛОБАЛЬНЫЕ ДУБЛИРУЮЩИЕСЯ РУДЫ И ДРУГИЕ СВЯЗИ
    ["grass"] = {
        {world = "Home World", layer = 0, prettyName = "Grass"},
        {world = "Dino Land", layer = 0, prettyName = "Grass"}
    },
    ["grass ore"] = {{world = "Magic Forest", layer = 2, prettyName = "Grass Ore"}},
    ["coconuts"] = {{world = "The Beach", layer = 3, prettyName = "Coconuts"}},
    ["godly gem"] = {
        {world = "Space Adventure", layer = 9, prettyName = "Godly Gem"},
        {world = "Dino Land", layer = 8, prettyName = "Godly Gem"}
    },
    ["twilight gem"] = {{world = "Crystal Cavern", layer = 9, prettyName = "Twilight Gem"}},
    ["coal"] = {
        {world = "Home World", layer = 3, prettyName = "Coal"},
        {world = "Space Adventure", layer = 1, prettyName = "Coal"}
    },
    ["copper"] = {
        {world = "Home World", layer = 3, prettyName = "Copper"},
        {world = "Space Adventure", layer = 1, prettyName = "Copper"}
    },
    ["silver"] = {
        {world = "Home World", layer = 4, prettyName = "Silver"},
        {world = "Space Adventure", layer = 1, prettyName = "Silver"}
    },
    ["gold"] = {
        {world = "Home World", layer = 5, prettyName = "Gold"},
        {world = "Space Adventure", layer = 1, prettyName = "Gold"}
    },
    ["quartz"] = {
        {world = "Home World", layer = 4, prettyName = "Quartz"},
        {world = "Space Adventure", layer = 1, prettyName = "Quartz"}
    },
    ["emerald"] = {
        {world = "Home World", layer = 6, prettyName = "Emerald"},
        {world = "Space Adventure", layer = 3, prettyName = "Emerald"}
    },
    ["ruby"] = {
        {world = "Home World", layer = 6, prettyName = "Ruby"},
        {world = "Space Adventure", layer = 3, prettyName = "Ruby"}
    },
    ["lavastone"] = {
        {world = "Home World", layer = 6, prettyName = "Lavastone"},
        {world = "Space Adventure", layer = 3, prettyName = "Lavastone"}
    },
    ["sapphire"] = {
        {world = "Home World", layer = 6, prettyName = "Sapphire"},
        {world = "Space Adventure", layer = 4, prettyName = "Sapphire"}
    },
    ["obsidian"] = {
        {world = "Home World", layer = 6, prettyName = "Obsidian"},
        {world = "Space Adventure", layer = 5, prettyName = "Obsidian"}
    },
    ["glowstone"] = {
        {world = "Home World", layer = 6, prettyName = "Glowstone"},
        {world = "Space Adventure", layer = 5, prettyName = "Glowstone"}
    },
    ["diamond"] = {
        {world = "Home World", layer = 7, prettyName = "Diamond"},
        {world = "Space Adventure", layer = 3, prettyName = "Diamond"}
    },
    ["unobtainium"] = {
        {world = "Home World", layer = 7, prettyName = "Unobtainium"},
        {world = "Space Adventure", layer = 5, prettyName = "Unobtainium"}
    },
    ["lapis"] = {
        {world = "Home World", layer = 6, prettyName = "Lapis"},
        {world = "Space Adventure", layer = 5, prettyName = "Lapis"}
    },
    ["uranium"] = {
        {world = "Home World", layer = 6, prettyName = "Uranium"},
        {world = "Space Adventure", layer = 5, prettyName = "Uranium"}
    },
    ["platinum"] = {
        {world = "Home World", layer = 6, prettyName = "Platinum"},
        {world = "Space Adventure", layer = 5, prettyName = "Platinum"}
    },
    ["krixanium"] = {
        {world = "Home World", layer = 6, prettyName = "Krixanium"},
        {world = "Space Adventure", layer = 5, prettyName = "Krixanium"}
    },
    ["red rock"] = {
        {world = "Home World", layer = 6, prettyName = "Red Rock"},
        {world = "Space Adventure", layer = 5, prettyName = "Red Rock"}
    },
    ["dravite"] = {
        {world = "Home World", layer = 6, prettyName = "Dravite"},
        {world = "Space Adventure", layer = 5, prettyName = "Dravite"}
    },
    ["mythic stone"] = {
        {world = "Home World", layer = 7, prettyName = "Mythic Stone"},
        {world = "Space Adventure", layer = 5, prettyName = "Mythic Stone"}
    },
    ["legendary stone"] = {
        {world = "Home World", layer = 7, prettyName = "Legendary Stone"},
        {world = "Space Adventure", layer = 5, prettyName = "Legendary Stone"}
    },
    ["breadstone"] = {
        {world = "Home World", layer = 8, prettyName = "Breadstone"},
        {world = "Space Adventure", layer = 6, prettyName = "Breadstone"}
    }
}
local desiredGravity = 196
local gravityLockEnabled = true

game:GetService("RunService").Stepped:Connect(function()
    if gravityLockEnabled and workspace.Gravity ~= desiredGravity then
        workspace.Gravity = desiredGravity
    end
end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local MarketplaceService = game:GetService("MarketplaceService")
local LocalPlayer = Players.LocalPlayer
local placeId = game.PlaceId

local trackedBlocks = {}
local activeCards = {}
local currentMode = "ESP"

local function getCharacter()
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local hrp = character:WaitForChild("HumanoidRootPart")
    local humanoid = character:WaitForChild("Humanoid")
    return character, hrp, humanoid
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MiningSimPlusGUI"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

local function runMainGuiWithIntro(guiFrame)
    local IntroGui = Instance.new("ScreenGui")
    IntroGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    IntroGui.IgnoreGuiInset = true

    local Note = Instance.new("TextLabel")
    Note.Size = UDim2.new(0, 320, 0, 40)
    Note.Position = UDim2.new(0.5, -160, 0.1, -20)
    Note.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Note.TextColor3 = Color3.fromRGB(255, 255, 255)
    Note.Font = Enum.Font.GothamBold
    Note.TextScaled = true
    Note.Text = "Made by Watzz and Kirblox39"
    Note.Parent = IntroGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = Note

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(0, 170, 255)
    stroke.Thickness = 2
    stroke.Parent = Note

    Note.BackgroundTransparency = 1
    Note.TextTransparency = 1
    
    for i = 1, 20 do
        Note.BackgroundTransparency = 1 - (i * 0.05)
        Note.TextTransparency = 1 - (i * 0.05)
        task.wait(0.02)
    end
    task.wait(3)
    for i = 1, 20 do
        Note.BackgroundTransparency = i * 0.05
        Note.TextTransparency = i * 0.05
        task.wait(0.02)
    end
    IntroGui:Destroy()
    guiFrame.Visible = true
end

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 280, 0, 290)
MainFrame.Position = UDim2.new(0.5, -140, 0.3, -145)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 12)
Corner.Parent = MainFrame

local Stroke = Instance.new("UIStroke")
Stroke.Color = Color3.fromRGB(0, 170, 255)
Stroke.Thickness = 2
Stroke.Parent = MainFrame

local OpenButton = Instance.new("TextButton")
OpenButton.Size = UDim2.new(0, 30, 0, 60)
OpenButton.Position = UDim2.new(0.5, -140, 0.1, 0)
OpenButton.Text = ">"
OpenButton.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
OpenButton.Parent = ScreenGui
OpenButton.Visible = false

local OpenCorner = Instance.new("UICorner")
OpenCorner.CornerRadius = UDim.new(0, 6)
OpenCorner.Parent = OpenButton

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 25, 0, 25)
CloseButton.Position = UDim2.new(1, -30, 0, 5)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
CloseButton.Parent = MainFrame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseButton

local GameThumbnail = Instance.new("ImageLabel")
GameThumbnail.Size = UDim2.new(0, 60, 0, 60)
GameThumbnail.Position = UDim2.new(0, 10, 0, 10)
GameThumbnail.BackgroundTransparency = 1
GameThumbnail.Parent = MainFrame

local GameTitle = Instance.new("TextLabel")
GameTitle.Size = UDim2.new(0, 200, 0, 30)
GameTitle.Position = UDim2.new(0, 80, 0, 10)
GameTitle.BackgroundTransparency = 1
GameTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
GameTitle.TextScaled = true
GameTitle.Font = Enum.Font.GothamBold
GameTitle.Text = "Mining Simulator"
GameTitle.Parent = MainFrame

local InfoLabel = Instance.new("TextLabel")
InfoLabel.Size = UDim2.new(0, 200, 0, 40)
InfoLabel.Position = UDim2.new(0, 80, 0, 50)
InfoLabel.BackgroundTransparency = 1
InfoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
InfoLabel.TextScaled = true
InfoLabel.TextWrapped = true
InfoLabel.Font = Enum.Font.Gotham
InfoLabel.Text = "Ping: ...\nServer: ..."
InfoLabel.Parent = MainFrame

pcall(function()
    local success, info = pcall(function()
        return MarketplaceService:GetProductInfo(placeId, Enum.InfoType.Asset)
    end)
    if success and info then
        GameTitle.Text = info.Name
        GameThumbnail.Image = "https://roblox.com" .. info.AssetId .. "&width=150&height=150"
    end
end)

RunService.RenderStepped:Connect(function()
    local ping = math.floor(LocalPlayer:GetNetworkPing() * 1000)
    local serverID = game.JobId:sub(1, 6)
    InfoLabel.Text = string.format("Ping: %d ms\nServer: %s", ping, serverID)
end)

local function MakeButton(text, xPos, yPos, parentFrame, sizeX, sizeY)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, sizeX or 120, 0, sizeY or 30)
    btn.Position = UDim2.new(0, xPos, 0, yPos)
    btn.Text = text
    btn.Font = Enum.Font.GothamBold
    btn.TextScaled = true
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    btn.Parent = parentFrame or MainFrame

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = btn
    return btn
end

local ListFrame = Instance.new("Frame")
ListFrame.Size = UDim2.new(0, 140, 0, 290)
ListFrame.Position = UDim2.new(0, -145, 0, 0)
ListFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
ListFrame.BorderSizePixel = 0
ListFrame.Parent = MainFrame
ListFrame.Visible = false

local ListCorner = Instance.new("UICorner")
ListCorner.CornerRadius = UDim.new(0, 12)
ListCorner.Parent = ListFrame

local ListStroke = Instance.new("UIStroke")
ListStroke.Color = Color3.fromRGB(0, 170, 255)
ListStroke.Thickness = 2
ListStroke.Parent = ListFrame

local ListClose = Instance.new("TextButton")
ListClose.Size = UDim2.new(0, 18, 0, 18)
ListClose.Position = UDim2.new(0, 5, 0, 5)
ListClose.Text = "X"
ListClose.TextColor3 = Color3.fromRGB(255, 100, 100)
ListClose.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ListClose.Font = Enum.Font.GothamBold
ListClose.Parent = ListFrame
ListClose.MouseButton1Click:Connect(function() ListFrame.Visible = false end)

local SearchBox = Instance.new("TextBox")
SearchBox.Size = UDim2.new(1, -10, 0, 25)
SearchBox.Position = UDim2.new(0, 5, 0, 28)
SearchBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SearchBox.PlaceholderText = "Search..."
SearchBox.Font = Enum.Font.Gotham
SearchBox.TextSize = 12
SearchBox.Text = ""
SearchBox.Parent = ListFrame

local ScrollingList = Instance.new("ScrollingFrame")
ScrollingList.Size = UDim2.new(1, -10, 1, -65)
ScrollingList.Position = UDim2.new(0, 5, 0, 58)
ScrollingList.BackgroundTransparency = 1
ScrollingList.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollingList.ScrollBarThickness = 3
ScrollingList.Parent = ListFrame

local ListLayout = Instance.new("UIListLayout")
ListLayout.Parent = ScrollingList
ListLayout.Padding = UDim.new(0, 4)

local DisplayFrame = Instance.new("ScrollingFrame")
DisplayFrame.Size = UDim2.new(0, 240, 0, 290)
DisplayFrame.Position = UDim2.new(1, 10, 0, 0)
DisplayFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
DisplayFrame.BorderSizePixel = 0
DisplayFrame.ScrollBarThickness = 4
DisplayFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
DisplayFrame.Parent = MainFrame
DisplayFrame.Visible = false

local DisplayCorner = Instance.new("UICorner")
DisplayCorner.CornerRadius = UDim.new(0, 12)
DisplayCorner.Parent = DisplayFrame

local DisplayStroke = Instance.new("UIStroke")
DisplayStroke.Color = Color3.fromRGB(0, 170, 255)
DisplayStroke.Thickness = 2
DisplayStroke.Parent = DisplayFrame

local DisplayLayout = Instance.new("UIListLayout")
DisplayLayout.Parent = DisplayFrame
DisplayLayout.Padding = UDim.new(0, 6)

local AutoRebirth = MakeButton("Auto Rebirth", 20, 100)
local AutoMine = MakeButton("Auto Mine", 150, 100)
local DupeButton = MakeButton("Dupe", 20, 140)
local BoostFPS = MakeButton("Boost FPS", 150, 140)
local EspListBtn = MakeButton("ESP Blocks", 20, 180)
local WikiListBtn = MakeButton("WIKI Blocks", 150, 180)

local function getPartToApplyEsp(blockModel)
    if not blockModel or not blockModel:IsA("Model") then return nil end
    local cp = blockModel:FindFirstChild("ColorPart")
    local p = blockModel:FindFirstChild("Part")
    local b = blockModel:FindFirstChild("Base")
    if cp and cp:IsA("BasePart") then return cp end
    if p and p:IsA("BasePart") then return p end
    if b and b:IsA("BasePart") then return b end
    if blockModel.PrimaryPart then return blockModel.PrimaryPartend
    return blockModel:FindFirstChildOfClass("BasePart")
end

local function removeEspFromBlock(blockModel)
    local target = getPartToApplyEsp(blockModel)
    if target then
        local old = target:FindFirstChild("BlockEspGui")
        if old then old:Destroy() end
    end
end

local function applyEspToBlock(blockModel, nameLower, config)
    if not blockModel or not config or not config.enabled then return end
    local target = getPartToApplyEsp(blockModel)
    if not target then return end
    
    removeEspFromBlock(blockModel)
    
    local bgui = Instance.new("BillboardGui")
    bgui.Name = "BlockEspGui"
    bgui.Size = UDim2.new(0, 14, 0, 14)
    bgui.AlwaysOnTop = true
    
    local f = Instance.new("Frame")
    f.Size = UDim2.new(1, 0, 1, 0)
    f.BackgroundColor3 = config.color
    f.Parent = bgui
    
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(1, 0)
    c.Parent = f
    
    bgui.Parent = target
end

local function updateAllEspForBlock(nameLower)
    local config = trackedBlocks[nameLower]
    local blocksFolder = workspace:FindFirstChild("Blocks")
    if not blocksFolder then return end
    
    for _, b in ipairs(blocksFolder:GetChildren()) do
        if b.Name:lower() == nameLower then
            if config and config.enabled then
                applyEspToBlock(b, nameLower, config)
            else
                removeEspFromBlock(b)
            end
        end
    end
end

local function refreshDisplayLayoutSize()
    local totalHeight = 0
    for _, child in ipairs(DisplayFrame:GetChildren()) do
        if child:IsA("Frame") then
            totalHeight = totalHeight + child.Size.Y.Offset + 6
        end
    end
    DisplayFrame.CanvasSize = UDim2.new(0, 0, 0, totalHeight + 10)
end

local function createActiveCard(nameLower)
    if activeCards[nameLower] then return end
    DisplayFrame.Visible = true
    
    local data = oreToWorldMap[nameLower]
    local pName = (data and data.prettyName) or nameLower:sub(1,1):upper()..nameLower:sub(2)
    
    local CardFrame = Instance.new("Frame")
    CardFrame.Size = UDim2.new(1, -10, 0, currentMode == "ESP" and 110 or 80)
    CardFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    CardFrame.Parent = DisplayFrame
    
    local cc = Instance.new("UICorner")
    cc.CornerRadius = UDim.new(0, 8)
    cc.Parent = CardFrame
    
    activeCards[nameLower] = CardFrame
    
    local CardClose = Instance.new("TextButton")
    CardClose.Size = UDim2.new(0, 16, 0, 16)
    CardClose.Position = UDim2.new(1, -22, 0, 6)
    CardClose.Text = "X"
    CardClose.TextColor3 = Color3.fromRGB(255, 100, 100)
    CardClose.BackgroundTransparency = 1
    CardClose.Font = Enum.Font.GothamBold
    CardClose.Parent = CardFrame
    CardClose.MouseButton1Click:Connect(function()
        CardFrame:Destroy()
        activeCards[nameLower] = nil
        refreshDisplayLayoutSize()
        if next(activeCards) == nil then DisplayFrame.Visible = false end
    end)
    
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, -30, 0, 20)
    Title.Position = UDim2.new(0, 8, 0, 4)
    Title.BackgroundTransparency = 1
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 13
    Title.Text = pName
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.Parent = CardFrame
    
    if currentMode == "ESP" then
        if not trackedBlocks[nameLower] then
            trackedBlocks[nameLower] = {enabled = true, color = Color3.fromRGB(0, 170, 255)}
        else
            trackedBlocks[nameLower].enabled = true
        end
        updateAllEspForBlock(nameLower)
        
        local OptBtn = Instance.new("TextButton")
        OptBtn.Size = UDim2.new(1, -16, 0, 24)
        OptBtn.Position = UDim2.new(0, 8, 0, 28)
        OptBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 100)
        OptBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        OptBtn.Font = Enum.Font.GothamBold
        OptBtn.TextSize = 11
        OptBtn.Text = "ESP: ON"
        OptBtn.Parent = CardFrame
        Instance.new("UICorner", OptBtn).CornerRadius = UDim.new(0, 4)
        
        OptBtn.MouseButton1Click:Connect(function()
            trackedBlocks[nameLower].enabled = not trackedBlocks[nameLower].enabled
            if trackedBlocks[nameLower].enabled then
                OptBtn.Text = "ESP: ON"
                OptBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 100)
            else
                OptBtn.Text = "ESP: OFF"
                OptBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
            end
            updateAllEspForBlock(nameLower)
        end)
        
        local function makeRgb(x, val)
            local b = Instance.new("TextBox")
            b.Size = UDim2.new(0, 45, 0, 22)
            b.Position = UDim2.new(0, x, 0, 58)
            b.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            b.TextColor3 = Color3.fromRGB(255, 255, 255)
            b.Text = tostring(math.floor(val * 255))
            b.Font = Enum.Font.Gotham
            b.TextSize = 11
            b.Parent = CardFrame
            Instance.new("UICorner", b).CornerRadius = UDim.new(0, 4)
            return b
        end
        
        local rB = makeRgb(8, trackedBlocks[nameLower].color.R)
        local gB = makeRgb(60, trackedBlocks[nameLower].color.G)
        local bB = makeRgb(112, trackedBlocks[nameLower].color.B)
        
        local AppColor = Instance.new("TextButton")
        AppColor.Size = UDim2.new(0, 60, 0, 22)
        AppColor.Position = UDim2.new(0, 164, 0, 58)
        AppColor.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
        AppColor.TextColor3 = Color3.fromRGB(255, 255, 255)
        AppColor.Text = "Set"
        AppColor.Font = Enum.Font.GothamBold
        AppColor.TextSize = 11
        AppColor.Parent = CardFrame
        Instance.new("UICorner", AppColor).CornerRadius = UDim.new(0, 4)
        
        AppColor.MouseButton1Click:Connect(function()
            local r = tonumber(rB.Text) or 255
            local g = tonumber(gB.Text) or 0
            local b = tonumber(bB.Text) or 0
            trackedBlocks[nameLower].color = Color3.fromRGB(math.clamp(r,0,255), math.clamp(g,0,255), math.clamp(b,0,255))
            updateAllEspForBlock(nameLower)
        end)
    else
        local InfoTxt = Instance.new("TextLabel")
        InfoTxt.Size = UDim2.new(1, -16, 0, 45)
        InfoTxt.Position = UDim2.new(0, 8, 0, 28)
        InfoTxt.BackgroundTransparency = 1
        InfoTxt.TextColor3 = Color3.fromRGB(220, 220, 220)
        InfoTxt.Font = Enum.Font.Gotham
        InfoTxt.TextSize = 11
        InfoTxt.TextWrapped = true
        
        if data and #data > 0 then
            local str = ""
            for _, info in ipairs(data) do
                str = str .. string.format("World: %s | Layer: %d\n", info.world, info.layer)
            end
            InfoTxt.Text = str
        else
            InfoTxt.Text = "Location data unavailable."
        end
        InfoTxt.Parent = CardFrame
    end
    refreshDisplayLayoutSize()
end

local function populateList()
    for _, item in ipairs(ScrollingList:GetChildren()) do
        if not item:IsA("UIListLayout") then item:Destroy() end
    end
    
    local counts = {}
    local blocksFolder = workspace:FindFirstChild("Blocks")
    if blocksFolder then
        for _, b in ipairs(blocksFolder:GetChildren()) do
            local nl = b.Name:lower()
            counts[nl] = (counts[nl] or 0) + 1
        end
    end
    
    local sortedList = {}
    for k in pairs(oreToWorldMap) do table.insert(sortedList, k) end
    table.sort(sortedList)
    
    local filter = SearchBox.Text:lower()
    local idx = 0
    
    for _, nameL in ipairs(sortedList) do
        local data = oreToWorldMap[nameL]
        local pName = (data and data.prettyName) or nameL:sub(1,1):upper()..nameL:sub(2)
        local count = counts[nameL] or 0
        
        if filter == "" or pName:lower():find(filter) or nameL:find(filter) then
            idx = idx + 1
            local ItemBtn = Instance.new("TextButton")
            ItemBtn.Size = UDim2.new(1, -4, 0, 26)
            ItemBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            ItemBtn.TextColor3 = count > 0 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(110, 110, 110)
            ItemBtn.Font = Enum.Font.Gotham
            ItemBtn.TextSize = 11
            ItemBtn.Text = string.format("  %s (%d)", pName, count)
            ItemBtn.TextXAlignment = Enum.TextXAlignment.Left
            ItemBtn.Parent = ScrollingList
            Instance.new("UICorner", ItemBtn).CornerRadius = UDim.new(0, 4)
            
            ItemBtn.MouseButton1Click:Connect(function()
                createActiveCard(nameL)
            end)
        end
    end
    ScrollingList.CanvasSize = UDim2.new(0, 0, 0, idx * 30)
end

SearchBox:GetPropertyChangedSignal("Text"):Connect(populateList)

task.spawn(function()
    while task.wait(3) do
        if ListFrame.Visible then populateList() end
    end
end)

workspace:WaitForChild("Blocks").ChildAdded:Connect(function(child)
    task.wait()
    local nl = child.Name:lower()
    if trackedBlocks[nl] and trackedBlocks[nl].enabled then
        applyEspToBlock(child, nl, trackedBlocks[nl])
    end
end)

EspListBtn.MouseButton1Click:Connect(function()
    currentMode = "ESP"
    ListFrame.Visible = true
    populateList()
end)

WikiListBtn.MouseButton1Click:Connect(function()
    currentMode = "WIKI"
    ListFrame.Visible = true
    populateList()
end)

local function startTelepadRebirth()
    if getgenv().MS_AUTO_RUNNING then warn("Auto Rebirth already running") return end
    getgenv().MS_AUTO_RUNNING = true
    getgenv().Name = getgenv().Name or " "

    local SellThreshold = getgenv().SellThreshold or 30000
    local Depth = getgenv().Depth or 260
    local SellArea = CFrame.new(41.96064, 14, -1239.64648)
    local Collapse = false
    local ScriptIsBroken = false
    local Counter = 0
    local TeleportPos

    local virtual = game:GetService("VirtualUser")
    LocalPlayer.Idled:Connect(function()
        virtual:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        task.wait(1)
        virtual:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    end)

    local screenGui = LocalPlayer.PlayerGui:WaitForChild("ScreenGui")
    
    pcall(function() screenGui.TeleporterFrame:Destroy() end)
    pcall(function() screenGui.StatsFrame.Sell:Destroy() end)
    pcall(function() screenGui.MainButtons.Surface:Destroy() end)

    local character, hrp, humanoid = getCharacter()
    pcall(function()
        character.Head.CustomPlayerTag.PlayerName.Text = getgenv().Name
        character.Head.CustomPlayerTag.MinerRank.Text = "Made By Watzz"
    end)

    local Remote = nil
    pcall(function()
        local netFunc = game:GetService("ReplicatedStorage"):FindFirstChild("Network")
        if netFunc and netFunc:IsA("RemoteFunction") then
            local serverEvent, _ = netFunc:InvokeServer()
            if serverEvent and serverEvent:IsA("RemoteEvent") then
                Remote = serverEvent
            end
        end
    end)

    if not Remote then
        LocalPlayer:Kick("Failed to secure RemoteEvent bypass.")
        return
    end

    pcall(function() Remote.OnClientEvent:Connect(function() return nil end) end)

    local function refreshCharacter()
        character, hrp, humanoid = getCharacter()
        return character, hrp, humanoid
    end

    local function split(s, del)
        local res = {}
        for match in (s .. del):gmatch("(.-)" .. del) do table.insert(res, match) end
        return res
    end

    local function getDepthAmount()
        local lbl = screenGui:FindFirstChild("TopInfoFrame") and screenGui.TopInfoFrame:FindFirstChild("Depth")
        if not lbl then return 0 end
        return tonumber(split(lbl.Text, " ")[1]) or 0
    end

    local CoinsAmount = LocalPlayer.leaderstats.Coins
    local function getCoinsAmount()
        return tonumber(tostring(CoinsAmount.Value):gsub(",", "")) or 0
    end

    local function getInventoryAmount()
        local amount
        pcall(function() amount = screenGui.StatsFrame2.Inventory.Amount.Text end)
        if not amount then
            pcall(function() amount = character.Backpack.Decore.Count.SurfaceGui.Amount.Text end)
        end
        amount = tostring(amount or "0"):gsub("%s+", ""):gsub(",", "")
        return tonumber(amount:split("/")[1]) or 0
    end

    local function setPlatformStand(state)
        refreshCharacter()
        humanoid.PlatformStand = state
        for _, obj in ipairs(character:GetDescendants()) do
            if obj:IsA("BasePart") then obj.CanCollide = false end
        end
    end

    local function hardSetCFrame(cframe, anchored)
        refreshCharacter()
        hrp.Anchored = true
        setPlatformStand(true)
        hrp.CFrame = cframe
        RunService.Stepped:Wait()
        hrp.Anchored = anchored == true
    end

    local function softSetCFrame(cframe)
        refreshCharacter()
        setPlatformStand(true)
        hrp.Anchored = false
        hrp.CFrame = cframe
        RunService.Stepped:Wait()
    end

    local function moveToLavaStart()
        refreshCharacter()
        gravityLockEnabled = false
        workspace.Gravity = 1000
        humanoid.WalkSpeed = 0
        humanoid.JumpPower = 0
        hrp.Anchored = true
        setPlatformStand(true)
        Remote:FireServer("MoveTo", {{"LavaSpawn"}})
        task.wait(1)
        hrp.Anchored = false

        while hrp.Position.Z > 26220 do
            hardSetCFrame(CFrame.new(Vector3.new(hrp.Position.X, 13.05, hrp.Position.Z - 0.5)), false)
            task.wait()
        end
        hardSetCFrame(CFrame.new(18, 10, 26220), false)
        workspace.Gravity = desiredGravity
        gravityLockEnabled = true
    end

    local function digToDepth()
        refreshCharacter()
        while getDepthAmount() < Depth and hrp.Position.Y > -2430 do
            local min = hrp.CFrame + Vector3.new(-1, -10, -1)
            local max = hrp.CFrame + Vector3.new(1, 0, 1)
            local parts = workspace:FindPartsInRegion3WithWhiteList(Region3.new(min.Position, max.Position), {workspace.Blocks}, 5)
            for _, block in pairs(parts) do
                Remote:FireServer("MineBlock", {{block.Parent}})
                RunService.Stepped:Wait()
            end
            task.wait()
        end
    end

    local function placeTelepadAt(pos)
        refreshCharacter()
        hardSetCFrame(CFrame.new(pos), true)
        Remote:FireServer("RemovePad", {{}})
        task.wait(0.1)
        Remote:FireServer("PlaceTeleporter", {{pos}})
        task.wait(0.25)
        Remote:FireServer("TeleportToPad", {{}})
        task.wait(0.25)
        TeleportPos = hrp.Position
    end

    local function returnToTelepad()
        refreshCharacter()
        hrp.Anchored = true
        setPlatformStand(true)
        for _ = 1, 30 do
            Remote:FireServer("TeleportToPad", {{}})
            RunService.Stepped:Wait()
            if TeleportPos and (hrp.Position - TeleportPos).Magnitude <= 6 then return true end
        end
        return false
    end

    local function resetTelepadAtStart()
        placeTelepadAt(Vector3.new(18, 10, 26220))
    end

    local function fullDepthSetup()
        moveToLavaStart()
        digToDepth()
        refreshCharacter()
        placeTelepadAt(hrp.CFrame.Position)
    end

    fullDepthSetup()

    local RebirthsAmount = LocalPlayer.leaderstats.Rebirths
    local blocksMined = LocalPlayer.leaderstats:FindFirstChild("Blocks Mined")
    if blocksMined then
        blocksMined:GetPropertyChangedSignal("Value"):Connect(function() Counter = 0 end)
    end

    workspace.Collapsed.Changed:Connect(function()
        if workspace.Collapsed.Value == true then
            Collapse = true
            setPlatformStand(false)
            refreshCharacter()
            hrp.Anchored = true
            task.wait(1)
            hrp.Anchored = false
            fullDepthSetup()
            Counter = 0
            Collapse = false
        end
    end)

    task.spawn(function()
        while getgenv().MS_AUTO_RUNNING do
            task.wait(1)
            Counter = Counter + 1
            if Counter >= 10 then
                if not Collapse and not ScriptIsBroken then
                    ScriptIsBroken = true
                    resetTelepadAtStart()
                    Counter = 0
                    ScriptIsBroken = false
                else
                    Counter = 0
                end
            end
        end
    end)

    local function rebirthLoop()
        setPlatformStand(true)
        while getgenv().MS_AUTO_RUNNING do
            refreshCharacter()
            if not Collapse and not ScriptIsBroken then
                local params = OverlapParams.new()
                params.FilterType = Enum.RaycastFilterType.Include
                params.FilterDescendantsInstances = {workspace.Blocks}

                local parts = workspace:GetPartBoundsInBox(hrp.CFrame, Vector3.new(10, 10, 10), params)
                if parts then
                    for _, block in pairs(parts) do
                        if Collapse or ScriptIsBroken then break end
                        if block:IsA("BasePart") and block.Parent then
                            Remote:FireServer("MineBlock", {{block.Parent}})
                        end

                        if getInventoryAmount() >= SellThreshold then
                            while getInventoryAmount() >= SellThreshold and not Collapse and not ScriptIsBroken do
                                softSetCFrame(SellArea)
                                task.wait()
                                Remote:FireServer("SellItems", {{}})
                                task.wait()
                            end

                            while getCoinsAmount() >= (10000000 * (RebirthsAmount.Value + 1)) and not Collapse and not ScriptIsBroken do
                                Remote:FireServer("Rebirth", {{}})
                                task.wait()
                            end

                            if not returnToTelepad() then resetTelepadAtStart() end
                            setPlatformStand(true)
                        end
                        task.wait()
                    end
                else
                    if not Collapse and not ScriptIsBroken then resetTelepadAtStart() end
                end
            end
            RunService.Stepped:Wait()
        end
    end
    rebirthLoop()
end

AutoRebirth.MouseButton1Click:Connect(function() task.spawn(startTelepadRebirth) end)
AutoMine.MouseButton1Click:Connect(function() loadstring(game:HttpGet("https://githubusercontent.com"))() end)
DupeButton.MouseButton1Click:Connect(function() loadstring(game:HttpGet("https://githubusercontent.com"))() end)

CloseButton.MouseButton1Click:Connect(function() MainFrame.Visible = false OpenButton.Visible = true end)
OpenButton.MouseButton1Click:Connect(function() MainFrame.Visible = true OpenButton.Visible = false end)

task.spawn(function() runMainGuiWithIntro(MainFrame) end)

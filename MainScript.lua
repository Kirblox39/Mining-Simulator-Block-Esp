-- Инициализация глобальной базы данных руд
_G.oreToWorldMap = {
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

-- Автоматическое слияние первой части (из прошлого сообщения) и этой второй части в глобальную память
if not _G.oreToWorldMap then
    _G.oreToWorldMap = {}
end

for oreName, infoData in pairs(part2) do
    _G.oreToWorldMap[oreName] = infoData
end

print("Вторая часть базы успешно добавлена. Всего руд в базе: ", table.concat({print(select(2, pcall(function() local c = 0 for _ in pairs(_G.oreToWorldMap) do c = c + 1 end return c end)))}))

local Game: DataModel, typeof = game, typeof
if not (Game:IsLoaded()) then Game.Loaded:Wait() end

if typeof(_IsLoadedFM) == "function" and _IsLoadedFM() then return warn("[FLAMES]: Script Already loaded!") end

local Repo = "https://raw.githubusercontent.com/FlamesW/DirectorCut/home/Games/"
local loadstring, Universe = loadstring, Game.CreatorId

local Games = {
    [997469855] = {
        Name = "A Bizarre Village",
        Url = Repo .. "ABV/Source.luau",
    },
}

local Entry = Games[Universe]

if Entry then
    loadstring(Game:HttpGet(Entry.Url))()
end

local ReGui = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/catblox1346/Dear-ReGui/refs/heads/main/ReGui.lua"
))()

local InsertService = game:GetService("InsertService")

print("ReGui version:", ReGui:GetVersion())
print("PrefabsId:", ReGui.PrefabsId)

-- Load prefab của fork
local Prefabs = InsertService:LoadLocalAsset(
    "rbxassetid://" .. tostring(ReGui.PrefabsId)
)

print("Prefabs loaded:", Prefabs:GetFullName())
print("Prefab count:", #Prefabs:GetChildren())

-- Init
ReGui:Init({
    Prefabs = Prefabs
})

print("ReGui initialized")
print("Starting built-in DemoWindow...")

-- Chạy demo chính thức được nhúng trong ReGui
local Success, Error = xpcall(function()
    ReGui.DemoWindow(ReGui)
end, debug.traceback)

print("Demo finished:", Success)

if not Success then
    warn(Error)
end

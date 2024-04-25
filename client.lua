local QBCore = exports['qb-core']:GetCoreObject()
local CurrentArea = nil
local SafeZones = {}

local function CreateSafeZone()
    local combo = ComboZone:Create(SafeZones, {
        name = 'safearea',
        debugPoly = false
    })
    combo:onPlayerInOut(function(isPointInside, l, zone)
        if isPointInside then
            CurrentArea = zone.name
                -- exports['qb-core']:DrawText(Config.SafeZoneLocations[CurrentArea]['drawText'], Config.DrawTextPosition)
        else
            CurrentArea = nil
            -- exports['qb-core']:HideText()
        end
    end)
end

local function CreateSafeZonePolyZone(safezone)
    local zone = PolyZone:Create(Config.SafeZoneLocations[safezone].Zone.Shape, {
        name = safezone,
        minZ = Config.SafeZoneLocations[safezone].Zone.minZ,
        maxZ = Config.SafeZoneLocations[safezone].Zone.maxZ,
        debugPoly = Config.SafeZoneLocations[safezone].debug
    })
    isInZone = false
    zone:onPlayerInOut(function(isPointInside)
        isInZone = isPointInside
        CreateThread(function()
            while isInZone do
                -- Disable controls
                SetCurrentPedWeapon(player, GetHashKey("WEAPON_UNARMED"), true)
                DisplayHelpText(Config.Title)
                if IsControlJustPressed(0, 106) then
                    QBCore.Functions.Notify('You are in a safezone. You can not shoot.', 'error')
                end
                SetPlayerCanDoDriveBy(player, false)
                DisablePlayerFiring(player, true)
                DisableControlAction(0, 140)
                Wait(0)
            end
        end)
    end)
    SafeZones[#SafeZones + 1] = zone
end

-- Threads
CreateThread(function()
    for _, safezone in pairs(Config.SafeZoneLocations) do
        if safezone.showBlip then
            local SafeBlip = AddBlipForCoord(safezone.blipcoords.x, safezone.blipcoords.y, safezone.blipcoords.z)
            local blipColor = safezone.blipColor ~= nil and safezone.blipColor or 3
            SetBlipSprite(SafeBlip, safezone.blipNumber)
            SetBlipDisplay(SafeBlip, 4)
            SetBlipScale(SafeBlip, 0.90)
            SetBlipAsShortRange(SafeBlip, true)
            SetBlipColour(SafeBlip, blipColor)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(Config.GarageNameAsBlipName and safezone.label or safezone.blipName)
            EndTextCommandSetBlipName(SafeBlip)
        end
    end
end)

CreateThread(function()
    for garageName, safezone in pairs(Config.SafeZoneLocations) do
        if (safezone.type == 'green' or safezone.type == 'stress' or safezone.type == 'heal') then
            CreateSafeZonePolyZone(garageName)
        end
    end
    CreateSafeZone()
end)

function DisplayHelpText(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 0, -1)
end

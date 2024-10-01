local frame = CreateFrame("Frame")

-- Funktion zum Deaktivieren der Tooltips im Kampf und beim Betreten eines Dungeons
local function HideTooltipsOnEvent(event)
    if event == "PLAYER_REGEN_DISABLED" or event == "INSTANCE_ENCOUNTER_ENGAGE_UNIT" then
        -- Spieler ist im Kampf oder hat einen Dungeon betreten
        frame:SetScript("OnUpdate", function()
            if GameTooltip:IsShown() then
                GameTooltip:Hide()
            end
        end)
    elseif event == "PLAYER_REGEN_ENABLED" then
        -- Spieler ist aus dem Kampf, Tooltip-Anzeige wieder zulassen
        frame:SetScript("OnUpdate", nil) -- Tooltip-Blockierung aufheben
    elseif event == "PLAYER_ENTERING_WORLD" then
        -- Spieler hat einen Dungeon betreten oder den Weltzustand geändert
        if IsInInstance() then
            frame:SetScript("OnUpdate", function()
                if GameTooltip:IsShown() then
                    GameTooltip:Hide()
                end
            end)
        else
            frame:SetScript("OnUpdate", nil) -- OnUpdate-Blockierung aufheben, wenn man nicht in einem Dungeon ist
        end
    end
end

-- Hook für das Erstellen der Tooltips, um diese im Kampf und beim Dungeon-Eintritt direkt zu blockieren
GameTooltip:HookScript("OnShow", function(self)
    if InCombatLockdown() or IsInInstance() then
        self:Hide() -- Sofort ausblenden, falls im Kampf oder im Dungeon
    end
end)

-- Event-Listener für Kampfeintritt, Kampfaustritt und Dungeon-Eintritt
frame:RegisterEvent("PLAYER_REGEN_DISABLED")
frame:RegisterEvent("PLAYER_REGEN_ENABLED")
frame:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT") -- Event für Dungeon-Eintritt
frame:RegisterEvent("PLAYER_ENTERING_WORLD") -- Event für den Weltzustand

frame:SetScript("OnEvent", HideTooltipsOnEvent)

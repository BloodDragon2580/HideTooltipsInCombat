local frame = CreateFrame("Frame")

-- Funktion zum Deaktivieren der Tooltips im Kampf
local function HideTooltipsOnCombat(event)
    if event == "PLAYER_REGEN_DISABLED" then
        -- Spieler ist im Kampf
        frame:SetScript("OnUpdate", function()
            if GameTooltip:IsShown() then
                GameTooltip:Hide()
            end
        end)
    elseif event == "PLAYER_REGEN_ENABLED" then
        -- Spieler ist aus dem Kampf, Tooltip-Anzeige wieder zulassen
        frame:SetScript("OnUpdate", nil) -- Tooltip-Blockierung aufheben
    end
end

-- Hook für das Erstellen der Tooltips, um diese im Kampf direkt zu blockieren
GameTooltip:HookScript("OnShow", function(self)
    if InCombatLockdown() then
        self:Hide() -- Sofort ausblenden, falls im Kampf
    end
end)

-- Event-Listener für den Kampfeintritt und -austritt
frame:RegisterEvent("PLAYER_REGEN_DISABLED")
frame:RegisterEvent("PLAYER_REGEN_ENABLED")

frame:SetScript("OnEvent", HideTooltipsOnCombat)

local addonName = ...

local frame = CreateFrame("Frame")

-- =========================
-- Localization
-- =========================
local function MakeL()
    local L = {
        TITLE = addonName or "HideTooltipsInCombat",

        OPT_HIDE_TITLE = "Hide tooltips in combat",
        OPT_HIDE_DESC  = "Default: tooltips are hidden in combat. Hold the override key to show them temporarily.",

        OPT_AURA_TITLE = "Hide my buff/debuff tooltips in combat",
        OPT_AURA_DESC  = "Hide tooltips on your own buff and debuff icons during combat. When disabled, those tooltips remain visible. The override key still works.",

        OPT_KEY_TITLE  = "Override key in combat",
        OPT_KEY_DESC   = "Hold the key and hover a new target to show tooltips in combat.",

        KEY_ALT   = "ALT",
        KEY_SHIFT = "SHIFT",
        KEY_CTRL  = "CTRL",
        KEY_NONE  = "None (always hidden in combat)",
    }

    local loc = GetLocale()
    local t = {
        deDE = {
            OPT_AURA_TITLE = "Eigene Buff-/Debuff-Tooltips im Kampf ausblenden",
            OPT_AURA_DESC  = "Versteckt Tooltips der eigenen Buffs und Debuffs im Kampf. Ist diese Option aus, bleiben sie sichtbar. Die Override-Taste funktioniert weiterhin.",
            OPT_HIDE_TITLE = "Tooltips im Kampf verstecken",
            OPT_HIDE_DESC  = "Standard: Tooltips sind im Kampf AUS. Halte die Override-Taste gedrückt, um sie kurz anzuzeigen.",
            OPT_KEY_TITLE  = "Override-Taste im Kampf",
            OPT_KEY_DESC   = "Taste gedrückt halten und erneut über ein Ziel hovern, um Tooltips im Kampf anzuzeigen.",
            KEY_ALT   = "ALT",
            KEY_SHIFT = "SHIFT",
            KEY_CTRL  = "STRG",
            KEY_NONE  = "Keine (im Kampf immer aus)",
        },
        frFR = {
            OPT_AURA_TITLE = "Masquer mes info-bulles de buffs/debuffs en combat",
            OPT_AURA_DESC  = "Masque les info-bulles de vos propres buffs et debuffs en combat. Si l’option est désactivée, elles restent visibles. La touche de substitution reste active.",
            OPT_HIDE_TITLE = "Masquer les info-bulles en combat",
            OPT_HIDE_DESC  = "Par défaut : les info-bulles sont masquées en combat. Maintenez la touche de substitution pour les afficher temporairement.",
            OPT_KEY_TITLE  = "Touche de substitution en combat",
            OPT_KEY_DESC   = "Maintenez la touche et survolez une nouvelle cible pour afficher les info-bulles en combat.",
            KEY_ALT="ALT", KEY_SHIFT="MAJ", KEY_CTRL="CTRL", KEY_NONE="Aucune (toujours masquées)",
        },
        esES = {
            OPT_AURA_TITLE = "Ocultar mis tooltips de beneficios/perjuicios en combate",
            OPT_AURA_DESC  = "Oculta los tooltips de tus propios beneficios y perjuicios en combate. Si está desactivado, siguen visibles. La tecla de anulación sigue funcionando.",
            OPT_HIDE_TITLE = "Ocultar descripciones emergentes en combate",
            OPT_HIDE_DESC  = "Por defecto: los tooltips se ocultan en combate. Mantén la tecla de anulación para mostrarlos temporalmente.",
            OPT_KEY_TITLE  = "Tecla de anulación en combate",
            OPT_KEY_DESC   = "Mantén la tecla y vuelve a pasar el ratón por un objetivo para mostrar los tooltips en combate.",
            KEY_ALT="ALT", KEY_SHIFT="MAYÚS", KEY_CTRL="CTRL", KEY_NONE="Ninguna (siempre ocultos)",
        },
        esMX = {
            OPT_AURA_TITLE = "Ocultar mis tooltips de beneficios/perjuicios en combate",
            OPT_AURA_DESC  = "Oculta los tooltips de tus propios beneficios y perjuicios en combate. Si está desactivado, siguen visibles. La tecla de anulación sigue funcionando.",
            OPT_HIDE_TITLE = "Ocultar tooltips en combate",
            OPT_HIDE_DESC  = "Por defecto: los tooltips se ocultan en combate. Mantén la tecla de anulación para mostrarlos temporalmente.",
            OPT_KEY_TITLE  = "Tecla de anulación en combate",
            OPT_KEY_DESC   = "Mantén la tecla y vuelve a pasar el ratón por un objetivo para mostrar los tooltips en combate.",
            KEY_ALT="ALT", KEY_SHIFT="MAYÚS", KEY_CTRL="CTRL", KEY_NONE="Ninguna (siempre ocultos)",
        },
        itIT = {
            OPT_AURA_TITLE = "Nascondi i tooltip dei miei buff/debuff in combattimento",
            OPT_AURA_DESC  = "Nasconde i tooltip dei tuoi buff e debuff in combattimento. Se disattivato, restano visibili. Il tasto di override continua a funzionare.",
            OPT_HIDE_TITLE = "Nascondi tooltip in combattimento",
            OPT_HIDE_DESC  = "Predefinito: i tooltip sono nascosti in combattimento. Tieni premuto il tasto di override per mostrarli temporaneamente.",
            OPT_KEY_TITLE  = "Tasto di override in combattimento",
            OPT_KEY_DESC   = "Tieni premuto il tasto e passa di nuovo il mouse su un bersaglio per mostrare i tooltip in combattimento.",
            KEY_ALT="ALT", KEY_SHIFT="MAIUSC", KEY_CTRL="CTRL", KEY_NONE="Nessuno (sempre nascosti)",
        },
        ptBR = {
            OPT_AURA_TITLE = "Ocultar dicas dos meus bônus/penalidades em combate",
            OPT_AURA_DESC  = "Oculta as dicas dos seus próprios efeitos benéficos e prejudiciais em combate. Desativado: elas continuam visíveis. A tecla de substituição continua funcionando.",
            OPT_HIDE_TITLE = "Ocultar dicas em combate",
            OPT_HIDE_DESC  = "Padrão: as dicas ficam ocultas em combate. Segure a tecla de substituição para mostrar temporariamente.",
            OPT_KEY_TITLE  = "Tecla de substituição em combate",
            OPT_KEY_DESC   = "Segure a tecla e passe o mouse novamente sobre um alvo para mostrar as dicas em combate.",
            KEY_ALT="ALT", KEY_SHIFT="SHIFT", KEY_CTRL="CTRL", KEY_NONE="Nenhuma (sempre ocultas)",
        },
        ruRU = {
            OPT_AURA_TITLE = "Скрывать подсказки моих эффектов в бою",
            OPT_AURA_DESC  = "Скрывает подсказки собственных положительных и отрицательных эффектов в бою. Если выключено, они остаются видимыми. Клавиша-переопределение продолжает работать.",
            OPT_HIDE_TITLE = "Скрывать подсказки в бою",
            OPT_HIDE_DESC  = "По умолчанию: подсказки скрыты в бою. Удерживайте клавишу-переопределение, чтобы показать их временно.",
            OPT_KEY_TITLE  = "Клавиша-переопределение в бою",
            OPT_KEY_DESC   = "Удерживайте клавишу и наведите курсор на новую цель, чтобы показать подсказки в бою.",
            KEY_ALT="ALT", KEY_SHIFT="SHIFT", KEY_CTRL="CTRL", KEY_NONE="Нет (всегда скрыты)",
        },
        koKR = {
            OPT_AURA_TITLE = "전투 중 내 강화/약화 효과 툴팁 숨기기",
            OPT_AURA_DESC  = "전투 중 자신의 강화 및 약화 효과 아이콘 툴팁을 숨깁니다. 끄면 표시됩니다. 임시 표시 키는 계속 작동합니다.",
            OPT_HIDE_TITLE = "전투 중 툴팁 숨기기",
            OPT_HIDE_DESC  = "기본값: 전투 중 툴팁이 숨겨집니다. 재정의 키를 누르고 있으면 일시적으로 표시됩니다.",
            OPT_KEY_TITLE  = "전투 중 재정의 키",
            OPT_KEY_DESC   = "키를 누른 상태에서 새로운 대상에 마우스를 올리면 전투 중 툴팁이 표시됩니다.",
            KEY_ALT="ALT", KEY_SHIFT="SHIFT", KEY_CTRL="CTRL", KEY_NONE="없음 (항상 숨김)",
        },
        zhCN = {
            OPT_AURA_TITLE = "战斗中隐藏自己的增益/减益提示",
            OPT_AURA_DESC  = "战斗中隐藏自己增益和减益图标的鼠标提示。关闭后这些提示仍会显示。覆盖按键仍然有效。",
            OPT_HIDE_TITLE = "战斗中隐藏提示信息",
            OPT_HIDE_DESC  = "默认：战斗中隐藏鼠标提示。按住覆盖按键可临时显示。",
            OPT_KEY_TITLE  = "战斗中覆盖按键",
            OPT_KEY_DESC   = "按住按键并重新指向目标，即可在战斗中显示提示信息。",
            KEY_ALT="ALT", KEY_SHIFT="SHIFT", KEY_CTRL="CTRL", KEY_NONE="无（战斗中始终隐藏）",
        },
        zhTW = {
            OPT_AURA_TITLE = "戰鬥中隱藏自己的增益/減益提示",
            OPT_AURA_DESC  = "戰鬥中隱藏自己增益和減益圖示的滑鼠提示。關閉後這些提示仍會顯示。覆寫按鍵仍然有效。",
            OPT_HIDE_TITLE = "戰鬥中隱藏提示資訊",
            OPT_HIDE_DESC  = "預設：戰鬥中隱藏滑鼠提示。按住覆寫按鍵可暫時顯示。",
            OPT_KEY_TITLE  = "戰鬥中覆寫按鍵",
            OPT_KEY_DESC   = "按住按鍵並重新指向目標，即可在戰鬥中顯示提示資訊。",
            KEY_ALT="ALT", KEY_SHIFT="SHIFT", KEY_CTRL="CTRL", KEY_NONE="無（戰鬥中一律隱藏）",
        },
    }

    if t[loc] then
        for k, v in pairs(t[loc]) do
            L[k] = v
        end
    end
    return L
end

local L = MakeL()

-- =========================
-- SavedVariables
-- =========================
HideTooltipsInCombatDB = HideTooltipsInCombatDB or {
    enabled = true,    -- Standard: Tooltips im Kampf AUS
    modifier = "ALT",  -- Override: ALT gedrückt halten => Tooltips im Kampf AN
}

-- Neue Einstellung: bestehende Profile beibehalten, standardmäßig AUS.
if HideTooltipsInCombatDB.hidePlayerAuraTooltips == nil then
    HideTooltipsInCombatDB.hidePlayerAuraTooltips = false
end

local function IsModifierDown(mod)
    if mod == "ALT" then return IsAltKeyDown() end
    if mod == "SHIFT" then return IsShiftKeyDown() end
    if mod == "CTRL" then return IsControlKeyDown() end
    return false
end

-- Eigene Buff-/Debuff-Icons lassen sich anhand ihrer Besitzerrahmen erkennen.
-- Keine Buffnamen, Zaubernamen oder Aura-IDs auslesen (Midnight: secret values).
local function IsPlayerAuraOwner(tt)
    if not tt or not tt.GetOwner then return false end
    local owner = tt:GetOwner()
    for _ = 1, 12 do
        if not owner then break end
        if owner == BuffFrame or owner == DebuffFrame or owner == TemporaryEnchantFrame then
            return true
        end
        local name = owner.GetName and owner:GetName()
        if type(name) == "string" and (
            name:match("^BuffButton%d+") or name:match("^DebuffButton%d+") or
            name:match("^TempEnchant%d+") or name:match("^BuffFrame") or
            name:match("^DebuffFrame") or name:match("^PlayerBuff") or
            name:match("^PlayerDebuff")
        ) then
            return true
        end
        owner = owner.GetParent and owner:GetParent()
    end
    return false
end

local function IsPlayerAuraTooltip(tt, data)
    if not tt then return false end
    if IsPlayerAuraOwner(tt) then return true end

    if not data and tt.GetPrimaryTooltipData then
        data = tt:GetPrimaryTooltipData()
    end
    if data and not (issecretvalue and issecretvalue(data)) then
        local auraType = Enum and Enum.TooltipDataType and Enum.TooltipDataType.UnitAura
        if auraType and data.type == auraType then
            local unit = data.unitToken
            if unit and not (issecretvalue and issecretvalue(unit)) then
                return unit == "player" or unit == "vehicle"
            end
        end
    end
    return false
end

local function ShouldHideTooltipInCombat(tt, data)
    if not HideTooltipsInCombatDB.enabled then return false end
    if not InCombatLockdown() then return false end

    local mod = HideTooltipsInCombatDB.modifier or "ALT"
    if mod ~= "NONE" and IsModifierDown(mod) then return false end

    -- Die separate Checkbox steuert ausschließlich eigene Buffs/Debuffs.
    if tt and IsPlayerAuraTooltip(tt, data) then
        return HideTooltipsInCombatDB.hidePlayerAuraTooltips == true
    end
    return true
end

local function RestoreTooltip(tt)
    if not tt then return end
    if tt.SetAlpha then tt:SetAlpha(1) end
end

local function ForceHideTooltip(tt)
    if not tt then return end
    if tt.ClearLines then tt:ClearLines() end
    if tt.SetOwner then tt:SetOwner(UIParent, "ANCHOR_NONE") end
    if tt.SetAlpha then tt:SetAlpha(0) end
    if tt.Hide then tt:Hide() end
end

local function HideAllKnownTooltips()
    local tooltips = {
        GameTooltip,
        ItemRefTooltip,
        ShoppingTooltip1,
        ShoppingTooltip2,
        ShoppingTooltip3,
        WorldMapTooltip,
        EmbeddedItemTooltip,
    }

    for _, tt in ipairs(tooltips) do
        if tt and tt.IsShown and tt:IsShown() and ShouldHideTooltipInCombat(tt) then
            ForceHideTooltip(tt)
        end
    end
    if ShouldHideTooltipInCombat(GameTooltip) then
        ForceHideTooltip(GameTooltip)
    end
end

local function RefreshVisibleTooltips()
    if InCombatLockdown() and ShouldHideTooltipInCombat() then
        HideAllKnownTooltips()
        if C_Timer and C_Timer.After then
            C_Timer.After(0, function()
                if InCombatLockdown() and ShouldHideTooltipInCombat() then
                    HideAllKnownTooltips()
                end
            end)
        end
    else
        -- wenn wir nicht verstecken sollen: Tooltip wieder normal sichtbar machen
        RestoreTooltip(GameTooltip)
    end
end

-- Block new tooltips while hiding is active
GameTooltip:HookScript("OnShow", function(self)
    if ShouldHideTooltipInCombat(self) then
        self:Hide()
    else
        RestoreTooltip(self)
    end
end)

-- Auch alternative Aura-Tooltip-Fenster unterstützen (Blizzard TooltipDataProcessor).
-- Der bisherige GameTooltip-Hook bleibt unverändert für andere Tooltips.
if TooltipDataProcessor and TooltipDataProcessor.AddTooltipPostCall and
   Enum and Enum.TooltipDataType and Enum.TooltipDataType.UnitAura then
    TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.UnitAura, function(tooltip, data)
        if IsPlayerAuraTooltip(tooltip, data) and ShouldHideTooltipInCombat(tooltip, data) then
            if tooltip.Hide then tooltip:Hide() end
        end
    end)
end

-- Extra Guard: Wenn ein Element den Tooltip im Kampf ständig erneut anzeigen will,
-- halten wir ihn per OnUpdate zuverlässig versteckt.
local guardActive = false
frame:SetScript("OnUpdate", function()
    if InCombatLockdown() and ShouldHideTooltipInCombat() then
        if GameTooltip and GameTooltip:IsShown() and ShouldHideTooltipInCombat(GameTooltip) then
            HideAllKnownTooltips()
        end
        guardActive = true
    elseif guardActive then
        RestoreTooltip(GameTooltip)
        guardActive = false
    end
end)

-- =========================
-- Settings UI (TWW Retail)
-- =========================
local function CreateOptions()
    if not (Settings and Settings.RegisterAddOnCategory and Settings.RegisterVerticalLayoutCategory) then
        return
    end

    local category = Settings.RegisterVerticalLayoutCategory(L.TITLE)

    -- Checkbox
    do
        local setting = Settings.RegisterProxySetting(
            category, "HTIC_ENABLED",
            Settings.VarType.Boolean,
            L.OPT_HIDE_TITLE,
            true,
            function() return HideTooltipsInCombatDB.enabled end,
            function(v)
                HideTooltipsInCombatDB.enabled = v and true or false
                RefreshVisibleTooltips()
            end
        )
        Settings.CreateCheckbox(category, setting, L.OPT_HIDE_DESC)
    end

    -- Eigene Buff-/Debuff-Tooltips separat ein-/ausschalten.
    do
        local setting = Settings.RegisterProxySetting(
            category, "HTIC_PLAYER_AURA_TOOLTIPS",
            Settings.VarType.Boolean,
            L.OPT_AURA_TITLE,
            false,
            function() return HideTooltipsInCombatDB.hidePlayerAuraTooltips end,
            function(v)
                HideTooltipsInCombatDB.hidePlayerAuraTooltips = v and true or false
                RefreshVisibleTooltips()
            end
        )
        Settings.CreateCheckbox(category, setting, L.OPT_AURA_DESC)
    end

    -- Dropdown (ControlTextContainer -> lesbare Menu-Items)
    do
        local setting = Settings.RegisterProxySetting(
            category, "HTIC_MOD",
            Settings.VarType.String,
            L.OPT_KEY_TITLE,
            "ALT",
            function() return HideTooltipsInCombatDB.modifier or "ALT" end,
            function(v)
                HideTooltipsInCombatDB.modifier = v
                RefreshVisibleTooltips()
            end
        )

        local function GetOptions()
            local container = Settings.CreateControlTextContainer()
            container:Add("ALT",   L.KEY_ALT)
            container:Add("SHIFT", L.KEY_SHIFT)
            container:Add("CTRL",  L.KEY_CTRL)
            container:Add("NONE",  L.KEY_NONE)
            return container:GetData()
        end

        local create = Settings.CreateDropDown or Settings.CreateDropdown
        if create then
            create(category, setting, GetOptions, L.OPT_KEY_DESC)
        end
    end

    Settings.RegisterAddOnCategory(category)
end

-- =========================
-- Events
-- =========================
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("PLAYER_REGEN_DISABLED")
frame:RegisterEvent("PLAYER_REGEN_ENABLED")
frame:RegisterEvent("MODIFIER_STATE_CHANGED")

frame:SetScript("OnEvent", function(_, event)
    if event == "PLAYER_LOGIN" then
        pcall(CreateOptions)
        return
    end

    -- Bei Kampfbeginn sofort verstecken (Tooltip kann vorher offen sein)
    RefreshVisibleTooltips()
end)

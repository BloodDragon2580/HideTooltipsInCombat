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
            OPT_HIDE_TITLE = "Masquer les info-bulles en combat",
            OPT_HIDE_DESC  = "Par défaut : les info-bulles sont masquées en combat. Maintenez la touche de substitution pour les afficher temporairement.",
            OPT_KEY_TITLE  = "Touche de substitution en combat",
            OPT_KEY_DESC   = "Maintenez la touche et survolez une nouvelle cible pour afficher les info-bulles en combat.",
            KEY_ALT="ALT", KEY_SHIFT="MAJ", KEY_CTRL="CTRL", KEY_NONE="Aucune (toujours masquées)",
        },
        esES = {
            OPT_HIDE_TITLE = "Ocultar descripciones emergentes en combate",
            OPT_HIDE_DESC  = "Por defecto: los tooltips se ocultan en combate. Mantén la tecla de anulación para mostrarlos temporalmente.",
            OPT_KEY_TITLE  = "Tecla de anulación en combate",
            OPT_KEY_DESC   = "Mantén la tecla y vuelve a pasar el ratón por un objetivo para mostrar los tooltips en combate.",
            KEY_ALT="ALT", KEY_SHIFT="MAYÚS", KEY_CTRL="CTRL", KEY_NONE="Ninguna (siempre ocultos)",
        },
        esMX = {
            OPT_HIDE_TITLE = "Ocultar tooltips en combate",
            OPT_HIDE_DESC  = "Por defecto: los tooltips se ocultan en combate. Mantén la tecla de anulación para mostrarlos temporalmente.",
            OPT_KEY_TITLE  = "Tecla de anulación en combate",
            OPT_KEY_DESC   = "Mantén la tecla y vuelve a pasar el ratón por un objetivo para mostrar los tooltips en combate.",
            KEY_ALT="ALT", KEY_SHIFT="MAYÚS", KEY_CTRL="CTRL", KEY_NONE="Ninguna (siempre ocultos)",
        },
        itIT = {
            OPT_HIDE_TITLE = "Nascondi tooltip in combattimento",
            OPT_HIDE_DESC  = "Predefinito: i tooltip sono nascosti in combattimento. Tieni premuto il tasto di override per mostrarli temporaneamente.",
            OPT_KEY_TITLE  = "Tasto di override in combattimento",
            OPT_KEY_DESC   = "Tieni premuto il tasto e passa di nuovo il mouse su un bersaglio per mostrare i tooltip in combattimento.",
            KEY_ALT="ALT", KEY_SHIFT="MAIUSC", KEY_CTRL="CTRL", KEY_NONE="Nessuno (sempre nascosti)",
        },
        ptBR = {
            OPT_HIDE_TITLE = "Ocultar dicas em combate",
            OPT_HIDE_DESC  = "Padrão: as dicas ficam ocultas em combate. Segure a tecla de substituição para mostrar temporariamente.",
            OPT_KEY_TITLE  = "Tecla de substituição em combate",
            OPT_KEY_DESC   = "Segure a tecla e passe o mouse novamente sobre um alvo para mostrar as dicas em combate.",
            KEY_ALT="ALT", KEY_SHIFT="SHIFT", KEY_CTRL="CTRL", KEY_NONE="Nenhuma (sempre ocultas)",
        },
        ruRU = {
            OPT_HIDE_TITLE = "Скрывать подсказки в бою",
            OPT_HIDE_DESC  = "По умолчанию: подсказки скрыты в бою. Удерживайте клавишу-переопределение, чтобы показать их временно.",
            OPT_KEY_TITLE  = "Клавиша-переопределение в бою",
            OPT_KEY_DESC   = "Удерживайте клавишу и наведите курсор на новую цель, чтобы показать подсказки в бою.",
            KEY_ALT="ALT", KEY_SHIFT="SHIFT", KEY_CTRL="CTRL", KEY_NONE="Нет (всегда скрыты)",
        },
        koKR = {
            OPT_HIDE_TITLE = "전투 중 툴팁 숨기기",
            OPT_HIDE_DESC  = "기본값: 전투 중 툴팁이 숨겨집니다. 재정의 키를 누르고 있으면 일시적으로 표시됩니다.",
            OPT_KEY_TITLE  = "전투 중 재정의 키",
            OPT_KEY_DESC   = "키를 누른 상태에서 새로운 대상에 마우스를 올리면 전투 중 툴팁이 표시됩니다.",
            KEY_ALT="ALT", KEY_SHIFT="SHIFT", KEY_CTRL="CTRL", KEY_NONE="없음 (항상 숨김)",
        },
        zhCN = {
            OPT_HIDE_TITLE = "战斗中隐藏提示信息",
            OPT_HIDE_DESC  = "默认：战斗中隐藏鼠标提示。按住覆盖按键可临时显示。",
            OPT_KEY_TITLE  = "战斗中覆盖按键",
            OPT_KEY_DESC   = "按住按键并重新指向目标，即可在战斗中显示提示信息。",
            KEY_ALT="ALT", KEY_SHIFT="SHIFT", KEY_CTRL="CTRL", KEY_NONE="无（战斗中始终隐藏）",
        },
        zhTW = {
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

local function IsModifierDown(mod)
    if mod == "ALT" then return IsAltKeyDown() end
    if mod == "SHIFT" then return IsShiftKeyDown() end
    if mod == "CTRL" then return IsControlKeyDown() end
    return false
end

local function ShouldHideTooltipInCombat()
    if not HideTooltipsInCombatDB.enabled then return false end
    if not InCombatLockdown() then return false end

    local mod = HideTooltipsInCombatDB.modifier or "ALT"
    if mod == "NONE" then return true end
    return not IsModifierDown(mod)
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
        if tt and tt.IsShown and tt:IsShown() then
            ForceHideTooltip(tt)
        end
    end
    ForceHideTooltip(GameTooltip)
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
    if ShouldHideTooltipInCombat() then
        self:Hide()
    else
        RestoreTooltip(self)
    end
end)

-- Extra Guard: Wenn ein Element den Tooltip im Kampf ständig erneut anzeigen will,
-- halten wir ihn per OnUpdate zuverlässig versteckt.
local guardActive = false
frame:SetScript("OnUpdate", function()
    if InCombatLockdown() and ShouldHideTooltipInCombat() then
        if GameTooltip and GameTooltip:IsShown() then
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

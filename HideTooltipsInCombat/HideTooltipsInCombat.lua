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

        OPT_AURA_TITLE = "My buff/debuff tooltips",
        OPT_AURA_DESC  = "Choose when tooltips on your own buff and debuff icons are hidden. Independent of the general combat setting. The override key works for combat-only hiding.",
        AURA_SHOW     = "Always show",
        AURA_COMBAT   = "Hide only in combat",
        AURA_ALWAYS   = "Always hide",

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
            OPT_AURA_TITLE = "Eigene Buff-/Debuff-Tooltips",
            OPT_AURA_DESC  = "Wähle, wann Tooltips deiner eigenen Buffs und Debuffs ausgeblendet werden. Unabhängig von der allgemeinen Kampf-Einstellung. Die Override-Taste wirkt nur bei „Nur im Kampf ausblenden“.",
            AURA_SHOW     = "Immer anzeigen",
            AURA_COMBAT   = "Nur im Kampf ausblenden",
            AURA_ALWAYS   = "Immer ausblenden",
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
            OPT_AURA_TITLE = "Info-bulles de mes buffs/debuffs",
            OPT_AURA_DESC  = "Choisissez quand masquer les info-bulles de vos propres buffs et debuffs. Indépendant du réglage général. La touche de substitution fonctionne uniquement en mode combat.",
            AURA_SHOW     = "Toujours afficher",
            AURA_COMBAT   = "Masquer uniquement en combat",
            AURA_ALWAYS   = "Toujours masquer",
            OPT_HIDE_TITLE = "Masquer les info-bulles en combat",
            OPT_HIDE_DESC  = "Par défaut : les info-bulles sont masquées en combat. Maintenez la touche de substitution pour les afficher temporairement.",
            OPT_KEY_TITLE  = "Touche de substitution en combat",
            OPT_KEY_DESC   = "Maintenez la touche et survolez une nouvelle cible pour afficher les info-bulles en combat.",
            KEY_ALT="ALT", KEY_SHIFT="MAJ", KEY_CTRL="CTRL", KEY_NONE="Aucune (toujours masquées)",
        },
        esES = {
            OPT_AURA_TITLE = "Tooltips de mis beneficios/perjuicios",
            OPT_AURA_DESC  = "Elige cuándo ocultar los tooltips de tus beneficios y perjuicios. Independiente del ajuste general. La tecla de anulación funciona solo con la opción de combate.",
            AURA_SHOW     = "Mostrar siempre",
            AURA_COMBAT   = "Ocultar solo en combate",
            AURA_ALWAYS   = "Ocultar siempre",
            OPT_HIDE_TITLE = "Ocultar descripciones emergentes en combate",
            OPT_HIDE_DESC  = "Por defecto: los tooltips se ocultan en combate. Mantén la tecla de anulación para mostrarlos temporalmente.",
            OPT_KEY_TITLE  = "Tecla de anulación en combate",
            OPT_KEY_DESC   = "Mantén la tecla y vuelve a pasar el ratón por un objetivo para mostrar los tooltips en combate.",
            KEY_ALT="ALT", KEY_SHIFT="MAYÚS", KEY_CTRL="CTRL", KEY_NONE="Ninguna (siempre ocultos)",
        },
        esMX = {
            OPT_AURA_TITLE = "Tooltips de mis beneficios/perjuicios",
            OPT_AURA_DESC  = "Elige cuándo ocultar los tooltips de tus beneficios y perjuicios. Independiente del ajuste general. La tecla de anulación funciona solo con la opción de combate.",
            AURA_SHOW     = "Mostrar siempre",
            AURA_COMBAT   = "Ocultar solo en combate",
            AURA_ALWAYS   = "Ocultar siempre",
            OPT_HIDE_TITLE = "Ocultar tooltips en combate",
            OPT_HIDE_DESC  = "Por defecto: los tooltips se ocultan en combate. Mantén la tecla de anulación para mostrarlos temporalmente.",
            OPT_KEY_TITLE  = "Tecla de anulación en combate",
            OPT_KEY_DESC   = "Mantén la tecla y vuelve a pasar el ratón por un objetivo para mostrar los tooltips en combate.",
            KEY_ALT="ALT", KEY_SHIFT="MAYÚS", KEY_CTRL="CTRL", KEY_NONE="Ninguna (siempre ocultos)",
        },
        itIT = {
            OPT_AURA_TITLE = "Tooltip dei miei buff/debuff",
            OPT_AURA_DESC  = "Scegli quando nascondere i tooltip dei tuoi buff e debuff. Indipendente dalle impostazioni generali. Il tasto di override funziona solo per la modalità combattimento.",
            AURA_SHOW     = "Mostra sempre",
            AURA_COMBAT   = "Nascondi solo in combattimento",
            AURA_ALWAYS   = "Nascondi sempre",
            OPT_HIDE_TITLE = "Nascondi tooltip in combattimento",
            OPT_HIDE_DESC  = "Predefinito: i tooltip sono nascosti in combattimento. Tieni premuto il tasto di override per mostrarli temporaneamente.",
            OPT_KEY_TITLE  = "Tasto di override in combattimento",
            OPT_KEY_DESC   = "Tieni premuto il tasto e passa di nuovo il mouse su un bersaglio per mostrare i tooltip in combattimento.",
            KEY_ALT="ALT", KEY_SHIFT="MAIUSC", KEY_CTRL="CTRL", KEY_NONE="Nessuno (sempre nascosti)",
        },
        ptBR = {
            OPT_AURA_TITLE = "Dicas dos meus bônus/penalidades",
            OPT_AURA_DESC  = "Escolha quando ocultar as dicas dos seus próprios efeitos. Independente da configuração geral. A tecla de substituição funciona apenas no modo de combate.",
            AURA_SHOW     = "Sempre mostrar",
            AURA_COMBAT   = "Ocultar apenas em combate",
            AURA_ALWAYS   = "Sempre ocultar",
            OPT_HIDE_TITLE = "Ocultar dicas em combate",
            OPT_HIDE_DESC  = "Padrão: as dicas ficam ocultas em combate. Segure a tecla de substituição para mostrar temporariamente.",
            OPT_KEY_TITLE  = "Tecla de substituição em combate",
            OPT_KEY_DESC   = "Segure a tecla e passe o mouse novamente sobre um alvo para mostrar as dicas em combate.",
            KEY_ALT="ALT", KEY_SHIFT="SHIFT", KEY_CTRL="CTRL", KEY_NONE="Nenhuma (sempre ocultas)",
        },
        ruRU = {
            OPT_AURA_TITLE = "Подсказки моих эффектов",
            OPT_AURA_DESC  = "Выберите, когда скрывать подсказки своих положительных и отрицательных эффектов. Не зависит от общей настройки. Клавиша отмены действует только для режима боя.",
            AURA_SHOW     = "Всегда показывать",
            AURA_COMBAT   = "Скрывать только в бою",
            AURA_ALWAYS   = "Всегда скрывать",
            OPT_HIDE_TITLE = "Скрывать подсказки в бою",
            OPT_HIDE_DESC  = "По умолчанию: подсказки скрыты в бою. Удерживайте клавишу-переопределение, чтобы показать их временно.",
            OPT_KEY_TITLE  = "Клавиша-переопределение в бою",
            OPT_KEY_DESC   = "Удерживайте клавишу и наведите курсор на новую цель, чтобы показать подсказки в бою.",
            KEY_ALT="ALT", KEY_SHIFT="SHIFT", KEY_CTRL="CTRL", KEY_NONE="Нет (всегда скрыты)",
        },
        koKR = {
            OPT_AURA_TITLE = "내 강화/약화 효과 툴팁",
            OPT_AURA_DESC  = "내 강화/약화 효과의 툴팁을 숨길 시점을 선택합니다. 일반 전투 설정과 별개입니다. 임시 표시 키는 전투 중 숨기기 모드에서만 작동합니다.",
            AURA_SHOW     = "항상 표시",
            AURA_COMBAT   = "전투 중에만 숨기기",
            AURA_ALWAYS   = "항상 숨기기",
            OPT_HIDE_TITLE = "전투 중 툴팁 숨기기",
            OPT_HIDE_DESC  = "기본값: 전투 중 툴팁이 숨겨집니다. 재정의 키를 누르고 있으면 일시적으로 표시됩니다.",
            OPT_KEY_TITLE  = "전투 중 재정의 키",
            OPT_KEY_DESC   = "키를 누른 상태에서 새로운 대상에 마우스를 올리면 전투 중 툴팁이 표시됩니다.",
            KEY_ALT="ALT", KEY_SHIFT="SHIFT", KEY_CTRL="CTRL", KEY_NONE="없음 (항상 숨김)",
        },
        zhCN = {
            OPT_AURA_TITLE = "自己的增益/减益提示",
            OPT_AURA_DESC  = "选择何时隐藏自己的增益和减益图标提示。独立于一般战斗设置。覆盖按键仅在“仅战斗中隐藏”模式下生效。",
            AURA_SHOW     = "始终显示",
            AURA_COMBAT   = "仅战斗中隐藏",
            AURA_ALWAYS   = "始终隐藏",
            OPT_HIDE_TITLE = "战斗中隐藏提示信息",
            OPT_HIDE_DESC  = "默认：战斗中隐藏鼠标提示。按住覆盖按键可临时显示。",
            OPT_KEY_TITLE  = "战斗中覆盖按键",
            OPT_KEY_DESC   = "按住按键并重新指向目标，即可在战斗中显示提示信息。",
            KEY_ALT="ALT", KEY_SHIFT="SHIFT", KEY_CTRL="CTRL", KEY_NONE="无（战斗中始终隐藏）",
        },
        zhTW = {
            OPT_AURA_TITLE = "自己的增益/減益提示",
            OPT_AURA_DESC  = "選擇何時隱藏自己的增益和減益圖示提示。獨立於一般戰鬥設定。覆寫按鍵僅在「只在戰鬥中隱藏」模式下生效。",
            AURA_SHOW     = "一律顯示",
            AURA_COMBAT   = "只在戰鬥中隱藏",
            AURA_ALWAYS   = "一律隱藏",
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

-- 8.2: Vorhandene Checkbox-Einstellung ohne Verlust auf drei Modi umstellen.
-- Bisher: false = immer anzeigen, true = nur im Kampf ausblenden.
if HideTooltipsInCombatDB.auraTooltipMode ~= "SHOW" and
   HideTooltipsInCombatDB.auraTooltipMode ~= "COMBAT" and
   HideTooltipsInCombatDB.auraTooltipMode ~= "ALWAYS" then
    HideTooltipsInCombatDB.auraTooltipMode =
        HideTooltipsInCombatDB.hidePlayerAuraTooltips == true and "COMBAT" or "SHOW"
end
HideTooltipsInCombatDB.hidePlayerAuraTooltips = nil  -- veraltete Checkbox

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

local function IsOverrideDown()
    local mod = HideTooltipsInCombatDB.modifier or "ALT"
    return mod ~= "NONE" and IsModifierDown(mod)
end

local function ShouldHideTooltip(tt, data)
    -- Eigene Buffs/Debuffs haben eine unabhängige Auswahl, auch außerhalb des Kampfes.
    if tt and IsPlayerAuraTooltip(tt, data) then
        local mode = HideTooltipsInCombatDB.auraTooltipMode
        if mode == "ALWAYS" then return true end
        if mode == "SHOW" then return false end
        -- "COMBAT": temporäre Anzeige per Override-Taste möglich.
        return InCombatLockdown() and not IsOverrideDown()
    end

    -- Alle anderen Tooltips wie bisher behandeln.
    return HideTooltipsInCombatDB.enabled == true and
           InCombatLockdown() and not IsOverrideDown()
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

    -- pairs statt ipairs: einzelne alternative Tooltip-Fenster können nil sein.
    for _, tt in pairs(tooltips) do
        if tt and tt.IsShown and tt:IsShown() and ShouldHideTooltip(tt) then
            ForceHideTooltip(tt)
        end
    end
end

local function RefreshVisibleTooltips()
    -- Bei Moduswechsel auch außerhalb des Kampfes sofort reagieren.
    -- Nur die Deckkraft zurücksetzen, keine ausgeblendeten Tooltips neu öffnen.
    if not ShouldHideTooltip(GameTooltip) then
        RestoreTooltip(GameTooltip)
    end
    HideAllKnownTooltips()
    if C_Timer and C_Timer.After then
        C_Timer.After(0, HideAllKnownTooltips)
    end
end

-- Block new tooltips while hiding is active
GameTooltip:HookScript("OnShow", function(self)
    if ShouldHideTooltip(self) then
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
        if IsPlayerAuraTooltip(tooltip, data) and ShouldHideTooltip(tooltip, data) then
            if tooltip.Hide then tooltip:Hide() end
        end
    end)
end

-- Extra Guard: Deckt auch den "immer ausblenden"-Modus außerhalb des Kampfes ab.
local guardActive = false
frame:SetScript("OnUpdate", function()
    if GameTooltip and GameTooltip:IsShown() and ShouldHideTooltip(GameTooltip) then
        ForceHideTooltip(GameTooltip)
        guardActive = true
    elseif guardActive and not ShouldHideTooltip(GameTooltip) then
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

    -- Eigene Buff-/Debuff-Tooltips: immer anzeigen / nur im Kampf / immer aus.
    do
        local setting = Settings.RegisterProxySetting(
            category, "HTIC_PLAYER_AURA_TOOLTIP_MODE",
            Settings.VarType.String,
            L.OPT_AURA_TITLE,
            "SHOW",
            function() return HideTooltipsInCombatDB.auraTooltipMode end,
            function(v)
                if v == "SHOW" or v == "COMBAT" or v == "ALWAYS" then
                    HideTooltipsInCombatDB.auraTooltipMode = v
                    RefreshVisibleTooltips()
                end
            end
        )

        local function GetOptions()
            local container = Settings.CreateControlTextContainer()
            container:Add("SHOW",   L.AURA_SHOW)
            container:Add("COMBAT", L.AURA_COMBAT)
            container:Add("ALWAYS", L.AURA_ALWAYS)
            return container:GetData()
        end

        local create = Settings.CreateDropDown or Settings.CreateDropdown
        if create then
            create(category, setting, GetOptions, L.OPT_AURA_DESC)
        end
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

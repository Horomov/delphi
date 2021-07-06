script_name('testimgui')
script_author('delphi')
script_version('1')
require "lib.moonloader"
local sampev = require 'lib.samp.events'
local imgui = require 'imgui'
local encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8
local fa = require 'fAwesome5'
local fa_glyph_ranges = imgui.ImGlyphRanges({ fa.min_range, fa.max_range })
local tag = '{774a9e} [IMGUItest] | {FFFFFF}'
local menuSelect = 0
imgui.ToggleButton = require('imgui_addons').ToggleButton

function imgui.BeforeDrawFrame()
    if fa_font == nil then
        local font_config = imgui.ImFontConfig()
        font_config.MergeMode = true

        fa_font = imgui.GetIO().Fonts:AddFontFromFileTTF('moonloader/resource/fonts/fa-solid-900.ttf', 13.0, font_config, fa_glyph_ranges)
    end
end

local helloText = [[
Police Tools - многофункциональный скрипт, созданный для офицеров LVPD сервера PARADOX ROLEPLEY.
Блаблаблаблбалбалбалба
балбалбал

Создатели скрипта: Vlad_Delphi, Capone_Flex
]]

function apply_custom_style()
	imgui.SwitchContext()
	local style = imgui.GetStyle()
	local colors = style.Colors
	local clr = imgui.Col
	local ImVec4 = imgui.ImVec4
	local ImVec2 = imgui.ImVec2
 
	 style.WindowPadding = ImVec2(15, 15)
	 style.WindowRounding = 15.0
	 style.FramePadding = ImVec2(5, 5)
	 style.ItemSpacing = ImVec2(12, 8)
	 style.ItemInnerSpacing = ImVec2(8, 6)
	 style.IndentSpacing = 25.0
	 style.ScrollbarSize = 15.0
	 style.ScrollbarRounding = 15.0
	 style.GrabMinSize = 15.0
	 style.GrabRounding = 7.0
	 style.ChildWindowRounding = 8.0
	 style.FrameRounding = 6.0
	 style.WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
	 style.ButtonTextAlign = imgui.ImVec2(0.02, 0.4)
 
	   colors[clr.Text] = ImVec4(0.95, 0.96, 0.98, 1.00)
	   colors[clr.TextDisabled] = ImVec4(0.36, 0.42, 0.47, 1.00)
	   colors[clr.WindowBg]     = ImVec4(0.09, 0.09, 0.09, 0.94)
	   colors[clr.ChildWindowBg]  = ImVec4(0.00, 0.00, 0.00, 0.00)
	   colors[clr.PopupBg] = ImVec4(0.08, 0.08, 0.08, 0.94)
	   colors[clr.Border] = ImVec4(0.43, 0.43, 0.50, 0.50)
	   colors[clr.BorderShadow] = ImVec4(0.00, 0.00, 0.00, 0.00)
	   colors[clr.FrameBg] = ImVec4(0.20, 0.25, 0.29, 1.00)
	   colors[clr.FrameBgHovered] = ImVec4(0.12, 0.20, 0.28, 1.00)
	   colors[clr.FrameBgActive] = ImVec4(0.09, 0.12, 0.14, 1.00)
	   colors[clr.TitleBg] = ImVec4(0.09, 0.12, 0.14, 0.65)
	   colors[clr.TitleBgCollapsed] = ImVec4(0.00, 0.00, 0.00, 0.51)
	   colors[clr.TitleBgActive] = ImVec4(0.08, 0.10, 0.12, 1.00)
	   colors[clr.MenuBarBg] = ImVec4(0.15, 0.18, 0.22, 1.00)
	   colors[clr.ScrollbarBg] = ImVec4(0.02, 0.02, 0.02, 0.39)
	   colors[clr.ScrollbarGrab] = ImVec4(0.20, 0.25, 0.29, 1.00)
	   colors[clr.ScrollbarGrabHovered] = ImVec4(0.18, 0.22, 0.25, 1.00)
	   colors[clr.ScrollbarGrabActive] = ImVec4(0.09, 0.21, 0.31, 1.00)
	   colors[clr.ComboBg] = ImVec4(0.20, 0.25, 0.29, 1.00)
	   colors[clr.CheckMark] = ImVec4(0.28, 0.56, 1.00, 1.00)
	   colors[clr.SliderGrab] = ImVec4(0.28, 0.56, 1.00, 1.00)
	   colors[clr.SliderGrabActive] = ImVec4(0.37, 0.61, 1.00, 1.00)
	   colors[clr.Button] = ImVec4(0.20, 0.25, 0.29, 1.00)
	   colors[clr.ButtonHovered] = ImVec4(0.28, 0.56, 1.00, 1.00)
	   colors[clr.ButtonActive] = ImVec4(0.06, 0.53, 0.98, 1.00)
	   colors[clr.Header] = ImVec4(0.20, 0.25, 0.29, 0.55)
	   colors[clr.HeaderHovered] = ImVec4(0.26, 0.59, 0.98, 0.80)
	   colors[clr.HeaderActive] = ImVec4(0.26, 0.59, 0.98, 1.00)
	   colors[clr.ResizeGrip] = ImVec4(0.26, 0.59, 0.98, 0.25)
	   colors[clr.ResizeGripHovered] = ImVec4(0.26, 0.59, 0.98, 0.67)
	   colors[clr.ResizeGripActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
	   colors[clr.CloseButton] = ImVec4(0.40, 0.39, 0.38, 0.16)
	   colors[clr.CloseButtonHovered] = ImVec4(0.40, 0.39, 0.38, 0.39)
	   colors[clr.CloseButtonActive] = ImVec4(0.40, 0.39, 0.38, 1.00)
	   colors[clr.PlotLines] = ImVec4(0.61, 0.61, 0.61, 1.00)
	   colors[clr.PlotLinesHovered] = ImVec4(1.00, 0.43, 0.35, 1.00)
	   colors[clr.PlotHistogram] = ImVec4(0.90, 0.70, 0.00, 1.00)
	   colors[clr.PlotHistogramHovered] = ImVec4(1.00, 0.60, 0.00, 1.00)
	   colors[clr.TextSelectedBg] = ImVec4(0.25, 1.00, 0.00, 0.43)
	   colors[clr.ModalWindowDarkening] = ImVec4(1.00, 0.98, 0.95, 0.73)
end
apply_custom_style()

local sX, sY = getScreenResolution()
settings = imgui.ImBool(false) -- Окно имгуи
button1 = imgui.ImBool(false)
givehp = imgui.ImInt(100)

function main()
	if not isSampLoaded() or not isSampfuncsLoaded() then return end
	while not isSampAvailable() do wait(100) end
	if not doesFileExist('moonloader/resource/fonts/fa-solid-900.ttf') then
		sampAddChatMessage(tag..'У вас отсутствует файл скрипта {774a9e}: moonloader/resource/fonts/fa-solid-900.ttf',-1)
		thisScript():unload()
		---return
	else
		print('Все файлы скрипта имеются')
	end
	_, code = getTableUsersByUrl('https://raw.githubusercontent.com/Horomov/admintools/master/code.txt')
--	if not isAvailableUser(code, '1123') then
--		sampAddChatMessage('q',-1)
--	end
	sampAddChatMessage(tag..'Тестовый скрипт успешно загружен!',-1)
	sampRegisterChatCommand('test', testimgui)
	sampRegisterChatCommand('codeg', cmd_code)
	sampRegisterChatCommand('codes',cmd_codes)
	while true do
		wait(0)
		local result, button, list, input = sampHasDialogRespond(2)
		if result then
			if button == 1 then
				resultt = false
				for i=1, #code do
					if input == code[i].namecode then
						sampAddChatMessage(tag..'привет',-1)
						resultt = true
					end
				end
				if not resultt then sampAddChatMessage(tag..'Данный код не существует!',-1) end
			end
		end
	end 
end
function cmd_code()
	sampShowDialog(2, "Активация PREMIUM","{FFFFFF}Введите код в строку ниже", "Выбрать", "Закрыть", 1)
end
function cmd_codes(id)
	if tonumber(id) == nil or tonumber(id) > #code then sampAddChatMessage(tag..'Такого кода нет!',-1) return end
	sampAddChatMessage(tag..code[tonumber(id)].namecode, -1)
end
function testimgui(id)
	settings.v = not settings.v
	imgui.Process = settings.v
end
function imgui.Hint(text)
	imgui.SameLine()
	imgui.TextDisabled("(?)") 
	if imgui.IsItemHovered() then
		imgui.BeginTooltip()
		imgui.TextUnformatted(u8(text))
		imgui.EndTooltip()
	end
end
function imgui.ButtonHint(text, delay)
    if imgui.IsItemHovered() then
        if go_hint == nil then go_hint = os.clock() + (delay and delay or 0.0) end
        local alpha = (os.clock() - go_hint) * 5 -- скорость появления
        if os.clock() >= go_hint then 
            imgui.PushStyleVar(imgui.StyleVar.Alpha, (alpha <= 1.0 and alpha or 1.0))
                imgui.PushStyleColor(imgui.Col.PopupBg, imgui.GetStyle().Colors[imgui.Col.ButtonHovered])
                    imgui.BeginTooltip()
                    imgui.PushTextWrapPos(450)
                    imgui.TextUnformatted(text)
                    if not imgui.IsItemVisible() and imgui.GetStyle().Alpha == 1 then go_hint = nil end
                    imgui.PopTextWrapPos()
                    imgui.EndTooltip()
                imgui.PopStyleColor()
            imgui.PopStyleVar()
        end
    end
end

function imgui.OnDrawFrame()
	if not settings.v then imgui.Process = false end

	if settings.v then
		imgui.SetNextWindowSize(imgui.ImVec2(900, 450), imgui.Cond.FirstUseEver)
        imgui.SetNextWindowPos(imgui.ImVec2(sX / 2, sY / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		imgui.Begin(fa.ICON_FA_TOOLBOX..(u8(' Админ Тулс')), settings, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoCollapse)
		local bet = imgui.ImVec2(100, 0)
			imgui.BeginChild('##MenuButtons', imgui.ImVec2(189, 405), true)
				imgui.Text('')
				if imgui.Button(fa.ICON_FA_COGS..(u8' Настройки'), imgui.ImVec2(163, 25)) then
					menuSelect = 1
				end
				if imgui.Button(fa.ICON_FA_CROSSHAIRS..(u8' Трейсер пуль'), imgui.ImVec2(163, 25)) then
					menuSelect=2
				end
        	imgui.EndChild()
			imgui.SameLine()
			imgui.BeginChild("##Menu", imgui.ImVec2(674, 405), true)
				if menuSelect == 0 then
					imgui.Text(u8(helloText))
				end
				if menuSelect == 1 then
					if imgui.Button(u8"Кнопка1", bet) then
						sampAddChatMessage('q',-1)
						--code
					end
					imgui.ButtonHint(u8'Включение хуйни',1)
					imgui.Text(u8'Проверка')
					if imgui.ToggleButton('ToggleButton##1', button1) then
						sampAddChatMessage(tostring(button1.v),-1)
					end
				end
				if menuSelect == 2 then
					imgui.Text(u8'123')
					if imgui.Button(u8'/sethp', bet) then
						imgui.OpenPopup(u8"Выдача жизней")
					end
					if imgui.BeginPopupModal(u8"Выдача жизней", _, imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoResize + imgui.WindowFlags.NoMove) then
						imgui.Text(u8'Выберите, сколько выдать ХП')
						imgui.PushItemWidth(175) imgui.SliderInt('##giveHpSlider', givehp, 0, 100) imgui.PopItemWidth()
						if imgui.Button(u8'Выдать жизни', imgui.ImVec2(175, 0)) then
							sampAddChatMessage('/sethp '..givehp.v)
							imgui.CloseCurrentPopup()
						end
						if imgui.Button(u8'Закрыть', imgui.ImVec2(175, 0)) then
							imgui.CloseCurrentPopup()
						end
						imgui.EndPopup()
					end
				end
        	imgui.EndChild()

		imgui.End()
	end
end

function getTableUsersByUrl(url)
    local n_file, bool, code = os.getenv('TEMP')..os.time(), false, {}
    downloadUrlToFile(url, n_file, function(id, status)
        if status == 6 then bool = true end
    end)
    while not doesFileExist(n_file) do wait(0) end
    if bool then
        local file = io.open(n_file, 'r')
        for w in file:lines() do
            local n = w:match('(.*)')
            code[#code+1] = { namecode = n }
        end
        file:close()
        os.remove(n_file)
    end
    return bool, code
end
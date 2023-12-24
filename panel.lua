local blur = Material("pp/blurscreen")
local function DrawBlur(panel, amount)
    local x, y = panel:LocalToScreen(0, 0)
    local scrW, scrH = ScrW(), ScrH()
    surface.SetDrawColor(255, 255, 255)
    surface.SetMaterial(blur)
    for i = 1, 3 do
        blur:SetFloat("$blur", (i / 3) * (amount or 6))
        blur:Recompute()
        render.UpdateScreenEffectTexture()
        surface.DrawTexturedRect(x * -1, y * -1, scrW, scrH)
    end
end

local function u()
    local a = {
    	"!info (Открыть эту панель)",
        "emotes (Вводить в консоль)",
        "/inv (Меню рюкзака)",
        "/pick (Положить предмет на который смотрите в рюкзак)",
        "Показать меню радио - R (Если вы в машине)",
        "Сменить/Включить песню/Закрыть меню - SHIFT (Если вы в машине)"
    }

    local b = vgui.Create("DFrame")
    b:Center()
    b:SetSize(500, 500)
    b:MakePopup()
    b:SetTitle("")
    b:ShowCloseButton(false)

    b.Paint = function(self, w, h)
        draw.RoundedBox(7, 0, 0, w, h, Color(10, 10, 10, 235))
        local textX, textY = 20, 20
        for _, c in ipairs(a) do
            draw.SimpleText(c, "x.15", textX, textY, Color(255, 255, 255))
            textY = textY + 20
        end
    end

    local v = vgui.Create("DButton", b)
    v:SetText("✕")
    v:SetPos(b:GetWide() - 30, 10)
    v:SetSize(20, 20)
    v:SetTextColor(Color(255, 255, 255, 255))
    v.Paint = function(self, w, h)
        draw.RoundedBox(50, 0, 0, w, h, Color(255, 0, 0))
    end
    v.DoClick = function()
        if IsValid(b) then
            b:Close()
        end
    end
end

local function i()
   gui.OpenURL("https://docs.google.com/document/d/1cEKIJQXmdoL9sZH7V4O7th2LeK548ji-3ZLY5Vw55LM/edit?usp=sharing")
end

local function o()
    gui.OpenURL("https://github.com/REBOULT")
end

local function p()
    local as = {
        "Тут ты можешь узнать о нашем сервере немного больше :)",
    }

    local a = vgui.Create("DFrame")
    a:Center()
    a:MakePopup()
    a:ShowCloseButton(false)
    a:SetTitle("")
    a:SetSize(1000, 1000)
    a:SetPos(ScrW() / 2 - 500, ScrH() / 2 - 500)

    a.Paint = function(self, w, h)
        DrawBlur(self, 7)
        draw.RoundedBox(7, 0, 0, w, h, Color(10, 10, 10, 235))

        draw.SimpleText("Привет!", "x.80", w / 2, 10, Color(255, 255, 255), TEXT_ALIGN_CENTER)
        local textY = 100
        for _, zxc in ipairs(as) do
            draw.SimpleText(zxc, "x.30", w / 2, textY, Color(255, 255, 255), TEXT_ALIGN_CENTER)
            textY = textY + 30
        end
    end

    local m = vgui.Create("DButton", a)
    m:SetText("✕")
    m:SetPos(a:GetWide() - 30, 10)
    m:SetSize(20, 20)
    m:SetTextColor(Color(255, 255, 255, 255))
    m.Paint = function(self, w, h)
        draw.RoundedBox(50, 0, 0, w, h, Color(255, 0, 0))
    end
    m.DoClick = function()
        if IsValid(a) then
            a:Close()
        end
    end

    local buttonWidth, buttonHeight = 150, 30
    local spacing = 10
    local buttonX = (a:GetWide() - buttonWidth * 3 - spacing * 2) / 2
    local buttonY = 150

    local j = vgui.Create("DButton", a)
    j:SetFont("a.23")
    j:SetText("Команды")
    j:SetTextColor(Color(255,255,255,255))
    j:SetPos(buttonX, buttonY)
    j:SetSize(buttonWidth, buttonHeight)
    j.Paint = function(self, w, h)
        DrawBlur(self,5)
        draw.RoundedBox(7, 0, 0, w, h, Color(10, 10, 10, 200))

    end
    j.DoClick = u

    local rt = vgui.Create("DButton", a)
    rt:SetFont("a.23")
    rt:SetText("Правила")
    rt:SetTextColor(Color(255,255,255,255))
    rt:SetPos(buttonX + buttonWidth + spacing, buttonY)
    rt:SetSize(buttonWidth, buttonHeight)
    rt.Paint = function(self, w, h)
    DrawBlur(self,5)
        draw.RoundedBox(7, 0, 0, w, h, Color(10, 10, 10, 200))
        
    end
    rt.DoClick = i

    local db = vgui.Create("DButton", a)
    db:SetFont("a.23")
    db:SetText("Разработчик")
    db:SetTextColor(HSVToColor(CurTime() % 360 * 40,1,1))
    db:SetPos(buttonX + 2 * (buttonWidth + spacing), buttonY)
    db:SetSize(buttonWidth, buttonHeight)
    db.Paint = function(self, w, h)
    DrawBlur(self,5)
        draw.RoundedBox(7, 0, 0, w, h, Color(10, 10, 10, 200))
        
    end
    db.DoClick = o
end


hook.Add("OnPlayerChat", "recfo", function(ply, text)
    if text == "!info" then
        p()
        return true
    end
end)

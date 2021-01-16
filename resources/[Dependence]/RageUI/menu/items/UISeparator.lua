---
--- @author Dylan MALANDAIN
--- @version 2.0.0
--- @since 2020
---
--- RageUI Is Advanced UI Libs in LUA for make beautiful interface like RockStar GAME.
---
---
--- Commercial Info.
--- Any use for commercial purposes is strictly prohibited and will be punished.
---
--- @see RageUI
---

---@type table
local SettingsButton = {
    Rectangle = { Y = 0, Width = 431, Height = 45 },
    Text = { X = 8, Y = 3, Scale = 0.5 },
    SelectedSprite = { Dictionary = "root_cause", Texture = "gradient_nav", Y = 0, Width = 431, Height = 45 },
}

---@type Item
function RageUI.Item.Separator(Label)
    local CurrentMenu = RageUI.CurrentMenu
    if CurrentMenu ~= nil then
        if CurrentMenu() then
            local Option = RageUI.Options + 1
            if CurrentMenu.Pagination.Minimum <= Option and CurrentMenu.Pagination.Maximum >= Option then
                if (Label ~= nil) then
                    RenderText(Label, CurrentMenu.X + FontPos[MenuFont.Txt].Txt.X + (CurrentMenu.WidthOffset ~= 0 and 200 + CurrentMenu.WidthOffset / 2 or 200), CurrentMenu.Y + FontPos[MenuFont.Txt].Txt.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, MenuFont.Txt or 6, FontPos[MenuFont.Txt].Txt.Scale, MenuColour.Txt.R or 191, MenuColour.Txt.G or 204, MenuColour.Txt.B or 148, MenuColour.Txt.A or 255, 1)                
                    RenderRectangle(CurrentMenu.X, CurrentMenu.Y + SettingsButton.SelectedSprite.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.SelectedSprite.Width + CurrentMenu.WidthOffset, SettingsButton.SelectedSprite.Height,  MenuColour.Background.R or 13, MenuColour.Background.G or 24, MenuColour.Background.B or 33, MenuColour.Background.A or 200)
                end
                RageUI.ItemOffset = RageUI.ItemOffset + SettingsButton.Rectangle.Height
                if (CurrentMenu.Index == Option) then
                    if (RageUI.LastControl) then
                        CurrentMenu.Index = Option - 1
                        if (CurrentMenu.Index < 1) then
                            CurrentMenu.Index = RageUI.CurrentMenu.Options
                        end
                    else
                        CurrentMenu.Index = Option + 1
                    end
                end
            end
            RageUI.Options = RageUI.Options + 1
        end
    end
end


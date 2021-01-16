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
    Text = { X = 8, Y = 3, Scale = 0.50 },
    LeftBadge = { Y = -2, Width = 40, Height = 40 },
    RightBadge = { X = 385, Y = -2, Width = 40, Height = 40 },
    RightText = { X = 420, Y = 4, Scale = 0.35 },
    SelectedSprite = { Dictionary = "root_cause", Texture = "gradient_nav", Y = 0, Width = 431, Height = 45 },
}

---@type table
local SettingsCheckbox = {
    Dictionary = "root_cause", Textures = {
        "shop_box_blankb", -- 1
        "shop_box_tickb", -- 2
        "shop_box_blank", -- 3
        "shop_box_tick", -- 4
        "shop_box_crossb", -- 5
        "shop_box_cross", -- 6
    },
    X = 380, Y = -6, Width = 50, Height = 50
}

RageUI.CheckboxStyle = {
    Tick = 1,
    Cross = 2
}

---@type table Index of all List Items
local Index = { }

---StyleCheckBox
---@param Selected number
---@param Checked boolean
---@param Box number
---@param BoxSelect number
---@return nil
local function StyleCheckBox(Selected, Checked, Box, BoxSelect, OffSet)
    ---@type table
    local CurrentMenu = RageUI.CurrentMenu;
    if OffSet == nil then
        OffSet = 0
    end
    if Selected then
        if Checked then
            RenderSprite(SettingsCheckbox.Dictionary, SettingsCheckbox.Textures[4], CurrentMenu.X + SettingsCheckbox.X + CurrentMenu.WidthOffset - OffSet, CurrentMenu.Y + SettingsCheckbox.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsCheckbox.Width, SettingsCheckbox.Height)
        else
            RenderSprite(SettingsCheckbox.Dictionary, SettingsCheckbox.Textures[3], CurrentMenu.X + SettingsCheckbox.X + CurrentMenu.WidthOffset - OffSet, CurrentMenu.Y + SettingsCheckbox.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsCheckbox.Width, SettingsCheckbox.Height)
        end
    else
        if Checked then
            RenderSprite(SettingsCheckbox.Dictionary, SettingsCheckbox.Textures[4], CurrentMenu.X + SettingsCheckbox.X + CurrentMenu.WidthOffset - OffSet, CurrentMenu.Y + SettingsCheckbox.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsCheckbox.Width, SettingsCheckbox.Height)
        else
            RenderSprite(SettingsCheckbox.Dictionary, SettingsCheckbox.Textures[3], CurrentMenu.X + SettingsCheckbox.X + CurrentMenu.WidthOffset - OffSet, CurrentMenu.Y + SettingsCheckbox.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsCheckbox.Width, SettingsCheckbox.Height)
        end
    end
end

---@type Item
function RageUI.Item.Checkbox(Label, Description, Checked, Style, Actions)

    ---@type table
    local CurrentMenu = RageUI.CurrentMenu;

    if CurrentMenu ~= nil then
        if CurrentMenu() then

            local Option = RageUI.Options + 1
            if (Index[Option] == nil) then
                Index[Option] = { Current = Checked }
            end

            ---@type number
            local Option = RageUI.Options + 1

            if CurrentMenu.Pagination.Minimum <= Option and CurrentMenu.Pagination.Maximum >= Option then

                ---@type number
                local Selected = CurrentMenu.Index == Option
                local LeftBadgeOffset = ((Style.LeftBadge == RageUI.BadgeStyle.None or Style.LeftBadge == nil) and 0 or 27)
                local RightBadgeOffset = ((Style.RightBadge == RageUI.BadgeStyle.None or Style.RightBadge == nil) and 0 or 32)
                local BoxOffset = 0
                RageUI.ItemsSafeZone(CurrentMenu)
                RenderRectangle(CurrentMenu.X, CurrentMenu.Y + SettingsButton.SelectedSprite.Y + RageUI.ItemOffset, SettingsButton.SelectedSprite.Width + CurrentMenu.WidthOffset, SettingsButton.SelectedSprite.Height,  MenuColour.Background.R or 13, MenuColour.Background.G or 24, MenuColour.Background.B or 33, MenuColour.Background.A or 200)
                local Hovered = false;

                ---@type boolean
                if CurrentMenu.EnableMouse == true and (CurrentMenu.CursorStyle == 0) or (CurrentMenu.CursorStyle == 1) then
                    Hovered = RageUI.ItemsMouseBounds(CurrentMenu, Selected, Option, SettingsButton);
                    if Actions["onHovered"] ~= nil then
                        if (Hovered) then
                            Actions['onHovered']();
                        end
                    end
                end
                if Selected then
                    RenderRectangle(CurrentMenu.X, CurrentMenu.Y + SettingsButton.SelectedSprite.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.SelectedSprite.Width + CurrentMenu.WidthOffset, SettingsButton.SelectedSprite.Height, MenuColour.Selection.R or 123, MenuColour.Selection.G or 137, MenuColour.Selection.B or 138, MenuColour.Selection.A or 127.5)
                end

                if type(Style) == "table" then
                    if Style.Enabled == true or Style.Enabled == nil then
                        if Selected then
                            RenderText(Label, CurrentMenu.X + SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, MenuFont.Txt or 6, SettingsButton.Text.Scale, MenuColour.Txt.R or 191, MenuColour.Txt.G or 204, MenuColour.Txt.B or 148, MenuColour.Txt.A or 255)
                        else
                            RenderText(Label, CurrentMenu.X + SettingsButton.Text.X + LeftBadgeOffset, CurrentMenu.Y + SettingsButton.Text.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, MenuFont.Txt or 6, SettingsButton.Text.Scale, MenuColour.Txt.R or 191, MenuColour.Txt.G or 204, MenuColour.Txt.B or 148, MenuColour.Txt.A or 255)
                        end
                        if type(Style) == 'table' then
                            if Style.LeftBadge ~= nil then
                                if Style.LeftBadge ~= RageUI.BadgeStyle.None then
                                    local BadgeData = Style.LeftBadge(Selected)
                                    RenderSprite(BadgeData.BadgeDictionary or "commonmenu", BadgeData.BadgeTexture or "", CurrentMenu.X, CurrentMenu.Y + SettingsButton.LeftBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.LeftBadge.Width, SettingsButton.LeftBadge.Height, 0, MenuColour.Txt.R or 191, MenuColour.Txt.G or 204, MenuColour.Txt.B or 148, MenuColour.Txt.A or 255)
                                end
                            end
                            if Style.RightBadge ~= nil then
                                if Style.RightBadge ~= RageUI.BadgeStyle.None then
                                    local BadgeData = Style.RightBadge(Selected)
                                    RenderSprite(BadgeData.BadgeDictionary or "commonmenu", BadgeData.BadgeTexture or "", CurrentMenu.X + SettingsButton.RightBadge.X + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.RightBadge.Width, SettingsButton.RightBadge.Height, 0, MenuColour.Txt.R or 191, MenuColour.Txt.G or 204, MenuColour.Txt.B or 148, MenuColour.Txt.A or 255)
                                end
                            end
                        end
                    else
                        ---@type table
                        local LeftBadge = RageUI.BadgeStyle.Lock
                        ---@type number
                        local LeftBadgeOffset = ((LeftBadge == RageUI.BadgeStyle.None or LeftBadge == nil) and 0 or 27)

                        if Selected then
                            RenderText(Label, CurrentMenu.X + FontPos[MenuFont.Txt].Txt.X + LeftBadgeOffset, CurrentMenu.Y + FontPos[MenuFont.Txt].Txt.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, FontPos[MenuFont.Txt].Txt.Scale, MenuColour.Txt.R or 191, MenuColour.Txt.G or 204, MenuColour.Txt.B or 148, MenuColour.Txt.A or 255)
                        else
                            RenderText(Label, CurrentMenu.X + FontPos[MenuFont.Txt].Txt.X + LeftBadgeOffset, CurrentMenu.Y + FontPos[MenuFont.Txt].Txt.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, FontPos[MenuFont.Txt].Txt.Scale, MenuColour.Txt.R or 191, MenuColour.Txt.G or 204, MenuColour.Txt.B or 148, MenuColour.Txt.A or 255)
                        end

                        if LeftBadge ~= RageUI.BadgeStyle.None and LeftBadge ~= nil then
                            local BadgeData = LeftBadge(Selected)

                            RenderSprite(BadgeData.BadgeDictionary or "commonmenu", BadgeData.BadgeTexture or "", CurrentMenu.X, CurrentMenu.Y + SettingsButton.LeftBadge.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, SettingsButton.LeftBadge.Width, SettingsButton.LeftBadge.Height, 0, MenuColour.Txt.R or 191, MenuColour.Txt.G or 204, MenuColour.Txt.B or 148, MenuColour.Txt.A or 255)
                        end
                    end

                    if Style.Enabled == true or Style.Enabled == nil then
                        if Selected then
                            if Style.RightLabel ~= nil and Style.RightLabel ~= "" then

                                RenderText(Style.RightLabel, CurrentMenu.X + SettingsButton.RightText.X - RightBadgeOffset + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightText.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.RightText.Scale, MenuColour.Txt.R or 191, MenuColour.Txt.G or 204, MenuColour.Txt.B or 148, MenuColour.Txt.A or 255, 2)
                                BoxOffset = MeasureStringWidth(Style.RightLabel, 0, 0.35)
                            end
                        else
                            if Style.RightLabel ~= nil and Style.RightLabel ~= "" then
                                RenderText(Style.RightLabel, CurrentMenu.X + SettingsButton.RightText.X - RightBadgeOffset + CurrentMenu.WidthOffset, CurrentMenu.Y + SettingsButton.RightText.Y + CurrentMenu.SubtitleHeight + RageUI.ItemOffset, 0, SettingsButton.RightText.Scale, MenuColour.Txt.R or 191, MenuColour.Txt.G or 204, MenuColour.Txt.B or 148, MenuColour.Txt.A or 255, 2)
                                BoxOffset = MeasureStringWidth(Style.RightLabel, 0, 0.35)
                            end
                        end

                    end

                    BoxOffset = RightBadgeOffset + BoxOffset
                    if Style.Style ~= nil then
                        if Style.Style == RageUI.CheckboxStyle.Tick then
                            StyleCheckBox(Selected, Index[Option].Current, 2, 4, BoxOffset)
                        elseif Style.Style == RageUI.CheckboxStyle.Cross then
                            StyleCheckBox(Selected, Index[Option].Current, 5, 6, BoxOffset)
                        else
                            StyleCheckBox(Selected, Index[Option].Current, 2, 4, BoxOffset)
                        end
                    else
                        StyleCheckBox(Selected, Index[Option].Current, 2, 4, BoxOffset)
                    end

                    if Selected and (CurrentMenu.Controls.Select.Active or (Hovered and CurrentMenu.Controls.Click.Active)) and (Style.Enabled == true or Style.Enabled == nil) then
                        local Audio = RageUI.Settings.Audio
                        RageUI.PlaySound(Audio[Audio.Use].Select.audioName, Audio[Audio.Use].Select.audioRef)
                        Index[Option].Current = not Index[Option].Current
                        if (Index[Option].Current) then
                            Index[Option].Current = true
                            if Actions.onChecked ~= nil then
                                Citizen.CreateThread(function()
                                    Actions.onChecked();
                                end)
                            end
                        else
                            Index[Option].Current = false
                            if Actions.onUnChecked ~= nil then
                                Citizen.CreateThread(function()
                                    Actions.onUnChecked();
                                end)
                            end
                        end
                    end

                else
                    error("UICheckBox Style is not a `table`")
                end

                RageUI.ItemOffset = RageUI.ItemOffset + SettingsButton.Rectangle.Height

                RageUI.ItemsDescription(CurrentMenu, Description, Selected)

                if (((CurrentMenu.Controls.Select.Active or (Hovered and CurrentMenu.Controls.Click.Active)) and Selected)) then
                    if Actions.onSelected ~= nil then
                        Citizen.CreateThread(function()
                            Actions.onSelected(Index[Option].Current);
                        end)
                    end
                end
                if (Selected) then
                    if (Actions.onActive ~= nil) then
                        Actions.onActive();
                    end
                end

            end
            RageUI.Options = RageUI.Options + 1
        end
    end
end



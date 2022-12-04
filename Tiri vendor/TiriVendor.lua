-- local name = UnitName("player")

-- message("Hello, " .. name .. "!")


-- SLASH_HELLO1 = "/helloworld"

-- local function HelloWorldHandler(name)
--     if(string.len(name) > 0) then
--         message("Hello, " .. name .. "!")
--     else
--         local playerName = UnitName("player")
--         message("Hello, " .. playerName .. "!")
--     end
-- end

-- SlashCmdList["HELLO"] = HelloWorldHandler;


SLASH_HELLO1 = "/helloworld"
SLASH_SPH1 = "/sph"


local function showGreeting(name)
    local greeting = "Hello, " .. name .. "!"

    message(greeting)
end

local function HelloWorldHandler(name)
    local nameExists = string.len(name) > 0

    if(nameExists) then
        showGreeting(name)
    else
        local playerName = UnitName("player")

        showGreeting(playerName)
    end
end

local function testHandler()
  -- message("handler2")
  MakeButton(UIParent)
end


SLASH_GEMAGI1 = "/gemagi"

local function GemAgiHandler(gemsNum)
  for i = gemsNum,0, -1
  do
  BuyMerchantItem(94)
end
end

SlashCmdList["HELLO"] = HelloWorldHandler
SlashCmdList["SPH"] = testHandler
SlashCmdList["GEMAGI"] = GemAgiHandler




function DropDownTest_InitializeDropDown(self, level)
  -- Create a table to use for button information
  local info = UIDropDownMenu_CreateInfo()
  -- Create a title button
  info.text = "DropDown Test"
  info.isTitle = 1
  UIDropDownMenu_AddButton(info)
  -- Create a normal button
  info = UIDropDownMenu_CreateInfo()
  info.text = "Sample Item 1"
  UIDropDownMenu_AddButton(info)
  -- Create another normal button
  info = UIDropDownMenu_CreateInfo()
  info.text = "Sample Item 2"
  UIDropDownMenu_AddButton(info)
  end


  -- SELECT
  if not DropDownMenuTest then
    CreateFrame("Frame", "DropDownMenuTest", TiriVendor,
    "UIDropDownMenuTemplate")
  end
  DropDownMenuTest:ClearAllPoints()
  -- mount to - TiriVendor_selectString
  -- POINT, RELATIVE FRAME, RELATIVE POINT, coords
  DropDownMenuTest:SetPoint("TOP", TiriVendor_selectString, "BOTTOM", 0, -10)
  DropDownMenuTest:Show()
  local items = {
  "12 Agility",
  "24 Attack Power",
  "14 Spell Damage",
  "26 Healing 9 spell damage",
  "18 Stamina",
  "12 Spell crit",
  "12 Crit  Strike",
  "12 Defence Rating"
  }

  local myTable = {
    "12 Agility" = 99,
    "24 Attack Power"=88,
    "14 Spell Damage"=88,
    "26 Healing 9 spell damage"=88,
    "18 Stamina"=88,
    "12 Spell crit"=  88,
    "12 Crit  Strike"= 88,
    "12 Defence Rating"= 88
  }

  local function OnClick()
  UIDropDownMenu_SetSelectedID(DropDownMenuTest, this:GetID())
  end
  local function initialize(self, level)
  local info = UIDropDownMenu_CreateInfo()
  for k, v in pairs(items) do
  info = UIDropDownMenu_CreateInfo()
  info.text = v
  info.value = v
  info.func = OnClick
  UIDropDownMenu_AddButton(info, level)
  end
  end
  UIDropDownMenu_Initialize(DropDownMenuTest, initialize)

  -- UIDropDownMenu_SetWidth(DropDownMenuTest, 100); err
  UIDropDownMenu_SetWidth(100, DropDownMenuTest);

  UIDropDownMenu_SetButtonWidth(124, DropDownMenuTest)
  UIDropDownMenu_SetSelectedID(DropDownMenuTest, 1)

  UIDropDownMenu_JustifyText("LEFT", DropDownMenuTest)



  -- Create an anonymous blank frame
-- local frame = CreateFrame('Frame')

-- Tell the API to listen for 'VARIABLES_LOADED', 'ADDON_LOADED', and 'MERCHANT_SHOW'
-- RegisterEvents(frame, 'VARIABLES_LOADED', 'ADDON_LOADED', 'MERCHANT_SHOW')

local frame = CreateFrame("FRAME", "FooAddonFrame");
frame:RegisterEvent("PLAYER_ENTERING_WORLD");
frame:RegisterEvent("MERCHANT_SHOW")
frame:RegisterEvent("MERCHANT_CLOSED")
local function eventHandler(self, event, ...)
 if(event == "MERCHANT_SHOW" and UnitName("target") == "Kianna")
 then
  TiriVendor:Show()

elseif ( event == "MERCHANT_CLOSED" )
then
  TiriVendor:Hide()

  return;
 end
end
frame:SetScript("OnEvent", eventHandler);

/run BuyMerchantItem(100 {3, quantity})
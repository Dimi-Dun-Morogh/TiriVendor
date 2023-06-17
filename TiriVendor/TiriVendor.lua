-- SELECT
if not TiriVendor_DropDownMenuTest then
  CreateFrame("Frame", "TiriVendor_DropDownMenuTest", TiriVendor,
              "UIDropDownMenuTemplate")
end
TiriVendor_DropDownMenuTest:ClearAllPoints()
-- mount to - TiriVendor_selectString
-- POINT, RELATIVE FRAME, RELATIVE POINT, coords
TiriVendor_DropDownMenuTest:SetPoint("TOP", TiriVendor_selectString, "BOTTOM",
                                   0, -10)



local function BuyStuff(slot, amount)

for i = 1, amount do
  BuyMerchantItem(slot)
end
end

function ButtonGemsHandler()
  -- get quantity + select value
  local quantity = TiriVendor_Input:GetText()
  selectValue = TiriGemsCurrentSelect

  -- BUYING GOES HERE
  BuyStuff(selectValue, quantity)
end





local gemsArr = {
  {"12 Agility", 94}, {"24 Attack Power", 93}, {"14 Spell Damage", 95},
  {"26 Healing 9 spell damage", 96}, {"18 Stamina", 97},
  {"12 Spell crit", 98}, {"12 Crit  Strike", 99}, {"12 Defence Rating", 100}
}

TiriGemsCurrentSelect = gemsArr[1][2]

local function OnClick()
  UIDropDownMenu_SetSelectedID(TiriVendor_DropDownMenuTest, this:GetID())
  -- message(this.value)
  TiriGemsCurrentSelect = this.value
  print(this.value)
end
-- init  TiriGemsCurrentSelect with first value
local function initialize(self, level)
  local info = UIDropDownMenu_CreateInfo()
  for i = 1, #(gemsArr) do
      local key = gemsArr[i][1]
      local value = gemsArr[i][2]
      info = UIDropDownMenu_CreateInfo()
      info.text = key
      info.value = value
      info.func = OnClick
      UIDropDownMenu_AddButton(info, level)
  end
end
UIDropDownMenu_Initialize(TiriVendor_DropDownMenuTest, initialize)

-- UIDropDownMenu_SetWidth(TiriVendor_DropDownMenuTest, 100); err
UIDropDownMenu_SetWidth(100, TiriVendor_DropDownMenuTest);

UIDropDownMenu_SetButtonWidth(124, TiriVendor_DropDownMenuTest)
UIDropDownMenu_SetSelectedID(TiriVendor_DropDownMenuTest, 1)

UIDropDownMenu_JustifyText("LEFT", TiriVendor_DropDownMenuTest)

-- Tell the API to listen for 'VARIABLES_LOADED', 'ADDON_LOADED', and 'MERCHANT_SHOW'
-- RegisterEvents(frame, 'VARIABLES_LOADED', 'ADDON_LOADED', 'MERCHANT_SHOW')

local frame = CreateFrame("FRAME", "TiriVenAddonFrame");

frame:RegisterEvent("MERCHANT_SHOW")
frame:RegisterEvent("MERCHANT_CLOSED")
local function eventHandler(self, event, ...)
  if (event == "MERCHANT_SHOW" and UnitName("target") == "Kianna") then
      TiriVendor:Show()
  elseif (event == "MERCHANT_CLOSED") then
      TiriVendor:Hide();

      return;
  end
end
frame:SetScript("OnEvent", eventHandler);

-- default value for input
TiriVendor_Input:SetText(1);
 function print(text)

		DEFAULT_CHAT_FRAME:AddMessage(text)

end


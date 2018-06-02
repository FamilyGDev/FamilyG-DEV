ESX 						   = nil
local CopsConnected       	   = 0
local PlayersHarvestingCoke    = {}
local PlayersTransformingCoke  = {}
local PlayersSellingCoke       = {}
local PlayersHarvestingMeth    = {}
local PlayersTransformingMeth  = {}
local PlayersSellingMeth       = {}
local PlayersHarvestingWeed    = {}
local PlayersTransformingWeed  = {}
local PlayersSellingWeed       = {}
local PlayersHarvestingOpium   = {}
local PlayersTransformingOpium = {}
local PlayersSellingOpium      = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function CountCops()

	local xPlayers = ESX.GetPlayers()

	CopsConnected = 0

	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if xPlayer.job.name == 'police' then
			CopsConnected = CopsConnected + 1
		end
	end

	SetTimeout(5000, CountCops)

end

CountCops()

--coke
local function HarvestCoke(source)

	if CopsConnected < Config.RequiredCopsCoke then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsCoke))
		return
	end

	SetTimeout(5000, function()

		if PlayersHarvestingCoke[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)

			local coke = xPlayer.getInventoryItem('coke')

			if coke.limit ~= -1 and coke.count >= coke.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_coke'))
			else
				xPlayer.addInventoryItem('coke', 1)
				HarvestCoke(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startHarvestCoke')
AddEventHandler('esx_drugs:startHarvestCoke', function()
	local _source = source
  	
	if PlayersHarvestingCoke[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
		PlayersHarvestingCoke[_source] = false
	else
		PlayersHarvestingCoke[_source] = true
		TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))  
		HarvestCoke(_source)
	end
end)

RegisterServerEvent('esx_drugs:stopHarvestCoke')
AddEventHandler('esx_drugs:stopHarvestCoke', function()
	local _source = source
	
	if PlayersHarvestingCoke[_source] == true then
		PlayersHarvestingCoke[_source] = false
		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
	else
		TriggerClientEvent('esx:showNotification', _source, 'Veuillez attendre 10s avant de ~g~récolter')
		PlayersHarvestingCoke[_source] = true
	end
end)

local function TransformCoke(source)

	if CopsConnected < Config.RequiredCopsCoke then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsCoke))
		return
	end

	SetTimeout(10000, function()

		if PlayersTransformingCoke[source] == true then

			  local _source = source
  			  local xPlayer = ESX.GetPlayerFromId(_source)

			local cokeQuantity = xPlayer.getInventoryItem('coke').count
			local poochQuantity = xPlayer.getInventoryItem('coke_pooch').count

			if poochQuantity > 35 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif cokeQuantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_coke'))
			else
				xPlayer.removeInventoryItem('coke', 5)
				xPlayer.addInventoryItem('coke_pooch', 1)
			
				TransformCoke(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformCoke')
AddEventHandler('esx_drugs:startTransformCoke', function()
	local _source = source
  	
	if PlayersTransformingCoke[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
		PlayersTransformingCoke[_source] = false
	else
		PlayersTransformingCoke[_source] = true
		TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))  
		TransformCoke(_source)
	end
end)

RegisterServerEvent('esx_drugs:stopTransformCoke')
AddEventHandler('esx_drugs:stopTransformCoke', function()
	local _source = source
	
	if PlayersTransformingCoke[_source] == true then
		PlayersTransformingCoke[_source] = false
		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
	else
		TriggerClientEvent('esx:showNotification', _source, 'Veuillez attendre 10s avant de ~g~récolter')
		PlayersTransformingCoke[_source] = true
	end
end)

local function SellCoke(source)

	if CopsConnected < Config.RequiredCopsCoke then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsCoke))
		return
	end

	SetTimeout(7500, function()

		if PlayersSellingCoke[source] == true then

			  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

			local poochQuantity = xPlayer.getInventoryItem('coke_pooch').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('coke_pooch', 1)
				if CopsConnected == 0 then
                    xPlayer.addAccountMoney('black_money', 198)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
                elseif CopsConnected == 1 then
                    xPlayer.addAccountMoney('black_money', 258)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
                elseif CopsConnected == 2 then
                    xPlayer.addAccountMoney('black_money', 308)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
                elseif CopsConnected == 3 then
                    xPlayer.addAccountMoney('black_money', 358)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
                elseif CopsConnected == 4 then
                    xPlayer.addAccountMoney('black_money', 396)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
                elseif CopsConnected >= 5 then
                    xPlayer.addAccountMoney('black_money', 428)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_coke'))
                end
				
				SellCoke(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startSellCoke')
AddEventHandler('esx_drugs:startSellCoke', function()
	local _source = source
  	
	if PlayersSellingCoke[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
		PlayersSellingCoke[_source] = false
	else
		PlayersSellingCoke[_source] = true
		TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))  
		SellCoke(_source)
	end
end)

RegisterServerEvent('esx_drugs:stopSellCoke')
AddEventHandler('esx_drugs:stopSellCoke', function()
	local _source = source
	
	if PlayersSellingCoke[_source] == true then
		PlayersSellingCoke[_source] = false
		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
	else
		TriggerClientEvent('esx:showNotification', _source, 'Veuillez attendre 10s avant de ~g~récolter')
		PlayersSellingCoke[_source] = true
	end
end)


--meth
local function HarvestMeth(source)

	if CopsConnected < Config.RequiredCopsMeth then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsMeth))
		return
	end
	
	SetTimeout(5000, function()

		if PlayersHarvestingMeth[source] == true then

			  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

			local meth = xPlayer.getInventoryItem('meth')

			if meth.limit ~= -1 and meth.count >= meth.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_meth'))
			else
				xPlayer.addInventoryItem('meth', 1)
				HarvestMeth(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startHarvestMeth')
AddEventHandler('esx_drugs:startHarvestMeth', function()
	local _source = source
  	
	if PlayersHarvestingMeth[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
		PlayersHarvestingMeth[_source] = false
	else
		PlayersHarvestingMeth[_source] = true
		TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))  
		HarvestMeth(_source)
	end
end)

RegisterServerEvent('esx_drugs:stopHarvestMeth')
AddEventHandler('esx_drugs:stopHarvestMeth', function()
	local _source = source
	
	if PlayersHarvestingMeth[_source] == true then
		PlayersHarvestingMeth[_source] = false
		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
	else
		TriggerClientEvent('esx:showNotification', _source, 'Veuillez attendre 10s avant de ~g~récolter')
		PlayersHarvestingMeth[_source] = true
	end
end)

local function TransformMeth(source)

	if CopsConnected < Config.RequiredCopsMeth then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsMeth))
		return
	end

	SetTimeout(12000, function()

		if PlayersTransformingMeth[source] == true then

			  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

			local methQuantity = xPlayer.getInventoryItem('meth').count
			local poochQuantity = xPlayer.getInventoryItem('meth_pooch').count

			if poochQuantity > 35 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif methQuantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_meth'))
			else
				xPlayer.removeInventoryItem('meth', 5)
				xPlayer.addInventoryItem('meth_pooch', 1)
				
				TransformMeth(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformMeth')
AddEventHandler('esx_drugs:startTransformMeth', function()
	local _source = source
  	
	if PlayersTransformingMeth[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
		PlayersTransformingMeth[_source] = false
	else
		PlayersTransformingMeth[_source] = true
		TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))  
		TransformMeth(_source)
	end
end)

RegisterServerEvent('esx_drugs:stopTransformMeth')
AddEventHandler('esx_drugs:stopTransformMeth', function()
	local _source = source
	
	if PlayersTransformingMeth[_source] == true then
		PlayersTransformingMeth[_source] = false
		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
	else
		TriggerClientEvent('esx:showNotification', _source, 'Veuillez attendre 10s avant de ~g~récolter')
		PlayersTransformingMeth[_source] = true
	end
end)

local function SellMeth(source)

	if CopsConnected < Config.RequiredCopsMeth then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsMeth))
		return
	end

	SetTimeout(7500, function()

		if PlayersSellingMeth[source] == true then

			  local _source = source
  			local xPlayer = ESX.GetPlayerFromId(_source)

			local poochQuantity = xPlayer.getInventoryItem('meth_pooch').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', _source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('meth_pooch', 1)
				if CopsConnected == 0 then
                    xPlayer.addAccountMoney('black_money', 276)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
                elseif CopsConnected == 1 then
                    xPlayer.addAccountMoney('black_money', 374)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
                elseif CopsConnected == 2 then
                    xPlayer.addAccountMoney('black_money', 900)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
                elseif CopsConnected == 3 then
                    xPlayer.addAccountMoney('black_money', 1100)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
                elseif CopsConnected == 4 then
                    xPlayer.addAccountMoney('black_money', 1200)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
                elseif CopsConnected == 5 then
                    xPlayer.addAccountMoney('black_money', 1300)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
                elseif CopsConnected >= 6 then
                    xPlayer.addAccountMoney('black_money', 1400)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_meth'))
                end
				
				SellMeth(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startSellMeth')
AddEventHandler('esx_drugs:startSellMeth', function()
	local _source = source
  	
	if PlayersSellingMeth[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
		PlayersSellingMeth[_source] = false
	else
		PlayersSellingMeth[_source] = true
		TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))  
		SellMeth(_source)
	end
end)

RegisterServerEvent('esx_drugs:stopSellMeth')
AddEventHandler('esx_drugs:stopSellMeth', function()
	local _source = source
	
	if PlayersSellingMeth[_source] == true then
		PlayersSellingMeth[_source] = false
		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
	else
		TriggerClientEvent('esx:showNotification', _source, 'Veuillez attendre 10s avant de ~g~récolter')
		PlayersSellingMeth[_source] = true
	end
end)


--weed
local function HarvestWeed(source)

	if CopsConnected < Config.RequiredCopsWeed then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsWeed))
		return
	end

	SetTimeout(5000, function()

		if PlayersHarvestingWeed[source] == true then

			local _source = source
  			local xPlayer = ESX.GetPlayerFromId(_source)

			local weed = xPlayer.getInventoryItem('weed')

			if weed.limit ~= -1 and weed.count >= weed.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_weed'))
			else
				xPlayer.addInventoryItem('weed', 1)
				HarvestWeed(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startHarvestWeed')
AddEventHandler('esx_drugs:startHarvestWeed', function()
	local _source = source
  	
	if PlayersHarvestingWeed[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
		PlayersHarvestingWeed[_source] = false
	else
		PlayersHarvestingWeed[_source] = true
		TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))  
		HarvestWeed(_source)
	end
end)


RegisterServerEvent('esx_drugs:stopHarvestWeed')
AddEventHandler('esx_drugs:stopHarvestWeed', function()
	local _source = source
	
	if PlayersHarvestingWeed[_source] == true then
		PlayersHarvestingWeed[_source] = false
		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
	else
		TriggerClientEvent('esx:showNotification', _source, 'Veuillez attendre 10s avant de ~g~récolter')
		PlayersHarvestingWeed[_source] = true
	end
end)

local function TransformWeed(source)

	if CopsConnected < Config.RequiredCopsWeed then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsWeed))
		return
	end

	SetTimeout(7500, function()

		if PlayersTransformingWeed[source] == true then

			local _source = source
  			local xPlayer = ESX.GetPlayerFromId(_source)
			local weedQuantity = xPlayer.getInventoryItem('weed').count
			local poochQuantity = xPlayer.getInventoryItem('weed_pooch').count

			if poochQuantity > 35 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif weedQuantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_weed'))
			else
				xPlayer.removeInventoryItem('weed', 5)
				xPlayer.addInventoryItem('weed_pooch', 1)
				
				TransformWeed(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformWeed')
AddEventHandler('esx_drugs:startTransformWeed', function()
	local _source = source
  	
	if PlayersTransformingWeed[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
		PlayersTransformingWeed[_source] = false
	else
		PlayersTransformingWeed[_source] = true
		TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))  
		TransformWeed(_source)
	end
end)

RegisterServerEvent('esx_drugs:stopTransformWeed')
AddEventHandler('esx_drugs:stopTransformWeed', function()
	local _source = source
	
	if PlayersTransformingWeed[_source] == true then
		PlayersTransformingWeed[_source] = false
		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
	else
		TriggerClientEvent('esx:showNotification', _source, 'Veuillez attendre 10s avant de ~g~récolter')
		PlayersTransformingWeed[_source] = true
	end
end)


local function SellWeed(source)

	if CopsConnected < Config.RequiredCopsWeed then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsWeed))
		return
	end

	SetTimeout(7500, function()

		if PlayersSellingWeed[source] == true then

			local _source = source
  			local xPlayer = ESX.GetPlayerFromId(_source)

			local poochQuantity = xPlayer.getInventoryItem('weed_pooch').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('weed_pooch', 1)
                if CopsConnected == 0 then
                    xPlayer.addAccountMoney('black_money', 216)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
                elseif CopsConnected == 1 then
                    xPlayer.addAccountMoney('black_money', 256)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
                elseif CopsConnected == 2 then
                    xPlayer.addAccountMoney('black_money', 304)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
                elseif CopsConnected == 3 then
                    xPlayer.addAccountMoney('black_money', 330)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
                elseif CopsConnected >= 4 then
                    xPlayer.addAccountMoney('black_money', 360)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_weed'))
                end
				
				SellWeed(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startSellWeed')
AddEventHandler('esx_drugs:startSellWeed', function()
	local _source = source
  	
	if PlayersSellingWeed[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
		PlayersSellingWeed[_source] = false
	else
		PlayersSellingWeed[_source] = true
		TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))  
		SellWeed(_source)
	end
end)

RegisterServerEvent('esx_drugs:stopSellWeed')
AddEventHandler('esx_drugs:stopSellWeed', function()
	local _source = source
	
	if PlayersSellingWeed[_source] == true then
		PlayersSellingWeed[_source] = false
		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
	else
		TriggerClientEvent('esx:showNotification', _source, 'Veuillez attendre 10s avant de ~g~récolter')
		PlayersSellingWeed[_source] = true
	end
end)


--opium

local function HarvestOpium(source)

	if CopsConnected < Config.RequiredCopsOpium then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsOpium))
		return
	end

	SetTimeout(5000, function()

		if PlayersHarvestingOpium[source] == true then

			local _source = source
  			local xPlayer = ESX.GetPlayerFromId(_source)

			local opium = xPlayer.getInventoryItem('opium')

			if opium.limit ~= -1 and opium.count >= opium.limit then
				TriggerClientEvent('esx:showNotification', source, _U('inv_full_opium'))
			else
				xPlayer.addInventoryItem('opium', 1)
				HarvestOpium(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startHarvestOpium')
AddEventHandler('esx_drugs:startHarvestOpium', function()
	local _source = source
  	
	if PlayersHarvestingOpium[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
		PlayersHarvestingOpium[_source] = false
	else
		PlayersHarvestingOpium[_source] = true
		TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))  
		HarvestOpium(_source)
	end
end)

RegisterServerEvent('esx_drugs:stopHarvestOpium')
AddEventHandler('esx_drugs:stopHarvestOpium', function()
	local _source = source
	
	if PlayersHarvestingOpium[_source] == true then
		PlayersHarvestingOpium[_source] = false
		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
	else
		TriggerClientEvent('esx:showNotification', _source, 'Veuillez attendre 10s avant de ~g~récolter')
		PlayersHarvestingOpium[_source] = true
	end
end)


local function TransformOpium(source)

	if CopsConnected < Config.RequiredCopsOpium then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsOpium))
		return
	end

	SetTimeout(10000, function()

		if PlayersTransformingOpium[source] == true then

			local _source = source
  			local xPlayer = ESX.GetPlayerFromId(_source)

			local opiumQuantity = xPlayer.getInventoryItem('opium').count
			local poochQuantity = xPlayer.getInventoryItem('opium_pooch').count

			if poochQuantity > 35 then
				TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
			elseif opiumQuantity < 5 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_opium'))
			else
				xPlayer.removeInventoryItem('opium', 5)
				xPlayer.addInventoryItem('opium_pooch', 1)
			
				TransformOpium(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startTransformOpium')
AddEventHandler('esx_drugs:startTransformOpium', function()
	local _source = source
  	
	if PlayersTransformingOpium[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
		PlayersTransformingOpium[_source] = false
	else
		PlayersTransformingOpium[_source] = true
		TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))  
		TransformOpium(_source)
	end
end)

RegisterServerEvent('esx_drugs:stopTransformOpium')
AddEventHandler('esx_drugs:stopTransformOpium', function()
	local _source = source
	
	if PlayersTransformingOpium[_source] == true then
		PlayersTransformingOpium[_source] = false
		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
	else
		TriggerClientEvent('esx:showNotification', _source, 'Veuillez attendre 10s avant de ~g~récolter')
		PlayersTransformingOpium[_source] = true
	end
end)


local function SellOpium(source)

	if CopsConnected < Config.RequiredCopsOpium then
		TriggerClientEvent('esx:showNotification', source, _U('act_imp_police', CopsConnected, Config.RequiredCopsOpium))
		return
	end

	SetTimeout(7500, function()

		if PlayersSellingOpium[source] == true then

			local _source = source
  			local xPlayer = ESX.GetPlayerFromId(_source)

			local poochQuantity = xPlayer.getInventoryItem('opium_pooch').count

			if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale'))
			else
				xPlayer.removeInventoryItem('opium_pooch', 1)
				if CopsConnected == 0 then
                    xPlayer.addAccountMoney('black_money', 300)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
                elseif CopsConnected == 1 then
                    xPlayer.addAccountMoney('black_money', 500)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
                elseif CopsConnected == 2 then
                    xPlayer.addAccountMoney('black_money', 1400)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
                elseif CopsConnected == 3 then
                    xPlayer.addAccountMoney('black_money', 1600)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
                elseif CopsConnected == 4 then
                    xPlayer.addAccountMoney('black_money', 1800)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
                elseif CopsConnected >= 5 then
                    xPlayer.addAccountMoney('black_money', 2000)
                    TriggerClientEvent('esx:showNotification', source, _U('sold_one_opium'))
                end
				
				SellOpium(source)
			end

		end
	end)
end

RegisterServerEvent('esx_drugs:startSellOpium')
AddEventHandler('esx_drugs:startSellOpium', function()
	local _source = source
  	
	if PlayersSellingOpium[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
		PlayersSellingOpium[_source] = false
	else
		PlayersSellingOpium[_source] = true
		TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))  
		SellOpium(_source)
	end
end)

RegisterServerEvent('esx_drugs:stopSellOpium')
AddEventHandler('esx_drugs:stopSellOpium', function()
	local _source = source
	
	if PlayersSellingOpium[_source] == true then
		PlayersSellingOpium[_source] = false
		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
	else
		TriggerClientEvent('esx:showNotification', _source, 'Veuillez attendre 10s avant de ~g~récolter')
		PlayersSellingOpium[_source] = true
	end
end)


-- RETURN INVENTORY TO CLIENT
RegisterServerEvent('esx_drugs:GetUserInventory')
AddEventHandler('esx_drugs:GetUserInventory', function(currentZone)
	local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('esx_drugs:ReturnInventory', 
    	_source, 
    	xPlayer.getInventoryItem('coke').count, 
		xPlayer.getInventoryItem('coke_pooch').count,
		xPlayer.getInventoryItem('meth').count, 
		xPlayer.getInventoryItem('meth_pooch').count, 
		xPlayer.getInventoryItem('weed').count, 
		xPlayer.getInventoryItem('weed_pooch').count, 
		xPlayer.getInventoryItem('opium').count, 
		xPlayer.getInventoryItem('opium_pooch').count,
		xPlayer.job.name, 
		currentZone
    )
end)

-- Register Usable Item
ESX.RegisterUsableItem('weed', function(source)

	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('weed', 1)

	TriggerClientEvent('esx_drugs:onPot', _source)
    TriggerClientEvent('esx:showNotification', _source, _U('used_one_weed'))

end)

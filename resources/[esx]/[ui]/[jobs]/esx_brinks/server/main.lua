-----------------------------------------
-- Created and modify by L'ile Légale RP
-- SenSi and Kaminosekai
-----------------------------------------

ESX = nil
local PlayersTransforming  = {}
local PlayersSelling       = {}
local PlayersHarvesting = {}
local sacnumerotter = 1
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
	TriggerEvent('esx_service:activateService', 'brinks', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'brinks', _U('brinks_client'), true, true)
TriggerEvent('esx_society:registerSociety', 'brinks', 'Brinks', 'society_brinks', 'society_brinks', 'society_brinks', {type = 'private'})
local function Harvest(source, zone)
	if PlayersHarvesting[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "PieceFarm" then
			local itemQuantity = xPlayer.getInventoryItem('piece').count
			if itemQuantity >= 100 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_place'))
				return
			else
				SetTimeout(1800, function()
					xPlayer.addInventoryItem('piece', 1)
					Harvest(source, zone)
				end)
			end
		end
	end
end

RegisterServerEvent('esx_brinks:startHarvest')
AddEventHandler('esx_brinks:startHarvest', function(zone)
	local _source = source
  	
	if PlayersHarvesting[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
		PlayersHarvesting[_source]=false
	else
		PlayersHarvesting[_source]=true
		TriggerClientEvent('esx:showNotification', _source, _U('brinks_taken'))  
		Harvest(_source,zone)
	end
end)


RegisterServerEvent('esx_brinks:stopHarvest')
AddEventHandler('esx_brinks:stopHarvest', function()
	local _source = source
	
	if PlayersHarvesting[_source] == true then
		PlayersHarvesting[_source]=false
		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
	else
		TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~récolter')
		PlayersHarvesting[_source]=true
	end
end)


local function Transform(source, zone)

	if PlayersTransforming[source] == true then

		local xPlayer  = ESX.GetPlayerFromId(source)
		if zone == "TraitementBillet" then
			local itemQuantity = xPlayer.getInventoryItem('piece').count
			
			if itemQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_brinks'))
				return
			else
				local rand = math.random(0,100)
					SetTimeout(1800, function()
						xPlayer.removeInventoryItem('piece', 1)
						xPlayer.addInventoryItem('billet', 1)
				
						Transform(source, zone)
					end)
			end
		elseif zone == "TraitementSacnumerotter" then
			local itemQuantity = xPlayer.getInventoryItem('billet').count
			if itemQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, _U('not_enough_brinks'))
				return
			else
				SetTimeout(1800, function()
					xPlayer.removeInventoryItem('billet', 1)
					xPlayer.addInventoryItem('sacnumerotter', 1)
		  
					Transform(source, zone)	  
				end)
			end
		end
	end	
end

RegisterServerEvent('esx_brinks:startTransform')
AddEventHandler('esx_brinks:startTransform', function(zone)
	local _source = source
  	
	if PlayersTransforming[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
		PlayersTransforming[_source]=false
	else
		PlayersTransforming[_source]=true
		TriggerClientEvent('esx:showNotification', _source, _U('transforming_in_progress')) 
		Transform(_source,zone)
	end
end)

RegisterServerEvent('esx_brinks:stopTransform')
AddEventHandler('esx_brinks:stopTransform', function()

	local _source = source
	
	if PlayersTransforming[_source] == true then
		PlayersTransforming[_source]=false
		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
		
	else
		TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~reprendre le travail')
		PlayersTransforming[_source]=true
		
	end
end)

local function Sell(source, zone)

	if PlayersSelling[source] == true then
		local xPlayer  = ESX.GetPlayerFromId(source)
		
		if zone == 'SellFarm' then
			-- if xPlayer.getInventoryItem('bandage').count <= 0 then
			-- 	wine = 0
			-- else
			-- 	wine = 1
			-- end
			
			if xPlayer.getInventoryItem('sacnumerotter').count <= 0 then
				sacnumerotter = 0
			else
				sacnumerotter = 1
			end
		
			if wine == 0 and sacnumerotter == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_product_sale'))
				return
			-- elseif xPlayer.getInventoryItem('bandage').count <= 0 and sacnumerotter == 0 then
			-- 	TriggerClientEvent('esx:showNotification', source, _U('no_vin_sale'))
			-- 	wine = 0
			-- 	return
			elseif xPlayer.getInventoryItem('sacnumerotter').count <= 0 and wine == 0then
				TriggerClientEvent('esx:showNotification', source, _U('brinks'))
				sacnumerotter = 0
				return
			else
				if (sacnumerotter == 1) then
					SetTimeout(1100, function()
						local money = math.random(72,75)
						xPlayer.removeInventoryItem('sacnumerotter', 1)
						local societyAccount = nil

						TriggerEvent('esx_addonaccount:getSharedAccount', 'society_brinks', function(account)
							societyAccount = account
						end)
						if societyAccount ~= nil then
							societyAccount.addMoney(money)
							TriggerClientEvent('esx:showNotification', xPlayer.source, _U('comp_earned') .. money)
						end
						Sell(source,zone)
					end)
				-- elseif (wine == 1) then
				-- 	SetTimeout(1100, function()
				-- 		local money = math.random(11,12)
				-- 		xPlayer.removeInventoryItem('bandage', 1)
				-- 		local societyAccount = nil

				-- 		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_brinks', function(account)
				-- 			societyAccount = account
				-- 		end)
				-- 		if societyAccount ~= nil then
				-- 			societyAccount.addMoney(money)
				-- 			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('comp_earned') .. money)
				-- 		end
				-- 		Sell(source,zone)
				-- 	end)
				end
				
			end
		end
	end
end

RegisterServerEvent('esx_brinks:startSell')
AddEventHandler('esx_brinks:startSell', function(zone)

	local _source = source
	
	if PlayersSelling[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
		PlayersSelling[_source]=false
	else
		PlayersSelling[_source]=true
		TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))
		Sell(_source, zone)
	end

end)

RegisterServerEvent('esx_brinks:stopSell')
AddEventHandler('esx_brinks:stopSell', function()

	local _source = source
	
	if PlayersSelling[_source] == true then
		PlayersSelling[_source]=false
		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
		
	else
		TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~vendre')
		PlayersSelling[_source]=true
	end

end)

RegisterServerEvent('esx_brinks:getStockItem')
AddEventHandler('esx_brinks:getStockItem', function(itemName, count)

	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_brinks', function(inventory)

		local item = inventory.getItem(itemName)

		if item.count >= count then
			inventory.removeItem(itemName, count)
			xPlayer.addInventoryItem(itemName, count)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end

		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_withdrawn') .. count .. ' ' .. item.label)

	end)

end)

ESX.RegisterServerCallback('esx_brinks:getStockItems', function(source, cb)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_brinks', function(inventory)
		cb(inventory.items)
	end)

end)

RegisterServerEvent('esx_brinks:putStockItems')
AddEventHandler('esx_brinks:putStockItems', function(itemName, count)

	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_brinks', function(inventory)

		local item = inventory.getItem(itemName)

		if item.count >= 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
		end

		TriggerClientEvent('esx:showNotification', xPlayer.source, _U('added') .. count .. ' ' .. item.label)

	end)
end)

ESX.RegisterServerCallback('esx_brinks:getPlayerInventory', function(source, cb)

	local xPlayer    = ESX.GetPlayerFromId(source)
	local items      = xPlayer.inventory

	cb({
		items      = items
	})

end)

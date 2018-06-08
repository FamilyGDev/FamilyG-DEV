ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('duty:police')
AddEventHandler('duty:police', function(job)

        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.job.name == 'police' and xPlayer.job.grade == 1 then
        xPlayer.setJob('offpolice', 1)
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 2 then
        xPlayer.setJob('offpolice', 2)
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 3 then
        xPlayer.setJob('offpolice', 3)
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 4 then
        xPlayer.setJob('offpolice', 4)
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 0 then
        xPlayer.setJob('offpolice', 0)
    end

    if xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 1 then
        xPlayer.setJob('police', 1)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 2 then
        xPlayer.setJob('police', 2)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 3 then
        xPlayer.setJob('police', 3)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 4 then
        xPlayer.setJob('police', 4)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 0 then
        xPlayer.setJob('police', 0)
    end
end)

RegisterServerEvent('duty:ambulance')
AddEventHandler('duty:ambulance', function(job)

        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 1 then
        xPlayer.setJob('offambulance', 1)
    elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 2 then
        xPlayer.setJob('offambulance', 2)
    elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 3 then
        xPlayer.setJob('offambulance', 3)
    elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 0 then
        xPlayer.setJob('offambulance', 0)
    end

    if xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 1 then
        xPlayer.setJob('ambulance', 1)
    elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 2 then
        xPlayer.setJob('ambulance', 2)
    elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 3 then
        xPlayer.setJob('ambulance', 3)
    elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 0 then
        xPlayer.setJob('ambulance', 0)
    end
end)

RegisterServerEvent('duty:mecano')
AddEventHandler('duty:mecano', function(job)

        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.job.name == 'mecano' and xPlayer.job.grade == 1 then
        xPlayer.setJob('offmecano', 1)
    elseif xPlayer.job.name == 'mecano' and xPlayer.job.grade == 2 then
        xPlayer.setJob('offmecano', 2)
    elseif xPlayer.job.name == 'mecano' and xPlayer.job.grade == 3 then
        xPlayer.setJob('offmecano', 3)
    elseif xPlayer.job.name == 'mecano' and xPlayer.job.grade == 4 then
        xPlayer.setJob('offmecano', 4)
    elseif xPlayer.job.name == 'mecano' and xPlayer.job.grade == 0 then
        xPlayer.setJob('offmecano', 0)
    end

    if xPlayer.job.name == 'offmecano' and xPlayer.job.grade == 1 then
        xPlayer.setJob('mecano', 1)
    elseif xPlayer.job.name == 'offmecano' and xPlayer.job.grade == 2 then
        xPlayer.setJob('mecano', 2)
    elseif xPlayer.job.name == 'offmecano' and xPlayer.job.grade == 3 then
        xPlayer.setJob('mecano', 3)
    elseif xPlayer.job.name == 'offmecano' and xPlayer.job.grade == 4 then
        xPlayer.setJob('mecano', 4)
    elseif xPlayer.job.name == 'offmecano' and xPlayer.job.grade == 0 then
        xPlayer.setJob('mecano', 0)
    end
end)

RegisterServerEvent('duty:taxi')
AddEventHandler('duty:taxi', function(job)

        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.job.name == 'taxi' and xPlayer.job.grade == 1 then
        xPlayer.setJob('offtaxi', 1)
    elseif xPlayer.job.name == 'taxi' and xPlayer.job.grade == 2 then
        xPlayer.setJob('offtaxi', 2)
    elseif xPlayer.job.name == 'taxi' and xPlayer.job.grade == 3 then
        xPlayer.setJob('offtaxi', 3)
    elseif xPlayer.job.name == 'taxi' and xPlayer.job.grade == 4 then
        xPlayer.setJob('offtaxi', 4)
    elseif xPlayer.job.name == 'taxi' and xPlayer.job.grade == 0 then
        xPlayer.setJob('offtaxi', 0)
    end

    if xPlayer.job.name == 'offtaxi' and xPlayer.job.grade == 1 then
        xPlayer.setJob('taxi', 1)
    elseif xPlayer.job.name == 'offtaxi' and xPlayer.job.grade == 2 then
        xPlayer.setJob('taxi', 2)
    elseif xPlayer.job.name == 'offtaxi' and xPlayer.job.grade == 3 then
        xPlayer.setJob('taxi', 3)
    elseif xPlayer.job.name == 'offtaxi' and xPlayer.job.grade == 4 then
        xPlayer.setJob('taxi', 4)
    elseif xPlayer.job.name == 'offtaxi' and xPlayer.job.grade == 0 then
        xPlayer.setJob('taxi', 0)
    end
end)

RegisterServerEvent('duty:banker')
AddEventHandler('duty:banker', function(job)

        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.job.name == 'banker' and xPlayer.job.grade == 1 then
        xPlayer.setJob('offbanker', 1)
    elseif xPlayer.job.name == 'banker' and xPlayer.job.grade == 2 then
        xPlayer.setJob('offbanker', 2)
    elseif xPlayer.job.name == 'banker' and xPlayer.job.grade == 3 then
        xPlayer.setJob('offbanker', 3)
    elseif xPlayer.job.name == 'banker' and xPlayer.job.grade == 4 then
        xPlayer.setJob('offbanker', 4)
    elseif xPlayer.job.name == 'banker' and xPlayer.job.grade == 0 then
        xPlayer.setJob('offbanker', 0)
    end

    if xPlayer.job.name == 'offbanker' and xPlayer.job.grade == 1 then
        xPlayer.setJob('banker', 1)
    elseif xPlayer.job.name == 'offbanker' and xPlayer.job.grade == 2 then
        xPlayer.setJob('banker', 2)
    elseif xPlayer.job.name == 'offbanker' and xPlayer.job.grade == 3 then
        xPlayer.setJob('banker', 3)
    elseif xPlayer.job.name == 'offbanker' and xPlayer.job.grade == 4 then
        xPlayer.setJob('banker', 4)
    elseif xPlayer.job.name == 'offbanker' and xPlayer.job.grade == 0 then
        xPlayer.setJob('banker', 0)
    end
end)

RegisterServerEvent('duty:fueler')
AddEventHandler('duty:fueler', function(job)

        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.job.name == 'fueler' and xPlayer.job.grade == 1 then
        xPlayer.setJob('offfueler', 1)
    elseif xPlayer.job.name == 'fueler' and xPlayer.job.grade == 2 then
        xPlayer.setJob('offfueler', 2)
    elseif xPlayer.job.name == 'fueler' and xPlayer.job.grade == 3 then
        xPlayer.setJob('offfueler', 3)
    elseif xPlayer.job.name == 'fueler' and xPlayer.job.grade == 0 then
        xPlayer.setJob('offfueler', 0)
    end

    if xPlayer.job.name == 'offfueler' and xPlayer.job.grade == 1 then
        xPlayer.setJob('fueler', 1)
    elseif xPlayer.job.name == 'offfueler' and xPlayer.job.grade == 2 then
        xPlayer.setJob('fueler', 2)
    elseif xPlayer.job.name == 'offfueler' and xPlayer.job.grade == 3 then
        xPlayer.setJob('fueler', 3)
    elseif xPlayer.job.name == 'offfueler' and xPlayer.job.grade == 0 then
        xPlayer.setJob('fueler', 0)
    end
end)

RegisterServerEvent('duty:realestateagent')
AddEventHandler('duty:realestateagent', function(job)

        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.job.name == 'realestateagent' and xPlayer.job.grade == 1 then
        xPlayer.setJob('offrealestateagent', 1)
    elseif xPlayer.job.name == 'realestateagent' and xPlayer.job.grade == 2 then
        xPlayer.setJob('offrealestateagent', 2)
    elseif xPlayer.job.name == 'realestateagent' and xPlayer.job.grade == 3 then
        xPlayer.setJob('offrealestateagent', 3)
    elseif xPlayer.job.name == 'realestateagent' and xPlayer.job.grade == 0 then
        xPlayer.setJob('offrealestateagent', 0)
    end

    if xPlayer.job.name == 'offrealestateagent' and xPlayer.job.grade == 1 then
        xPlayer.setJob('realestateagent', 1)
    elseif xPlayer.job.name == 'offrealestateagent' and xPlayer.job.grade == 2 then
        xPlayer.setJob('realestateagent', 2)
    elseif xPlayer.job.name == 'offrealestateagent' and xPlayer.job.grade == 3 then
        xPlayer.setJob('realestateagent', 3)
    elseif xPlayer.job.name == 'offrealestateagent' and xPlayer.job.grade == 0 then
        xPlayer.setJob('realestateagent', 0)
    end
end)

RegisterServerEvent('duty:vigne')
AddEventHandler('duty:vigne', function(job)

        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.job.name == 'vigne' and xPlayer.job.grade == 1 then
        xPlayer.setJob('offvigne', 1)
    elseif xPlayer.job.name == 'vigne' and xPlayer.job.grade == 2 then
        xPlayer.setJob('offvigne', 2)
    elseif xPlayer.job.name == 'vigne' and xPlayer.job.grade == 3 then
        xPlayer.setJob('offvigne', 3)
    elseif xPlayer.job.name == 'vigne' and xPlayer.job.grade == 0 then
        xPlayer.setJob('offvigne', 0)
    end

    if xPlayer.job.name == 'offvigne' and xPlayer.job.grade == 1 then
        xPlayer.setJob('vigne', 1)
    elseif xPlayer.job.name == 'offvigne' and xPlayer.job.grade == 2 then
        xPlayer.setJob('vigne', 2)
    elseif xPlayer.job.name == 'offvigne' and xPlayer.job.grade == 3 then
        xPlayer.setJob('vigne', 3)
    elseif xPlayer.job.name == 'offvigne' and xPlayer.job.grade == 0 then
        xPlayer.setJob('vigne', 0)
    end
end)

RegisterServerEvent('duty:unicorn')
AddEventHandler('duty:unicorn', function(job)

        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.job.name == 'unicorn' and xPlayer.job.grade == 1 then
        xPlayer.setJob('offunicorn', 1)
    elseif xPlayer.job.name == 'unicorn' and xPlayer.job.grade == 2 then
        xPlayer.setJob('offunicorn', 2)
    elseif xPlayer.job.name == 'unicorn' and xPlayer.job.grade == 3 then
        xPlayer.setJob('offunicorn', 3)
    elseif xPlayer.job.name == 'unicorn' and xPlayer.job.grade == 0 then
        xPlayer.setJob('offunicorn', 0)
    end

    if xPlayer.job.name == 'offunicorn' and xPlayer.job.grade == 1 then
        xPlayer.setJob('unicorn', 1)
    elseif xPlayer.job.name == 'offunicorn' and xPlayer.job.grade == 2 then
        xPlayer.setJob('unicorn', 2)
    elseif xPlayer.job.name == 'offunicorn' and xPlayer.job.grade == 3 then
        xPlayer.setJob('unicorn', 3)
    elseif xPlayer.job.name == 'offunicorn' and xPlayer.job.grade == 0 then
        xPlayer.setJob('unicorn', 0)
    end
end)

--AJOUT DAUTRES JOBS
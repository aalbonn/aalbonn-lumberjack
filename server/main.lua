local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('aalbonn-lumberjack:server:cutjack', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem("wood", 1)
    TriggerClientEvent('QBCore:Notify', src, Lang:t('success.sc_wood'), 'success', 3000)
end)

RegisterServerEvent('aalbonn-lumberjack:server:processwood', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem('wood', 1) then
        Wait(1000)
        Player.Functions.AddItem('tallwood', 1)
        TriggerClientEvent('QBCore:Notify', src, Lang:t('success.sp_wood'), "success")
    else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.no_wood'), "error")
    end
end)

RegisterServerEvent('aalbonn-lumberjack:server:sellwood', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local Item = Player.Functions.GetItemByName('tallwood')
    local price = Config.Prices['tallwood'] * Item.amount
	if Item ~= nil and Item.amount > 0 then
        Player.Functions.RemoveItem('tallwood', Item.amount)
        Player.Functions.AddMoney("cash", price, "sold-wood")
        TriggerClientEvent('QBCore:Notify', src, Lang:t('success.sold_wood', {money = price}), 'success', 1000)  
	else
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.no_tallwood'), 'error')
	end
end)

local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    for _, v in pairs(Config.Blips) do
        local blip = AddBlipForCoord(v.coords.x, v.coords.y, v.coords.z)
        SetBlipSprite(blip, v.sprite)
        SetBlipScale(blip, v.scale)
        SetBlipColour(blip, v.color)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName(v.label)
        EndTextCommandSetBlipName(blip)
    end
end)

RegisterNetEvent('aalbonn-lumberjack:client:cutjack', function()
    local ped = PlayerPedId()
    QBCore.Functions.Progressbar("cut_wood", Lang:t('info.cut_wood'), 1000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "rcmnigel1d",
        anim = "swing_a_mark",
    }, {
        model = "prop_ld_fireaxe",
        bone = 28422,
        coords = { x = -0.005, y = 0.0, z = 0.0 },
        rotation = { x = 0.0, y = 180.0, z = 0.0 },
    }, {}, function()
        if math.random(1,100) < 70 then
            TriggerServerEvent("aalbonn-lumberjack:server:cutjack")
        end
        ClearPedTasks(ped)
    end, function()
        ClearPedTasks(ped)
    end)
end)

RegisterNetEvent('aalbonn-lumberjack:client:processwood', function()
    local ped = PlayerPedId()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
            QBCore.Functions.Progressbar("process_wood", Lang:t('info.proc_wood'), math.random(15000, 30000), false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "mini@repair",
                anim = "fixing_a_player",
                flags = 16,
            }, {}, {}, function()
                TriggerServerEvent("aalbonn-lumberjack:server:processwood")
                ClearPedTasks(ped)
            end, function()
                ClearPedTasks(ped)
            end)
        else
            QBCore.Functions.Notify(Lang:t('error.no_wood'), 'error')
        end
    end, 'wood')
end)

RegisterNetEvent("aalbonn-lumberjack:client:sellwood", function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
            QBCore.Functions.Progressbar("sell_wood", Lang:t('info.sell_wood'), 7000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function()
                TriggerServerEvent("aalbonn-lumberjack:server:sellwood")
            end)
        else
            QBCore.Functions.Notify(Lang:t('error.no_tallwood'), 'error')
        end
    end, 'tallwood')
end)

CreateThread(function()
    for k, v in pairs (Config.Locations["lumberjack"]) do
        exports['qb-target']:AddBoxZone("jacktree1", vector3(v.coords.x, v.coords.y, v.coords.z), v.length, v.width,{
            name = "jacktree1",
            heading = v.heading,
            debugPoly = false,
            minZ = v.coords.z - 2,
            maxZ = v.coords.z + 2
        }, {
            options = {
                {
                    event = "aalbonn-lumberjack:client:cutjack",
                    icon = "fas fa-circle",
                    label = Lang:t('target.cwood'),
                },
            },
            distance = 2.0
        })
    end

    for k, v in pairs (Config.Locations["process1"]) do
        exports['qb-target']:AddBoxZone("cutprocess", vector3(v.coords.x, v.coords.y, v.coords.z), v.length, v.width,{
            name = "cutprocess",
            heading = 250,
            debugPoly = false,
            minZ = v.coords.z - 2,
            maxZ = v.coords.z + 2
        }, {
            options = {
                {
                    event = "aalbonn-lumberjack:client:processwood",
                    icon = "fas fa-circle",
                    label = Lang:t('target.pwood'),
                },
            },
            distance = 2.0
        })
    end

    for k, v in pairs (Config.Locations["seller"]) do
        exports['qb-target']:AddBoxZone("sellerped", vector3(v.coords.x, v.coords.y, v.coords.z),  v.length, v.width, {
            name = "seller",
            heading = 340,
            debugPoly = false,
            minZ = v.coords.z - 2,
            maxZ = v.coords.z + 2
        }, {
            options = {
                {
                    event = "aalbonn-lumberjack:menuseller",
                    icon = "Fas Fa-hands",
                    label = Lang:t('target.tt_seller'),
                },
            },
            distance = 2.0
        })
    end
end)

RegisterNetEvent('aalbonn-lumberjack:menuseller', function(data)
    exports['qb-menu']:openMenu({
        {
            header = Lang:t('menu.lj_seller'),
            isMenuHeader = true,
        },
        {
            header = Lang:t('menu.sl_wood'),
            params = {
                event = 'aalbonn-lumberjack:client:sellwood',
            }
        },
        {
            header = Lang:t('menu.close'),
        },
    })
end)

CreateThread(function()
    for k, v in pairs (Config.Locations["seller"]) do
        exports['aalbonn-base']:PedCreate('Wood Seller', 0x94562DD7, v.coords.x, v.coords.y, v.coords.z, v.coords.a)
    end
end)

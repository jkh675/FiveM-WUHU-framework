RegisterNetEvent('addMoney')
AddEventHandler('addMoney', function(playerid,ammount)

    local playerIdentifier = GetPlayerIdentifier(playerid)

    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier',{
        ['@identifier'] = playerIdentifier
    },function(result)
        MySQL.Async.execute('UPDATE users SET money = @money WHERE identifier = @identifier',{ 
            ['money'] = tonumber(result[1].money) + ammount,
            ['identifier'] = playerIdentifier
        },
        function(affectedRows)
            print('服务器给了 '.. affectedRows .. " 现金给 " .. GetPlayerName(playerid))
         end)
    end)
end)


function addMoney(playerid,ammount)
    TriggerEvent('addMoney', playerid,ammount)
end



RegisterNetEvent('removeMoney')
AddEventHandler('removeMoney', function(playerid,ammount)

    local playerIdentifier = GetPlayerIdentifier(playerid)

    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier',{
        ['@identifier'] = playerIdentifier
    },function(result)
        MySQL.Async.execute('UPDATE users SET money = @money WHERE identifier = @identifier',{ 
            ['money'] = tonumber(result[1].money) - ammount,
            ['identifier'] = playerIdentifier
        },
        function(affectedRows)
            print('服务器移除了 '.. affectedRows .. " 现金 " .. GetPlayerName(playerid))
         end)
    end)
end)

function removeMoney(playerid,ammount)
    TriggerEvent('removeMoney', playerid,ammount)
end

RegisterNetEvent('addBank')
AddEventHandler('addBank', function(playerid,ammount)

    local playerIdentifier = GetPlayerIdentifier(playerid)

    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier',{
        ['@identifier'] = playerIdentifier
    },function(result)
        MySQL.Async.execute('UPDATE users SET bank = @bank WHERE identifier = @identifier',{ 
            ['bank'] = tonumber(result[1].bank) + ammount,
            ['identifier'] = playerIdentifier
        },
        function(affectedRows)
            print('服务器给了 '.. affectedRows .. " 银行给 " .. GetPlayerName(playerid))
         end)
    end)
end)

function addBank(playerid,ammount)
    TriggerEvent('addBank', playerid,ammount)
end

RegisterNetEvent('removeBank')
AddEventHandler('removeBank', function(playerid,ammount)

    local playerIdentifier = GetPlayerIdentifier(playerid)

    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier',{
        ['@identifier'] = playerIdentifier
    },function(result)
        MySQL.Async.execute('UPDATE users SET bank = @bank WHERE identifier = @identifier',{ 
            ['bank'] = tonumber(result[1].bank) - ammount,
            ['identifier'] = playerIdentifier
        },
        function(affectedRows)
            print('服务器移除了 '.. GetPlayerName(playerid) .."的".. affectedRows .. " 银行 " )
         end)
    end)
end)

function removeBank(playerid,ammount)
    TriggerEvent('removeBank', playerid,ammount)
end

RegisterServerCallback('getplayerid', function(source, ...)
    local id = GetPlayers(source)[1]
    return id -- return any
end)


function getplayerid(source, ...)
    local id = GetPlayers(source)[1]
    return id -- return any
end

RegisterServerCallback('getplayermoney', function(playerid)
    local money

    local playerIdentifier = GetPlayerIdentifier(playerid)

    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier',{
        ['@identifier'] = playerIdentifier
    },function(result)
        money = result[1].money
    end)
    Wait(100)
    return tonumber(money) -- return any
end)

function getplayermoney(playerid)
    local money

    local playerIdentifier = GetPlayerIdentifier(playerid)

    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier',{
        ['@identifier'] = playerIdentifier
    },function(result)
        money = result[1].money
    end)
    Wait(100)
    return tonumber(money) -- return any
end

RegisterServerCallback('getplayerbank', function(playerid)
    local bank = 0

    local playerIdentifier = GetPlayerIdentifier(playerid)

    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier',{
        ['@identifier'] = playerIdentifier
    },
    function(result)
        bank = (result[1].bank)
    end)
    Wait(100)
    return bank -- return any
end)

function getplayerbank(playerid)
    local bank = 0

    local playerIdentifier = GetPlayerIdentifier(playerid)

    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier',{
        ['@identifier'] = playerIdentifier
    },
    function(result)
        bank = (result[1].bank)
    end)
    Wait(100)
    return bank -- return any
end

function banplayer(playerid,reson)
    -- kickplayer(playerid,reson)
    MySQL.Async.execute('INSERT INTO ban (steamid, endpoint,name, date, reson) VALUES (@steamid, @endpoint,@name, @date, @reson)',
    { 
        ['steamid'] = GetPlayerIdentifier(playerid), 
        ['endpoint'] = GetPlayerEndpoint(playerid),
        ['name'] = GetPlayerName(playerid), 
        ['date'] = os.date("%Y-%m-%d||%H:%M"), 
        ['reson'] = reson
    })
end

RegisterServerCallback('checksteamban', function(playerid)
    local src = source
    local resulte = "1"
    MySQL.Async.fetchAll('SELECT * FROM ban WHERE steamid = @steamid', 
    { 
        ['@steamid'] = GetPlayerIdentifier(playerid)
    }, 
    function(result)
        resulte = result
    end)
    Wait(200)
    print("下面这个SCRIPT ERROR不要动他 动了的话就Steam封禁就失效，不要修")
    local steamid = json.encode(resulte[1].steamid)
    if steamid then 
        kickplayer(playerid,"\n您已於："..json.encode(resulte[1].date).."被封禁\n".."原因："..json.encode(resulte[1].reson).."\n如有疑惑请到QQ群了解")
    end
end)

RegisterServerCallback('checkipban', function(playerid)
    local src = source
    local resulte = "1"
    MySQL.Async.fetchAll('SELECT * FROM ban WHERE endpoint = @endpoint', 
    { 
        ['@endpoint'] = GetPlayerEndpoint(playerid)
    }, 
    
    function(result)
        resulte = result
    end)
    Wait(200)
    print("下面这个SCRIPT ERROR不要动他 动了的话就IP封禁就失效，不要修")
    local ip = json.encode(resulte[1].endpoint)
    if ip then 
        kickplayer(playerid,"\n您已於："..json.encode(resulte[1].date).."被封禁\n".."原因："..json.encode(resulte[1].reson).."\n如有疑惑请到QQ群了解")
    end
end)


RegisterCommand('ban',function(args,rawCommand)
    banplayer(rawCommand[1],rawCommand[2])
end)

function kickplayer(playerid,reson)
    print(GetPlayerName(playerid).."已被踢出服务器")
    DropPlayer(playerid, reson)
end
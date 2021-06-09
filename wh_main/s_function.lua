function addMoney(playerid,ammount)
    local playerIdentifier = GetPlayerIdentifier(playerid)
    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier',{
        ['@identifier'] = playerIdentifier
    },function(result)
        MySQL.Async.execute('UPDATE users SET money = @money WHERE identifier = @identifier',{ 
            ['money'] = tonumber(result[1].money) + ammount,
            ['identifier'] = playerIdentifier
        },
        function(affectedRows)
        end)
    end)
end

function removeMoney(playerid,ammount)
    local playerIdentifier = GetPlayerIdentifier(playerid)

    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier',{
        ['@identifier'] = playerIdentifier
    },function(result)
        MySQL.Async.execute('UPDATE users SET money = @money WHERE identifier = @identifier',{ 
            ['money'] = tonumber(result[1].money) - ammount,
            ['identifier'] = playerIdentifier
        },
        function(affectedRows)
        end)
    end)
end

function addBank (playerid,ammount)
    local playerIdentifier = GetPlayerIdentifier(playerid)
    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier',{
        ['@identifier'] = playerIdentifier
    },function(result)
        MySQL.Async.execute('UPDATE users SET bank = @bank WHERE identifier = @identifier',{ 
            ['bank'] = tonumber(result[1].bank) + ammount,
            ['identifier'] = playerIdentifier
        },
        function(affectedRows)
        end)
    end)
end

function removeBank(playerid,ammount)
    local playerIdentifier = GetPlayerIdentifier(playerid)

    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier',{
        ['@identifier'] = playerIdentifier
    },function(result)
        MySQL.Async.execute('UPDATE users SET bank = @bank WHERE identifier = @identifier',{ 
            ['bank'] = tonumber(result[1].bank) - ammount,
            ['identifier'] = playerIdentifier
        },
        function(affectedRows)
        end)
    end)
end

function GetPlayerID(source)
    return GetPlayers(source)[1]
end

function GetPlayerMoney(playerid)
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

function GetPlayerBank(playerid)
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

function BanPlayer(playerid,reson)
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

function KickPlayer(playerid,reson)
    print(GetPlayerName(playerid).."已被踢出服务器，原因:  "..reson)
    DropPlayer(playerid, reson)
end


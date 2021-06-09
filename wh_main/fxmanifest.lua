fx_version 'cerulean'
games {'gta5'}

author 'RULoN'
description 'Wuhu Freamwork'
version '1.0.0'

client_scripts {
    'client.lua',
    'c_function.lua',
}
export {
    'drawBlip',
    'helpnotify',
    'notify',
    'SpawnVehicle',
    'revivePed'
}

server_script {
    'server.lua',
    's_function.lua',
    '@mysql-async/lib/MySQL.lua',
}

server_export {
    'addMoney',
    'removeMoney',
    'addBank',
    'removeBank',
    'getplayerid',
    'getplayermoney',
    'getplayerbank',
    'kickplayer'
}




shared_script '@pmc-callbacks/import.lua'

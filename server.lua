--------------------------------
-- DESENVOLVIDO POR bfm#7197
-- discord.gg/vD3tqUWKXv
--------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

bfm = {}
Tunnel.bindInterface(GetCurrentResourceName(),bfm)

local notifypermissao = Config.notifypermissao
local detectaveis = Config.detectaveis
local notifypermissao = Config.notifypermissao
local msgperm = Config.msgperm
local somzinho = Config.somzinho

RegisterServerEvent('bfm:somzinholegal')


bfm.checkperm = function()
    source = source
    user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id, notifypermissao) then
        return true
    end
    return false
end

bfm.checkinv = function()
    for _,w in pairs(detectaveis) do
        if vRP.getInventoryItemAmount(user_id,w) >= 1 then
            return true
        end
    end
    return false
end

bfm.checkinv2 = function()
    local wps = vRPclient.getWeapons(source)
    for k,v in pairs(wps) do
        local wpuse = string.gsub(k,"wbody|","")
        if wps[wpuse] then
            return true
        end
    end
    return false
end

bfm.notify = function()
    for k,v in pairs(vRP.getUsersByPermission(notifypermissao)) do
        TriggerClientEvent('Notify', v, 'aviso', msgperm,2000)
    end
end

somzinholegalfunc = function()
    if somzinho then
        vRPclient.playSound(source,"Oneshot_Final","MP_MISSION_COUNTDOWN_SOUNDSET")
    end
end
AddEventHandler('bfm:somzinholegal', somzinholegalfunc)
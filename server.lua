--------------------------------
-- bfm#7197
-- discord.gg/vD3tqUWKXv
--------------------------------
vRP = Proxy.getInterface('vRP')
vRPc = Tunnel.getInterface('vRP')

bfm = {}
Tunnel.bindInterface(GetCurrentResourceName(),bfm)

bfm.checkPerm = function()
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id, notifyPermissao) then
        return true
    end
    return false
end

bfm.checkInvCfg = function()
    local user_id = vRP.getUserId(source)
    for _,w in pairs(detectaveis) do
        if vRP.getInventoryItemAmount(user_id,w) >= 1 then
            return true
        end
    end
    return false
end

bfm.checkInvFrame = function()
    local wps = vRPc.getWeapons(source)
    for k,v in pairs(wps) do
        local wpuse = string.gsub(k,'wbody|','')
        if wps[wpuse] then
            return true
        end
    end
    return false
end

bfm.notifyCops = function()
    for k,v in next,vRP.getUsersByPermission(notifyPermissao) do
        TriggerClientEvent('Notify', v, 'aviso', msgPerm)
    end
end

warningSound = function()
    if warningSnd then
        vRPc.playSound(source,'Oneshot_Final','MP_MISSION_COUNTDOWN_SOUNDSET')
    end
end
RegisterServerEvent('bfm:warningSound')
AddEventHandler('bfm:warningSound', warningSound)
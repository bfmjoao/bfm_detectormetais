--------------------------------
-- bfm#7197
-- discord.gg/vD3tqUWKXv
--------------------------------
vRP = Proxy.getInterface('vRP')

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
    for _,w in next,detectaveis do
        if vRP.getInventoryItemAmount(user_id,w) >= 1 then
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

--------------------------------
-- bfm#7197
-- discord.gg/vD3tqUWKXv
--------------------------------
bfm = Tunnel.getInterface(GetCurrentResourceName())

local notifysDetec = true

detector = function()
    local ped = PlayerPedId()

    repeat
        local ocelot = 1000
        
        for k,v in next,detectores do
            local pedPos = GetEntityCoords(ped)
            local vMelee,vGranadas,vResto = IsPedArmed(ped,1),IsPedArmed(ped,2),IsPedArmed(ped,4)
            local isThere = IsEntityAtCoord(ped, v[1], v[2], v[3], 0.15, 2.5, 0.77, 0, 1, 0)
            local distance = #(pedPos - vec3(v[1], v[2], v[3]))

            if distance < 7 then
                ocelot = 1
                if isThere and not bfm.checkPerm() then
                    if bfm.checkInvCfg() or bfm.checkInvFrame() or vMelee or vGranadas or vResto then
                        Wait(300)
                        TriggerServerEvent('bfm:warningSound')
                        if notifysDetec then
                            bfm.notifyCops()
                        end
                        if detectadoNotify then
                            TriggerEvent('Notify', 'aviso', msgDetectado)
                        end
                    end
                end
            end
        end

        Wait(ocelot)
    until false
end
CreateThread(detector)

atvdstv = function()
    if bfm.checkPerm() then
        notifysDetec = not notifysDetec
        if not notifysDetec then
            TriggerEvent('Notify', 'aviso', 'Notificações do detector desabilitadas!',4000)
        else
            TriggerEvent('Notify', 'aviso', 'Notificações do detector habilitadas!',4000)
        end
    else
        TriggerEvent('Notify', 'aviso', 'Você não tem permissão para isso!',3000)
    end
end
RegisterCommand('notifydetec', atvdstv)

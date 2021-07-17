--------------------------------
-- DESENVOLVIDO POR bfm#7197
-- discord.gg/TwuEPcKXvr
--------------------------------
local Proxy = module("vrp","lib/Proxy")
local Tunnel = module("vrp","lib/Tunnel")
vRP = Proxy.getInterface("vRP")

bfm = Tunnel.getInterface(GetCurrentResourceName())


local notifysdetec = true
local detectores = Config.detectores
local detectadonotify = Config.detectadonotify
local msgdetectado = Config.msgdetectado

detector = function()
    repeat
        local ocelot = 1000
        
        for k,v in pairs (detectores) do
            local ped = PlayerPedId()
            local pedpos = GetEntityCoords(ped)
            local vmelee = IsPedArmed(ped, 1)
            local vgranadas = IsPedArmed(ped, 2)
            local vresto = IsPedArmed(ped, 4)
            local isthere = IsEntityAtCoord(ped, v[1], v[2], v[3], 0.15, 2.5, 0.77, 0, 1, 0)
            local distance = #(vector3(pedpos) - vector3(v[1], v[2], v[3]))

            if distance < 8 then
                ocelot = 1
                if isthere == 1 and not bfm.checkperm() then
                    if bfm.checkinv() or bfm.checkinv2() or vmelee or  vgranadas or vresto then
                        Wait(300)
                        TriggerServerEvent('bfm:somzinholegal')
                        if notifysdetec then
                            bfm.notify()
                        end
                        if detectadonotify then
                            TriggerEvent('Notify', 'aviso', msgdetectado, 2000)
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
    if bfm.checkperm() then
        if notifysdetec then
            TriggerEvent('Notify', 'aviso', 'Notificações do detector desabilitadas!',4000)
            notifysdetec = false
        else
            TriggerEvent('Notify', 'aviso', 'Notificações do detector habilitadas!',4000)
            notifysdetec = true
        end
    else
        TriggerEvent('Notify', 'aviso', 'Você não tem permissão para isso!',3000)
    end
end
RegisterCommand('notifydetec', atvdstv)

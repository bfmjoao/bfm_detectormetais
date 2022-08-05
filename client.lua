--------------------------------
-- bfm#7197
-- discord.gg/vD3tqUWKXv
--------------------------------
bfm = Tunnel.getInterface(GetCurrentResourceName())

local notifysDetec = true

detectorThread = function()
    repeat
        local ocelot = 1000
        
        for k,v in next,detectores do
		    local ped = PlayerPedId()
          	local pedPos = GetEntityCoords(ped)
            local vMelee,vGranadas,vResto = IsPedArmed(ped,1),IsPedArmed(ped,2),IsPedArmed(ped,4)
            local isThere = IsEntityAtCoord(ped, v[1], v[2], v[3], 0.15, 2.5, 0.77, 0, 1, 0)
            local distance = #(pedPos - vec3(v[1], v[2], v[3]))

            if distance < 7 then
                ocelot = 1
                if isThere == 1 and not bfm.checkPerm() then
                    if bfm.checkInvCfg() or checkInvCl() or vMelee or vGranadas or vResto then
                        Wait(300)
                        if warningSnd then
                            PlaySoundFrontend(-1,'Oneshot_Final','MP_MISSION_COUNTDOWN_SOUNDSET',false)
                        end
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
CreateThread(detectorThread)



atvdstv = function()
    if bfm.checkPerm() then
        notifysDetec = not notifysDetec
        if not notifysDetec then
            TriggerEvent('Notify', 'aviso', 'Notificações do detector desabilitadas!')
        else
            TriggerEvent('Notify', 'aviso', 'Notificações do detector habilitadas!')
        end
    else
        TriggerEvent('Notify', 'aviso', 'Você não tem permissão para isso!')
    end
end
RegisterCommand('notifydetec', atvdstv)

getWeapons = function()
	local player = PlayerPedId()
	local ammo_types = {}
	local weapons = {}
	for k,v in next,weapon_types do
		local hash = GetHashKey(v)
		if HasPedGotWeapon(player,hash) then
			local weapon = {}
			weapons[v] = weapon
			local atype = GetPedAmmoTypeFromWeapon(player,hash)
			if ammo_types[atype] == nil then
				ammo_types[atype] = true
				weapon.ammo = GetAmmoInPedWeapon(player,hash)
			else
				weapon.ammo = 0
			end
		end
	end
	return weapons
end

checkInvCl = function()
    local wps = getWeapons()
    for k,v in next,wps do
        local wpuse = k:gsub('wbody|','')
        if wps[wpuse] then
            return true
        end
    end
    return false
end

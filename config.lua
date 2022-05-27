--------------------------------
-- bfm#7197
-- discord.gg/vD3tqUWKXv
--------------------------------


-- Itens que serão verificados no detector
    -- Para adicionar mais itens é só seguir o mesmo padrão da tabela;
    detectaveis = {
        'wbody|WEAPON_DAGGER',
        'wbody|WEAPON_BAT',
        'wbody|WEAPON_BOTTLE',
        'wbody|WEAPON_CROWBAR',
        'wbody|WEAPON_KNUCKLE',
        'wbody|WEAPON_KNIFE',
        'wbody|WEAPON_MACHETE',
        'wbody|WEAPON_SWITCHBLADE',
        'wbody|WEAPON_WRENCH',
        'wbody|WEAPON_BATTLEAXE',
        'wbody|WEAPON_PISTOL',
        'wbody|WEAPON_PISTOL_MK2',
        'wbody|WEAPON_COMBATPISTOL',
        'wbody|WEAPON_STUNGUN',
        'wbody|WEAPON_SNSPISTOL',
        'wbody|WEAPON_VINTAGEPISTOL',
        'wbody|WEAPON_REVOLVER',
        'wbody|WEAPON_REVOLVER_MK2',
        'wbody|WEAPON_MICROSMG',
        'wbody|WEAPON_SMG',
        'wbody|WEAPON_ASSAULTSMG',
        'wbody|WEAPON_COMBATPDW',
        'wbody|WEAPON_PUMPSHOTGUN_MK2',
        'wbody|WEAPON_CARBINERIFLE',
        'wbody|WEAPON_ASSAULTRIFLE',
        'wbody|WEAPON_PETROLCAN',
        'wbody|WEAPON_GUSENBERG',
        'wbody|WEAPON_MACHINEPISTOL',
        'wbody|WEAPON_COMPACTRIFLE',
        'wbody|WEAPON_CARBINERIFLE_MK2',
    }

-- Locais onde o detector estará ativo
    -- Para adicionar mais locais é só seguir o mesmo padrão dos deixados na tabela;
    detectores = {
        [1] = { 434.99, -981.86, 30.69 },
        [2] = { 299.26, -584.71, 43.27},
        [3] = { -1061.18, -827.29, 19.21 },
    }

-- Permissão que receberá notificações do detector e também não será verificada ao passar por um
    -- Exemplo: Policiais;
    notifyPermissao = 'policia.permissao'

-- Mensagem da notify que será enviada aos jogadores online com a permissão configurada acima
    -- Use o comando /notifydetec para desativar/reativar as notificações em jogo;
    msgPerm = 'Um cidadão acaba de passar armado no detector!'

-- Ativar/desativar notify que será enviada ao jogador se o detector achar algo com ele
    -- Use true para ativar e false para desativar;
    detectadoNotify = true

-- Mensagem da notify que será enviada ao jogador se o detector achar algo com ele
    -- Somente se a config. acima estiver habilitada;
    msgDetectado = 'DETECTOR DE METAIS: Armamento detectado!'

-- Ativar/desativar som que o detector fará para o jogador quando algo for detectado
    -- Use true para ativar e false para desativar;
    warningSnd = true
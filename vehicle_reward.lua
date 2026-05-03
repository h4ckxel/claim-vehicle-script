--[[
 ██╗  ██╗██╗  ██╗ ██████╗██╗  ██╗██╗  ██╗███████╗██╗
 ██║  ██║██║  ██║██╔════╝██║ ██╔╝╚██╗██╔╝██╔════╝██║
 ███████║███████║██║     █████╔╝  ╚███╔╝ █████╗  ██║
 ██╔══██║╚════██║██║     ██╔═██╗  ██╔██╗ ██╔══╝  ██║
 ██║  ██║     ██║╚██████╗██║  ██╗██╔╝ ██╗███████╗███████╗
 ╚═╝  ╚═╝     ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝

  >> made by h4ckxel
  >> https://github.com/h4ckxel
--]]

-- [ES] Pestaña de vehículos del GUI
-- [EN] Vehicle tab reference
-- [ZH] 载具 GUI 标签
-- [RU] Вкладка транспорта в GUI
local vehicle_tab = gui.get_tab("GUI_TAB_VEHICLE")

-- [ES] Offset del menú de garage en am_mp_vehicle_reward
-- [EN] Garage menu local offset
-- [ZH] 车库菜单 local 偏移量
-- [RU] Смещение меню гаража в локальных переменных
local GARAGE_MENU_DATA    = 176 -- 3A ? 42 ? 71 3A ? 42 ? 71 3A ? 42 ? 71 3A ? 42 ? 71 3A ? 42 ? 71 71 +1

-- [ES] Offset del bloque de datos de recompensa
-- [EN] Reward data block offset
-- [ZH] 奖励数据块偏移量
-- [RU] Смещение блока данных награды
local VEHICLE_REWARD_DATA = 129 -- 3A ? 40 ? 5D ? ? ? 2A +1

-- [ES] Activa/desactiva el loop de guardado
-- [EN] Toggles the save loop on/off
-- [ZH] 控制保存循环的开关
-- [RU] Флаг запуска цикла сохранения
local should_run_script = false

-- [ES] Consulta freemode: ¿el vehículo puede ser PV?
-- [EN] Ask freemode if vehicle is valid as PV
-- [ZH] 询问 freemode 该载具是否可作为私人载具
-- [RU] Проверяет в freemode: можно ли сохранить как личный транспорт
local function IS_VEHICLE_VALID_FOR_PV(vehicle_hash)
    return scr_function.call_script_function("freemode", 0x913BB, "bool", {
        { "int", vehicle_hash }
    })
end

-- [ES] Llama a GVR para registrar el vehículo como recompensa/PV
-- [EN] Calls GVR to register vehicle as reward/PV
-- [ZH] 调用 GVR 将载具注册为奖励/私人载具
-- [RU] Вызывает GVR для сохранения транспорта как награды/личного
local function GIVE_VEHICLE_REWARD(vehicle_id, data, transaction, garage, slot, state)
    return scr_function.call_script_function("am_mp_vehicle_reward", "GVR", "2D 0C 1E 00 00", "bool", {
        { "int", vehicle_id },
        { "ptr", data },
        { "ptr", transaction },
        { "ptr", garage },
        { "ptr", slot },
        { "ptr", state },
        { "bool", false }, -- ???
        { "bool", true },  -- Set as Last PV
        { "bool", true },  -- Display Cancel Error Message
        { "bool", false }, -- Is Podium Vehicle
        { "int", 0 },      -- ???
        { "int", -1 }      -- ???
    })
end

-- [ES] Núcleo: ejecuta el guardado tick a tick
-- [EN] Core: runs the save logic each tick
-- [ZH] 核心：每帧执行保存逻辑
-- [RU] Ядро: исполняет логику сохранения каждый тик
local function RUN_SCRIPT()

    -- [ES] Vehículo inexistente → cancelar
    -- [EN] Vehicle gone → abort
    -- [ZH] 载具不存在 → 取消
    -- [RU] Транспорт исчез → стоп
    if not ENTITY.DOES_ENTITY_EXIST(self.get_veh()) then
        should_run_script = false
        return
    end

    -- [ES] Punteros a los locals necesarios (+4 al +7)
    -- [EN] Pointers to required locals (+4 to +7)
    -- [ZH] 指向所需 local 变量的指针（+4 到 +7）
    -- [RU] Указатели на нужные локальные переменные (+4..+7)
    local menu_data          = locals.get_pointer("am_mp_vehicle_reward", GARAGE_MENU_DATA)
    local transaction_result = locals.get_pointer("am_mp_vehicle_reward", VEHICLE_REWARD_DATA + 4)
    local garage_id          = locals.get_pointer("am_mp_vehicle_reward", VEHICLE_REWARD_DATA + 5)
    local garage_slot        = locals.get_pointer("am_mp_vehicle_reward", VEHICLE_REWARD_DATA + 6)
    local reward_state       = locals.get_pointer("am_mp_vehicle_reward", VEHICLE_REWARD_DATA + 7)

    -- [ES] GVR ok + estado != 3 → limpiar locals y parar
    -- [EN] GVR ok + state != 3 → reset locals and stop
    -- [ZH] GVR 成功且状态 != 3 → 清空 local 并停止
    -- [RU] GVR ok + состояние != 3 → сбросить переменные и стоп
    if GIVE_VEHICLE_REWARD(self.get_veh(), menu_data, transaction_result, garage_id, garage_slot, reward_state) then
        if locals.get_int("am_mp_vehicle_reward", VEHICLE_REWARD_DATA + 7) ~= 3 then
            locals.set_int("am_mp_vehicle_reward", VEHICLE_REWARD_DATA + 4, 0)
            locals.set_int("am_mp_vehicle_reward", VEHICLE_REWARD_DATA + 5, 0)
            locals.set_int("am_mp_vehicle_reward", VEHICLE_REWARD_DATA + 6, 0)
            locals.set_int("am_mp_vehicle_reward", VEHICLE_REWARD_DATA + 7, 0)
            should_run_script = false
        end
    end
end

-- [ES] Loop: corre cada frame, delega a RUN_SCRIPT si la bandera está activa
-- [EN] Loop: runs every frame, delegates to RUN_SCRIPT when flag is set
-- [ZH] 循环：每帧运行，标志为真时调用 RUN_SCRIPT
-- [RU] Цикл: каждый кадр, делегирует в RUN_SCRIPT если флаг активен
script.register_looped("Vehicle Reward", function()

    -- [ES] Script base inactivo → bajar bandera
    -- [EN] Base script inactive → drop flag
    -- [ZH] 基础脚本未激活 → 关闭标志
    -- [RU] Базовый скрипт неактивен → сбросить флаг
    if not script.is_active("am_mp_vehicle_reward") then
        should_run_script = false
        return
    end

    if should_run_script then
        RUN_SCRIPT()
    end
end)

-- [ES] Botón: valida contexto y activa el loop de guardado
-- [EN] Button: validates context and fires the save loop
-- [ZH] 按钮：验证环境并启动保存循环
-- [RU] Кнопка: проверяет условия и запускает цикл сохранения
vehicle_tab:add_button("Claim Current Vehicle as PV", function()
    script.run_in_fiber(function()

        -- [ES] Online + freemode + reward activos
        -- [EN] Online + freemode + reward all active
        -- [ZH] 在线 + freemode + reward 均已激活
        -- [RU] Онлайн + freemode + reward — все активны
        if network.is_session_started() and script.is_active("freemode") and script.is_active("am_mp_vehicle_reward") then

            -- [ES] Jugador dentro de un vehículo
            -- [EN] Player must be in a vehicle
            -- [ZH] 玩家必须在载具内
            -- [RU] Игрок должен быть в транспорте
            if PED.IS_PED_IN_ANY_VEHICLE(self.get_ped(), false) then

                -- [ES] Modelo válido → activar; inválido → error
                -- [EN] Valid model → go; invalid → show error
                -- [ZH] 模型合法 → 启动；不合法 → 报错
                -- [RU] Модель допустима → старт; нет → ошибка
                if IS_VEHICLE_VALID_FOR_PV(ENTITY.GET_ENTITY_MODEL(self.get_veh())) then
                    should_run_script = true
                else
                    gui.show_error("Vehicle Reward", "This vehicle cannot be saved as a personal vehicle.")
                end
            else
                gui.show_error("Vehicle Reward", "Please get in a vehicle.")
            end
        else
            gui.show_error("Vehicle Reward", "Cannot give vehicle at the moment. Are you online?")
        end
    end)

end)
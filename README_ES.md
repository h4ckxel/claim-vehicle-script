
<p align="center">
  <img src="https://readme-typing-svg.demolab.com?font=Fira+Code&size=26&pause=1000&color=00FF41&center=true&vCenter=true&width=700&lines=VEHICLE+REWARD+SCRIPT;Reclama+cualquier+veh%C3%ADculo+como+PV;YimMenu+%2F+NewWay+Menu;by+h4ckxel" alt="Typing SVG"/>
</p>

<p align="center">
  <img src="https://media.giphy.com/media/RDZo7znAdn2u7sAcWH/giphy.gif" width="560" alt="hacker gif"/>
</p>

<p align="center">
  <a href="https://github.com/h4ckxel"><img src="https://img.shields.io/badge/autor-h4ckxel-00FF41?style=for-the-badge&logo=github&logoColor=black&labelColor=0d0d0d"/></a>
  <img src="https://img.shields.io/badge/idioma-Lua-00FF41?style=for-the-badge&logo=lua&logoColor=black&labelColor=0d0d0d"/>
  <img src="https://img.shields.io/badge/menu-YimMenu%20%2F%20NewWay-00FF41?style=for-the-badge&labelColor=0d0d0d"/>
</p>

---

## `> ¿QUÉ ES ESTO?`

Script Lua para **YimMenu** y **NewWay Menu** que te permite guardar **cualquier vehículo** en el que estés montado como tu **Vehículo Personal (PV)** — sin pasar por la tienda ni pagar nada en el juego.

> Funciona llamando directamente a las funciones internas del script `am_mp_vehicle_reward` de GTA Online, replicando el flujo que usa el juego al dar un vehículo como recompensa.

<p align="center">
  <img src="https://media.giphy.com/media/077i6AULCXc0FKTj9s/giphy.gif" width="460" alt="matrix"/>
</p>

---

## `> COMPATIBILIDAD`

```
[✓] YimMenu   — con scripting Lua habilitado
[✓] NewWay Menu — con scripting Lua habilitado
[✗] Otros menús no garantizados (depende del API de scr_function / locals)
```

---

## `> REQUISITOS`

```
[✓] Sesión de GTA Online activa
[✓] Script "freemode" corriendo
[✓] Script "am_mp_vehicle_reward" corriendo
[✓] Estar dentro de un vehículo
[✗] Vehículos en lista negra NO funcionan
     → el juego los elimina igual al desactivar los parches
```

---

## `> INSTALACIÓN`

```bash
# 1. Copia el archivo .lua en la carpeta de scripts de tu menú:
#    YimMenu  → %APPDATA%\YimMenu\scripts\
#    NewWay   → carpeta scripts\ de tu instalación

# 2. Entra a GTA Online

# 3. Súbete a cualquier vehículo

# 4. En el menú, ve a:
#    Vehículos → "Claim Current Vehicle as PV"

# 5. Selecciona garage y slot cuando el juego lo pida

# 6. ¡Listo! El vehículo queda guardado como PV
```

---

## `> CÓMO FUNCIONA`

```
┌──────────────────────────────────────────────────────────────┐
│  [BOTÓN PRESIONADO]                                          │
│         │                                                    │
│         ▼                                                    │
│  ¿Sesión online + freemode + reward activos?                 │
│         │ NO ──────────────────────────► Error: "¿Estás en  │
│         │                                línea?"            │
│        YES                                                   │
│         │                                                    │
│         ▼                                                    │
│  ¿Jugador en un vehículo?                                    │
│         │ NO ──────────────────────────► Error: "Súbete a   │
│         │                                un vehículo"       │
│        YES                                                   │
│         │                                                    │
│         ▼                                                    │
│  IS_VEHICLE_VALID_FOR_PV()                                   │
│         │ NO ──────────────────────────► Error: "Este       │
│         │                                vehículo no puede  │
│         │                                guardarse como PV" │
│        YES                                                   │
│         │                                                    │
│         ▼                                                    │
│  should_run_script = true                                    │
│         │                                                    │
│         ▼                                                    │
│  [LOOP por frame]                                            │
│  GIVE_VEHICLE_REWARD() ──► estado == 3 → sigue esperando    │
│                        └─► estado != 3 → resetea locals     │
│                                          → GUARDADO ✓        │
└──────────────────────────────────────────────────────────────┘
```

---

## `> DETALLES TÉCNICOS`

| Variable | Valor | Descripción |
|---|---|---|
| `GARAGE_MENU_DATA` | `176` | Offset del menú de garage en los locals |
| `VEHICLE_REWARD_DATA` | `129` | Base del bloque de datos de recompensa |
| `+4` | transaction | Resultado de la transacción |
| `+5` | garage_id | ID del garage destino |
| `+6` | garage_slot | Slot dentro del garage |
| `+7` | reward_state | Estado del proceso (`3` = pendiente) |

---

## `> LIMITACIONES`

```
[-] Vehículos en blacklist son ignorados por el juego
[-] El script "am_mp_vehicle_reward" debe estar activo
[-] Solo funciona en sesión online (no en modo historia)
[-] Requiere que el jugador esté dentro del vehículo
```

---

## `> AUTOR`

```
  ██╗  ██╗ ██╗  ██╗ ██████╗██╗  ██╗██╗  ██╗███████╗██╗
  ██║  ██║ ██║  ██║██╔════╝██║ ██╔╝╚██╗██╔╝██╔════╝██║
  ███████║ ███████║██║     █████╔╝  ╚███╔╝ █████╗  ██║
  ██╔══██║ ╚════██║██║     ██╔═██╗  ██╔██╗ ██╔══╝  ██║
  ██║  ██║      ██║╚██████╗██║  ██╗██╔╝ ██╗███████╗███████╗
  ╚═╝  ╚═╝      ╚═╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝

  github  →  https://github.com/h4ckxel
```

<p align="center">
  <img src="https://media.giphy.com/media/f3iwJFOVOwuy7K6FFw/giphy.gif" width="380"/>
</p>

---

<p align="center"><sub>⚡ Úsalo con responsabilidad. Solo con fines educativos. ⚡</sub></p>

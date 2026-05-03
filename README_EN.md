
<p align="center">
  <img src="https://readme-typing-svg.demolab.com?font=Fira+Code&size=26&pause=1000&color=00FF41&center=true&vCenter=true&width=700&lines=VEHICLE+REWARD+SCRIPT;Claim+any+vehicle+as+your+PV;YimMenu+%2F+NewWay+Menu;by+h4ckxel" alt="Typing SVG"/>
</p>

<p align="center">
  <img src="https://media.giphy.com/media/RDZo7znAdn2u7sAcWH/giphy.gif" width="560" alt="hacker gif"/>
</p>

<p align="center">
  <a href="https://github.com/h4ckxel"><img src="https://img.shields.io/badge/author-h4ckxel-00FF41?style=for-the-badge&logo=github&logoColor=black&labelColor=0d0d0d"/></a>
  <img src="https://img.shields.io/badge/language-Lua-00FF41?style=for-the-badge&logo=lua&logoColor=black&labelColor=0d0d0d"/>
  <img src="https://img.shields.io/badge/menu-YimMenu%20%2F%20NewWay-00FF41?style=for-the-badge&labelColor=0d0d0d"/>
</p>

---

## `> WHAT IS THIS?`

A Lua script for **YimMenu** and **NewWay Menu** that lets you save **any vehicle** you're currently driving as your **Personal Vehicle (PV)** — no in-game purchase required.

> It works by directly invoking the internal functions of GTA Online's `am_mp_vehicle_reward` script, replicating the flow the game uses when rewarding a vehicle to the player.

<p align="center">
  <img src="https://media.giphy.com/media/077i6AULCXc0FKTj9s/giphy.gif" width="460" alt="matrix"/>
</p>

---

## `> COMPATIBILITY`

```
[✓] YimMenu   — Lua scripting must be enabled
[✓] NewWay Menu — Lua scripting must be enabled
[✗] Other menus not guaranteed (depends on scr_function / locals API)
```

---

## `> REQUIREMENTS`

```
[✓] Active GTA Online session
[✓] "freemode" script running
[✓] "am_mp_vehicle_reward" script running
[✓] Player must be inside a vehicle
[✗] Blacklisted vehicles will NOT work
     → the game deletes them anyway once patches are disabled
```

---

## `> INSTALLATION`

```bash
# 1. Copy the .lua file into your menu's scripts folder:
#    YimMenu  → %APPDATA%\YimMenu\scripts\
#    NewWay   → scripts\ folder of your installation

# 2. Launch GTA Online

# 3. Get inside any vehicle

# 4. In the menu, navigate to:
#    Vehicle Tab → "Claim Current Vehicle as PV"

# 5. Select garage and slot when the game prompts you

# 6. Done. Vehicle saved as your PV.
```

---

## `> HOW IT WORKS`

```
┌──────────────────────────────────────────────────────────────┐
│  [BUTTON PRESSED]                                            │
│         │                                                    │
│         ▼                                                    │
│  Online session + freemode + reward scripts active?          │
│         │ NO ──────────────────────────► Error: "Are you    │
│         │                                online?"           │
│        YES                                                   │
│         │                                                    │
│         ▼                                                    │
│  Player inside a vehicle?                                    │
│         │ NO ──────────────────────────► Error: "Get in a   │
│         │                                vehicle"           │
│        YES                                                   │
│         │                                                    │
│         ▼                                                    │
│  IS_VEHICLE_VALID_FOR_PV()                                   │
│         │ NO ──────────────────────────► Error: "Cannot be  │
│         │                                saved as PV"       │
│        YES                                                   │
│         │                                                    │
│         ▼                                                    │
│  should_run_script = true                                    │
│         │                                                    │
│         ▼                                                    │
│  [LOOP per frame]                                            │
│  GIVE_VEHICLE_REWARD() ──► state == 3 → keep waiting        │
│                        └─► state != 3 → reset locals        │
│                                          → SAVED ✓           │
└──────────────────────────────────────────────────────────────┘
```

---

## `> TECHNICAL DETAILS`

| Variable | Value | Description |
|---|---|---|
| `GARAGE_MENU_DATA` | `176` | Garage menu local offset |
| `VEHICLE_REWARD_DATA` | `129` | Reward data block base offset |
| `+4` | transaction | Transaction result |
| `+5` | garage_id | Target garage ID |
| `+6` | garage_slot | Slot inside the garage |
| `+7` | reward_state | Process state (`3` = pending) |

---

## `> LIMITATIONS`

```
[-] Blacklisted vehicles are rejected by the game engine
[-] The "am_mp_vehicle_reward" script must be active
[-] Online sessions only (does not work in story mode)
[-] Player must be seated inside the vehicle
```

---

## `> AUTHOR`

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

<p align="center"><sub>⚡ Use responsibly. For educational purposes only. ⚡</sub></p>


<p align="center">
  <img src="https://readme-typing-svg.demolab.com?font=Fira+Code&size=28&pause=1000&color=00FF41&center=true&vCenter=true&width=700&lines=VEHICLE+REWARD+SCRIPT;by+h4ckxel;YimMenu+%2F+NewWay+Compatible;Claim+Any+Vehicle+as+PV" alt="Typing SVG" />
</p>

<p align="center">
  <img src="https://media.giphy.com/media/RDZo7znAdn2u7sAcWH/giphy.gif" width="600" alt="hacker gif"/>
</p>

<p align="center">
  <a href="https://github.com/h4ckxel"><img src="https://img.shields.io/badge/author-h4ckxel-00FF41?style=for-the-badge&logo=github&logoColor=black&labelColor=0d0d0d"/></a>
  <img src="https://img.shields.io/badge/menu-YimMenu%20%2F%20NewWay-00FF41?style=for-the-badge&logoColor=black&labelColor=0d0d0d"/>
  <img src="https://img.shields.io/badge/language-Lua-00FF41?style=for-the-badge&logo=lua&logoColor=black&labelColor=0d0d0d"/>
  <img src="https://img.shields.io/badge/status-stable-00FF41?style=for-the-badge&labelColor=0d0d0d"/>
</p>

---

```
██╗   ██╗███████╗██╗  ██╗██╗ ██████╗██╗     ███████╗    ██████╗ ███████╗██╗    ██╗ █████╗ ██████╗ ██████╗
██║   ██║██╔════╝██║  ██║██║██╔════╝██║     ██╔════╝    ██╔══██╗██╔════╝██║    ██║██╔══██╗██╔══██╗██╔══██╗
██║   ██║█████╗  ███████║██║██║     ██║     █████╗      ██████╔╝█████╗  ██║ █╗ ██║███████║██████╔╝██║  ██║
╚██╗ ██╔╝██╔══╝  ██╔══██║██║██║     ██║     ██╔══╝      ██╔══██╗██╔══╝  ██║███╗██║██╔══██║██╔══██╗██║  ██║
 ╚████╔╝ ███████╗██║  ██║██║╚██████╗███████╗███████╗    ██║  ██║███████╗╚███╔███╔╝██║  ██║██║  ██║██████╔╝
  ╚═══╝  ╚══════╝╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝╚══════╝    ╚═╝  ╚═╝╚══════╝ ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝
```

---

## `> SELECT LANGUAGE / SELECCIONA IDIOMA`

| 🌐 | README |
|---|--------|
| 🇲🇽 Español | [`README_ES.md`](./README_ES.md) |
| 🇺🇸 English | [`README_EN.md`](./README_EN.md) |
| 🇨🇳 中文 | [`README_ZH.md`](./README_ZH.md) |
| 🇷🇺 Русский | [`README_RU.md`](./README_RU.md) |

---

## `> WHAT IS THIS?`

> A Lua script for **YimMenu** / **NewWay Menu** that lets you claim **any vehicle** you're currently driving as your **Personal Vehicle (PV)** — bypassing the normal in-game purchase flow.

<p align="center">
  <img src="https://media.giphy.com/media/077i6AULCXc0FKTj9s/giphy.gif" width="480" alt="matrix code"/>
</p>

---

## `> QUICK START`

```bash
# 1. Drop the script into your YimMenu/NewWay scripts folder
# 2. Launch GTA Online
# 3. Get inside any vehicle
# 4. Navigate to: Vehicle Tab → "Claim Current Vehicle as PV"
# 5. Select garage + slot when prompted
# 6. Done. Vehicle is yours.
```

---

## `> REQUIREMENTS`

```
[✓] YimMenu  OR  NewWay Menu (Lua scripting enabled)
[✓] GTA Online session active
[✓] freemode script running
[✓] am_mp_vehicle_reward script running
[✓] Player inside a vehicle
[✗] Blacklisted vehicles will NOT work (game deletes them anyway)
```

---

## `> HOW IT WORKS`

```
┌─────────────────────────────────────────────────────────┐
│  PLAYER IN VEHICLE                                      │
│         │                                               │
│         ▼                                               │
│  IS_VEHICLE_VALID_FOR_PV()  ──[NO]──► show error        │
│         │                                               │
│        [YES]                                            │
│         │                                               │
│         ▼                                               │
│  should_run_script = true                               │
│         │                                               │
│         ▼                                               │
│  [LOOP] GIVE_VEHICLE_REWARD()                           │
│         │                                               │
│         ├──[state == 3]──► keep waiting                 │
│         │                                               │
│         └──[state != 3]──► reset locals → DONE ✓        │
└─────────────────────────────────────────────────────────┘
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
  <img src="https://media.giphy.com/media/f3iwJFOVOwuy7K6FFw/giphy.gif" width="400" alt="hacker terminal"/>
</p>

---

<p align="center"><sub>⚡ Use responsibly. For educational purposes only. ⚡</sub></p>


<p align="center">
  <img src="https://readme-typing-svg.demolab.com?font=Fira+Code&size=26&pause=1000&color=00FF41&center=true&vCenter=true&width=700&lines=VEHICLE+REWARD+SCRIPT;将任意载具保存为私人载具;YimMenu+%2F+NewWay+Menu;by+h4ckxel" alt="Typing SVG"/>
</p>

<p align="center">
  <img src="https://media.giphy.com/media/RDZo7znAdn2u7sAcWH/giphy.gif" width="560" alt="hacker gif"/>
</p>

<p align="center">
  <a href="https://github.com/h4ckxel"><img src="https://img.shields.io/badge/作者-h4ckxel-00FF41?style=for-the-badge&logo=github&logoColor=black&labelColor=0d0d0d"/></a>
  <img src="https://img.shields.io/badge/语言-Lua-00FF41?style=for-the-badge&logo=lua&logoColor=black&labelColor=0d0d0d"/>
  <img src="https://img.shields.io/badge/菜单-YimMenu%20%2F%20NewWay-00FF41?style=for-the-badge&labelColor=0d0d0d"/>
</p>

---

## `> 这是什么？`

这是一个用于 **YimMenu** 和 **NewWay Menu** 的 Lua 脚本，允许你将**当前驾驶的任何载具**保存为你的**私人载具 (PV)** — 无需在游戏内购买。

> 原理：直接调用 GTA Online 内部脚本 `am_mp_vehicle_reward` 的底层函数，模拟游戏发放载具奖励时的完整流程。

<p align="center">
  <img src="https://media.giphy.com/media/077i6AULCXc0FKTj9s/giphy.gif" width="460" alt="matrix"/>
</p>

---

## `> 兼容性`

```
[✓] YimMenu   — 需要启用 Lua 脚本功能
[✓] NewWay Menu — 需要启用 Lua 脚本功能
[✗] 其他菜单不保证兼容（取决于 scr_function / locals API 的实现）
```

---

## `> 运行要求`

```
[✓] 已进入 GTA Online 在线会话
[✓] "freemode" 脚本正在运行
[✓] "am_mp_vehicle_reward" 脚本正在运行
[✓] 玩家必须坐在载具内
[✗] 黑名单载具无效
     → 即使保存，游戏也会在禁用补丁后立即删除
```

---

## `> 安装方法`

```bash
# 1. 将 .lua 文件复制到你的菜单脚本文件夹：
#    YimMenu  → %APPDATA%\YimMenu\scripts\
#    NewWay   → 你的安装目录下的 scripts\ 文件夹

# 2. 启动 GTA Online

# 3. 进入任意载具

# 4. 在菜单中导航至：
#    载具标签 → "Claim Current Vehicle as PV"

# 5. 根据游戏提示选择车库和车位

# 6. 完成！载具已保存为私人载具
```

---

## `> 工作原理`

```
┌──────────────────────────────────────────────────────────────┐
│  [按下按钮]                                                   │
│         │                                                    │
│         ▼                                                    │
│  在线会话 + freemode + reward 脚本均已激活？                  │
│         │ 否 ──────────────────────────► 错误："你在线吗？"  │
│        是                                                    │
│         │                                                    │
│         ▼                                                    │
│  玩家在载具内？                                               │
│         │ 否 ──────────────────────────► 错误："请进入载具"  │
│        是                                                    │
│         │                                                    │
│         ▼                                                    │
│  IS_VEHICLE_VALID_FOR_PV()                                   │
│         │ 否 ──────────────────────────► 错误："此载具无法   │
│         │                                保存为私人载具"     │
│        是                                                    │
│         │                                                    │
│         ▼                                                    │
│  should_run_script = true                                    │
│         │                                                    │
│         ▼                                                    │
│  [每帧循环]                                                   │
│  GIVE_VEHICLE_REWARD() ──► 状态 == 3 → 继续等待             │
│                        └─► 状态 != 3 → 重置 local 变量       │
│                                          → 保存完成 ✓         │
└──────────────────────────────────────────────────────────────┘
```

---

## `> 技术细节`

| 变量 | 值 | 说明 |
|---|---|---|
| `GARAGE_MENU_DATA` | `176` | 车库菜单 local 偏移量 |
| `VEHICLE_REWARD_DATA` | `129` | 奖励数据块基础偏移量 |
| `+4` | transaction | 交易结果 |
| `+5` | garage_id | 目标车库 ID |
| `+6` | garage_slot | 车库内的车位 |
| `+7` | reward_state | 流程状态（`3` = 待定中） |

---

## `> 限制说明`

```
[-] 黑名单载具会被游戏引擎拒绝
[-] "am_mp_vehicle_reward" 脚本必须处于活动状态
[-] 仅限在线模式（故事模式无效）
[-] 玩家必须坐在载具驾驶位上
```

---

## `> 作者`

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

<p align="center"><sub>⚡ 请合理使用。仅供学习参考。⚡</sub></p>

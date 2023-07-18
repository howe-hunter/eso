-------------------------------------------
-- chinese localization for Destinations --
-------------------------------------------
local strings = {
  --地图过滤器 Tags
  DEST_FILTER_UNKNOWN = "(Dest) 未知地点",
  DEST_FILTER_KNOWN = "(Dest) 已知地点",
  DEST_FILTER_OTHER = "(Dest) 其他成就",
  DEST_FILTER_OTHER_DONE = "(Dest) 其他成就 已完成",
  DEST_FILTER_MAIQ = "(Dest) " .. zo_strformat(GetAchievementInfo(872)),
  DEST_FILTER_MAIQ_DONE = "(Dest) " .. zo_strformat(GetAchievementInfo(872)) .. " 已完成",
  DEST_FILTER_PEACEMAKER = "(Dest) " .. zo_strformat(GetAchievementInfo(716)),
  DEST_FILTER_PEACEMAKER_DONE = "(Dest) " .. zo_strformat(GetAchievementInfo(716)) .. " 已完成",
  DEST_FILTER_NOSEDIVER = "(Dest) " .. zo_strformat(GetAchievementInfo(406)),
  DEST_FILTER_NOSEDIVER_DONE = "(Dest) " .. zo_strformat(GetAchievementInfo(406)) .. " 已完成",
  DEST_FILTER_EARTHLYPOS = "(Dest) " .. zo_strformat(GetAchievementInfo(1121)),
  DEST_FILTER_EARTHLYPOS_DONE = "(Dest) " .. zo_strformat(GetAchievementInfo(1121)) .. " 已完成",
  DEST_FILTER_ON_ME = "(Dest) " .. zo_strformat(GetAchievementInfo(704)),
  DEST_FILTER_ON_ME_DONE = "(Dest) " .. zo_strformat(GetAchievementInfo(704)) .. " 已完成",
  DEST_FILTER_BRAWL = "(Dest) " .. zo_strformat(GetAchievementInfo(1247)),
  DEST_FILTER_BRAWL_DONE = "(Dest) " .. zo_strformat(GetAchievementInfo(1247)) .. " 已完成",
  DEST_FILTER_PATRON = "(Dest) " .. zo_strformat(GetAchievementInfo(1316)),
  DEST_FILTER_PATRON_DONE = "(Dest) " .. zo_strformat(GetAchievementInfo(1316)) .. " 已完成",
  DEST_FILTER_WROTHGAR_JUMPER = "(Dest) " .. zo_strformat(GetAchievementInfo(1331)),
  DEST_FILTER_WROTHGAR_JUMPER_DONE = "(Dest) " .. zo_strformat(GetAchievementInfo(1331)) .. " 已完成",
  DEST_FILTER_RELIC_HUNTER = "(Dest) " .. zo_strformat(GetAchievementInfo(1250)),
  DEST_FILTER_RELIC_HUNTER_DONE = "(Dest) " .. zo_strformat(GetAchievementInfo(1250)) .. " 已完成",
  DEST_FILTER_BREAKING_ENTERING = "(Dest) " .. zo_strformat(GetAchievementInfo(1349)),
  DEST_FILTER_BREAKING_ENTERING_DONE = "(Dest) " .. zo_strformat(GetAchievementInfo(1349)) .. " 已完成",
  DEST_FILTER_CUTPURSE_ABOVE = "(Dest) " .. zo_strformat(GetAchievementInfo(1383)),
  DEST_FILTER_CUTPURSE_ABOVE_DONE = "(Dest) " .. zo_strformat(GetAchievementInfo(1383)) .. " 已完成",

  DEST_FILTER_CHAMPION = "(Dest) 副本首领",
  DEST_FILTER_CHAMPION_DONE = "(Dest) 副本首领 已完成",

  DEST_FILTER_COLLECTIBLE = "(Dest) 收藏品图标",
  DEST_FILTER_COLLECTIBLE_DONE = "(Dest) 收藏品 已完成",

  DEST_FILTER_FISHING = "(Dest) 钓鱼点图标",
  DEST_FILTER_FISHING_DONE = "(Dest) 钓鱼点 已完成",

  DEST_FILTER_QUESTGIVER = "(Dest) 任务提供者图标",
  DEST_FILTER_QUESTS_IN_PROGRESS = "(Dest) 进行中的任务",
  DEST_FILTER_QUESTS_DONE = "(Dest) 任务 已完成",

  DEST_FILTER_AYLEID = "(Dest) 亚历德魔法井",
  DEST_FILTER_DEADLANDS_ENTRANCE = "(Dest) Deadlands Entrance",
  DEST_FILTER_DWEMER = "(Dest) 锻莫遗迹",
  DEST_FILTER_BORDER = "(Dest) 荒崖边界线",

  DEST_FILTER_WWVAMP = "(Dest) 狼人和吸血鬼",
  DEST_FILTER_VAMPIRE_ALTAR = "(Dest) 吸血鬼祭坛",
  DEST_FILTER_WEREWOLF_SHRINE = "(Dest) 狼人祭坛",

  --Settings Menu
  DEST_SETTINGS_TITLE = "Destinations",

  DEST_SETTINGS_IMPROVEMENT_HEADER = "地点改善",
  DEST_SETTINGS_IMPROVEMENT_HEADER_TT = "改善未知和已知地点",
  DEST_SETTINGS_POI_ENGLISH_TEXT_HEADER = "在地点图标上显示英文文本",
  DEST_SETTINGS_POI_SHOW_ENGLISH = "展示英文地点名",
  DEST_SETTINGS_POI_SHOW_ENGLISH_TT = "在地图顶上展示英文地点名",
  DEST_SETTINGS_POI_ENGLISH_COLOR = "英文地点名文本颜色",
  DEST_SETTINGS_POI_ENGLISH_COLOR_TT = "为英语翻译的地点名设置文本颜色",
  DEST_SETTINGS_POI_SHOW_ENGLISH_KEEPS = "展示堡垒英文地点名",
  DEST_SETTINGS_POI_SHOW_ENGLISH_KEEPS_TT = "在堡垒提示框上展示英文地点名",
  DEST_SETTINGS_POI_ENGLISH_KEEPS_COLOR = "堡垒英文名文本颜色",
  DEST_SETTINGS_POI_ENGLISH_KEEPS_COLOR_TT = "为翻译的堡垒英文名设置文本颜色",
  DEST_SETTINGS_POI_ENGLISH_KEEPS_HA = "在堡垒提示框上隐藏联盟名",
  DEST_SETTINGS_POI_ENGLISH_KEEPS_HA_TT = "在堡垒提示框上隐藏联盟名",
  DEST_SETTINGS_POI_ENGLISH_KEEPS_NL = "在堡垒提示框上加一条新线",
  DEST_SETTINGS_POI_ENGLISH_KEEPS_NL_TT = "在堡垒提示框上为英语名加一条新线",
  DEST_SETTINGS_POI_IMPROVE_MUNDUS = "改善梦达斯地点",
  DEST_SETTINGS_POI_IMPROVE_MUNDUS_TT = "通过在提示框上加上效果描述改善梦达斯地点",
  DEST_SETTINGS_POI_IMPROVE_CRAFTING = "改善制造地点",
  DEST_SETTINGS_POI_IMPROVE_CRAFTING_TT = "通过在提示框上加上套装描述改善制造地点",

  DEST_SETTINGS_USE_ACCOUNTWIDE = "使用账户设置",
  DEST_SETTINGS_USE_ACCOUNTWIDE_TT = "如打开，则所有角色的设置都是相同的。",
  DEST_SETTINGS_RELOAD_WARNING = "更改此设置将强制立即重置界面",
  DEST_SETTINGS_PER_CHAR_HEADER = "只对当前角色生效的设置会用一个黄色的 '*' 号标记",
  DEST_SETTINGS_PER_CHAR = "*",
  DEST_SETTINGS_PER_CHAR_TOGGLE_TT = "此开关只对当前角色生效",
  DEST_SETTINGS_PER_CHAR_BUTTON_TT = "此按钮只对当前角色生效",

  DEST_SETTINGS_POI_HEADER = "未知地点",
  DEST_SETTINGS_POI_HEADER_TT = "此子菜单包括未知地点",
  DEST_SETTINGS_POI_UNKOWN_SUBHEADER = "This may be unused",
  DEST_SETTINGS_POI_KNOWN_SUBHEADER = "This may be unused",
  DEST_SETTINGS_POIS_ENGLISH_TEXT_HEADER = "This may be unused",

  DEST_SETTINGS_UNKNOWN_PIN_TOGGLE = "展示未知地点",
  DEST_SETTINGS_UNKNOWN_PIN_STYLE = "未知地点地图图标",
  DEST_SETTINGS_UNKNOWN_PIN_SIZE = "未知地点图标尺寸",
  DEST_SETTINGS_UNKNOWN_PIN_LAYER = "未知地点图标图层",
  DEST_SETTINGS_UNKNOWN_COLOR = "未知地点图标文本颜色",
  DEST_SETTINGS_UNKNOWN_COLOR_TT = "对所有未知地点生效",
  DEST_SETTINGS_UNKNOWN_COLOR_EN = "图标文本颜色 (英文)",
  DEST_SETTINGS_UNKNOWN_COLOR_EN_TT = "对所有未知地点英文文本生效, 如果开启的话",
  DEST_SETTINGS_KNOWN_PIN_TOGGLE = "展示已知地点",
  DEST_SETTINGS_KNOWN_PIN_STYLE = "已知地点地图图标",
  DEST_SETTINGS_KNOWN_PIN_SIZE = "已知地点图标尺寸",
  DEST_SETTINGS_KNOWN_PIN_LAYER = "已知地点图标图层",
  DEST_SETTINGS_KNOWN_COLOR = "已知地点图标文本颜色",
  DEST_SETTINGS_KNOWN_COLOR_TT = "对所有已知地点生效",
  DEST_SETTINGS_KNOWN_COLOR_EN = "图标文本颜色 (英文)",
  DEST_SETTINGS_KNOWN_COLOR_EN_TT = "对所有已知地点英文文本生效, 如果开启的话",
  DEST_SETTINGS_MUNDUS_DETAIL_PIN_TOGGLE = "展示梦达斯明细",
  DEST_SETTINGS_MUNDUS_TXT_COLOR = "梦达斯之石 文本颜色",
  DEST_SETTINGS_MUNDUS_TXT_COLOR_TT = "对梦达斯之石明细文本生效",
  DEST_SETTINGS_GTRADER_COLOR = "公会商人图标文本颜色",
  DEST_SETTINGS_GTRADER_COLOR_TT = "影响在指路祭坛上的'公会商人'文本",

  DEST_SETTINGS_ACH_HEADER = "成就位置",
  DEST_SETTINGS_ACH_HEADER_TT = "这个子菜单涵盖了游戏中的大部分成就 (太多不列举了)",
  DEST_SETTINGS_ACH_PIN_TOGGLE = "展示未完成成就",
  DEST_SETTINGS_ACH_PIN_TOGGLE_DONE = "展示已完成的成就",
  DEST_SETTINGS_ACH_PIN_STYLE = "成就图标风格",
  DEST_SETTINGS_ACH_PIN_SIZE = "成就图标尺寸",

  DEST_SETTINGS_ACH_OTHER_HEADER = "'光明使者', '施舍穷人' 和 '罪恶支付'",
  DEST_SETTINGS_ACH_MAIQ_HEADER = "'我喜欢麦奎'",
  DEST_SETTINGS_ACH_PEACEMAKER_HEADER = "'和事老'",
  DEST_SETTINGS_ACH_NOSEDIVER_HEADER = "'鼻子跳水家'",
  DEST_SETTINGS_ACH_EARTHLYPOS_HEADER = "'现世之财'",
  DEST_SETTINGS_ACH_ON_ME_HEADER = "'这杯算我的'",
  DEST_SETTINGS_ACH_BRAWL_HEADER = "'最后一场争吵'",
  DEST_SETTINGS_ACH_PATRON_HEADER = "'奥辛纽姆赞助人'",
  DEST_SETTINGS_ACH_WROTHGAR_JUMPER_HEADER = "'沃斯嘉跳崖者'",
  DEST_SETTINGS_ACH_RELIC_HUNTER_HEADER = "'沃斯嘉大师遗物猎人'",
  DEST_SETTINGS_ACH_BREAKING_HEADER = "'破门而入'",
  DEST_SETTINGS_ACH_CUTPURSE_HEADER = "'高级窃贼'",

  DEST_SETTINGS_ACH_CHAMPION_PIN_HEADER = "副本首领",
  DEST_SETTINGS_ACH_CHAMPION_ZONE_PIN_TOGGLE = "在区域地图上展示",
  DEST_SETTINGS_ACH_CHAMPION_ZONE_PIN_TOGGLE_TT = "此开关切换首领 (单人副本Boss) 在区域地图上展示与否",
  DEST_SETTINGS_ACH_CHAMPION_FRONT_PIN_TOGGLE = "展示在区域图标之前",
  DEST_SETTINGS_ACH_CHAMPION_FRONT_PIN_TOGGLE_TT = "此选项切换是否区域图标 (如开启) 在展示副本图标之前",
  DEST_SETTINGS_ACH_CHAMPION_PIN_SIZE = "副本首领图标尺寸",

  DEST_SETTINGS_ACH_GLOBAL_HEADER = "成就位置 - 全局设置",
  DEST_SETTINGS_ACH_GLOBAL_HEADER_TT = "此子菜单覆盖全局成就设置",
  DEST_SETTINGS_ACH_ALL_PIN_LAYER = "所有成就图标图层",
  DEST_SETTINGS_ACH_PIN_COLOR_MISS = "图标颜色 (未完成)",
  DEST_SETTINGS_ACH_PIN_COLOR_MISS_TT = "影响未完成的成就图标颜色",
  DEST_SETTINGS_ACH_TXT_COLOR_MISS = "图标文本颜色 (未完成)",
  DEST_SETTINGS_ACH_TXT_COLOR_MISS_TT = "影响未完成的成就图标文本",
  DEST_SETTINGS_ACH_PIN_COLOR_DONE = "图标颜色 (已完成)",
  DEST_SETTINGS_ACH_PIN_COLOR_DONE_TT = "影响已完成的成就图标颜色",
  DEST_SETTINGS_ACH_TXT_COLOR_DONE = "图标文本颜色 (已完成)",
  DEST_SETTINGS_ACH_TXT_COLOR_DONE_TT = "影响已完成的成就图标文本",
  DEST_SETTINGS_ACH_ALL_COMPASS_TOGGLE = "在罗盘上展示成就",
  DEST_SETTINGS_ACH_ALL_COMPASS_DIST = "罗盘上的图标距离",

  DEST_SETTINGS_MISC_HEADER = "杂项地点位置",
  DEST_SETTINGS_MISC_HEADER_TT = "此子菜单涵盖 亚历德魔法井, 锻莫遗迹和荒崖边界线.",
  DEST_SETTINGS_MISC_AYLEID_WELL_HEADER = "亚历德魔法井",
  DEST_SETTINGS_MISC_DEADLANDS_ENTRANCE_HEADER = "Deadlands Entrance",
  DEST_SETTINGS_MISC_DWEMER_HEADER = "锻莫遗迹",
  DEST_SETTINGS_MISC_COMPASS_HEADER = "杂项设置",
  DEST_SETTINGS_MISC_BORDER_HEADER = "荒崖边界",

  DEST_SETTINGS_MISC_PIN_AYLEID_WELL_TOGGLE = "展示亚历德魔法井",
  DEST_SETTINGS_MISC_PIN_AYLEID_WELL_TOGGLE_TT = "此开关切换亚历德魔法井在地图上展示与否",
  DEST_SETTINGS_MISC_PIN_AYLEID_WELL_SIZE = "亚历德魔法井图标尺寸",
  DEST_SETTINGS_MISC_PIN_AYLEID_WELL_COLOR = "亚历德魔法井图标颜色",
  DEST_SETTINGS_MISC_PIN_AYLEID_WELL_COLOR_TT = "影响亚历德魔法井图标颜色",
  DEST_SETTINGS_MISC_PINTEXT_AYLEID_WELL_COLOR = "亚历德魔法井图标文本颜色",
  DEST_SETTINGS_MISC_PINTEXT_AYLEID_WELL_COLOR_TT = "影响亚历德魔法井图标文本",

  -- Deadlands
  DEST_SETTINGS_MISC_PIN_DEADLANDS_ENTRANCE_TOGGLE = "Show Deadlands Entrance",
  DEST_SETTINGS_MISC_PIN_DEADLANDS_ENTRANCE_TOGGLE_TT = "This is for turning Deadlands Entrance on/off on the maps",
  DEST_SETTINGS_MISC_PIN_DEADLANDS_ENTRANCE_SIZE = "Pin size for Deadlands Entrance",
  DEST_SETTINGS_MISC_PIN_DEADLANDS_ENTRANCE_COLOR = "Pin color for Deadlands Entrance",
  DEST_SETTINGS_MISC_PIN_DEADLANDS_ENTRANCE_COLOR_TT = "Affects the PIN color for Deadlands Entrance",
  DEST_SETTINGS_MISC_PINTEXT_DEADLANDS_ENTRANCE_COLOR = "Pin text color for Deadlands Entrance",
  DEST_SETTINGS_MISC_PINTEXT_DEADLANDS_ENTRANCE_COLOR_TT = "Affects the pin TEXT on Deadlands Entrance",

  DEST_SETTINGS_MISC_DWEMER_PIN_TOGGLE = "展示锻莫遗迹",
  DEST_SETTINGS_MISC_DWEMER_PIN_TOGGLE_TT = "此开关切换锻莫遗迹在地图上展示与否",
  DEST_SETTINGS_MISC_DWEMER_PIN_SIZE = "锻莫遗迹图标尺寸",
  DEST_SETTINGS_MISC_DWEMER_PIN_COLOR = "锻莫遗迹图标颜色",
  DEST_SETTINGS_MISC_DWEMER_PIN_COLOR_TT = "影响锻莫遗迹图标颜色",
  DEST_SETTINGS_MISC_DWEMER_PINTEXT_COLOR = "锻莫遗迹图标文本颜色",
  DEST_SETTINGS_MISC_DWEMER_PINTEXT_COLOR_TT = "影响锻莫遗迹图标文本",
  DEST_SETTINGS_MISC_PIN_LAYER = "所有杂项地点图标图层",
  DEST_SETTINGS_MISC_COMPASS_PIN_TOGGLE = "在罗盘上展示杂项地点",
  DEST_SETTINGS_MISC_COMPASS_DIST = "罗盘上的地点图标距离",
  DEST_SETTINGS_MISC_BORDER_PIN_TOGGLE = "展示荒崖边界线",
  DEST_SETTINGS_MISC_BORDER_PIN_TOGGLE_TT = "展示区分南北荒崖的分界线",
  DEST_SETTINGS_MISC_BORDER_SIZE = "荒崖边界图标尺寸",
  DEST_SETTINGS_MISC_BORDER_PIN_COLOR = "荒崖边界图标颜色",
  DEST_SETTINGS_MISC_BORDER_PIN_COLOR_TT = "影响荒崖边界图标颜色",

  DEST_SETTINGS_VWW_HEADER = "吸血鬼和狼人位置",
  DEST_SETTINGS_VWW_HEADER_TT = "此子菜单涵盖吸血鬼和狼人, 包括刷新点和祭坛.",
  DEST_SETTINGS_VWW_WWVAMP_HEADER = "吸血鬼和狼人刷新点",
  DEST_SETTINGS_VWW_VAMP_HEADER = "吸血鬼祭坛",
  DEST_SETTINGS_VWW_WW_HEADER = "狼人祭坛",
  DEST_SETTINGS_VWW_COMPASS_HEADER = "杂项设置",

  DEST_SETTINGS_VWW_PIN_WWVAMP_TOGGLE = "展示狼人/吸血鬼刷新点",
  DEST_SETTINGS_VWW_PIN_WWVAMP_TOGGLE_TT = "此开关切换吸血鬼和狼人刷新点在地图上展示与否",
  DEST_SETTINGS_VWW_PIN_WWVAMP_SIZE = "狼人/吸血鬼图标尺寸",
  DEST_SETTINGS_VWW_PIN_VAMP_ALTAR_TOGGLE = "展示吸血鬼祭坛",
  DEST_SETTINGS_VWW_PIN_VAMP_ALTAR_TOGGLE_TT = "此开关切换吸血鬼祭坛在地图上展示与否",
  DEST_SETTINGS_VWW_PIN_VAMP_ALTAR_SIZE = "吸血鬼祭坛图标尺寸",
  DEST_SETTINGS_VWW_PIN_WW_SHRINE_TOGGLE = "展示狼人祭坛",
  DEST_SETTINGS_VWW_PIN_WW_SHRINE_TOGGLE_TT = "此开关切换狼人祭坛在地图上展示与否",
  DEST_SETTINGS_VWW_PIN_WW_SHRINE_SIZE = "狼人祭坛图标尺寸",
  DEST_SETTINGS_VWW_PIN_LAYER = "狼人/吸血鬼图标图层",
  DEST_SETTINGS_VWW_COMPASS_PIN_TOGGLE = "在罗盘上展示图标",
  DEST_SETTINGS_VWW_COMPASS_DIST = "罗盘上的图标距离",
  DEST_SETTINGS_VWW_PIN_COLOR = "狼人/吸血鬼图标颜色",
  DEST_SETTINGS_VWW_PIN_COLOR_TT = "影响狼人和吸血鬼刷新点, 吸血鬼祭坛和狼人祭坛的图标颜色",
  DEST_SETTINGS_VWW_PINTEXT_COLOR = "狼人/吸血鬼图标文本颜色",
  DEST_SETTINGS_VWW_PINTEXT_COLOR_TT = "影响狼人和吸血鬼刷新点, 吸血鬼祭坛和狼人祭坛的图标文本",

  DEST_SETTINGS_QUEST_HEADER = "任务提供者位置",
  DEST_SETTINGS_QUEST_HEADER_TT = "此子菜单涵盖所有任务有关设置",
  DEST_SETTINGS_QUEST_UNDONE_HEADER = "未完成的任务",
  DEST_SETTINGS_QUEST_INPROGRESS_HEADER = "进行中的任务",
  DEST_SETTINGS_QUEST_DONE_HEADER = "已完成的任务",
  DEST_SETTINGS_QUEST_CADWELLS_HEADER = "卡德威尔的年鉴",
  DEST_SETTINGS_QUEST_DAILIES_HEADER = "日常/可重复",
  DEST_SETTINGS_QUEST_COMPASS_HEADER = "杂项",
  DEST_SETTINGS_QUEST_REGISTER_HEADER = "其他",

  DEST_SETTINGS_QUEST_UNDONE_PIN_TOGGLE = "展示任务提供者位置",
  DEST_SETTINGS_QUEST_UNDONE_PIN_SIZE = "任务提供者图标尺寸",
  DEST_SETTINGS_QUEST_UNDONE_PIN_COLOR = "任务提供者图标颜色",
  DEST_SETTINGS_QUEST_UNDONE_PIN_COLOR_TT = "为未接任务图标设置颜色",
  DEST_SETTINGS_QUEST_UNDONE_MAIN_PIN_COLOR = "主线任务图标颜色",
  DEST_SETTINGS_QUEST_UNDONE_MAIN_PIN_COLOR_TT = "为未接主线任务图标设置颜色",
  DEST_SETTINGS_QUEST_UNDONE_DAY_PIN_COLOR = "日常任务图标颜色",
  DEST_SETTINGS_QUEST_UNDONE_DAY_PIN_COLOR_TT = "为未接日常任务图标设置颜色",
  DEST_SETTINGS_QUEST_UNDONE_REP_PIN_COLOR = "可重复任务图标颜色",
  DEST_SETTINGS_QUEST_UNDONE_REP_PIN_COLOR_TT = "为未接可重复任务图标设置颜色",
  DEST_SETTINGS_QUEST_UNDONE_DUN_PIN_COLOR = "副本任务图标颜色",
  DEST_SETTINGS_QUEST_UNDONE_DUN_PIN_COLOR_TT = "为未接副本任务图标设置颜色",
  DEST_SETTINGS_QUEST_UNDONE_PINTEXT_COLOR = "任务提供者文本颜色",
  DEST_SETTINGS_QUEST_UNDONE_PINTEXT_COLOR_TT = "为未接任务图标上的文本设置颜色",
  DEST_SETTINGS_QUEST_INPROGRESS_PIN_TOGGLE = "展示进行中的任务",
  DEST_SETTINGS_QUEST_INPROGRESS_PIN_SIZE = "进行中的任务图标尺寸",
  DEST_SETTINGS_QUEST_INPROGRESS_PIN_COLOR = "进行中的任务图标颜色",
  DEST_SETTINGS_QUEST_INPROGRESS_PIN_COLOR_TT = "为日志(任务列表)中的任务图标设置颜色",
  DEST_SETTINGS_QUEST_INPROGRESS_PINTEXT_COLOR = "进行中的任务文本颜色",
  DEST_SETTINGS_QUEST_INPROGRESS_PINTEXT_COLOR_TT = "为日志(任务列表)中的任务图标上的文本设置颜色",
  DEST_SETTINGS_QUEST_DONE_PIN_TOGGLE = "展示已完成的任务",
  DEST_SETTINGS_QUEST_DONE_PIN_SIZE = "已完成的任务图标尺寸",
  DEST_SETTINGS_QUEST_DONE_PIN_COLOR = "已完成的任务图标颜色",
  DEST_SETTINGS_QUEST_DONE_PIN_COLOR_TT = "为已完成的任务图标设置颜色",
  DEST_SETTINGS_QUEST_DONE_PINTEXT_COLOR = "已完成的任务文本颜色",
  DEST_SETTINGS_QUEST_DONE_PINTEXT_COLOR_TT = "为已完成的任务图标上的文本设置颜色",
  DEST_SETTINGS_QUEST_CADWELLS_PIN_TOGGLE = "展示卡德威尔的年鉴",
  DEST_SETTINGS_QUEST_CADWELLS_PIN_TOGGLE_TT = "在任务中展示/隐藏卡德威尔的年鉴标记",
  DEST_SETTINGS_QUEST_CADWELLS_ONLY_PIN_TOGGLE = "隐藏其他任务",
  DEST_SETTINGS_QUEST_CADWELLS_ONLY_PIN_TOGGLE_TT = "展示/隐藏不属于卡德威尔的年鉴列表中的其他所有普通任务",
  DEST_SETTINGS_QUEST_WRITS_PIN_TOGGLE = "展示日常状令",
  DEST_SETTINGS_QUEST_WRITS_PIN_TOGGLE_TT = "展示/隐藏日常状令",
  DEST_SETTINGS_QUEST_DAILIES_PIN_TOGGLE = "展示日常任务",
  DEST_SETTINGS_QUEST_DAILIES_PIN_TOGGLE_TT = "展示/隐藏日常任务",
  DEST_SETTINGS_QUEST_REPEATABLES_PIN_TOGGLE = "展示可重复任务",
  DEST_SETTINGS_QUEST_REPEATABLES_PIN_TOGGLE_TT = "展示/隐藏重复任务",
  DEST_SETTINGS_QUEST_ALL_PIN_LAYER = "所有任务图标图层",
  DEST_SETTINGS_QUEST_COMPASS_TOGGLE = "在罗盘上展示任务图标",
  DEST_SETTINGS_QUEST_COMPASS_DIST = "罗盘上的任务图标距离",

  DEST_SETTINGS_REGISTER_QUEST_GIVER_TOGGLE = "Hide Quest Giver Name",
  DEST_SETTINGS_REGISTER_QUEST_GIVER_TOGGLE_TT = "Show/Hide the name of the Quest giver in the tooltip.",

  DEST_SETTINGS_REGISTER_QUESTS_TOGGLE = "登记任务",
  DEST_SETTINGS_REGISTER_QUESTS_TOGGLE_TT = "保存任务信息以报告插件作者。更多信息请在 ESOUI.com 网站上查找 Destinations 页面。",
  DEST_SETTINGS_QUEST_RESET_HIDDEN = "重置被隐藏的任务",
  DEST_SETTINGS_QUEST_RESET_HIDDEN_TT = "重置所有被隐藏的任务, 并在你的地图和罗盘上重新展示。",

  DEST_SETTINGS_COLLECTIBLES_HEADER = "收藏品位置",
  DEST_SETTINGS_COLLECTIBLES_HEADER_TT = "此子菜单涵盖所有与收藏品有关的设置",
  DEST_SETTINGS_COLLECTIBLES_SUBHEADER = "收藏品设置",
  DEST_SETTINGS_COLLECTIBLES_COLORS_HEADER = "收藏品图标颜色",
  DEST_SETTINGS_COLLECTIBLES_MISC_HEADER = "杂项",

  DEST_SETTINGS_COLLECTIBLES_TOGGLE = "展示未完成收藏品",
  DEST_SETTINGS_COLLECTIBLES_TOGGLE_TT = "显示与成就所需收藏品相关的怪物区域",
  DEST_SETTINGS_COLLECTIBLES_DONE_TOGGLE = "展示已完成收藏品",
  DEST_SETTINGS_COLLECTIBLES_DONE_TOGGLE_TT = "展示已完成收藏品区域",
  DEST_SETTINGS_COLLECTIBLES_PIN_STYLE = "收藏品图标风格",
  DEST_SETTINGS_COLLECTIBLES_SHOW_MOBNAME = "在图标上展示怪物名",
  DEST_SETTINGS_COLLECTIBLES_SHOW_MOBNAME_TT = "展示可掉落成就所需物品的怪物的名字",
  DEST_SETTINGS_COLLECTIBLES_SHOW_ITEM = "在图标上展示物品名",
  DEST_SETTINGS_COLLECTIBLES_SHOW_ITEM_TT = "展示成就所需物品名字",
  DEST_SETTINGS_COLLECTIBLES_PIN_SIZE = "收藏品图标尺寸",
  DEST_SETTINGS_COLLECTIBLES_PIN_SIZE_TT = "收藏品图标尺寸",
  DEST_SETTINGS_COLLECTIBLES_PIN_LAYER = "收藏品图标图层",
  DEST_SETTINGS_COLLECTIBLES_PIN_LAYER_TT = "收藏品图标图层",
  DEST_SETTINGS_COLLECTIBLES_COMPASS_TOGGLE = "在罗盘上展示",
  DEST_SETTINGS_COLLECTIBLES_COMPASS_TOGGLE_TT = "在罗盘上展示收藏品",
  DEST_SETTINGS_COLLECTIBLES_COMPASS_DIST = "罗盘上的距离",
  DEST_SETTINGS_COLLECTIBLES_COMPASS_DIST_TT = "罗盘上展示收藏品区域的距离",
  DEST_SETTINGS_COLLECTIBLES_COLOR_TITLE = "标题文本颜色",
  DEST_SETTINGS_COLLECTIBLES_COLOR_TITLE_TT = "影响收藏品成就标题文本",
  DEST_SETTINGS_COLLECTIBLES_PIN_COLOR = "缺少的图标颜色",
  DEST_SETTINGS_COLLECTIBLES_PIN_COLOR_TT = "为缺少的收藏品图标设置颜色",
  DEST_SETTINGS_COLLECTIBLES_COLOR_UNDONE = "缺少的文本颜色",
  DEST_SETTINGS_COLLECTIBLES_COLOR_UNDONE_TT = "影响缺少的收藏品图标文本",
  DEST_SETTINGS_COLLECTIBLES_PIN_COLOR_DONE = "完成的图标颜色",
  DEST_SETTINGS_COLLECTIBLES_PIN_COLOR_DONE_TT = "为完成的收藏品图标设置颜色",
  DEST_SETTINGS_COLLECTIBLES_COLOR_DONE = "完成的文本颜色",
  DEST_SETTINGS_COLLECTIBLES_COLOR_DONE_TT = "影响完成的收藏品图标文本",

  DEST_SETTINGS_FISHING_HEADER = "钓鱼地点",
  DEST_SETTINGS_FISHING_HEADER_TT = "此子菜单涵盖所有钓鱼相关设置",
  DEST_SETTINGS_FISHING_SUBHEADER = "钓鱼设置",
  DEST_SETTINGS_FISHING_PIN_TEXT_HEADER = "钓鱼图标文本",
  DEST_SETTINGS_FISHING_COLOR_HEADER = "钓鱼图标颜色",
  DEST_SETTINGS_FISHING_MISC_HEADER = "杂项",

  DEST_SETTINGS_FISHING_TOGGLE = "展示未完成地点",
  DEST_SETTINGS_FISHING_TOGGLE_TT = "展示有机会抓到成就所需的鱼的鱼洞",
  DEST_SETTINGS_FISHING_DONE_TOGGLE = "展示已完成位置",
  DEST_SETTINGS_FISHING_DONE_TOGGLE_TT = "展示已完成鱼洞位置",
  DEST_SETTINGS_FISHING_PIN_STYLE = "钓鱼图标风格",
  DEST_SETTINGS_FISHING_SHOW_FISHNAME = "在图标上展示鱼名",
  DEST_SETTINGS_FISHING_SHOW_FISHNAME_TT = "展示此种水域类型缺少的鱼",
  DEST_SETTINGS_FISHING_SHOW_BAIT = "在图标上展示最佳鱼饵",
  DEST_SETTINGS_FISHING_SHOW_BAIT_TT = "展示最佳鱼饵来使用",
  DEST_SETTINGS_FISHING_SHOW_BAIT_LEFT = "在图标左边展示鱼饵",
  DEST_SETTINGS_FISHING_SHOW_BAIT_LEFT_TT = "展示你袋子里还剩下多少最佳的鱼饵。如果有第三个数字，那是指简单的诱饵",
  DEST_SETTINGS_FISHING_SHOW_WATER = "在图标上展示水域类型",
  DEST_SETTINGS_FISHING_SHOW_WATER_TT = "展示水域类型",
  DEST_SETTINGS_FISHING_PIN_SIZE = "钓鱼图标尺寸",
  DEST_SETTINGS_FISHING_PIN_SIZE_TT = "钓鱼图标尺寸",
  DEST_SETTINGS_FISHING_PIN_LAYER = "钓鱼图标图层",
  DEST_SETTINGS_FISHING_PIN_LAYER_TT = "钓鱼图标图层",
  DEST_SETTINGS_FISHING_COMPASS_TOGGLE = "在罗盘上展示",
  DEST_SETTINGS_FISHING_COMPASS_TOGGLE_TT = "在罗盘上展示鱼洞",
  DEST_SETTINGS_FISHING_COMPASS_DIST = "罗盘上的距离",
  DEST_SETTINGS_FISHING_COMPASS_DIST_TT = "在罗盘上展示鱼洞的距离",
  DEST_SETTINGS_FISHING_COLOR_TITLE = "成就标题文本颜色",
  DEST_SETTINGS_FISHING_COLOR_TITLE_TT = "影响钓鱼成就标题文本",
  DEST_SETTINGS_FISHING_PIN_COLOR = "缺少的图标颜色",
  DEST_SETTINGS_FISHING_PIN_COLOR_TT = "为缺少的鱼图标设置颜色",
  DEST_SETTINGS_FISHING_COLOR_UNDONE = "缺少的文本颜色",
  DEST_SETTINGS_FISHING_COLOR_UNDONE_TT = "影响缺少的鱼图标文本",
  DEST_SETTINGS_FISHING_COLOR_BAIT_UNDONE = "缺少的鱼饵类型文本颜色",
  DEST_SETTINGS_FISHING_COLOR_BAIT_UNDONE_TT = "影响缺少的鱼图标鱼饵文本, 如果开启的话",
  DEST_SETTINGS_FISHING_COLOR_WATER_UNDONE = "缺少的水域类型文本颜色",
  DEST_SETTINGS_FISHING_COLOR_WATER_UNDONE_TT = "影响缺少的鱼图标水域文本, 如果开启的话",
  DEST_SETTINGS_FISHING_PIN_COLOR_DONE = "完成的图标颜色",
  DEST_SETTINGS_FISHING_PIN_COLOR_DONE_TT = "为完成的鱼图标设置颜色",
  DEST_SETTINGS_FISHING_COLOR_DONE = "完成的文本颜色",
  DEST_SETTINGS_FISHING_COLOR_DONE_TT = "影响完成的鱼图标文本",
  DEST_SETTINGS_FISHING_COLOR_BAIT_DONE = "完成的的鱼饵类型文本颜色",
  DEST_SETTINGS_FISHING_COLOR_BAIT_DONE_TT = "影响完成的鱼图标鱼饵文本, 如果开启的话",
  DEST_SETTINGS_FISHING_COLOR_WATER_DONE = "完成的的水域类型文本颜色",
  DEST_SETTINGS_FISHING_COLOR_WATER_DONE_TT = "影响完成的鱼图标水域文本, 如果开启的话",

  DEST_SETTINGS_MAPFILTERS_HEADER = "地图过滤器",
  DEST_SETTINGS_MAPFILTERS_HEADER_TT = "此子菜单涵盖所有地图过滤器相关设置",
  DEST_SETTINGS_MAPFILTERS_SUBHEADER = "地图过滤器设置",

  DEST_SETTINGS_MAPFILTERS_POIS_TOGGLE = "展示地点地图过滤器",
  DEST_SETTINGS_MAPFILTERS_POIS_TOGGLE_TT = "展示/隐藏所有地点地图过滤器",
  DEST_SETTINGS_MAPFILTERS_ACHS_TOGGLE = "展示成就地图过滤器",
  DEST_SETTINGS_MAPFILTERS_ACHS_TOGGLE_TT = "展示/隐藏所有成就地图过滤器.",
  DEST_SETTINGS_MAPFILTERS_QUES_TOGGLE = "展示任务提供者地图过滤器",
  DEST_SETTINGS_MAPFILTERS_QUES_TOGGLE_TT = "展示/隐藏所有任务提供者地图过滤器",
  DEST_SETTINGS_MAPFILTERS_COLS_TOGGLE = "展示收藏品地图过滤器",
  DEST_SETTINGS_MAPFILTERS_COLS_TOGGLE_TT = "展示/隐藏所有收藏品地图过滤器",
  DEST_SETTINGS_MAPFILTERS_FISS_TOGGLE = "展示钓鱼地图过滤器",
  DEST_SETTINGS_MAPFILTERS_FISS_TOGGLE_TT = "展示/隐藏所有鱼洞地图过滤器",
  DEST_SETTINGS_MAPFILTERS_MISS_TOGGLE = "展示杂项地图过滤器",
  DEST_SETTINGS_MAPFILTERS_MISS_TOGGLE_TT = "展示/隐藏所有杂项图标地图过滤器 (亚历德魔法井, 锻莫遗迹, 荒崖边界, 以及所有狼人和吸血鬼图标).",

  GLOBAL_SETTINGS_SELECT_TEXT_ONLY = "只能是文本!",

  DEST_SETTINGS_RESET = "重置默认设置",

  --POI Types
  POITYPE_AOI = "地点",
  POITYPE_HOUSING = "房子",
  POITYPE_CRAFTING = "制造地点",
  POITYPE_DELVE = "洞穴",
  POITYPE_DOLMEN = "暗锚",
  POITYPE_GATE = "大门",
  POITYPE_GROUPBOSS = "组队Boss",
  POITYPE_GROUPDELVE = "组队洞穴",
  POITYPE_GROUPDUNGEON = "组队副本",
  POITYPE_GROUPEVENT = "组队事件",
  POITYPE_MUNDUS = "梦达斯之石",
  POITYPE_PUBLICDUNGEON = "公共副本",
  POITYPE_QUESTHUB = "任务中心",
  POITYPE_SOLOTRIAL = "试炼",
  POITYPE_TRADER = "公会商人",
  POITYPE_TRIALINSTANCE = "试炼情况",
  POITYPE_UNKNOWN = "未知",
  POITYPE_WAYSHRINE = "指路祭坛",
  POITYPE_VAULT = "地下室",
  POITYPE_DARK_BROTHERHOOD = "黑暗兄弟会",
  POITYPE_BREAKING_ENTERING = "破门而入",
  POITYPE_CUTPURSE_ABOVE = "高级窃贼",

  POITYPE_MAIQ = zo_strformat(GetAchievementInfo(872)),
  POITYPE_LB_GTTP_CP = zo_strformat(GetAchievementInfo(873)) .. "/" .. zo_strformat(GetAchievementInfo(871)) .. "/" .. zo_strformat(GetAchievementInfo(869)),
  POITYPE_PEACEMAKER = zo_strformat(GetAchievementInfo(716)),
  POITYPE_CRIME_PAYS = zo_strformat(GetAchievementInfo(869)),
  POITYPE_GIVE_TO_THE_POOR = zo_strformat(GetAchievementInfo(871)),
  POITYPE_LIGHTBRINGER = zo_strformat(GetAchievementInfo(873)),
  POITYPE_NOSEDIVER = zo_strformat(GetAchievementInfo(406)),
  POITYPE_EARTHLYPOS = zo_strformat(GetAchievementInfo(1121)),
  POITYPE_ON_ME = zo_strformat(GetAchievementInfo(704)),
  POITYPE_BRAWL = zo_strformat(GetAchievementInfo(1247)),
  POITYPE_RELICHUNTER = zo_strformat(GetAchievementInfo(1250)),
  POITYPE_PATRON = zo_strformat(GetAchievementInfo(1316)),
  POITYPE_WROTHGAR_JUMPER = zo_strformat(GetAchievementInfo(1331)),
  POITYPE_BREAKING_ENTERING = zo_strformat(GetAchievementInfo(1349)),
  POITYPE_CUTPURSE_ABOVE = zo_strformat(GetAchievementInfo(1383)),

  POITYPE_AYLEID_WELL = "亚历德魔法井",
  POITYPE_DEADLANDS_ENTRANCE = "Deadlands Entrance",
  POITYPE_WWVAMP = "狼人/吸血鬼",
  POITYPE_VAMPIRE_ALTAR = "吸血鬼祭坛",
  POITYPE_DWEMER_RUIN = "锻莫遗迹",
  POITYPE_WEREWOLF_SHRINE = "狼人祭坛",

  POITYPE_COLLECTIBLE = "收藏品",
  POITYPE_FISH = "钓鱼",
  POITYPE_UNDETERMINED = "未确定",

  -- Quest completion editing texts
  QUEST_EDIT_ON = "Destinations 目的地 任务提供者编辑被打开!",
  QUEST_EDIT_OFF = "Destinations 目的地 任务提供者编辑被关闭!",
  QUEST_MENU_NOT_FOUND = "无法在数据库中找到此任务",
  QUEST_MENU_HIDE_QUEST = "隐藏此任务图标",
  QUEST_MENU_DISABLE_EDIT = "禁用编辑",

  -- Quest types
  QUESTTYPE_NONE = "任务",
  QUESTTYPE_GROUP = "组队任务",
  QUESTTYPE_MAIN_STORY = "主线任务",
  QUESTTYPE_GUILD = "公会任务",
  QUESTTYPE_CRAFTING = "制造任务",
  QUESTTYPE_DUNGEON = "副本任务",
  QUESTTYPE_RAID = "团队任务",
  QUESTTYPE_AVA = "联盟战争任务",
  QUESTTYPE_CLASS = "职业任务",
  QUESTTYPE_QA_TEST = "Q&A 测试任务",
  QUESTTYPE_AVA_GROUP = "联盟战争组队任务",
  QUESTTYPE_AVA_GRAND = "联盟战争大任务",
  QUESTREPEAT_NOT_REPEATABLE = "普通任务",
  QUESTREPEAT_REPEATABLE = "可重复任务",
  QUESTREPEAT_DAILY = "日常任务",

  -- 钓鱼
  FISHING_FOUL = "污水",
  FISHING_RIVER = "河水",
  FISHING_OCEAN = "海水",
  FISHING_LAKE = "湖水",
  FISHING_UNKNOWN = "- 未知 -",
  FISHING_FOUL_BAIT = "爬虫/鱼卵",
  FISHING_RIVER_BAIT = "昆虫残骸/鲱鱼",
  FISHING_OCEAN_BAIT = "蠕虫/鲦鱼",
  FISHING_LAKE_BAIT = "肠子/小鱼",
  FISHING_HWBC = "蟹与鹤杀手",

  -- Destinations chat commands
  DESTCOMMANDS = "Destinations 目的地 命令列表:",
  DESTCOMMANDdhlp = "/dhlp (Destinations目的地 帮助) : 就是你刚使用的命令 ;)",
  DESTCOMMANDdset = "/dset (Destinations 目的地 设置) : 打开Destinations 目的地 设置窗口.",
  DESTCOMMANDdqed = "/dqed (Destinations 目的地 任务编辑器) : 此命令将切换任务图标的编辑模式。打开或关闭将显示在聊天窗口。当打开时，开启你的地图，并点击图标切换完成或未完成。记得在编辑完成时，通过重复该命令将编辑模式关闭!",

  -- Destinations Misc
  LOAD_NEW_QUEST_FORMAT = "重置任务数据",
  LOAD_NEW_QUEST_FORMAT_TT = "这将把所有已知的任务重新加载到一个新表中。游戏将做一次重载界面来完成它.",
  RELOADUI_WARNING = "如果你按下此按钮, 游戏将做一次重载界面",
  RELOADUI_INFO = "在您单击“重置界面”按钮之前，对该设置的更改将不会生效.",
  DEST_SETTINGS_RELOADUI = "重置界面",
  DEST_SET_REQUIREMENT = "需要 <<1>> 特性",
}

for key, value in pairs(strings) do
  ZO_CreateStringId(key, value)
  SafeAddVersion(key, 1)
end

-------------------------------------------
-- Polish localization for Destinations --
-------------------------------------------
local strings = {
  --Map Filter Tags
  DEST_FILTER_UNKNOWN = "(Dest) Nieznane POI",
  DEST_FILTER_KNOWN = "(Dest) Znane POI",
  DEST_FILTER_OTHER = "(Dest) Inne osiągnięcia",
  DEST_FILTER_OTHER_DONE = "(Dest) Inne osiągnięcia ukończone",
  DEST_FILTER_MAIQ = "(Dest) " .. zo_strformat(GetAchievementInfo(872)),
  DEST_FILTER_MAIQ_DONE = "(Dest) " .. zo_strformat(GetAchievementInfo(872)) .. " ukończone",
  DEST_FILTER_PEACEMAKER = "(Dest) " .. zo_strformat(GetAchievementInfo(716)),
  DEST_FILTER_PEACEMAKER_DONE = "(Dest) " .. zo_strformat(GetAchievementInfo(716)) .. " ukończone",
  DEST_FILTER_NOSEDIVER = "(Dest) " .. zo_strformat(GetAchievementInfo(406)),
  DEST_FILTER_NOSEDIVER_DONE = "(Dest) " .. zo_strformat(GetAchievementInfo(406)) .. " ukończone",
  DEST_FILTER_EARTHLYPOS = "(Dest) " .. zo_strformat(GetAchievementInfo(1121)),
  DEST_FILTER_EARTHLYPOS_DONE = "(Dest) " .. zo_strformat(GetAchievementInfo(1121)) .. " ukończone",
  DEST_FILTER_ON_ME = "(Dest) " .. zo_strformat(GetAchievementInfo(704)),
  DEST_FILTER_ON_ME_DONE = "(Dest) " .. zo_strformat(GetAchievementInfo(704)) .. " ukończone",
  DEST_FILTER_BRAWL = "(Dest) " .. zo_strformat(GetAchievementInfo(1247)),
  DEST_FILTER_BRAWL_DONE = "(Dest) " .. zo_strformat(GetAchievementInfo(1247)) .. " ukończone",
  DEST_FILTER_PATRON = "(Dest) " .. zo_strformat(GetAchievementInfo(1316)),
  DEST_FILTER_PATRON_DONE = "(Dest) " .. zo_strformat(GetAchievementInfo(1316)) .. " ukończone",
  DEST_FILTER_WROTHGAR_JUMPER = "(Dest) " .. zo_strformat(GetAchievementInfo(1331)),
  DEST_FILTER_WROTHGAR_JUMPER_DONE = "(Dest) " .. zo_strformat(GetAchievementInfo(1331)) .. " ukończone",
  DEST_FILTER_RELIC_HUNTER = "(Dest) " .. zo_strformat(GetAchievementInfo(1250)),
  DEST_FILTER_RELIC_HUNTER_DONE = "(Dest) " .. zo_strformat(GetAchievementInfo(1250)) .. " ukończone",
  DEST_FILTER_BREAKING_ENTERING = "(Dest) " .. zo_strformat(GetAchievementInfo(1349)),
  DEST_FILTER_BREAKING_ENTERING_DONE = "(Dest) " .. zo_strformat(GetAchievementInfo(1349)) .. " ukończone",
  DEST_FILTER_CUTPURSE_ABOVE = "(Dest) " .. zo_strformat(GetAchievementInfo(1383)),
  DEST_FILTER_CUTPURSE_ABOVE_DONE = "(Dest) " .. zo_strformat(GetAchievementInfo(1383)) .. " ukończone",

  DEST_FILTER_CHAMPION = "(Dest) Czempiony w lochach",
  DEST_FILTER_CHAMPION_DONE = "(Dest) Ukończone czempiony w lochach",

  DEST_FILTER_COLLECTIBLE = "(Dest) Przedmioty kolekcjonerskie",
  DEST_FILTER_COLLECTIBLE_DONE = "(Dest) Ukończone przedmioty kolekcjonerskie",

  DEST_FILTER_FISHING = "(Dest) Łowiska",
  DEST_FILTER_FISHING_DONE = "(Dest) Ukończone łowiska",

  DEST_FILTER_QUESTGIVER = "(Dest) Zleceniodawcy zadań",
  DEST_FILTER_QUESTS_IN_PROGRESS = "(Dest) Zadania w trakcie",
  DEST_FILTER_QUESTS_DONE = "(Dest) Ukończone zadania",

  DEST_FILTER_AYLEID = "(Dest) Ayleidzkie studnie",
  DEST_FILTER_DEADLANDS_ENTRANCE = "(Dest) Deadlands Entrance",
  DEST_FILTER_DWEMER = "(Dest) Dwemerowe ruiny",
  DEST_FILTER_BORDER = "(Dest) Craglorn Border Line",

  DEST_FILTER_WWVAMP = "(Dest) Wampiry i Wilkołaki",
  DEST_FILTER_VAMPIRE_ALTAR = "(Dest) Ołtarze Wampirów",
  DEST_FILTER_WEREWOLF_SHRINE = "(Dest) Kapliczka wilkołaków",

  --Settings Menu
  DEST_SETTINGS_TITLE = "Destinations",

  DEST_SETTINGS_IMPROVEMENT_HEADER = "Ulepszenie POI",
  DEST_SETTINGS_IMPROVEMENT_HEADER_TT = "Ulepszenie nieznanych i znanych POI",
  DEST_SETTINGS_POI_ENGLISH_TEXT_HEADER = "Angielski tekst dla Interesujących miejsc",
  DEST_SETTINGS_POI_SHOW_ENGLISH = "Pokaż angielskie nazwy POI",
  DEST_SETTINGS_POI_SHOW_ENGLISH_TT = "Pokaż angielskie nazwy POI u góry mapy",
  DEST_SETTINGS_POI_ENGLISH_COLOR = "Kolor tekstu angielskich nazw POI",
  DEST_SETTINGS_POI_ENGLISH_COLOR_TT = "Ustaw kolor tekstu angielskiego tłumaczenia nazw POI",
  DEST_SETTINGS_POI_SHOW_ENGLISH_KEEPS = "Pokaż angielskie nazwy punktów POI dla Warowni",
  DEST_SETTINGS_POI_SHOW_ENGLISH_KEEPS_TT = "Pokaż angielskie nazwy POI w podpowiedziach Warowni",
  DEST_SETTINGS_POI_ENGLISH_KEEPS_COLOR = "Kolor tekstu dla angielskich nazw Warowni",
  DEST_SETTINGS_POI_ENGLISH_KEEPS_COLOR_TT = "Ustaw kolor tekstu dla angielskich Warowni",
  DEST_SETTINGS_POI_ENGLISH_KEEPS_HA = "Ukryj podpowiedzi nazw frakcji Warowni",
  DEST_SETTINGS_POI_ENGLISH_KEEPS_HA_TT = "Ukryj podpowiedzi nazw frakcji Warowni",
  DEST_SETTINGS_POI_ENGLISH_KEEPS_NL = "Dodaj nowy wiersz w podpowiedziach Warowni",
  DEST_SETTINGS_POI_ENGLISH_KEEPS_NL_TT = "Dodaj nowy wiersz w podpowiedziach Warowni dla angielskich nazw",
  DEST_SETTINGS_POI_IMPROVE_MUNDUS = "Ulepszenie POI Mundus",
  DEST_SETTINGS_POI_IMPROVE_MUNDUS_TT = "Ulepsz punkty POI Mundus, dodając opis efektu w podpowiedzi",
  DEST_SETTINGS_POI_IMPROVE_CRAFTING = "Ulepsz punkty POI rzemiosła",
  DEST_SETTINGS_POI_IMPROVE_CRAFTING_TT = "Ulepsz punkty POI rzemiosła dodając opis zestawu w podpowiedzi",

  DEST_SETTINGS_USE_ACCOUNTWIDE = "Użyj ustawień na całym koncie",
  DEST_SETTINGS_USE_ACCOUNTWIDE_TT = "Jeżeli zostanie włączone, to ustawienia będą takie same dla WSZYSTKICH postaci.",
  DEST_SETTINGS_RELOAD_WARNING = "Zmiana tego ustawienia wymusi natychmiastowe /reloadui",
  DEST_SETTINGS_PER_CHAR_HEADER = "Ustawienia oznaczone żółtą '*' mają wpływ tylko na bieżącą postać.",
  DEST_SETTINGS_PER_CHAR = "*",
  DEST_SETTINGS_PER_CHAR_TOGGLE_TT = "Ten przełącznik wpływa tylko na aktualną postać.",
  DEST_SETTINGS_PER_CHAR_BUTTON_TT = "Ten przycisk ma wpływ tylko na aktualną postać.",

  DEST_SETTINGS_POI_HEADER = "Nieznane interesujące miejsca",
  DEST_SETTINGS_POI_HEADER_TT = "To podmenu obejmuje nieznane interesujące miejsca",

  DEST_SETTINGS_UNKNOWN_PIN_TOGGLE = "Pokaż nieznane POI",
  DEST_SETTINGS_UNKNOWN_PIN_STYLE = "Punkty na mapie dla nieznanych POI",
  DEST_SETTINGS_UNKNOWN_PIN_SIZE = "Wielkość punktu dla nieznanych POI",
  DEST_SETTINGS_UNKNOWN_PIN_LAYER = "Pin layer for unknown POIs",
  DEST_SETTINGS_UNKNOWN_COLOR = "Kolor tekstu nieznanych punktów POI",
  DEST_SETTINGS_UNKNOWN_COLOR_TT = "Wpływa na wszystkie nieznane interesujące punkty",
  DEST_SETTINGS_UNKNOWN_COLOR_EN = "Kolor tekstu punktów (angielski)",
  DEST_SETTINGS_UNKNOWN_COLOR_EN_TT = "Ma wpływ na tekst w języku angielskim dla wszystkich nieznanych POI, jeśli jest aktywny",
  DEST_SETTINGS_KNOWN_PIN_TOGGLE = "Pokaż poznane POI",
  DEST_SETTINGS_KNOWN_PIN_STYLE = "Znane punkty POI",
  DEST_SETTINGS_KNOWN_PIN_SIZE = "Rozmiar znanych punktów POI",
  DEST_SETTINGS_KNOWN_PIN_LAYER = "Pin layer for known POIs",
  DEST_SETTINGS_KNOWN_COLOR = "Kolor tekstu znanych punktów POI",
  DEST_SETTINGS_KNOWN_COLOR_TT = "Wpływa na wszystkie znane interesujące miejsca",
  DEST_SETTINGS_KNOWN_COLOR_EN = "Kolor tekstu punktów (angielski)",
  DEST_SETTINGS_KNOWN_COLOR_EN_TT = "Wpływa na angielskie teksty dla wszystkich interesujących miejsc, jeżeli jest aktywny",
  DEST_SETTINGS_MUNDUS_DETAIL_PIN_TOGGLE = "Pokaż szczegóły Mundus",
  DEST_SETTINGS_MUNDUS_TXT_COLOR = "Kolor tekstu Kamieni Mundus",
  DEST_SETTINGS_MUNDUS_TXT_COLOR_TT = "Wpływa na TEKST SZCZEGÓŁÓW Kamieni Mundus",
  DEST_SETTINGS_GTRADER_COLOR = "Kolor tekstu punktów kupców gildii",
  DEST_SETTINGS_GTRADER_COLOR_TT = "Wpływa na tekst kupiec gildii przy kapliczkach",

  DEST_SETTINGS_ACH_HEADER = "Pozycja osiągnięć",
  DEST_SETTINGS_ACH_HEADER_TT = "‎Podmenu to obejmuje większość osiągnięć w grze (zbyt wiele, aby je wymieniać)‎",
  DEST_SETTINGS_ACH_PIN_TOGGLE = "Pokaż nieukończone osiągnięcia",
  DEST_SETTINGS_ACH_PIN_TOGGLE_DONE = "Pokaż ukończone osiągnięcia",
  DEST_SETTINGS_ACH_PIN_STYLE = "Styl punktów osiągnięć",
  DEST_SETTINGS_ACH_PIN_SIZE = "Wielkość punktów osiągnięć",

  DEST_SETTINGS_ACH_OTHER_HEADER = "Przynoszący światło, Rozdaj ubogim, i Zbrodnia popłaca",
  DEST_SETTINGS_ACH_MAIQ_HEADER = "Lubię M'aiqa",
  DEST_SETTINGS_ACH_PEACEMAKER_HEADER = "Rozjemca/Rozjemczyni",
  DEST_SETTINGS_ACH_NOSEDIVER_HEADER = "Węszący nurek",
  DEST_SETTINGS_ACH_EARTHLYPOS_HEADER = "Ziemskie dobytki",
  DEST_SETTINGS_ACH_ON_ME_HEADER = "Ja stawiam",
  DEST_SETTINGS_ACH_BRAWL_HEADER = "Ostatnia bójka",
  DEST_SETTINGS_ACH_PATRON_HEADER = "Dobrodziej Orsinium",
  DEST_SETTINGS_ACH_WROTHGAR_JUMPER_HEADER = "Klifowy skoczek Wrothgaru",
  DEST_SETTINGS_ACH_RELIC_HUNTER_HEADER = "Mistrzowski łowca/Mistrzowska łowczyni reliktów Wrothgaru",
  DEST_SETTINGS_ACH_BREAKING_HEADER = "Włamanie i wtargnięcie",
  DEST_SETTINGS_ACH_CUTPURSE_HEADER = "Nadkieszonkowiec",

  DEST_SETTINGS_ACH_CHAMPION_PIN_HEADER = "czempion/czempionka lochów",
  DEST_SETTINGS_ACH_CHAMPION_ZONE_PIN_TOGGLE = "Pokaż na mapach regionu",
  DEST_SETTINGS_ACH_CHAMPION_ZONE_PIN_TOGGLE_TT = "Służy do włączenia lub wyłączenia Czempionów (bossy w lochach solo) na mapie regionu",
  DEST_SETTINGS_ACH_CHAMPION_FRONT_PIN_TOGGLE = "Zone pin to Front",
  DEST_SETTINGS_ACH_CHAMPION_FRONT_PIN_TOGGLE_TT = "This will toggle if ZONE pins (if active) should be shown in front of dungeon pins or not",
  DEST_SETTINGS_ACH_CHAMPION_PIN_SIZE = "Wielkość punktów dla czempionów w lochach",

  DEST_SETTINGS_ACH_GLOBAL_HEADER = "Pozycja osiągnięcia - Globalne ustawienia",
  DEST_SETTINGS_ACH_GLOBAL_HEADER_TT = "‎Podmenu obejmuje ustawienia ‎‎osiągnięć globalnych‎",
  DEST_SETTINGS_ACH_ALL_PIN_LAYER = "Pin layer for all Achievements",
  DEST_SETTINGS_ACH_PIN_COLOR_MISS = "Kolor punktów (nieukończone)",
  DEST_SETTINGS_ACH_PIN_COLOR_MISS_TT = "Wpływa na kolor punktów dla nieukończonych osiągnięć",
  DEST_SETTINGS_ACH_TXT_COLOR_MISS = "Kolor tekstu punktów (nieukończone)",
  DEST_SETTINGS_ACH_TXT_COLOR_MISS_TT = "Wpływa na TEKST punktów nieukończonych osiągnięć",
  DEST_SETTINGS_ACH_PIN_COLOR_DONE = "Kolor punktów (ukończone)",
  DEST_SETTINGS_ACH_PIN_COLOR_DONE_TT = "Wpływa na kolor punktów ukończonych osiągnięć",
  DEST_SETTINGS_ACH_TXT_COLOR_DONE = "Kolor tekstu punktów (ukończone)",
  DEST_SETTINGS_ACH_TXT_COLOR_DONE_TT = "Wpływa na TEKST ukończonych punktów osiągnięć",
  DEST_SETTINGS_ACH_ALL_COMPASS_TOGGLE = "Pokaż osiągnięcia na kompasie",
  DEST_SETTINGS_ACH_ALL_COMPASS_DIST = "Dystans do punktów na kompasie",

  DEST_SETTINGS_MISC_HEADER = "Pozycja punktów Różności",
  DEST_SETTINGS_MISC_HEADER_TT = "To podmenu obejmuje Ayleidzką studnie, Dwemerowe ruiny i linię granicy Craglorn.",
  DEST_SETTINGS_MISC_AYLEID_WELL_HEADER = "Ayleidzka studnia",
  DEST_SETTINGS_MISC_DEADLANDS_ENTRANCE_HEADER = "Deadlands Entrance",
  DEST_SETTINGS_MISC_DWEMER_HEADER = "Dwemerowe ruiny",
  DEST_SETTINGS_MISC_COMPASS_HEADER = "Różne ustawienia",
  DEST_SETTINGS_MISC_BORDER_HEADER = "Granica Craglorn",

  DEST_SETTINGS_MISC_PIN_AYLEID_WELL_TOGGLE = "Pokaż Ayleidzką studnie",
  DEST_SETTINGS_MISC_PIN_AYLEID_WELL_TOGGLE_TT = "Służy do włączania i wyłączania Ayledzkich Stuni na mapie",
  DEST_SETTINGS_MISC_PIN_AYLEID_WELL_SIZE = "Wielkość punktów Ayleidzkich Studni",
  DEST_SETTINGS_MISC_PIN_AYLEID_WELL_COLOR = "Kolor punktów Ayleidzkich Studni",
  DEST_SETTINGS_MISC_PIN_AYLEID_WELL_COLOR_TT = "Wpływa na kolor punktów Ayleidzkich Studni",
  DEST_SETTINGS_MISC_PINTEXT_AYLEID_WELL_COLOR = "Kolor tekstu punktów Ayleidzkich Studni",
  DEST_SETTINGS_MISC_PINTEXT_AYLEID_WELL_COLOR_TT = "Wpływa na TEKST punktów Ayleidzkich Studni",

  -- Deadlands
  DEST_SETTINGS_MISC_PIN_DEADLANDS_ENTRANCE_TOGGLE = "Show Deadlands Entrance",
  DEST_SETTINGS_MISC_PIN_DEADLANDS_ENTRANCE_TOGGLE_TT = "This is for turning Deadlands Entrance on/off on the maps",
  DEST_SETTINGS_MISC_PIN_DEADLANDS_ENTRANCE_SIZE = "Pin size for Deadlands Entrance",
  DEST_SETTINGS_MISC_PIN_DEADLANDS_ENTRANCE_COLOR = "Pin color for Deadlands Entrance",
  DEST_SETTINGS_MISC_PIN_DEADLANDS_ENTRANCE_COLOR_TT = "Affects the PIN color for Deadlands Entrance",
  DEST_SETTINGS_MISC_PINTEXT_DEADLANDS_ENTRANCE_COLOR = "Pin text color for Deadlands Entrance",
  DEST_SETTINGS_MISC_PINTEXT_DEADLANDS_ENTRANCE_COLOR_TT = "Affects the pin TEXT on Deadlands Entrance",

  DEST_SETTINGS_MISC_DWEMER_PIN_TOGGLE = "Pokaż Dwemerowe ruiny",
  DEST_SETTINGS_MISC_DWEMER_PIN_TOGGLE_TT = "Służy do włączenia i wyłączenia Dwemerowych ruin na mapie",
  DEST_SETTINGS_MISC_DWEMER_PIN_SIZE = "Wielkość punktów Dwemerowych ruin",
  DEST_SETTINGS_MISC_DWEMER_PIN_COLOR = "Kolor punktów Dwemerowych ruin",
  DEST_SETTINGS_MISC_DWEMER_PIN_COLOR_TT = "Wpływa na kolor punktów Dwemerowych ruin",
  DEST_SETTINGS_MISC_DWEMER_PINTEXT_COLOR = "Kolor tekstu punktów Dwemerowych ruin",
  DEST_SETTINGS_MISC_DWEMER_PINTEXT_COLOR_TT = "Wpływa na TEKST punktów Dwemerowych ruin",
  DEST_SETTINGS_MISC_PIN_LAYER = "Pin layer for all miscellaneous POIs",
  DEST_SETTINGS_MISC_COMPASS_PIN_TOGGLE = "Pokaż punkty Różności na kompasie",
  DEST_SETTINGS_MISC_COMPASS_DIST = "Odległość dla punktów na kompasie",
  DEST_SETTINGS_MISC_BORDER_PIN_TOGGLE = "Pokaż linię granicy Craglorn",
  DEST_SETTINGS_MISC_BORDER_PIN_TOGGLE_TT = "‎Pokazuje linię graniczną dzielącą górną i ‎‎dolną część ‎‎Craglorn",
  DEST_SETTINGS_MISC_BORDER_SIZE = "Wielkość punktu granicy Craglorn",
  DEST_SETTINGS_MISC_BORDER_PIN_COLOR = "Kolor punktów granicy Craglorn",
  DEST_SETTINGS_MISC_BORDER_PIN_COLOR_TT = "Wpływa na kolor punktów granicy Craglorn",

  DEST_SETTINGS_VWW_HEADER = "Pozycja Wampirów i Wilkołaków",
  DEST_SETTINGS_VWW_HEADER_TT = "This submenu covers Vampires and Werewolfs, including spawns, Alters and Shrines.",
  DEST_SETTINGS_VWW_WWVAMP_HEADER = "Miejsce odrodzenia Wampirów i Wilkołaków",
  DEST_SETTINGS_VWW_VAMP_HEADER = "Ołtarze Wampirów",
  DEST_SETTINGS_VWW_WW_HEADER = "Kapliczki Wilkołaków",
  DEST_SETTINGS_VWW_COMPASS_HEADER = "Różne ustawienia",

  DEST_SETTINGS_VWW_PIN_WWVAMP_TOGGLE = "Pokaż miejsca odrodzenia Wilkołaków/Wampirów",
  DEST_SETTINGS_VWW_PIN_WWVAMP_TOGGLE_TT = "Pozwala włączać i wyłączać pokazywanie miejsc odrodzenia Wampirów i Wilkołaków na mapie",
  DEST_SETTINGS_VWW_PIN_WWVAMP_SIZE = "Wielkość punktów Wilkołaków/Wampirów",
  DEST_SETTINGS_VWW_PIN_VAMP_ALTAR_TOGGLE = "Pokaż Ołtarze Wampirów",
  DEST_SETTINGS_VWW_PIN_VAMP_ALTAR_TOGGLE_TT = "Umożliwia włączanie/wyłączanie Ołtarzy Wampirów na mapie",
  DEST_SETTINGS_VWW_PIN_VAMP_ALTAR_SIZE = "Wielkość punktów Ołtarzy Wampirów",
  DEST_SETTINGS_VWW_PIN_WW_SHRINE_TOGGLE = "Pokaż Kapliczki Wilkołaków",
  DEST_SETTINGS_VWW_PIN_WW_SHRINE_TOGGLE_TT = "Umożliwia włączenie/wyłączenie Kapliczek Wilkołaków na mapie",
  DEST_SETTINGS_VWW_PIN_WW_SHRINE_SIZE = "Wielkość punktów Kapliczek Wilkołaków",
  DEST_SETTINGS_VWW_PIN_LAYER = "Pin layer for Werewolfs/Vampires",
  DEST_SETTINGS_VWW_COMPASS_PIN_TOGGLE = "Pokaż punkty na kompasie",
  DEST_SETTINGS_VWW_COMPASS_DIST = "Odległość punktów na kompasie",
  DEST_SETTINGS_VWW_PIN_COLOR = "Kolor punktów dla Wilkołaków/Wampirów",
  DEST_SETTINGS_VWW_PIN_COLOR_TT = "Affects the PIN color for Werewolf and Vampire spawns, Vampire Altars and Werewolf Shrines",
  DEST_SETTINGS_VWW_PINTEXT_COLOR = "Kolor tekstu punktów Wilkołaków/Wampirów",
  DEST_SETTINGS_VWW_PINTEXT_COLOR_TT = "Affects the pin TEXT on Werewolf and Vampire spawns, Vampire Altars and Werewolf Shrines",

  DEST_SETTINGS_QUEST_HEADER = "Pozycja zleceniodawcy zadania",
  DEST_SETTINGS_QUEST_HEADER_TT = "To podmenu obejmuje wszystkie ustawienia związane z zadaniem.",
  DEST_SETTINGS_QUEST_UNDONE_HEADER = "Nieukończone zadania",
  DEST_SETTINGS_QUEST_INPROGRESS_HEADER = "Zadania w trakcie",
  DEST_SETTINGS_QUEST_DONE_HEADER = "Ukończone zadania",
  DEST_SETTINGS_QUEST_CADWELLS_HEADER = "Almanach Cadwella",
  DEST_SETTINGS_QUEST_DAILIES_HEADER = "Dzienne/powtarzalne",
  DEST_SETTINGS_QUEST_COMPASS_HEADER = "Różne",
  DEST_SETTINGS_QUEST_REGISTER_HEADER = "Inne",

  DEST_SETTINGS_QUEST_UNDONE_PIN_TOGGLE = "Pokaż pozycje zleceniodawcy zadania",
  DEST_SETTINGS_QUEST_UNDONE_PIN_SIZE = "Wielkość punktów zleceniodawców zadań",
  DEST_SETTINGS_QUEST_UNDONE_PIN_COLOR = "Kolor punktów zleceniodawców zadań",
  DEST_SETTINGS_QUEST_UNDONE_PIN_COLOR_TT = "Ustawia kolor punktów dla zadań, które nie zostały jeszcze rozpoczęte",
  DEST_SETTINGS_QUEST_UNDONE_MAIN_PIN_COLOR = "Kolor punktu dla głównego zadania",
  DEST_SETTINGS_QUEST_UNDONE_MAIN_PIN_COLOR_TT = "Ustawia kolor punktów dla zadań GŁÓWNEGO WĄTKU, które nie zostały jeszcze rozpoczęte",
  DEST_SETTINGS_QUEST_UNDONE_DAY_PIN_COLOR = "Kolor punktu codziennych zadań",
  DEST_SETTINGS_QUEST_UNDONE_DAY_PIN_COLOR_TT = "Ustawia kolor PUNKTÓW dla codziennych zadań, które nie zostały jeszcze rozpoczęte",
  DEST_SETTINGS_QUEST_UNDONE_REP_PIN_COLOR = "Kolor punktu powtarzalnych zadań",
  DEST_SETTINGS_QUEST_UNDONE_REP_PIN_COLOR_TT = "Ustawia kolor PUNKTÓW dla powtarzalnych zadań, które nie zostały jeszcze rozpoczęte",
  DEST_SETTINGS_QUEST_UNDONE_DUN_PIN_COLOR = "Kolor punktu zadań w lochach",
  DEST_SETTINGS_QUEST_UNDONE_DUN_PIN_COLOR_TT = "Ustawia kolor PUNKTÓW dla zadań w lochach, jeszcze nie rozpoczętych",
  DEST_SETTINGS_QUEST_UNDONE_PINTEXT_COLOR = "Kolor tekstu zleceniodawców zadań",
  DEST_SETTINGS_QUEST_UNDONE_PINTEXT_COLOR_TT = "Ustawia kolor TEKSTU punktów dla zadań, które nie zostały jeszcze rozpoczęte",
  DEST_SETTINGS_QUEST_INPROGRESS_PIN_TOGGLE = "Pokaż zadania w trakcie",
  DEST_SETTINGS_QUEST_INPROGRESS_PIN_SIZE = "Wielkość punktu zadań w trakcie",
  DEST_SETTINGS_QUEST_INPROGRESS_PIN_COLOR = "Kolor punktu zadań w trakcie",
  DEST_SETTINGS_QUEST_INPROGRESS_PIN_COLOR_TT = "Ustawia kolor PUNKTÓW dla zadań w dzienniku (lista zadań)",
  DEST_SETTINGS_QUEST_INPROGRESS_PINTEXT_COLOR = "Kolor tekstu zadań w trakcie",
  DEST_SETTINGS_QUEST_INPROGRESS_PINTEXT_COLOR_TT = "Ustawia kolor TEKSTU punktów dla zadań w dzienniku (lista zadań)",
  DEST_SETTINGS_QUEST_DONE_PIN_TOGGLE = "Pokaż ukończone zadania",
  DEST_SETTINGS_QUEST_DONE_PIN_SIZE = "Wielkość punktu ukończonych zadań",
  DEST_SETTINGS_QUEST_DONE_PIN_COLOR = "Kolor punktu ukończonych zadań",
  DEST_SETTINGS_QUEST_DONE_PIN_COLOR_TT = "Ustawia kolor PUNKTÓW dla ukończonych zadań",
  DEST_SETTINGS_QUEST_DONE_PINTEXT_COLOR = "Kolor tekstu ukończonych zadań",
  DEST_SETTINGS_QUEST_DONE_PINTEXT_COLOR_TT = "Ustawia kolor TEKSTU punktów ukończonych zadań",
  DEST_SETTINGS_QUEST_CADWELLS_PIN_TOGGLE = "Pokaż Almanach Cadwella",
  DEST_SETTINGS_QUEST_CADWELLS_PIN_TOGGLE_TT = "Pokazuje/ukrywa marker 'Almanach Cadwella' przy zadaniach",
  DEST_SETTINGS_QUEST_CADWELLS_ONLY_PIN_TOGGLE = "Ukryj inne zadania",
  DEST_SETTINGS_QUEST_CADWELLS_ONLY_PIN_TOGGLE_TT = "Pokazuje/ukrywa wszystkie zwykłe zadania, które NIE są częścią Almanachu Cadwella",
  DEST_SETTINGS_QUEST_WRITS_PIN_TOGGLE = "Pokaż zlecenia",
  DEST_SETTINGS_QUEST_WRITS_PIN_TOGGLE_TT = "Pokazuje/ukrywa zlecenia",
  DEST_SETTINGS_QUEST_DAILIES_PIN_TOGGLE = "Pokaż zadania codzienne",
  DEST_SETTINGS_QUEST_DAILIES_PIN_TOGGLE_TT = "Pokazuje/ukrywa zadania codzienne",
  DEST_SETTINGS_QUEST_REPEATABLES_PIN_TOGGLE = "Pokaż powtarzalne zadania",
  DEST_SETTINGS_QUEST_REPEATABLES_PIN_TOGGLE_TT = "Pokazuje/ukrywa powtarzalne zadania",
  DEST_SETTINGS_QUEST_ALL_PIN_LAYER = "Pin layer for all Quest pins",
  DEST_SETTINGS_QUEST_COMPASS_TOGGLE = "Pokaż punkty zadań na kompasie",
  DEST_SETTINGS_QUEST_COMPASS_DIST = "Odległość dla punktów zadań na kompasie",
  DEST_SETTINGS_REGISTER_QUESTS_TOGGLE = "Rejestracja zadań",
  DEST_SETTINGS_REGISTER_QUESTS_TOGGLE_TT = "Zapisuje informacje o zadaniu w zmiennych raportowania. Aby uzyskać więcej informacji, odwiedź stronę Destinations ESOUI.com.",
  DEST_SETTINGS_QUEST_RESET_HIDDEN = "Reset ukrytych zadań",
  DEST_SETTINGS_QUEST_RESET_HIDDEN_TT = "Resetuje WSZYSTKIE ukryte zadania i ponownie wyświetla je na mapie/radarze.",

  DEST_SETTINGS_COLLECTIBLES_HEADER = "Pozycja przedmiotów kolekcjonerskich",
  DEST_SETTINGS_COLLECTIBLES_HEADER_TT = "To podmenu obejmuje wszystkie ustawienia związane z przedmiotami kolekcjonerskimi.",
  DEST_SETTINGS_COLLECTIBLES_SUBHEADER = "Ustawienia przedmiotów kolekcjonerskich",
  DEST_SETTINGS_COLLECTIBLES_COLORS_HEADER = "Kolor punktu przedmiotów kolekcjonerskich ",
  DEST_SETTINGS_COLLECTIBLES_MISC_HEADER = "Różne",

  DEST_SETTINGS_COLLECTIBLES_TOGGLE = "Pokaż nieukończone przedmioty kolekcjonerskie",
  DEST_SETTINGS_COLLECTIBLES_TOGGLE_TT = "Pokazuje obszary, w których można zabić bestie, aby zebrać przedmioty kolekcjonerskie za osiągnięcia",
  DEST_SETTINGS_COLLECTIBLES_DONE_TOGGLE = "Pokaż ukończone przedmioty kolekcjonerskie",
  DEST_SETTINGS_COLLECTIBLES_DONE_TOGGLE_TT = "Pokaż ukończone obszary przedmiotów kolekcjonerskich",
  DEST_SETTINGS_COLLECTIBLES_PIN_STYLE = "Styl punktu przedmiotów kolekcjonerskich",
  DEST_SETTINGS_COLLECTIBLES_SHOW_MOBNAME = "Pokaż nazwy mobów dla punktów",
  DEST_SETTINGS_COLLECTIBLES_SHOW_MOBNAME_TT = "‎Pokazuje nazwy potworów (w języku angielskim w tej chwili), które mogą upuścić przedmioty potrzebne do ukończenia ‎‎osiągnięcia‎",
  DEST_SETTINGS_COLLECTIBLES_SHOW_ITEM = "Pokaż punkty z nazwami przedmiotów",
  DEST_SETTINGS_COLLECTIBLES_SHOW_ITEM_TT = "Pokazuje nazwy przedmiotów potrzebnych do ukończenia osiągnięcia",
  DEST_SETTINGS_COLLECTIBLES_PIN_SIZE = "Wielkość punktów przedmiotów kolekcjonerskich",
  DEST_SETTINGS_COLLECTIBLES_PIN_SIZE_TT = "Wielkość punktów przedmiotów kolekcjonerskich",
  DEST_SETTINGS_COLLECTIBLES_PIN_LAYER = "Pin layer for Collectibles",
  DEST_SETTINGS_COLLECTIBLES_PIN_LAYER_TT = "Pin layer for Collectibles",
  DEST_SETTINGS_COLLECTIBLES_COMPASS_TOGGLE = "Pokaż na kompasie",
  DEST_SETTINGS_COLLECTIBLES_COMPASS_TOGGLE_TT = "Pokaż przedmioty kolekcjonerskie na kompasie",
  DEST_SETTINGS_COLLECTIBLES_COMPASS_DIST = "Odległość na kompasie",
  DEST_SETTINGS_COLLECTIBLES_COMPASS_DIST_TT = "Odległość obszarów przedmiotów kolekcjonerskich na kompasie",
  DEST_SETTINGS_COLLECTIBLES_COLOR_TITLE = "Kolor tekstu tytułu nagłówka",
  DEST_SETTINGS_COLLECTIBLES_COLOR_TITLE_TT = "Wpływa na tytuł tekstu osiągnięć przedmiotów kolekcjonerskich",
  DEST_SETTINGS_COLLECTIBLES_PIN_COLOR = "Kolor punktu brakujących",
  DEST_SETTINGS_COLLECTIBLES_PIN_COLOR_TT = "Ustawia kolor PUNKTÓW dla brakujących przedmiotów kolekcjonerskich",
  DEST_SETTINGS_COLLECTIBLES_COLOR_UNDONE = "Kolor tekstu brakujących",
  DEST_SETTINGS_COLLECTIBLES_COLOR_UNDONE_TT = "Wpływa na TEKST punktu brakujących przedmiotów kolekcjonerskich",
  DEST_SETTINGS_COLLECTIBLES_PIN_COLOR_DONE = "Kolor punktu ukończonych",
  DEST_SETTINGS_COLLECTIBLES_PIN_COLOR_DONE_TT = "Ustawia kolor PUNKTÓW dla ukończonych przedmiotów kolekcjonerskich",
  DEST_SETTINGS_COLLECTIBLES_COLOR_DONE = "Kolor tekstu ukończonych",
  DEST_SETTINGS_COLLECTIBLES_COLOR_DONE_TT = "Wpływa na TEKST punktu ukończonych przedmiotów kolekcjonerskich",

  DEST_SETTINGS_FISHING_HEADER = "Pozycje połowów ryb",
  DEST_SETTINGS_FISHING_HEADER_TT = "To podmenu obejmuje wszystkie ustawienia związane z połowem ryb.",
  DEST_SETTINGS_FISHING_SUBHEADER = "Ustawienia połowu ryb",
  DEST_SETTINGS_FISHING_PIN_TEXT_HEADER = "Tekst punktu połowu ryb",
  DEST_SETTINGS_FISHING_COLOR_HEADER = "Kolor punktu połowu ryb",
  DEST_SETTINGS_FISHING_MISC_HEADER = "Różne",

  DEST_SETTINGS_FISHING_TOGGLE = "Pokaż nieukończone pozycje",
  DEST_SETTINGS_FISHING_TOGGLE_TT = "Pokazuje łowiska, w których istnieje szansa złowienia ryb za osiągnięcia",
  DEST_SETTINGS_FISHING_DONE_TOGGLE = "Pokaż ukończone pozycje",
  DEST_SETTINGS_FISHING_DONE_TOGGLE_TT = "Pokazuje ukończone pozycje łowisk",
  DEST_SETTINGS_FISHING_PIN_STYLE = "Styl punktu połowu ryb",
  DEST_SETTINGS_FISHING_SHOW_FISHNAME = "Pokaż nazwy ryb przy punktach",
  DEST_SETTINGS_FISHING_SHOW_FISHNAME_TT = "Pokazuje brakujące ryby dla tego typu wód",
  DEST_SETTINGS_FISHING_SHOW_BAIT = "Pokaż optymalną przynętę przy punktach",
  DEST_SETTINGS_FISHING_SHOW_BAIT_TT = "Pokazuje optymalną przynętę do użycia",
  DEST_SETTINGS_FISHING_SHOW_BAIT_LEFT = "Pokaż przynętę pozostałą przy punktach",
  DEST_SETTINGS_FISHING_SHOW_BAIT_LEFT_TT = "Pokazuje, ile przynęt optymalnego typu pozostało w twojej torbie. JEŚLI jest trzecia liczba, to jest to prosta przynęta",
  DEST_SETTINGS_FISHING_SHOW_WATER = "Pokaż typ wody przy punktach",
  DEST_SETTINGS_FISHING_SHOW_WATER_TT = "Pokazuje rodzaj wody",
  DEST_SETTINGS_FISHING_PIN_SIZE = "Wielkość punktu połowu ryb",
  DEST_SETTINGS_FISHING_PIN_SIZE_TT = "Wielkość punktu połowu ryb",
  DEST_SETTINGS_FISHING_PIN_LAYER = "Pin layer for Fishing",
  DEST_SETTINGS_FISHING_PIN_LAYER_TT = "Pin layer for Fishing",
  DEST_SETTINGS_FISHING_COMPASS_TOGGLE = "Pokaż na kompasie",
  DEST_SETTINGS_FISHING_COMPASS_TOGGLE_TT = "Pokaż łowiska na kompasie",
  DEST_SETTINGS_FISHING_COMPASS_DIST = "Odległość na kompasie",
  DEST_SETTINGS_FISHING_COMPASS_DIST_TT = "Odległość łowisk na kompasie",
  DEST_SETTINGS_FISHING_COLOR_TITLE = "Kolor tekstu tytułu osiągnięć",
  DEST_SETTINGS_FISHING_COLOR_TITLE_TT = "Wpływa na tytuł tekstu osiągnięć łowienia",
  DEST_SETTINGS_FISHING_PIN_COLOR = "Kolor punktu brakujących",
  DEST_SETTINGS_FISHING_PIN_COLOR_TT = "Ustawia kolor PUNKTÓW dla brakującej ryby",
  DEST_SETTINGS_FISHING_COLOR_UNDONE = "Kolor tekstu brakujących",
  DEST_SETTINGS_FISHING_COLOR_UNDONE_TT = "Wpływa na TEKST punktu brakującej ryby",
  DEST_SETTINGS_FISHING_COLOR_BAIT_UNDONE = "Kolor tekstu brakującego typu przynęty",
  DEST_SETTINGS_FISHING_COLOR_BAIT_UNDONE_TT = "Wpływa na tekst PRZYNĘTY brakującej ryby, jeśli jest aktywowany",
  DEST_SETTINGS_FISHING_COLOR_WATER_UNDONE = "Kolor tekstu brakującego typu wód",
  DEST_SETTINGS_FISHING_COLOR_WATER_UNDONE_TT = "Wpływa na tekst WÓD dla brakującej ryby, jeśli jest aktywowany",
  DEST_SETTINGS_FISHING_PIN_COLOR_DONE = "Kolor punktu ukończonych",
  DEST_SETTINGS_FISHING_PIN_COLOR_DONE_TT = "Ustawia kolor PUNKTÓW dla zebranych ryb",
  DEST_SETTINGS_FISHING_COLOR_DONE = "Kolor tekstu ukończonych",
  DEST_SETTINGS_FISHING_COLOR_DONE_TT = "Wpływa na TEKST punktu dla ukończonej ryby",
  DEST_SETTINGS_FISHING_COLOR_BAIT_DONE = "Kolor tekstu dla ukończonego typu przynęty",
  DEST_SETTINGS_FISHING_COLOR_BAIT_DONE_TT = "Wpływa na tekst PRZYNĘTY dla ukończonej ryby, jeśli jest aktywowany",
  DEST_SETTINGS_FISHING_COLOR_WATER_DONE = "Kolor tekstu ukończonego typu wód",
  DEST_SETTINGS_FISHING_COLOR_WATER_DONE_TT = "Wpływa na tekst WÓD dla ukończonej ryby, jeśli jest aktywny",

  DEST_SETTINGS_MAPFILTERS_HEADER = "Filtrowanie mapy",
  DEST_SETTINGS_MAPFILTERS_HEADER_TT = "To podmenu obejmuje wszystkie ustawienia związane z filtrowaniem mapy.",
  DEST_SETTINGS_MAPFILTERS_SUBHEADER = "Ustawienia filtrowania mapy",

  DEST_SETTINGS_MAPFILTERS_POIS_TOGGLE = "Pokaż filtrowanie mapy POI",
  DEST_SETTINGS_MAPFILTERS_POIS_TOGGLE_TT = "Pokazuje/ukrywa filtrowanie mapy dla wszystkich interesujących miejsc.",
  DEST_SETTINGS_MAPFILTERS_ACHS_TOGGLE = "Pokaż filtrowanie mapy związane z osiągnięciami",
  DEST_SETTINGS_MAPFILTERS_ACHS_TOGGLE_TT = "Pokazuje/ukrywa filtrowanie mapy dla wszystkich osiągnięć.",
  DEST_SETTINGS_MAPFILTERS_QUES_TOGGLE = "Pokaż filtrowanie mapy dla zleceniodawców zadań",
  DEST_SETTINGS_MAPFILTERS_QUES_TOGGLE_TT = "Pokazuje/ukrywa filtrowanie mapy dla wszystkich zleceniodawców zadań.",
  DEST_SETTINGS_MAPFILTERS_COLS_TOGGLE = "Pokaż filtrowanie mapy dla przedmiotów kolekcjonerskich",
  DEST_SETTINGS_MAPFILTERS_COLS_TOGGLE_TT = "Pokazuje/ukrywa filtrowanie mapy dla wszystkich przedmiotów kolekcjonerskich.",
  DEST_SETTINGS_MAPFILTERS_FISS_TOGGLE = "Pokaż filtrowanie mapy dla połowu ryb",
  DEST_SETTINGS_MAPFILTERS_FISS_TOGGLE_TT = "Pokazuje/ukrywa filtrowanie mapy dla wszystkich łowisk.",
  DEST_SETTINGS_MAPFILTERS_MISS_TOGGLE = "Pokaż filtrowanie mapy dla różnych",
  DEST_SETTINGS_MAPFILTERS_MISS_TOGGLE_TT = "Pokaż /ukryj filtry mapy dla różnych pinów (Ayleid Wells, Dwemer Ruins, Craglorn Border, a także wszystkie szpilki Werewolf i Vampire).",

  GLOBAL_SETTINGS_SELECT_TEXT_ONLY = "Tylko tekst!",

  DEST_SETTINGS_RESET = "Przywróć ustawienia domyślne",

  --POI Types
  POITYPE_AOI = "Obszar zainteresowań",
  POITYPE_HOUSING = "Dom",
  POITYPE_CRAFTING = "Lokacje rzemieślnicze",
  POITYPE_DELVE = "Grota",
  POITYPE_DOLMEN = "Dolmen",
  POITYPE_GATE = "Brama",
  POITYPE_GROUPBOSS = "Grupowy boss",
  POITYPE_GROUPDELVE = "Grupowa grota",
  POITYPE_GROUPDUNGEON = "Grupowy loch",
  POITYPE_GROUPEVENT = "Grupowe wydarzenie",
  POITYPE_MUNDUS = "Kamień Mundus",
  POITYPE_PUBLICDUNGEON = "Publiczny loch",
  POITYPE_QUESTHUB = "Quest Hub",
  POITYPE_SOLOTRIAL = "Próba",
  POITYPE_TRADER = "Kupcy gildii",
  POITYPE_TRIALINSTANCE = "Instancja próby",
  POITYPE_UNKNOWN = "Nieznane",
  POITYPE_WAYSHRINE = "Kapliczka",
  POITYPE_VAULT = "Skarbiec",
  POITYPE_DARK_BROTHERHOOD = "Mroczne Bractwo",
  POITYPE_BREAKING_ENTERING = "Włamanie i wtargnięcie",
  POITYPE_CUTPURSE_ABOVE = "Nadkieszonkowiec",

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

  POITYPE_AYLEID_WELL = "Ayleidzka studnia",
  POITYPE_DEADLANDS_ENTRANCE = "Deadlands Entrance",
  POITYPE_WWVAMP = "Wilkołaki/Wampiry",
  POITYPE_VAMPIRE_ALTAR = "Wampirzy Ołtarz",
  POITYPE_DWEMER_RUIN = "Dwemerowe ruiny",
  POITYPE_WEREWOLF_SHRINE = "Wilkołacza kapliczka",

  POITYPE_COLLECTIBLE = "Collectibles",
  POITYPE_FISH = "Fishing",
  POITYPE_UNDETERMINED = "Nieokreślone",

  -- Quest completion editing texts
  QUEST_EDIT_ON = "Edycja zleceniodawców zadań Destinations jest włączona!",
  QUEST_EDIT_OFF = "Edycja zleceniodawców zadań Destinations jest wyłączona!",
  QUEST_MENU_NOT_FOUND = "Nie można znaleźć zadania w bazie danych",
  QUEST_MENU_HIDE_QUEST = "Ukryj ten punkt zadania",
  QUEST_MENU_DISABLE_EDIT = "Wyłącz edycję",

  -- Quest types
  QUESTTYPE_NONE = "Zadanie",
  QUESTTYPE_GROUP = "Grupowe zadanie",
  QUESTTYPE_MAIN_STORY = "Zadanie głównego wątku",
  QUESTTYPE_GUILD = "Zadanie gildii",
  QUESTTYPE_CRAFTING = "Zadanie rzemieślnicze",
  QUESTTYPE_DUNGEON = "Zadanie lochu",
  QUESTTYPE_RAID = "Zadanie próby",
  QUESTTYPE_AVA = "Zadanie wojny frakcji",
  QUESTTYPE_CLASS = "Zadanie klasowe",
  QUESTTYPE_QA_TEST = "Q&A Test Quest",
  QUESTTYPE_AVA_GROUP = "Grupowe zadanie wojny frakcji",
  QUESTTYPE_AVA_GRAND = "Alliance War Grand Quest",
  QUESTREPEAT_NOT_REPEATABLE = "Zwykłe zadanie",
  QUESTREPEAT_REPEATABLE = "Powtarzalne zadanie",
  QUESTREPEAT_DAILY = "Dzienne zadanie",

  -- Fishing
  FISHING_FOUL = "Foul Water",
  FISHING_RIVER = "Rzeka",
  FISHING_OCEAN = "Ocean",
  FISHING_LAKE = "Jezioro",
  FISHING_UNKNOWN = "- nieznane -",
  FISHING_FOUL_BAIT = "Robak/przynęta",
  FISHING_RIVER_BAIT = "Cześć owadów/Shad",
  FISHING_OCEAN_BAIT = "Worms/Chub",
  FISHING_LAKE_BAIT = "Guts/Minnow",
  FISHING_HWBC = "Crab-Slaughter-Crane",

  -- Destinations chat commands
  DESTCOMMANDS = "Lista komend Destinations:",
  DESTCOMMANDdhlp = "/dhlp (Pomoc Destinations): Właśnie jej użyłeś;)",
  DESTCOMMANDdset = "/ dset (Ustawienia Destinations): Otwiera okno Ustawienia Destinations.",
  DESTCOMMANDdqed = "/dqed (Edytor Destinations): To polecenie PRZEŁĄCZA do edycji punktu zadań. Na czacie pokaże się informacja , o włączeniu i wyłączeniu tej funkcji. Po włączeniu otwórz mapę i kliknij punkty, które chcesz oznaczyć jako ukończone lub nieukończone. Pamiętaj, aby WYŁĄCZYĆ tą funkcje po zakończeniu edycji, powtarzając polecenie!",

  -- Destinations Misc
  LOAD_NEW_QUEST_FORMAT = "Zresetuj dane zadań",
  LOAD_NEW_QUEST_FORMAT_TT = "Spowoduje to ponowne załadowanie wszystkich znanych zadań do nowej tabeli. Gra wykona operację /reloadui, aby ukończyć tą operację.",
  RELOADUI_WARNING = "Jeśli klikniesz ten przycisk, gra wykona operację /reloadui",
  RELOADUI_INFO = "Zmiany tego ustawienia będą obowiązywać dopiero po kliknięciu przycisku 'ReloadUI'.",
  DEST_SETTINGS_RELOADUI = "ReloadUI",
  DEST_SET_REQUIREMENT = "Wymaga cechy: <<1>>",
}

for key, value in pairs(strings) do
  ZO_CreateStringId(key, value)
  SafeAddVersion(key, 1)
end
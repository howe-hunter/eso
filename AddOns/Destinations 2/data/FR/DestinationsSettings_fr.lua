﻿-------------------------------------------
-- French localization for Destinations --
-------------------------------------------
local strings = {

  --Map Filter Tags
  DEST_FILTER_UNKNOWN = "(Dest) PI Inconnus",
  DEST_FILTER_KNOWN = "(Dest) PI Connus",
  DEST_FILTER_OTHER = "(Dest) Autres succès",
  DEST_FILTER_OTHER_DONE = "(Dest) Autres succès obtenus",
  DEST_FILTER_MAIQ = "(Dest) " .. zo_strformat(GetAchievementInfo(872)),
  DEST_FILTER_MAIQ_DONE = "(Dest) Finis - " .. zo_strformat(GetAchievementInfo(872)) .. "",
  DEST_FILTER_PEACEMAKER = "(Dest) " .. zo_strformat(GetAchievementInfo(716)),
  DEST_FILTER_PEACEMAKER_DONE = "(Dest) Finis - " .. zo_strformat(GetAchievementInfo(716)) .. "",
  DEST_FILTER_NOSEDIVER = "(Dest) " .. zo_strformat(GetAchievementInfo(406)),
  DEST_FILTER_NOSEDIVER_DONE = "(Dest) Finis - " .. zo_strformat(GetAchievementInfo(406)) .. "",
  DEST_FILTER_EARTHLYPOS = "(Dest) " .. zo_strformat(GetAchievementInfo(1121)),
  DEST_FILTER_EARTHLYPOS_DONE = "(Dest) Finis - " .. zo_strformat(GetAchievementInfo(1121)) .. "",
  DEST_FILTER_ON_ME = "(Dest) " .. zo_strformat(GetAchievementInfo(704)),
  DEST_FILTER_ON_ME_DONE = "(Dest) Finis - " .. zo_strformat(GetAchievementInfo(704)) .. "",
  DEST_FILTER_BRAWL = "(Dest) " .. zo_strformat(GetAchievementInfo(1247)),
  DEST_FILTER_BRAWL_DONE = "(Dest) Finis - " .. zo_strformat(GetAchievementInfo(1247)) .. "",
  DEST_FILTER_PATRON = "(Dest) " .. zo_strformat(GetAchievementInfo(1316)),
  DEST_FILTER_PATRON_DONE = "(Dest) Finis - " .. zo_strformat(GetAchievementInfo(1316)) .. "",
  DEST_FILTER_WROTHGAR_JUMPER = "(Dest) " .. zo_strformat(GetAchievementInfo(1331)),
  DEST_FILTER_WROTHGAR_JUMPER_DONE = "(Dest) Finis - " .. zo_strformat(GetAchievementInfo(1331)) .. "",
  DEST_FILTER_RELIC_HUNTER = "(Dest) " .. zo_strformat(GetAchievementInfo(1250)),
  DEST_FILTER_RELIC_HUNTER_DONE = "(Dest) Finis - " .. zo_strformat(GetAchievementInfo(1250)) .. "",
  DEST_FILTER_BREAKING_ENTERING = "(Dest) " .. zo_strformat(GetAchievementInfo(1349)),
  DEST_FILTER_BREAKING_ENTERING_DONE = "(Dest) Finis - " .. zo_strformat(GetAchievementInfo(1349)) .. "",
  DEST_FILTER_CUTPURSE_ABOVE = "(Dest) " .. zo_strformat(GetAchievementInfo(1383)),
  DEST_FILTER_CUTPURSE_ABOVE_DONE = "(Dest) Finis - " .. zo_strformat(GetAchievementInfo(1383)) .. "",

  DEST_FILTER_CHAMPION = "(Dest) Champions de donjon",
  DEST_FILTER_CHAMPION_DONE = "(Dest) Champions de donjon tués",

  DEST_FILTER_COLLECTIBLE = "(Dest) Trophées non collectés",
  DEST_FILTER_COLLECTIBLE_DONE = "(Dest) Trophées collectés",

  DEST_FILTER_FISHING = "(Dest) Emplacement de pèche",
  DEST_FILTER_FISHING_DONE = "(Dest) Emplacement de pête visités",

  DEST_FILTER_QUESTGIVER = "(Dest) Donneurs de quête",
  DEST_FILTER_QUESTS_IN_PROGRESS = "(Dest) Quêtes en cours",
  DEST_FILTER_QUESTS_DONE = "(Dest) Quêtes achevées",

  DEST_FILTER_AYLEID = "(Dest) Puits ayléides",
  DEST_FILTER_DEADLANDS_ENTRANCE = "(Dest) Deadlands Entrance",
  DEST_FILTER_DWEMER = "(Dest) Ruines Dwemer",
  DEST_FILTER_BORDER = "(Dest) Frontière de Raidelorn",

  DEST_FILTER_WWVAMP = "(Dest) Loups-garous & Vampires",
  DEST_FILTER_VAMPIRE_ALTAR = "(Dest) Autels Vampire",
  DEST_FILTER_WEREWOLF_SHRINE = "(Dest) Sanctuaires Loup-garou",

  --Settings Menu
  DEST_SETTINGS_TITLE = "Destinations",

  DEST_SETTINGS_IMPROVEMENT_HEADER = "Amélioration des PI",
  DEST_SETTINGS_IMPROVEMENT_HEADER_TT = "Améliorer les points d'intérêt connus et inconnus",
  DEST_SETTINGS_POI_ENGLISH_TEXT_HEADER = "Nom anglais des points d'intérêt",
  DEST_SETTINGS_POI_SHOW_ENGLISH = "Afficher le nom anglais des points d'intérêt",
  DEST_SETTINGS_POI_SHOW_ENGLISH_TT = "Afficher le nom anglais des points d'intérêt en haut de la carte",
  DEST_SETTINGS_POI_ENGLISH_COLOR = "Couleur du texte des noms anglais de PI",
  DEST_SETTINGS_POI_ENGLISH_COLOR_TT = "Définissez la couleur des noms anglais des PI",
  DEST_SETTINGS_POI_SHOW_ENGLISH_KEEPS = "Afficher les noms anglais des forts",
  DEST_SETTINGS_POI_SHOW_ENGLISH_KEEPS_TT = "Afficher les noms anglais sur le tooltip des forts",
  DEST_SETTINGS_POI_ENGLISH_KEEPS_COLOR = "Couleur du nom du fort anglais",
  DEST_SETTINGS_POI_ENGLISH_KEEPS_COLOR_TT = "Définissez la couleur de la traduction du nom du fort anglais",
  DEST_SETTINGS_POI_ENGLISH_KEEPS_HA = "Masquer le nom de l'alliance",
  DEST_SETTINGS_POI_ENGLISH_KEEPS_HA_TT = "Masquer le nom de l'alliance sur les tooltips des forts",
  DEST_SETTINGS_POI_ENGLISH_KEEPS_NL = "Ajouter une nouvelle ligne",
  DEST_SETTINGS_POI_ENGLISH_KEEPS_NL_TT = "Ajouter une nouvelle ligne sur les tooltips de fort pour le nom anglais",
  DEST_SETTINGS_POI_IMPROVE_MUNDUS = "Améliorer les PI des Pierres de Mundus",
  DEST_SETTINGS_POI_IMPROVE_MUNDUS_TT = "Améliorer les points d'intérêt des Pierres de Mundus en ajoutant la description de l'effet sur le tooltip",
  DEST_SETTINGS_POI_IMPROVE_CRAFTING = "Améliorer les PI des Stations d'artisanat",
  DEST_SETTINGS_POI_IMPROVE_CRAFTING_TT = "Améliorer les points d'intérêt des Stations d'artisanat en ajoutant la description du set sur le tooltip",

  DEST_SETTINGS_USE_ACCOUNTWIDE = "Paramètres communs au compte",
  DEST_SETTINGS_USE_ACCOUNTWIDE_TT = "Si activé, les paramètres seront les mêmes pour TOUS les personnages.",
  DEST_SETTINGS_RELOAD_WARNING = "Modifier ce paramètre déclenchera un /reloadui instantanné.",
  DEST_SETTINGS_PER_CHAR_HEADER = "Les paramètres indiquées avec un '*' jaune n'affectent que le personnage actuel.",
  DEST_SETTINGS_PER_CHAR = "*",
  DEST_SETTINGS_PER_CHAR_TOGGLE_TT = "Cette option n'affecte que le personnage actuel.",
  DEST_SETTINGS_PER_CHAR_BUTTON_TT = "Ce bouton n'affecte que le personnage actuel",

  DEST_SETTINGS_POI_HEADER = "Points d'intérêt inconnus",
  DEST_SETTINGS_POI_HEADER_TT = "Ce menu gère les points d'intérêts encore inconnus",
  DEST_SETTINGS_POI_UNKOWN_SUBHEADER = "Unknown Points of Interest",
  DEST_SETTINGS_POI_KNOWN_SUBHEADER = "Known Points of Interest",
  DEST_SETTINGS_POIS_ENGLISH_TEXT_HEADER = "English text on Points of interest",

  DEST_SETTINGS_UNKNOWN_PIN_TOGGLE = "Afficher les PI inconnus",
  DEST_SETTINGS_UNKNOWN_PIN_STYLE = "Epingle pour les PI inconnus",
  DEST_SETTINGS_UNKNOWN_PIN_SIZE = "Taille de l'icône des PI inconnus",
  DEST_SETTINGS_UNKNOWN_PIN_LAYER = "Couche d'affichage des PI inconnus",
  DEST_SETTINGS_UNKNOWN_COLOR = "Couleur du texte des PI inconnus",
  DEST_SETTINGS_UNKNOWN_COLOR_TT = "Défini la couleur du texte tous les Points d'Intérêt inconnus",
  DEST_SETTINGS_UNKNOWN_COLOR_EN = "Couleur du texte Anglais des PI inconnus",
  DEST_SETTINGS_UNKNOWN_COLOR_EN_TT = "Défini la couleur des textes en anglais pour tous les Points d'Intérêt inconnus, si activé.",
  DEST_SETTINGS_KNOWN_PIN_TOGGLE = "Afficher les PI connus",
  DEST_SETTINGS_KNOWN_PIN_STYLE = "Epingle pour les PI connus",
  DEST_SETTINGS_KNOWN_PIN_SIZE = "Taille de l'icône des PI connus",
  DEST_SETTINGS_KNOWN_PIN_LAYER = "Couche d'affichage des PI connus",
  DEST_SETTINGS_KNOWN_COLOR = "Couleur du texte des PI connus",
  DEST_SETTINGS_KNOWN_COLOR_TT = "Défini la couleur du texte de tous les Points d'Intérêt connus",
  DEST_SETTINGS_KNOWN_COLOR_EN = "Couleur du texte Anglais des PI connus",
  DEST_SETTINGS_KNOWN_COLOR_EN_TT = "Défini la couleur des textes textes en anglais pour tous les Points d'Interêt connus, si activé",
  DEST_SETTINGS_MUNDUS_DETAIL_PIN_TOGGLE = "Afficher le détail des Pierres de Mundus",
  DEST_SETTINGS_MUNDUS_TXT_COLOR = "Couleur du texte des Pierres de Mundus",
  DEST_SETTINGS_MUNDUS_TXT_COLOR_TT = "Défini la couleur du texte de détail des Pierres de Mundus",
  DEST_SETTINGS_GTRADER_COLOR = "Couleur du texte des Commercants de Guilde",
  DEST_SETTINGS_GTRADER_COLOR_TT = "Défini la couleur du texte des Commercants de guilde  sur les Oratoires",
  DEST_SETTINGS_ALL_SHOW_ENGLISH = "Afficher également les noms des PI en Anglais",

  DEST_SETTINGS_ACH_HEADER = "Emplacements des Succès",
  DEST_SETTINGS_ACH_HEADER_TT = "Ce sous-menu couvre la plupart des succès du jeu (la liste est trop longue)",
  DEST_SETTINGS_ACH_PIN_TOGGLE = "Afficher les Succès inachevés",
  DEST_SETTINGS_ACH_PIN_TOGGLE_DONE = "Afficher les Succès achevés",
  DEST_SETTINGS_ACH_PIN_STYLE = "Style d'icône pour les Succès",
  DEST_SETTINGS_ACH_PIN_SIZE = "Taille de l'icône des Succès",

  DEST_SETTINGS_ACH_OTHER_HEADER = "'Port. lumière', 'Don aux pauvres' et 'Crime paye'",
  DEST_SETTINGS_ACH_MAIQ_HEADER = "'Il n'y a que M'aiq qui m'aille'",
  DEST_SETTINGS_ACH_PEACEMAKER_HEADER = "'Pacificateur'",
  DEST_SETTINGS_ACH_NOSEDIVER_HEADER = "'Plongeur en piqué'",
  DEST_SETTINGS_ACH_EARTHLYPOS_HEADER = "'Possessions terrestre'",
  DEST_SETTINGS_ACH_ON_ME_HEADER = "'C'est ma tournée'",
  DEST_SETTINGS_ACH_BRAWL_HEADER = "'Une dernière bagarre'",
  DEST_SETTINGS_ACH_PATRON_HEADER = "'Mécène d'Orsinium'",
  DEST_SETTINGS_ACH_WROTHGAR_JUMPER_HEADER = "'Sauteur des falaise de Wrothgar'",
  DEST_SETTINGS_ACH_RELIC_HUNTER_HEADER = "'Chasseur de reliques de Wrothgar'",
  DEST_SETTINGS_ACH_BREAKING_HEADER = "'Breaking and Entering'",
  DEST_SETTINGS_ACH_CUTPURSE_HEADER = "'A Cutpurse Above'",

  DEST_SETTINGS_ACH_CHAMPION_PIN_HEADER = "Champions de Donjon",
  DEST_SETTINGS_ACH_CHAMPION_ZONE_PIN_TOGGLE = "Afficher sur la carte de Zone",
  DEST_SETTINGS_ACH_CHAMPION_ZONE_PIN_TOGGLE_TT = "Cette options est pour afficher les Champions (de donjon solo) sur la CARTE DE ZONE",
  DEST_SETTINGS_ACH_CHAMPION_FRONT_PIN_TOGGLE = "Icône de zone au-dessus",
  DEST_SETTINGS_ACH_CHAMPION_FRONT_PIN_TOGGLE_TT = "Activer pour que  les icônes de soient zône au dessus (si actives) des icônes des donjons ou non.",
  DEST_SETTINGS_ACH_CHAMPION_PIN_SIZE = "Taille des icônes des Champions de Donjon",

  DEST_SETTINGS_ACH_GLOBAL_HEADER = "Emplacements des Succès - Paramètres globaux",
  DEST_SETTINGS_ACH_GLOBAL_HEADER_TT = "Ce sous-menu couvre les options globales des Succès",
  DEST_SETTINGS_ACH_ALL_PIN_LAYER = "Couche d'affichage des icônes pour tous les Succès",
  DEST_SETTINGS_ACH_PIN_COLOR_MISS = "Couleur de l'icône (inachevé)",
  DEST_SETTINGS_ACH_PIN_COLOR_MISS_TT = "Défini la couleur de l'icône des Succès inachevés",
  DEST_SETTINGS_ACH_TXT_COLOR_MISS = "Couleur du texte (incomplet)",
  DEST_SETTINGS_ACH_TXT_COLOR_MISS_TT = "Défini la couleur du texte des Sussècs inachevés",
  DEST_SETTINGS_ACH_PIN_COLOR_DONE = "Couleur de l'icône (achevé)",
  DEST_SETTINGS_ACH_PIN_COLOR_DONE_TT = "Défini la couleur de l'icône des Succès achevés",
  DEST_SETTINGS_ACH_TXT_COLOR_DONE = "Couleur du texte (achevé)",
  DEST_SETTINGS_ACH_TXT_COLOR_DONE_TT = "Défini la couleur du texte des Succès achevés",
  DEST_SETTINGS_ACH_ALL_COMPASS_TOGGLE = "Afficher les Succès sur le compas",
  DEST_SETTINGS_ACH_ALL_COMPASS_DIST = "Distance d'apparition des icônes sur le compas",

  DEST_SETTINGS_MISC_HEADER = "Emplacements des PI divers",
  DEST_SETTINGS_MISC_HEADER_TT = "Ce sous-menu couvre les Puits Ayléides, les ruines Dwemer et la Frontière de Raidelorn.",
  DEST_SETTINGS_MISC_AYLEID_WELL_HEADER = "Puits Ayléide",
  DEST_SETTINGS_MISC_DEADLANDS_ENTRANCE_HEADER = "Deadlands Entrance",
  DEST_SETTINGS_MISC_DWEMER_HEADER = "Ruines Dwemer",
  DEST_SETTINGS_MISC_COMPASS_HEADER = "Paramètres Divers",
  DEST_SETTINGS_MISC_BORDER_HEADER = "Frontière de Raidelorn",

  DEST_SETTINGS_MISC_PIN_AYLEID_WELL_TOGGLE = "Afficher les Puits Ayléide",
  DEST_SETTINGS_MISC_PIN_AYLEID_WELL_TOGGLE_TT = "Cette option active l'affichage des Puits Ayléide sur la carte",
  DEST_SETTINGS_MISC_PIN_AYLEID_WELL_SIZE = "Taille de l'icône des Puits Ayléide",
  DEST_SETTINGS_MISC_PIN_AYLEID_WELL_COLOR = "Couleur de l'icône des Puits Ayléide",
  DEST_SETTINGS_MISC_PIN_AYLEID_WELL_COLOR_TT = "Défini la couleur des icônes des Puits Ayléide",
  DEST_SETTINGS_MISC_PINTEXT_AYLEID_WELL_COLOR = "Couleur du texte des Puits Ayléide",
  DEST_SETTINGS_MISC_PINTEXT_AYLEID_WELL_COLOR_TT = "Défini la couleur du texte des Puits Ayléide",

  -- Deadlands
  DEST_SETTINGS_MISC_PIN_DEADLANDS_ENTRANCE_TOGGLE = "Show Deadlands Entrance",
  DEST_SETTINGS_MISC_PIN_DEADLANDS_ENTRANCE_TOGGLE_TT = "This is for turning Deadlands Entrance on/off on the maps",
  DEST_SETTINGS_MISC_PIN_DEADLANDS_ENTRANCE_SIZE = "Pin size for Deadlands Entrance",
  DEST_SETTINGS_MISC_PIN_DEADLANDS_ENTRANCE_COLOR = "Pin color for Deadlands Entrance",
  DEST_SETTINGS_MISC_PIN_DEADLANDS_ENTRANCE_COLOR_TT = "Affects the PIN color for Deadlands Entrance",
  DEST_SETTINGS_MISC_PINTEXT_DEADLANDS_ENTRANCE_COLOR = "Pin text color for Deadlands Entrance",
  DEST_SETTINGS_MISC_PINTEXT_DEADLANDS_ENTRANCE_COLOR_TT = "Affects the pin TEXT on Deadlands Entrance",

  DEST_SETTINGS_MISC_DWEMER_PIN_TOGGLE = "Afficher les Ruines Dwemer",
  DEST_SETTINGS_MISC_DWEMER_PIN_TOGGLE_TT = "Cette option active l'affichage des Ruines Dwemer sur la carrte",
  DEST_SETTINGS_MISC_DWEMER_PIN_SIZE = "Taille de l'icône des Ruines Dwemer",
  DEST_SETTINGS_MISC_DWEMER_PIN_COLOR = "Couleur de l'icône des Ruines Dwemer",
  DEST_SETTINGS_MISC_DWEMER_PIN_COLOR_TT = "Défini la couleur des icônes des Ruines Dwemer",
  DEST_SETTINGS_MISC_DWEMER_PINTEXT_COLOR = "Couleur du texte des Ruines Dwemer",
  DEST_SETTINGS_MISC_DWEMER_PINTEXT_COLOR_TT = "Défini la couleur du texte des Ruines Dwemer",
  DEST_SETTINGS_MISC_PIN_LAYER = "Couche d'affichage des PI Divers",
  DEST_SETTINGS_MISC_COMPASS_PIN_TOGGLE = "Afficher les PI divers sur le compas",
  DEST_SETTINGS_MISC_COMPASS_DIST = "Distance d'appartion des icônes sur le compas",
  DEST_SETTINGS_MISC_BORDER_PIN_TOGGLE = "Afficher la frontière de Raidelorn",
  DEST_SETTINGS_MISC_BORDER_PIN_TOGGLE_TT = "Affiche la frontière divisant le Bas Raidelorn du Haut Raidelorn",
  DEST_SETTINGS_MISC_BORDER_SIZE = "Taille de l'icône pour la frontière",
  DEST_SETTINGS_MISC_BORDER_PIN_COLOR = "Couleur de l'icône de la frontière",
  DEST_SETTINGS_MISC_BORDER_PIN_COLOR_TT = "Défini la couleur des icônes de la frontière de Raidelorn",

  DEST_SETTINGS_VWW_HEADER = "Emplacements des Vampires & Loups-Garous",
  DEST_SETTINGS_VWW_HEADER_TT = "Ce sous-menu couvrel les Vampires et les Loups-Garous, incluant les lieux d'apparition, les autels et les sanctuaires.",
  DEST_SETTINGS_VWW_WWVAMP_HEADER = "Lieu d'apparition des Vampires & Loups-Garous",
  DEST_SETTINGS_VWW_VAMP_HEADER = "Autels Vampire",
  DEST_SETTINGS_VWW_WW_HEADER = "Sanctuaire Loups-Garous",
  DEST_SETTINGS_VWW_COMPASS_HEADER = "Paramètres Divers",

  DEST_SETTINGS_VWW_PIN_WWVAMP_TOGGLE = "Afficher lieux apparition LG/Vampire",
  DEST_SETTINGS_VWW_PIN_WWVAMP_TOGGLE_TT = "Activer pour afficher les lieux d'apparition des Vampires & Loups-Garous sur la carte",
  DEST_SETTINGS_VWW_PIN_WWVAMP_SIZE = "Taille de l'icône des LG/Vampires",
  DEST_SETTINGS_VWW_PIN_VAMP_ALTAR_TOGGLE = "Afficher les Autels Vampire",
  DEST_SETTINGS_VWW_PIN_VAMP_ALTAR_TOGGLE_TT = "Activer pour afficher les Autels Vampire sur la carte",
  DEST_SETTINGS_VWW_PIN_VAMP_ALTAR_SIZE = "Taille de l'icône des Autels",
  DEST_SETTINGS_VWW_PIN_WW_SHRINE_TOGGLE = "Afficher les Sanctuaires Loup-Garou",
  DEST_SETTINGS_VWW_PIN_WW_SHRINE_TOGGLE_TT = "Activer pour afficher les Sanctuaires Loup-Garou sur la carte",
  DEST_SETTINGS_VWW_PIN_WW_SHRINE_SIZE = "Taille de l'icône des Sanctuaires",
  DEST_SETTINGS_VWW_PIN_LAYER = "Couche d'affichage des icônes LG/Vampire",
  DEST_SETTINGS_VWW_COMPASS_PIN_TOGGLE = "Afficher les icônes sur le compas",
  DEST_SETTINGS_VWW_COMPASS_DIST = "Distance d'affiche des icônes sur le compas",
  DEST_SETTINGS_VWW_PIN_COLOR = "Couleur des icônes pour les LG/Vampires",
  DEST_SETTINGS_VWW_PIN_COLOR_TT = "Défini la couleur des icônes des Loups-Garous, Vampires, Sanctuaires Loup-Garou et Autels Vampire",
  DEST_SETTINGS_VWW_PINTEXT_COLOR = "Couleur du texte pour les LG/Vampires",
  DEST_SETTINGS_VWW_PINTEXT_COLOR_TT = "Défini la couleur du texte des Loups-Garous, Vampires, Sanctuaires Loup-Garou et Autels Vampire",

  DEST_SETTINGS_QUEST_HEADER = "Emplacements des Donneurs de Quête",
  DEST_SETTINGS_QUEST_HEADER_TT = "Ce sous-menu couvre toutes les options relatives aux Quêtes.",
  DEST_SETTINGS_QUEST_UNDONE_HEADER = "Quêtes inachevées",
  DEST_SETTINGS_QUEST_INPROGRESS_HEADER = "Quêtes en cours",
  DEST_SETTINGS_QUEST_DONE_HEADER = "Quêtes achevées",
  DEST_SETTINGS_QUEST_CADWELLS_HEADER = "Almanach de Cadwell",
  DEST_SETTINGS_QUEST_DAILIES_HEADER = "Journalières/Répétables",
  DEST_SETTINGS_QUEST_COMPASS_HEADER = "Diver",
  DEST_SETTINGS_QUEST_REGISTER_HEADER = "Autres",

  DEST_SETTINGS_QUEST_UNDONE_PIN_TOGGLE = "Afficher les donneurs de quête",
  DEST_SETTINGS_QUEST_UNDONE_PIN_SIZE = "Taille de l'icône des donneurs de quête",
  DEST_SETTINGS_QUEST_UNDONE_PIN_COLOR = "Couleur de l'icône des donneurs de quête",
  DEST_SETTINGS_QUEST_UNDONE_PIN_COLOR_TT = "Défini la couleur de l'icône des quêtes non débutées",
  DEST_SETTINGS_QUEST_UNDONE_MAIN_PIN_COLOR = "Couleur de l'icône de la quête principale",
  DEST_SETTINGS_QUEST_UNDONE_MAIN_PIN_COLOR_TT = "Défini la couleur de l'icône des quêtes de l'HISTOIRE PRINCIPALE non débutées",
  DEST_SETTINGS_QUEST_UNDONE_DAY_PIN_COLOR = "Couleur de l'icône des quêtes journalières",
  DEST_SETTINGS_QUEST_UNDONE_DAY_PIN_COLOR_TT = "Défini la couleur de l'icône des QUÊTES JOURNALIÈRES non débutées",
  DEST_SETTINGS_QUEST_UNDONE_REP_PIN_COLOR = "Couleur de l'icône des quêtes répétables",
  DEST_SETTINGS_QUEST_UNDONE_REP_PIN_COLOR_TT = "Défini la couleur de l'icône des QUÊTES RÉPÉTABLES non débutées",
  DEST_SETTINGS_QUEST_UNDONE_DUN_PIN_COLOR = "Couleur de l'icône des quêtes de donjon",
  DEST_SETTINGS_QUEST_UNDONE_DUN_PIN_COLOR_TT = "Défini la couleur de l'icône des QUÊTES DE DONJON non débutées",
  DEST_SETTINGS_QUEST_UNDONE_PINTEXT_COLOR = "Couleur du texte des donneurs de quête",
  DEST_SETTINGS_QUEST_UNDONE_PINTEXT_COLOR_TT = "Défini la couleur du texte des quêtes non débutées",
  DEST_SETTINGS_QUEST_INPROGRESS_PIN_TOGGLE = "Afficher les quêtes en cours",
  DEST_SETTINGS_QUEST_INPROGRESS_PIN_SIZE = "Taille de l'icône des quêtes en cours",
  DEST_SETTINGS_QUEST_INPROGRESS_PIN_COLOR = "Couleur de l'icône des quêtes en cours",
  DEST_SETTINGS_QUEST_INPROGRESS_PIN_COLOR_TT = "Défini la couleur des icônes des quêtes actuellement dans le journal",
  DEST_SETTINGS_QUEST_INPROGRESS_PINTEXT_COLOR = "Couleur du texte des quêtes en cours",
  DEST_SETTINGS_QUEST_INPROGRESS_PINTEXT_COLOR_TT = "Défini la couleur du texte des quêtes actuellement dans le journal",
  DEST_SETTINGS_QUEST_DONE_PIN_TOGGLE = "Afficher les quêtes achevées",
  DEST_SETTINGS_QUEST_DONE_PIN_SIZE = "Taille de l'icône des quêtes achevées",
  DEST_SETTINGS_QUEST_DONE_PIN_COLOR = "Couleur de l'icône des quêtes achevées",
  DEST_SETTINGS_QUEST_DONE_PIN_COLOR_TT = "Défini la couleur de l'icône des quêtes achevées",
  DEST_SETTINGS_QUEST_DONE_PINTEXT_COLOR = "Couleur du texte des quêtes achevées",
  DEST_SETTINGS_QUEST_DONE_PINTEXT_COLOR_TT = "Défini la couleur du texte des quêtes achevées",
  DEST_SETTINGS_QUEST_CADWELLS_PIN_TOGGLE = "Afficher l'Almanach de Cadwell",
  DEST_SETTINGS_QUEST_CADWELLS_PIN_TOGGLE_TT = "Active les indicateurs des quêtes de l'Amanach de Cadwell sur la carte",
  DEST_SETTINGS_QUEST_CADWELLS_ONLY_PIN_TOGGLE = "Cacher les autres quêtes",
  DEST_SETTINGS_QUEST_CADWELLS_ONLY_PIN_TOGGLE_TT = "Cache toutes les quêtes ordinaires qui ne font pas partie de l'Almanach de Cadwell",
  DEST_SETTINGS_QUEST_WRITS_PIN_TOGGLE = "Afficher les Commandes d'artisanat",
  DEST_SETTINGS_QUEST_WRITS_PIN_TOGGLE_TT = "Défini l'affichage des Commandes d'Artisanat sur la carte.",
  DEST_SETTINGS_QUEST_DAILIES_PIN_TOGGLE = "Afficher les quêtes journalières",
  DEST_SETTINGS_QUEST_DAILIES_PIN_TOGGLE_TT = "Active l'affichage des quêtes journalières sur la carte",
  DEST_SETTINGS_QUEST_REPEATABLES_PIN_TOGGLE = "Afficher les quêtes répétables",
  DEST_SETTINGS_QUEST_REPEATABLES_PIN_TOGGLE_TT = "Active l'affichage des quêtes répétables sur la carte",
  DEST_SETTINGS_QUEST_ALL_PIN_LAYER = "Couche d'affichage des icônes de quête",
  DEST_SETTINGS_QUEST_COMPASS_TOGGLE = "Afficher les quêtes sur le compas",
  DEST_SETTINGS_QUEST_COMPASS_DIST = "Distance d'affichage des quêtes sur le compas",

  DEST_SETTINGS_REGISTER_QUEST_GIVER_TOGGLE = "Hide Quest Giver Name",
  DEST_SETTINGS_REGISTER_QUEST_GIVER_TOGGLE_TT = "Show/Hide the name of the Quest giver in the tooltip.",

  DEST_SETTINGS_REGISTER_QUESTS_TOGGLE = "Enregistrer les quêtes",
  DEST_SETTINGS_REGISTER_QUESTS_TOGGLE_TT = "Enregistre les informations des quêtes pour rapport. Veuillez vous rendre sur la page EOSUI.com de l'add-on Destination pour plus d'information",
  DEST_SETTINGS_QUEST_RESET_HIDDEN = "RAZ des quêtes cachées",
  DEST_SETTINGS_QUEST_RESET_HIDDEN_TT = "Remet à zéro toutes les quêtes cachées, et les réaffiche sur la carte et le compas.",

  DEST_SETTINGS_COLLECTIBLES_HEADER = "Emplacements des Trophées",
  DEST_SETTINGS_COLLECTIBLES_HEADER_TT = "Ce sous-menu couvre tous les paramètres relatifs aux trophées.",
  DEST_SETTINGS_COLLECTIBLES_SUBHEADER = "Paramètres des trophées",
  DEST_SETTINGS_COLLECTIBLES_COLORS_HEADER = "Couleur des icônes des trophées ",
  DEST_SETTINGS_COLLECTIBLES_MISC_HEADER = "Divers",

  DEST_SETTINGS_COLLECTIBLES_TOGGLE = "Afficher les trophée non collectés",
  DEST_SETTINGS_COLLECTIBLES_TOGGLE_TT = "Active l'affichage des zones où les monstres peuvent être tués afin de collecter les trophées pour compléter les succès",
  DEST_SETTINGS_COLLECTIBLES_DONE_TOGGLE = "Afficher les trophées collectés",
  DEST_SETTINGS_COLLECTIBLES_DONE_TOGGLE_TT = "Active l'affichage des zones où les trophées ont déjà été collectés",
  DEST_SETTINGS_COLLECTIBLES_PIN_STYLE = "Style des icônes des Trophées",
  DEST_SETTINGS_COLLECTIBLES_SHOW_MOBNAME = "Afficher le nom des monstres",
  DEST_SETTINGS_COLLECTIBLES_SHOW_MOBNAME_TT = "Active l'affichage du nom des monstres (en anglais uniquement) qui donnent l'objet nécessaire pour compléter les succès",
  DEST_SETTINGS_COLLECTIBLES_SHOW_ITEM = "Afficher le nom de l'objet",
  DEST_SETTINGS_COLLECTIBLES_SHOW_ITEM_TT = "Active l'affichage du nom des objets nécessaire pour compléter les succès",
  DEST_SETTINGS_COLLECTIBLES_PIN_SIZE = "Taille de l'icône des Trophées",
  DEST_SETTINGS_COLLECTIBLES_PIN_SIZE_TT = "Défini la taille de l'icône des Trophées",
  DEST_SETTINGS_COLLECTIBLES_PIN_LAYER = "Couche d'affichage des icônes",
  DEST_SETTINGS_COLLECTIBLES_PIN_LAYER_TT = "Défini la couche d'affichage des icônes des Trophées",
  DEST_SETTINGS_COLLECTIBLES_COMPASS_TOGGLE = "Afficher sur le compas",
  DEST_SETTINGS_COLLECTIBLES_COMPASS_TOGGLE_TT = "Active l'affichage des Trophées sur le compas",
  DEST_SETTINGS_COLLECTIBLES_COMPASS_DIST = "Distance d'affichage sur le compas",
  DEST_SETTINGS_COLLECTIBLES_COMPASS_DIST_TT = "Défini la distance d'affichage des icônes des Trophées sur le compas",
  DEST_SETTINGS_COLLECTIBLES_COLOR_TITLE = "Couleur des Titres",
  DEST_SETTINGS_COLLECTIBLES_COLOR_TITLE_TT = "Défini la couleur des titre reflètant les nom des Succès des Trophées",
  DEST_SETTINGS_COLLECTIBLES_PIN_COLOR = "Couleur des icônes des Trophées manquants",
  DEST_SETTINGS_COLLECTIBLES_PIN_COLOR_TT = "Défini la couleur des icônes pour les Trophées manquants",
  DEST_SETTINGS_COLLECTIBLES_COLOR_UNDONE = "Couleur du texte des Trophées manquants",
  DEST_SETTINGS_COLLECTIBLES_COLOR_UNDONE_TT = "Défini la couleur du texte pour les Trophées manquants",
  DEST_SETTINGS_COLLECTIBLES_PIN_COLOR_DONE = "Couleur de l'icône des Trophées collectés",
  DEST_SETTINGS_COLLECTIBLES_PIN_COLOR_DONE_TT = "Défini la couleur des icônes pour les Trophées collectés",
  DEST_SETTINGS_COLLECTIBLES_COLOR_DONE = "Couleur du texte des Trophées collectés",
  DEST_SETTINGS_COLLECTIBLES_COLOR_DONE_TT = "Défini la couleur du texte pour les Trophées collectés",

  DEST_SETTINGS_FISHING_HEADER = "Emplacements de Pêche",
  DEST_SETTINGS_FISHING_HEADER_TT = "Ce sous-menu couvre toutes les options relative à la Pêche.",
  DEST_SETTINGS_FISHING_SUBHEADER = "Paramètres de la Pêche",
  DEST_SETTINGS_FISHING_PIN_TEXT_HEADER = "Texte des icônes de la Pêche",
  DEST_SETTINGS_FISHING_COLOR_HEADER = "Couleur des icônes de la Pêche",
  DEST_SETTINGS_FISHING_MISC_HEADER = "Divers",

  DEST_SETTINGS_FISHING_TOGGLE = "Afficher les emplacement non utilisés",
  DEST_SETTINGS_FISHING_TOGGLE_TT = "Active l'affichage des trous de Pêche où il y a une chance de capturer un poisson pour les succès",
  DEST_SETTINGS_FISHING_DONE_TOGGLE = "Afficher les emplacements utilisés",
  DEST_SETTINGS_FISHING_DONE_TOGGLE_TT = "Active l'affichage des trous de Pêche déjà utilisés avec succès",
  DEST_SETTINGS_FISHING_PIN_STYLE = "Style des icônes de Pêche",
  DEST_SETTINGS_FISHING_SHOW_FISHNAME = "Afficher le nom des poissons",
  DEST_SETTINGS_FISHING_SHOW_FISHNAME_TT = "Active l'affichage du nom des poissons non pêchés dans ce type d'eaux",
  DEST_SETTINGS_FISHING_SHOW_BAIT = "Afficher l'appat optimal",
  DEST_SETTINGS_FISHING_SHOW_BAIT_TT = "Active l'affichage de l'appat optimal à utiliser",
  DEST_SETTINGS_FISHING_SHOW_BAIT_LEFT = "Afficher le nombre d'appats",
  DEST_SETTINGS_FISHING_SHOW_BAIT_LEFT_TT = "Active l'affichage du nombre d'appat du type optimal qu'il vous reste dans votre sac. SI il y a un troisième chiffre, il correspond à l'appat simple.",
  DEST_SETTINGS_FISHING_SHOW_WATER = "Afficher le type d'eau",
  DEST_SETTINGS_FISHING_SHOW_WATER_TT = "Active l'affichage du type d'eaux du trou de Pêche",
  DEST_SETTINGS_FISHING_PIN_SIZE = "Taille des icônes de Pêche",
  DEST_SETTINGS_FISHING_PIN_SIZE_TT = "Défini la taille des ciônes de Pêche",
  DEST_SETTINGS_FISHING_PIN_LAYER = "Couche d'affichage des icônes",
  DEST_SETTINGS_FISHING_PIN_LAYER_TT = "Défini la couche d'affichage des icônes de Pêche",
  DEST_SETTINGS_FISHING_COMPASS_TOGGLE = "Afficher sur le compas",
  DEST_SETTINGS_FISHING_COMPASS_TOGGLE_TT = "Active l'affichage les trous de pêche sur la carte",
  DEST_SETTINGS_FISHING_COMPASS_DIST = "Distance d'affichage sur le compas",
  DEST_SETTINGS_FISHING_COMPASS_DIST_TT = "Défini la distance d'affichage des trous de pêche",
  DEST_SETTINGS_FISHING_COLOR_TITLE = "Couleur du texte des Succès",
  DEST_SETTINGS_FISHING_COLOR_TITLE_TT = "Défini la couleur du texte des Succès associés au trou de Pêche",
  DEST_SETTINGS_FISHING_PIN_COLOR = "Couleur des icônes (inachevés)",
  DEST_SETTINGS_FISHING_PIN_COLOR_TT = "Défini la couleur des icônes des poissons non pêchés",
  DEST_SETTINGS_FISHING_COLOR_UNDONE = "Couleur du texte des poissons (inachevés",
  DEST_SETTINGS_FISHING_COLOR_UNDONE_TT = "Défini la couleur du texte des poissons non pêchés",
  DEST_SETTINGS_FISHING_COLOR_BAIT_UNDONE = "Couleur du texte des appats (inachevés)",
  DEST_SETTINGS_FISHING_COLOR_BAIT_UNDONE_TT = "Défini la couleur du texte des appats idéaux pour les poissons non pêchés",
  DEST_SETTINGS_FISHING_COLOR_WATER_UNDONE = "Couleur du texte des eaux (inachevés)",
  DEST_SETTINGS_FISHING_COLOR_WATER_UNDONE_TT = "Défini la couleur du texte des type d'eaux pour les poissons non pêchés",
  DEST_SETTINGS_FISHING_PIN_COLOR_DONE = "Couleurs des icônes (achevés)",
  DEST_SETTINGS_FISHING_PIN_COLOR_DONE_TT = "Défini la couleur de l'icône des poissons déjà pêchés",
  DEST_SETTINGS_FISHING_COLOR_DONE = "Couleur du texte (achevés)",
  DEST_SETTINGS_FISHING_COLOR_DONE_TT = "Défini la couleur du texte des poissons déjà pêchés",
  DEST_SETTINGS_FISHING_COLOR_BAIT_DONE = "Couleur du texte des appats (achevés)",
  DEST_SETTINGS_FISHING_COLOR_BAIT_DONE_TT = "Défini la couleur du texte des appats idéaux pour les poissons déjà pêchés",
  DEST_SETTINGS_FISHING_COLOR_WATER_DONE = "Couleur du texte des eaux (achevés)",
  DEST_SETTINGS_FISHING_COLOR_WATER_DONE_TT = "Défini la couleur du texte des type d'eaux pour les poissons déjà pêchés",

  DEST_SETTINGS_MAPFILTERS_HEADER = "Map Filters",
  DEST_SETTINGS_MAPFILTERS_HEADER_TT = "This submenu covers all Map Filter related settings.",
  DEST_SETTINGS_MAPFILTERS_SUBHEADER = "Map Filter Settings",

  DEST_SETTINGS_MAPFILTERS_POIS_TOGGLE = "Show POI Map filters",
  DEST_SETTINGS_MAPFILTERS_POIS_TOGGLE_TT = "Shows/hides Map Filters for all Points of Interest.",
  DEST_SETTINGS_MAPFILTERS_ACHS_TOGGLE = "Show Achievement Map filters",
  DEST_SETTINGS_MAPFILTERS_ACHS_TOGGLE_TT = "Shows/hides Map Filters for all Achievements.",
  DEST_SETTINGS_MAPFILTERS_QUES_TOGGLE = "Show Questgiver Map filters",
  DEST_SETTINGS_MAPFILTERS_QUES_TOGGLE_TT = "Shows/hides Map Filters for all Questgivers.",
  DEST_SETTINGS_MAPFILTERS_COLS_TOGGLE = "Show Collectible Map filters",
  DEST_SETTINGS_MAPFILTERS_COLS_TOGGLE_TT = "Shows/hides Map Filters for all Collectibles.",
  DEST_SETTINGS_MAPFILTERS_FISS_TOGGLE = "Show Fishing Map filters",
  DEST_SETTINGS_MAPFILTERS_FISS_TOGGLE_TT = "Shows/hides Map Filters for all Fishing holes.",
  DEST_SETTINGS_MAPFILTERS_MISS_TOGGLE = "Show Misc Map filters",
  DEST_SETTINGS_MAPFILTERS_MISS_TOGGLE_TT = "Shows/hides Map Filters for Miscellaneous pins (Ayleid Wells, Dwemer Ruins, Craglorn Border, as well as all Werewolf and Vampire pins).",

  GLOBAL_SETTINGS_SELECT_TEXT_ONLY = "Texte seulement !",

  DEST_SETTINGS_RESET = "RAZ des options",

  --POI Types
  POITYPE_AOI = "Aire d'Intérêt",
  POITYPE_HOUSING = "Maison",
  POITYPE_CRAFTING = "Lieux d'Artisanat",
  POITYPE_DELVE = "Donjon Solo",
  POITYPE_DOLMEN = "Dolmen",
  POITYPE_GATE = "Portail",
  POITYPE_GROUPBOSS = "Boss de Groupe",
  POITYPE_GROUPDELVE = "Donjon Public",
  POITYPE_GROUPDUNGEON = "Donjon de Groupe",
  POITYPE_GROUPEVENT = "Evênement de Groupe",
  POITYPE_MUNDUS = "Pierre de Mundus",
  POITYPE_PUBLICDUNGEON = "Donjon Public",
  POITYPE_QUESTHUB = "Centre de Quêtes",
  POITYPE_SOLOTRIAL = "Épreuve",
  POITYPE_TRADER = "Guild Traders",
  POITYPE_TRIALINSTANCE = "Instance d'épreuve",
  POITYPE_UNKNOWN = "Inconnu",
  POITYPE_WAYSHRINE = "Oratoire",
  POITYPE_VAULT = "Vault",
  POITYPE_DARK_BROTHERHOOD = "Dark Brotherhood",
  POITYPE_BREAKING_ENTERING = "Breaking and Entering",
  POITYPE_CUTPURSE_ABOVE = "A Cutpurse Above",

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

  POITYPE_AYLEID_WELL = "Puit Ayléide",
  POITYPE_DEADLANDS_ENTRANCE = "Deadlands Entrance",
  POITYPE_WWVAMP = "Loup-Garou/Vampire",
  POITYPE_VAMPIRE_ALTAR = "Autel Vampire",
  POITYPE_DWEMER_RUIN = "Ruine Dwemer",
  POITYPE_WEREWOLF_SHRINE = "Sanctuaire Loup-Garou",

  POITYPE_COLLECTIBLE = "Trophée",
  POITYPE_FISH = "Pêche",
  POITYPE_UNDETERMINED = "Indéterminé",

  -- Quest completion editing texts
  QUEST_EDIT_ON = "Edition des donneurs de quêtes de Destination ACTIF !",
  QUEST_EDIT_OFF = "Edition des donneurs de quêtes de Destination INACTIF !",
  QUEST_MENU_NOT_FOUND = "Impossible de trouve la quête dans la base de donnée",
  QUEST_MENU_HIDE_QUEST = "Cacher cette icône de quête",
  QUEST_MENU_DISABLE_EDIT = "Désactiver l'édition",

  -- Quest types
  QUESTTYPE_NONE = "Quête",
  QUESTTYPE_GROUP = "Quête de groupe",
  QUESTTYPE_MAIN_STORY = "Quête d'hitoire principale",
  QUESTTYPE_GUILD = "Quête de guilde",
  QUESTTYPE_CRAFTING = "Quête d'artisanat",
  QUESTTYPE_DUNGEON = "Quête de donjon",
  QUESTTYPE_RAID = "Quête de raid",
  QUESTTYPE_AVA = "Quête de guerre d'Alliance",
  QUESTTYPE_CLASS = "Quête de classe",
  QUESTTYPE_QA_TEST = "Quête de test Q&R",
  QUESTTYPE_AVA_GROUP = "Quête de guerre d'Alliance en Groupe",
  QUESTTYPE_AVA_GRAND = "Grand quête de guerre d'Alliance",
  QUESTREPEAT_NOT_REPEATABLE = "Quête normale",
  QUESTREPEAT_REPEATABLE = "Quête répétable",
  QUESTREPEAT_DAILY = "Quête journalière",

  -- Fishing
  FISHING_FOUL = "Marécages",
  FISHING_RIVER = "Rivière",
  FISHING_OCEAN = "Océan",
  FISHING_LAKE = "Lac (Eaux Profondes)",
  FISHING_UNKNOWN = "- inconnu -",
  FISHING_FOUL_BAIT = "Rampants/Oeufs de poisson",
  FISHING_RIVER_BAIT = "Insectes/Petits Poissons",
  FISHING_OCEAN_BAIT = "Vers/Chevesnes",
  FISHING_LAKE_BAIT = "Boyaux/Poissons",
  FISHING_HWBC = "crabe-grue-carnassier^m",

  -- Destinations chat commands
  DESTCOMMANDS = "Liste des commandes de Destinations :",
  DESTCOMMANDdhlp = "/dhlp (Aide de Destinations) : Vous venez juste de l'utiliser ;)",
  DESTCOMMANDdset = "/dset (Paramiètres de Destinations) : Ouvre les options de configuration de Destinations.",
  DESTCOMMANDdqed = "/dqed (Editeur de quête de Destinations) : Cette commande va ACTIVE/DESACTIVE l'édition des icônes de quête. Elle affiche dans le chat si elle est active ou non. Lorsqu'elle est active, ouvrez votre carte et cliquez sur l'icône que vous souhaites maquer comme achevée ou inachevée. N'oubliez-pas de désactiver l'édition lorsque vous avez terminé en retappant la commande !",

  -- Destinations Misc
  LOAD_NEW_QUEST_FORMAT = "RAZ des données de quête",
  LOAD_NEW_QUEST_FORMAT_TT = "Cela rechargeral toutes les quêtes connues dans une nouvelle table. Le jeu fera un /reloadui afin d'achever l'opération.",
  RELOADUI_WARNING = "Si vous cliquez ce bouton, le jeu effectuera un /reloadui",
  RELOADUI_INFO = "Changes to this setting will not be in effect until after you have clicked the 'ReloadUI' button.",
  DEST_SETTINGS_RELOADUI = "ReloadUI",
  DEST_SET_REQUIREMENT = "<<1>> traits requis",
}

for key, value in pairs(strings) do
  ZO_CreateStringId(key, value)
  SafeAddVersion(key, 1)
end
-- PortToFriendsHouse
-- By @s0rdrak (PC / EU)
-- Translated by: Morgul667
-- Reviewed by: @Nita65

local PortToFriend = _G['PortToFriend']

PortToFriend.HOUSES =
{
	[1] = "Baiser de Mara",
	[2] = "Le Lion heureux",
	[3] = "La Flasque d'ébène ",
	[4] = "Salon Privé du Crochet Barbelé",
	[5] = "Appartement des sœurs des sables",
	[6] = "Soupente de Luxe au Nix Enflammé",
	[7] = "Villa de la Vigne Noire",
	[8] = "Ombrescarpe",
	[9] = "Manoir Mathiisen",
	[10] = "Humbleboue",
	[11] = "Le Domicile Ample",
	[12] = "Manoir Restez Humide",
	[13] = "La Cosse ",
	[14] = "Refuge d'Arbreroche",
	[15] = "Propriété Gorinir",
	[16] = "Chez le Capitaine Margaux",
	[17] = "Butte-Aux-Corbeaux",
	[18] = "Maison Gardner",
	[19] = "Maison Kragen",
	[20] = "Rêverie Vélothi",
	[21] = "Quondam Indorilia",
	[22] = "Maison Rilune",
	[23] = "Maison de Vive Crique",
	[24] = "Ombraube",
	[25] = "Maison de la jungle Cyrodiiléenne",
	[26] = "Domus Phrasticus",
	[27] = "Domaine des Sources Stridentes",
	[28] = "Porte-de-l'Automne",
	[29] = "Chagrin de Grymharth",
	[30] = "Vieux Manoir de Voilebrume",
	[31] = "Bungalow de Martelmort",
	[32] = "Fort de Sangloth",
	[33] = "Forteresse Abandonnée",
	[34] = "Arches Jumelles",
	[35] = "Manoir du Magnifico Silencieux",
	[36] = "Palais d'Hunding",
	[37] = "Propriété des Chutes de la Sérénité",
	[38] = "Surplomb de Daguefilante",
	[39] = "Château de Coeurébène",
	[40] = "Grand Refuge Topal",
	[41] = "Caverne Coupeterre",
	[42] = "Loft de Saint Delyn",
	[43] = "Pavillon du Lac d'Amaya",
	[44] = "Maison Portuaire d'Ald Vélothi",
	[45] = "Tel Galen",
	[46] = "Grand Manoir de Linchal",
	[47] = "Propriété surréaliste de Havreglace",
	[48] = "Château de Hakkvild",
	[49] = "Le Cottage de la Congrégation Exorcisé",
	[54] = "Pinnacle du Paria",
	[55] = "L'Observatoire Antérieur",
	[56] = "Le Sanctuaire d'Antan",
	[57] = "Palais princier d'Aubéclat",
	[58] = "Soupente du Griffon doré",
	[59] = "Manoir de la crête d'Alinor",
	[60] = "Grotte aldmerie colossale",
	[61] = "La Clairière du Chasseur",
	[62] = "Grand Psijic Villa",
	[63] = "Foyer boule à neige enchantée",
	[64] = "Manoir du Xanmeer lacustre",
	[65] = "L'Abîme d'Arquegivre",
	[66] = "L'Arène privée d'Élinhir",
	[68] = "La suite au Sucrier",
	[69] = "Étreinte de Jode",
	[70] = "Salle du Champion lunaire",
	[71] = "Prairie à sucrelune",
	[72] = "Maisaulée",
	[73] = "Le débarcadère du Chanceux",
	[74] = "La Retraite du Potentat",
	[75] = "La Chute du maître de forge",
	[76] = "L'Oasis des voleurs",
	[77] = "Suite du dégel",
	[78] = "Le manoir de Hauteflèche",
	[79] = "Bastion Sanguinaris",
	[80] = "Retraite des Eaux calmes",
	[81] = "Galerie alpine de l'Antiquaire"
}

PortToFriend.constants.HEADER_TITLE = " PortToFriend "
PortToFriend.constants.LABEL_PLAYER = "Joueur :"
PortToFriend.constants.BUTTON_PORT = "Se téléporter"
PortToFriend.constants.BUTTON_ADD_FAVORITE = "Ajouter aux favoris"
PortToFriend.constants.BUTTON_SEND_VISITCARD = "Envoyer une carte de visite"
PortToFriend.constants.BUTTON_MAIN_RESIDENCE = "Résidence principale"
PortToFriend.constants.VC_HEADER_TITLE = "Cartes de visite"
PortToFriend.constants.VC_PLAYER = "Joueur: "
PortToFriend.constants.VC_HOUSE = "Maison: "
PortToFriend.constants.BUTTON_REMOVE = "Supprimer"
PortToFriend.constants.BUTTON_VC = "Carte de visite"
PortToFriend.constants.TOGGLE_PORT_WINDOW = "Afficher la fenêtre de téléportation"
PortToFriend.constants.PORT_TO_FAVORITE = "Allez aux favoris #%d"
PortToFriend.constants.PORT_TO_FAVORITE_MY_HOUSE_INSIDE = "Allez mon maison #%d (l'intérieur)"
PortToFriend.constants.PORT_TO_FAVORITE_MY_HOUSE_OUTSIDE = "Allez mon maison #%d (d'entrée)"
PortToFriend.constants.INVALID_FAVORITE_ID = "ID spécifiée invalide"
PortToFriend.constants.SORT_NAME = "Joueur"
PortToFriend.constants.SORT_HOUSE = "Maison"
PortToFriend.constants.CMD_HELP_1 = " open: Ouvre le menu de l’add-on PortToFriend "
PortToFriend.constants.CMD_HELP_2 = "show: Affiche les ID de toutes les maisons"
PortToFriend.constants.CMD_HELP_3 = " port <player> <ID>: Lance la téléportation vers la maison spécifiée (ID facultative)"
PortToFriend.constants.CMD_HELP_4 = " fav <ID>: Téléporte au favori <ID>"
PortToFriend.constants.CMD_HELP_5 = " favi <ID>: Téléporte au \"Mes maisons\" <ID> l'intérieur"
PortToFriend.constants.CMD_HELP_6 = " favo <ID>: Téléporte au \"Mes maisons\" <ID> d'entrée"
PortToFriend.constants.CMD_HELP_7 = " menu: Ouvre la configuration de l'addon"
PortToFriend.constants.TAB_HOUSE_TITLE = "Maisons"
PortToFriend.constants.TAB_VC_TITLE = "Cartes de visites"
PortToFriend.constants.TAB_MYHOUSES_TITLE = "Mes maisons"
PortToFriend.constants.TAB_LIBRARY_TITLE = "Annuaire"
PortToFriend.constants.TAB_DONATE_TITLE = "Don"
PortToFriend.constants.DONATION_WRONG_SERVER = "Les dons en pièces d'or sont les bienvenus.\r\nMais comme je joue sur PC/EU, ça n'aurait aucun sens de me faire un don sur PC/NA."
PortToFriend.constants.DONATION_MESSAGE = "Les dons en pièces d'or sont bienvenus."
PortToFriend.constants.BUTTON_DONATION_PERSONAL = "Dons"
PortToFriend.constants.BUTTON_DONATION_5 = "Donner 5000 gold"
PortToFriend.constants.BUTTON_DONATION_50 = "Donner 50000 gold"
PortToFriend.constants.DONATE_MAIL_SUBJECT = "PortToFriend - Don"
PortToFriend.constants.LIBRARY_MESSAGE = "L'annuaire recense les maisons enregistrées par les joueurs sur la base du volontariat. Si vous voulez y ajouter la vôtre, laissez un message sur le forum de TESO ou sur ESOUI dans l'un des fils de discussion consacrés à PTF."
PortToFriend.constants.SORT_LABEL = "Tri"
PortToFriend.constants.SORT_HOUSE = "Maison"
PortToFriend.constants.SORT_LOCATION = "Région"
PortToFriend.constants.FILTER_LABEL = "Filtre des catégories"
PortToFriend.constants.FILTER_NONE = "--AUCUN--"
PortToFriend.constants.FILTER_HIGHLIGHT = "Surbrillance"
PortToFriend.constants.FILTER_LABYRINTH = "Labyrinthe"
PortToFriend.constants.FILTER_JUMPNRUN = "Jump 'n' Run"
PortToFriend.constants.FILTER_CRAFTING = "Crafting / Mundus"
PortToFriend.constants.FILTER_GUILD = "Maison de Guilde"
PortToFriend.constants.FILTER_ROLEPLAY = "Roleplay"
PortToFriend.constants.FILTER_RAID = "Raid / DPS"
PortToFriend.constants.FILTER_HIDE_SEEK = "Cache-cache"
PortToFriend.constants.FILTER_ERP = "Pigalle"
PortToFriend.constants.LIBRARY_SORT_LABEL = "Tri"
PortToFriend.constants.LIBRARY_SORT_NONE = "--AUCUN--"
PortToFriend.constants.LIBRARY_SORT_NAME = "Nom"
PortToFriend.constants.LIBRARY_SORT_HOUSE = "Maison"
PortToFriend.constants.MYHOUSES_FRONT_DOOR = "Porte d'entrée"
PortToFriend.constants.MYHOUSES_PORT_INSIDE = "Se téléporter"

PortToFriend.constants.menu = {}
PortToFriend.constants.menu.DISPLAY_NAME = "|c4592FFConfiguration de Port to a Friend's House|r"
PortToFriend.constants.menu.AUTHOR = string.format("|cFF8174%s|r\r\nMerci à: |cFF8174%s|r\r\n", PortToFriend.author, PortToFriend.credits)
PortToFriend.constants.menu.VERSION = string.format("|cFF8174%s|r", PortToFriend.versionString)
PortToFriend.constants.menu.TITLE = "Configuration du chat"
PortToFriend.constants.menu.DESCRIPTION = "Configuration des fenêtres de chat autorisées à afficher les cartes de visite"

PortToFriend.constants.menu.G1 = "Guilde 1"
PortToFriend.constants.menu.O1 = "Officiers 1"
PortToFriend.constants.menu.G2 = "Guilde 2"
PortToFriend.constants.menu.O2 = "Officiers 2"
PortToFriend.constants.menu.G3 = "Guilde 3"
PortToFriend.constants.menu.O3 = "Officiers 3"
PortToFriend.constants.menu.G4 = "Guilde 4"
PortToFriend.constants.menu.O4 = "Officiers 4"
PortToFriend.constants.menu.G5 = "Guilde 5"
PortToFriend.constants.menu.O5 = "Officiers 5"
PortToFriend.constants.menu.EMOTE = "Emote"
PortToFriend.constants.menu.SAY = "Dire"
PortToFriend.constants.menu.YELL = "Crier"
PortToFriend.constants.menu.GROUP = "Groupe"
PortToFriend.constants.menu.TELL = "Parler"
PortToFriend.constants.menu.ZONE = "Zone"
PortToFriend.constants.menu.ENZONE = "Zone - Anglais"
PortToFriend.constants.menu.FRZONE = "Zone - Français"
PortToFriend.constants.menu.DEZONE = "Zone - Allemand"
PortToFriend.constants.menu.JPZONE = "Zone - Japonais"
PortToFriend.constants.menu.ALLOW_SELF = "Autoriser sa propre carte de visite"
PortToFriend.constants.menu.PORT_MODE = "Mode port (fenêtre fermer)"
PortToFriend.constants.menu.PORT_MODE_NONE = "Rien"
PortToFriend.constants.menu.PORT_MODE_CLICK = "Cliquez sur"
PortToFriend.constants.menu.PORT_MODE_DEACTIVATE = "Écran de chargement"
PortToFriend.constants.menu.DEFAULT_TAB = "Onglet par défaut"

PortToFriend.constants.CONTEXT_MENU_SEND = "Envoyer vers PTF"
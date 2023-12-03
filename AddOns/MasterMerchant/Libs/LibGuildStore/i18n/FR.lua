-- Last Updated September 5, 2021
-- Original file Sharlikran

ZO_CreateStringId("GS_DEBUG_OPTIONS", "Options de débogage")
ZO_CreateStringId("GS_REFRESH_BUTTON", "Rafraîchir")
ZO_CreateStringId("GS_REFRESH_DESC", "LibHistoire les données ne sont pas spécifiques au compte, vous n'avez donc besoin de le faire qu'une seule fois par serveur NA ou EU, pas une fois par compte.")
ZO_CreateStringId("GS_RESET_BUTTON", "Réinitialiser NA")
ZO_CreateStringId("GS_RESET_DESC", "Cela ne réinitialisera que les données NA de LibGuildStore.")
ZO_CreateStringId("GS_RESET_EU_BUTTON", "Réinitialiser EU")
ZO_CreateStringId("GS_RESET_EU_DESC", "Cela ne réinitialisera que les données EU de LibGuildStore.")
ZO_CreateStringId("GS_REFRESH_LIBHISTOIRE_NAME", "Rafraîchir Libhistoire")
ZO_CreateStringId("GS_REFRESH_LIBHISTOIRE_TIP", "Actualisez toutes les données de Libhistoire en fonction de la taille de votre historique de ventes.")
ZO_CreateStringId("GS_RESET_NAME", "Réinitialiser NA")
ZO_CreateStringId("GS_RESET_TIP", "Réinitialiser toutes les données LibGuildStore pour NA.")
ZO_CreateStringId("GS_RESET_EU_NAME", "Réinitialiser EU")
ZO_CreateStringId("GS_RESET_EU_TIP", "Réinitialiser toutes les données LibGuildStore pour UE.")

ZO_CreateStringId("GS_TRUNCATE_SALES_COMPLETE", "Découpage des données de vente terminé : %s secondes à découper, %s anciens enregistrements supprimés.")
ZO_CreateStringId("GS_TRUNCATE_LISTINGS_COMPLETE", "Ajustement des données des listes terminé : %s secondes pour le découpage, %s anciens enregistrements supprimés.")
ZO_CreateStringId("GS_TRUNCATE_PURCHASE_COMPLETE", "Achat de découpage terminé : %s secondes pour le découpage, %s anciens enregistrements supprimés.")
ZO_CreateStringId("GS_TRUNCATE_POSTED_COMPLETE", "Découpage des éléments publiés terminé : %s secondes pour le découpage, %s anciens enregistrements supprimés.")
ZO_CreateStringId("GS_TRUNCATE_CANCELLED_COMPLETE", "Découpage des éléments annulés terminé : %s secondes pour le découpage, %s anciens enregistrements supprimés.")

ZO_CreateStringId("GS_RESET_LISTINGS_BUTTON", "Réinitialiser les listes")
ZO_CreateStringId("GS_RESET_LISTINGS_DESC", "Cela ne réinitialisera que les listes pour le type de serveur actuel NA ou EU.")
ZO_CreateStringId("GS_RESET_LISTINGS_NAME", "Réinitialiser les données des listes")
ZO_CreateStringId("GS_RESET_LISTINGS_TIP", "Réinitialiser toutes les listes LibGuildStore.")
ZO_CreateStringId("GS_RESET_LISTINGS_CONFIRM_TITLE", "Confirmer la réinitialisation des listes")
ZO_CreateStringId("GS_RESET_LISTINGS_CONFIRM_MAIN", "Êtes-vous sûr de vouloir réinitialiser vos données d'inscription ? Vous devrez rendre visite aux boutiques pour collecter de nouvelles données.")
ZO_CreateStringId("GS_RESET_LIBGUILDSTORE_CONFIRM_TITLE", "Confirm LibGuildStore Reset")
ZO_CreateStringId("GS_RESET_LIBGUILDSTORE_CONFIRM_MAIN", "Are you sure you wish to reset all LibGuildStore Data? This will repair the LibGuildStore database however, all stored account names, guild names, and item links will be reset. This should only be done if you have corrupted data files.")
ZO_CreateStringId("GS_RESET_LIBGUILDSTORE_BUTTON", "Reset LibGuildStore")
ZO_CreateStringId("GS_RESET_LIBGUILDSTORE_DESC", "Reset all LibGuildStore Data. All stored account names, guild names, and item links will be reset. This should only be done if you have corrupted data files.")
ZO_CreateStringId("GS_RESET_LIBGUILDSTORE_NAME", "Reset LibGuildStore Data")
ZO_CreateStringId("GS_RESET_LIBGUILDSTORE_TIP", "Resets all LibGuildStore Data")

ZO_CreateStringId("GS_IMPORT_MM_BUTTON", "Importer des données de MM")
ZO_CreateStringId("GS_IMPORT_MM_DESC", "Jusqu'à MM 3.6.x, les données Master Merchant n'étaient pas enregistrées séparément pour les serveurs NA et EU. Il n'est pas recommandé d'importer des données à partir d'un type de serveur différent car les prix peuvent être différents.")
ZO_CreateStringId("GS_IMPORT_MM_NAME", "Import données de MM")
ZO_CreateStringId("GS_IMPORT_MM_TIP", "Importer toutes les données MM dans LibGuildStore.")
ZO_CreateStringId("GS_IMPORT_MM_OVERRIDE_NAME", "Remplacer l'importation de MM")
ZO_CreateStringId("GS_IMPORT_MM_OVERRIDE_TIP", "Remplacer l'importation des données MM de NA vers l'UE ou lorsque vos anciennes données contiennent à la fois des ventes NA et UE.")

ZO_CreateStringId("GS_IMPORT_ATT_BUTTON", "Importer des données de ATT")
ZO_CreateStringId("GS_IMPORT_ATT_NAME", "Import données de ATT")
ZO_CreateStringId("GS_IMPORT_ATT_TIP", "Importez toutes les données ATT dans LibGuildStore.")
ZO_CreateStringId("GS_IMPORT_ATT_DESC", "Les données de vente d'Arkadius Trade Tools ne sont pas spécifiques à un compte, vous n'avez donc besoin d'importer qu'une seule fois pour les serveurs NA ou EU, et non une seule fois par compte.")
ZO_CreateStringId("GS_IMPORT_ATT_FINISHED", "Les données de vente d'Arkadius Trade Tools ont été importées. L'utilisation de plusieurs modules complémentaires avec les mêmes données augmente l'utilisation de la mémoire et les temps de chargement.")

ZO_CreateStringId("GS_IMPORT_ATT_PURCHASE_BUTTON", "Importer des achats de ATT")
ZO_CreateStringId("GS_IMPORT_ATT_PURCHASE_DESC", "Les données d'achat d'Arkadius Trade Tools n'enregistrent pas l'ID d'achat spécifique. Vous pouvez involontairement importer un achat en double. Ce qui pourrait inclure un achat effectué alors qu'ATT et ShoppingList (version autonome) étaient actifs.")
ZO_CreateStringId("GS_IMPORT_ATT_PURCHASE_NAME", "Import achats de ATT")
ZO_CreateStringId("GS_IMPORT_ATT_PURCHASE_TIP", "Importer les données d'achats ATT dans LibGuildStore.")

ZO_CreateStringId("GS_IMPORT_SL_BUTTON", "Importer les données de ShoppingList")
ZO_CreateStringId("GS_IMPORT_SL_DESC", "Importez les données ShoppingList dans LibGuildStore. Les données ShoppingList précédentes n'enregistraient pas l'ID unique pour l'achat, vous pouvez avoir des doublons jusqu'à ce que l'achat soit plus ancien et soit coupé.")
ZO_CreateStringId("GS_IMPORT_SL_NAME", "Import Shoppinglist")
ZO_CreateStringId("GS_IMPORT_SL_TIP", "Importer les données de Shoppinglist dans LibGuildStore.")

ZO_CreateStringId("GS_IMPORT_PD_BUTTON", "Importer des données de prix")
ZO_CreateStringId("GS_IMPORT_PD_TITLE", "Pricing Data is your previously saved prices for listed items.")
ZO_CreateStringId("GS_IMPORT_PD_DESC", "Importez les données de prix MM dans LibGuildStore. Les données de prix précédentes ne seront disponibles qu'en tant que données de prix centrales. Il n'importera pas les mêmes données de prix dans chaque guilde distincte.")
ZO_CreateStringId("GS_IMPORT_PD_NAME", "Import données de prix")
ZO_CreateStringId("GS_IMPORT_PD_TIP", "Importez les données de prix dans LibGuildStore. Ne sera disponible que lors de l'utilisation des données de prix centrales. Pour les guildes individuelles, vous devrez établir de nouvelles données de prix par guilde.")

ZO_CreateStringId("GS_HELP_DUPS", "/lgs dups  - analyse votre historique pour éliminer les entrées en double")
ZO_CreateStringId("GS_HELP_CLEAN", "/lgs clean - nettoie les mauvais enregistrements de vente (informations invalides)")
ZO_CreateStringId("GS_HELP_SLIDE", "/lgs slide  - déplace vos enregistrements de ventes vers un nouveau @nom (Ex. @kindredspiritgr vers @kindredspiritgrSlid) / mm glisser vers l'arrière pour inverser.")
ZO_CreateStringId("GS_HELP_MMIMPORT", "/lgs mmimport  - Importer des données de ventes à partir de Master Merchant.")
ZO_CreateStringId("GS_HELP_ATTIMPORT", "/lgs attimport  - Importer des données de ventes à partir de Arkadius' Trade Tools.")

ZO_CreateStringId("GS_COLOR_WHITE", "blanc")
ZO_CreateStringId("GS_COLOR_GREEN", "vert")
ZO_CreateStringId("GS_COLOR_BLUE", "bleu")
ZO_CreateStringId("GS_COLOR_PURPLE", "violet")
ZO_CreateStringId("GS_COLOR_GOLD", "or")
ZO_CreateStringId("GS_COLOR_ORANGE", "orange")

ZO_CreateStringId("GS_SALES_MANAGEMENT_NAME", "Options de gestion des ventes")
ZO_CreateStringId("GS_DATA_MANAGEMENT_NAME", "Options de gestion des données")
ZO_CreateStringId("GS_SHOPPINGLIST_DEPTH_NAME", "Taille de l'historique de ShoppingList")
ZO_CreateStringId("GS_SHOPPINGLIST_DEPTH_TIP", "Combien de jours de données d'achat doivent être stockées dans ShoppingList.")
ZO_CreateStringId("GS_HISTORY_DEPTH_NAME", "Taille de l'historique des ventes")
ZO_CreateStringId("GS_HISTORY_DEPTH_TIP", "Combien de jours de données de ventes doivent être stockées. Réduire cela peut réduire l'impact de cet addon sur les performances.")
ZO_CreateStringId("GS_POSTEDITEMS_DEPTH_NAME", "Taille de l'historique des articles publiés")
ZO_CreateStringId("GS_POSTEDITEMS_DEPTH_TIP", "Combien de jours de données doivent être stockées dans le rapport sur les éléments publiés.")
ZO_CreateStringId("GS_CANCELEDITEMS_DEPTH_NAME", "Taille de l'historique des articles annulés")
ZO_CreateStringId("GS_CANCELEDITEMS_DEPTH_TIP", "Combien de jours de données doivent être stockées dans le rapport sur les articles annulés.")

ZO_CreateStringId("GS_APP_NAME", "LibGuildStore")
ZO_CreateStringId("GS_APP_AUTHOR", "Sharlikran")
ZO_CreateStringId("GS_DAYS_ONLY_NAME", "N'utiliser que la taille de l'historique des ventes")
ZO_CreateStringId("GS_DAYS_ONLY_TIP", "Utilisera la taille de l'historique des ventes uniquement lors de la réduction de l'historique des ventes. Cela ignorera le nombre min et max.")
ZO_CreateStringId("GS_MIN_ITEM_COUNT_NAME", "Nombre minimal d'articles")
ZO_CreateStringId("GS_MIN_ITEM_COUNT_TIP", "Nombre minimum de ventes pour un article à conserver dans l'historique.")
ZO_CreateStringId("GS_MAX_ITEM_COUNT_NAME", "Nombre maximal d'articles")
ZO_CreateStringId("GS_MAX_ITEM_COUNT_TIP", "Nombre maximum de ventes d'un article à conserver dans l'historique.")
ZO_CreateStringId("GS_MIN_SALES_INTERVAL_NAME", "Min Sales Interval")
ZO_CreateStringId("GS_MIN_SALES_INTERVAL_TIP", "Minimum Sales Interval to evaluate prior to trimming sales. A value of 0 disables the evaluation.")
ZO_CreateStringId("GS_MIN_SALES_INTERVAL_DESC", "When this value is greater then 0 the Min item count and the sales interval (in Days) will be considered first before truncating. If the interval is set to 10 days and the sale is less then 10 days old the sale will be retained the same as a sale below the Min Item Count.")
ZO_CreateStringId("GS_SKIP_INDEX_NAME", "Indexation minimale")
ZO_CreateStringId("GS_SKIP_INDEX_TIP", "Les index de l'historique des ventes sont ignorés pour économiser de la mémoire, mais la recherche sur l'écran MM est beaucoup plus lente.")
ZO_CreateStringId("GS_DUP_PURGE", "Double purge: %s secondes nettoyer %s doublons.")
ZO_CreateStringId("GS_REINDEXING_EVERYTHING", "Tout réindexer.")
ZO_CreateStringId("GS_REINDEXING_COMPLETE", "Réindexation terminée.")
ZO_CreateStringId("GS_PURGING_DUPLICATES", "Purger les doublons.")
ZO_CreateStringId("GS_PURGING_DUPLICATES_DELAY", "La purge des enregistrements de ventes en double commencera à la fin de l'analyse en cours.")
ZO_CreateStringId("GS_SLIDING_SALES", "Faire glisser vos ventes.")
ZO_CreateStringId("GS_SLIDING_SALES_DELAY", "Le glissement de vos enregistrements de ventes commencera lorsque l'analyse en cours sera terminée.")
ZO_CreateStringId("GS_CLEAN_START", "Nettoyer les mauvais enregistrements.")
ZO_CreateStringId("GS_CLEAN_START_DELAY", "Le nettoyage des enregistrements de ventes erronés commencera à la fin de l'analyse en cours.")
ZO_CreateStringId("GS_CLEAN_UPDATE_DESC", "Le nettoyage de LibGuildStore est configuré pour mettre à jour le texte de recherche.")
ZO_CreateStringId("GS_MINIMAL_INDEXING", "LibGuildStore configuré pour l'indexation minimale.")
ZO_CreateStringId("GS_FULL_INDEXING", "LibGuildStore configuré pour l'indexation complète.")
ZO_CreateStringId("GS_INDEXING_SUMMARY", "Indexation : %s secondes pour indexer %s enregistrements de ventes, %s mots uniques")
ZO_CreateStringId("GS_SLIDING_SUMMARY", "Glissement : %s secondes pour faire glisser %s enregistrements de ventes vers %s.")
ZO_CreateStringId("GS_CP_RANK_SEARCH", "cp")
ZO_CreateStringId("GS_REGULAR_RANK_SEARCH", "rr")
ZO_CreateStringId("GS_INIT_SALES_HISTORY_SUMMARY", "initialiser la Guilde et totaux d'article : %s secondes pour initialiser %s enregistrements.")
ZO_CreateStringId("GS_INIT_PURCHASES_HISTORY_SUMMARY", "initialisation des Totaux d'achat : %s secondes pour initialiser %s enregistrements.")
ZO_CreateStringId("GS_INIT_LISTINGS_HISTORY_SUMMARY", "initialisation total des listes : %s secondes pour initialiser %s enregistrements.")
ZO_CreateStringId("GS_TRUNCATE_NAME", "Activer le résumé tronqué")
ZO_CreateStringId("GS_TRUNCATE_TIP", "Afficher les totaux tronqués une fois le processus terminé.")
ZO_CreateStringId("GS_GUILD_ITEM_SUMMARY_NAME", "Activer la guilde et le résumé des article")
ZO_CreateStringId("GS_GUILD_ITEM_SUMMARY_TIP", "Afficher les totaux de guilde et d'article une fois le processus terminé.")
ZO_CreateStringId("GS_INDEXING_NAME", "Activer le résumé d'indexation")
ZO_CreateStringId("GS_INDEXING_TIP", "Afficher les totaux d'indexation une fois le processus terminé.")
ZO_CreateStringId("GS_CLEANING_TIME_ELAPSED", "Nettoyage : %s secondes pour nettoyer:")
ZO_CreateStringId("GS_CLEANING_BAD_REMOVED", "  %s mauvais dossiers de vente supprimés")
ZO_CreateStringId("GS_CLEANING_REINDEXED", "  %s registres des ventes réindexés")
ZO_CreateStringId("GS_CLEANING_WRONG_VERSION", "  %s mauvaises versions d'articles")
ZO_CreateStringId("GS_CLEANING_WRONG_ID", "  %s mauvais ID d'article")
ZO_CreateStringId("GS_CLEANING_WRONG_MULE", "  %s mauvais ID d'article de mule")
ZO_CreateStringId("GS_CLEANING_STRINGS_CONVERTED", "  %s événements avec des nombres convertis en chaînes")
ZO_CreateStringId("GS_CLEANING_BAD_ITEMLINKS", "  %s liens d'articles incorrects supprimés")
ZO_CreateStringId("GS_RESET_CONFIRM_TITLE", "Confirmer la réinitialisation")
ZO_CreateStringId("GS_RESET_CONFIRM_MAIN", "Êtes-vous sûr de vouloir réinitialiser votre historique des ventes ? Vous devrez rafraichir vos données LibHistoire.")

ZO_CreateStringId("GS_REFRESH_NOT_FINISHED", "L'actualisation de LibGuildStore n'est pas terminée")
ZO_CreateStringId("GS_REFRESH_FINISHED", "Actualisation de LibGuildStore terminée")
ZO_CreateStringId("GS_REFRESH_STARTING", "Démarrage de l'actualisation de LibGuildStore")
ZO_CreateStringId("GS_REFRESH_ESTIMATE", ": %s estimated events and %s minutes remaining.")

ZO_CreateStringId("GS_ALL_BUTTON", GetString(SI_ITEMTYPEDISPLAYCATEGORY0))
ZO_CreateStringId("GS_WEAPONS_BUTTON", GetString(SI_ITEMTYPEDISPLAYCATEGORY1))
ZO_CreateStringId("GS_ARMOR_BUTTON", GetString(SI_ITEMTYPEDISPLAYCATEGORY2))
ZO_CreateStringId("GS_JEWELRY_BUTTON", GetString(SI_ITEMTYPEDISPLAYCATEGORY3))
ZO_CreateStringId("GS_CONSUMABLE_BUTTON", GetString(SI_ITEMTYPEDISPLAYCATEGORY4))
ZO_CreateStringId("GS_CRAFTING_BUTTON", GetString(SI_ITEMTYPEDISPLAYCATEGORY5))
ZO_CreateStringId("GS_FURNISHING_BUTTON", GetString(SI_ITEMTYPEDISPLAYCATEGORY6))
ZO_CreateStringId("GS_MISCELLANEOUS_BUTTON", GetString(SI_ITEMTYPEDISPLAYCATEGORY7))
ZO_CreateStringId("GS_COMPANION_BUTTON", GetString(SI_QUESTTYPE16))
ZO_CreateStringId("GS_UNKNOWN_BUTTON", GetString(SI_INPUT_LANGUAGE_UNKNOWN))
ZO_CreateStringId("GS_KNOWN_BUTTON", "Connu")

-- buttons to toggle personal and guild sales
ZO_CreateStringId("GS_VIEW_POSTED_ITEMS", "Afficher les éléments publiés")
ZO_CreateStringId("GS_VIEW_CANCELED_ITEMS", "Afficher les article annulés")
-- window title viewMode - Personal sales
ZO_CreateStringId("GS_POSTED_ITEMS_TITLE", "Articles publiés")
-- window title viewSize - All sales
ZO_CreateStringId("GS_CANCELED_ITEMS_TITLE", "Articles annulés")

ZO_CreateStringId("GS_LIBGUILDSTORE_INITIALIZING", "Initialisation de LibGuildStore")
ZO_CreateStringId("GS_LIBGUILDSTORE_REFERENCE_DATA", "LibGuildStore Referencing Sales Data Containers")
ZO_CreateStringId("GS_LIBGUILDSTORE_TRUNCATE", "Commence à tronquer les enregistrements de LibGuildStore...")
ZO_CreateStringId("GS_LIBGUILDSTORE_HISTORY_INIT", "Début de l'initialisation de l'historique de LibGuildStore...")
ZO_CreateStringId("GS_LIBGUILDSTORE_BUSY", "LibGuildStore est occupé")

ZO_CreateStringId("GS_IMPORTING_ATT_SALES", "Importer des ventes de ATT")
ZO_CreateStringId("GS_ATT_MISSING", "Arkadius Trade Tools Données de vente non détectées.")
ZO_CreateStringId("GS_IMPORTING_MM_SALES", "Importation des ventes de MasterMerchant")
ZO_CreateStringId("GS_MM_MISSING", "Ventes de marchands anciens non détectées.")
ZO_CreateStringId("GS_MM_EU_NA_IMPORT_WARN", "Vos données MM contiennent des valeurs des serveurs NA et EU. Toutes les versions antérieures à 3.6.x ne séparaient pas les données de ventes NA et EU. Vous devez remplacer cela dans les paramètres de LibGuildStore.")
ZO_CreateStringId("GS_MM_EU_NA_DIFFERENT_SERVER_WARN", "Vous essayez d'importer des données NA ou EU MM, mais vous vous êtes connecté à un type de serveur différent. Vous devez remplacer cela dans les paramètres de LibGuildStore.")
ZO_CreateStringId("GS_RESET_EU_INSTEAD", "Réinitialisation annulée car LibHistoire actualiserait les données EU à la place.")
ZO_CreateStringId("GS_RESET_NA_INSTEAD", "Réinitialisation abandonnée car LibHistoire actualiserait les données NA à la place.")
ZO_CreateStringId("GS_SHOPPINGLIST_MISSING", "ShoppingList non actif")
ZO_CreateStringId("GS_SHOPPINGLIST_IMPORTED", "ShoppingList données importées.")
ZO_CreateStringId("GS_ELAPSED_TIME_FORMATTER", "%s secondes pour traiter %s enregistrements")
ZO_CreateStringId("GS_ATT_PURCHASE_DATA_MISSING", "Arkadius Trade Tools Données d'achat introuvables.")
ZO_CreateStringId("GS_ATT_PURCHASE_DATA_IMPORTED", "Arkadius Trade Tools Données d'achat introuvables.")

-- dropdown choices
ZO_CreateStringId("GS_DEAL_CALC_TTC_SUGGESTED", "TTC Suggéré")
ZO_CreateStringId("GS_DEAL_CALC_TTC_AVERAGE", "Moyenne TTC")
ZO_CreateStringId("GS_DEAL_CALC_MM_AVERAGE", "Moyenne MM")
ZO_CreateStringId("GS_DEAL_CALC_BONANZA_PRICE", "Prix Bonanza")

-- description menu text
ZO_CreateStringId("GS_IMPORT_MM_SALES", "Import des ventes MM")
ZO_CreateStringId("GS_IMPORT_ATT_SALES", "Import des ventes ATT")
ZO_CreateStringId("GS_IMPORT_ATT_PURCHASES", "Import des achats ATT")
ZO_CreateStringId("GS_REFRESH_LIBHISTOIRE", "Rafraîchir la base de données LibHistoire")
ZO_CreateStringId("GS_IMPORT_SHOPPINGLIST", "Importer ShoppingList")
ZO_CreateStringId("GS_RESET_LIBGUILDSTORE", "Réinitialiser NA LibGuildStore")
ZO_CreateStringId("GS_RESET_EU_LIBGUILDSTORE", "Réinitialiser EU LibGuildStore")

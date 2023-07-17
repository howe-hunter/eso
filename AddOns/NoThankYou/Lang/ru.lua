--------------------------------------
-- Russian localization for No Thank You! --
--------------------------------------

SafeAddString(NOTY_INTERACTION_TAKE, "Взять", 1)
SafeAddString(NOTY_INSECT_BUTTERFLY, "Бабочка", 1)
SafeAddString(NOTY_INSECT_TORCHBUG, "Светлячок", 1)
SafeAddString(NOTY_INSECT_WASP, "Оса", 1)
SafeAddString(NOTY_INSECT_FLESHFLIES, "Мясные мухи", 1)
SafeAddString(NOTY_INSECT_DRAGONFLY, "Стрекоза", 1)
SafeAddString(NOTY_INSECT_NETCHCALF, "Детеныш нетча", 1)
SafeAddString(NOTY_INSECT_FETCHERFLY, "Муха-сборщица", 1)
SafeAddString(NOTY_INSECT_DOVAH, "Дова-муха Сета", 1)

SafeAddString(NOTY_ENTERING_GROUP_AREA, "Вы входите в групповую область.", 1)
SafeAddString(NOTY_LEAVING_GROUP_AREA, "Вы покидаете групповую область.", 1)

SafeAddString(NOTY_RAID_COMPLETE, " завершили", 1)
SafeAddString(NOTY_RAID_OTHERS, "и <<1>> других", 1)

SafeAddString(NOTY_GUILD_INV_OPTION_0, "не блокировать", 1)
SafeAddString(NOTY_GUILD_INV_OPTION_1, "всегда", 1)
SafeAddString(NOTY_GUILD_INV_OPTION_2, "when full of guilds", 1)

SafeAddString(NOTY_AVA_MODE_OPTION_0, "не отключать", 1)
SafeAddString(NOTY_AVA_MODE_OPTION_1, "сообщение в чат", 1)
SafeAddString(NOTY_AVA_MODE_OPTION_2, "отключить", 1)

SafeAddString(NOTY_SOUND_MODE_OPTION_0, "никогда", 1)
SafeAddString(NOTY_SOUND_MODE_OPTION_1, "вне боя", 1)
SafeAddString(NOTY_SOUND_MODE_OPTION_2, "в бою", 1)
SafeAddString(NOTY_SOUND_MODE_OPTION_3, "всегда", 1)

SafeAddString(NOTY_GALERTS_OPTION_0, "не отключать", 1)
SafeAddString(NOTY_GALERTS_OPTION_1, "сообщение в чат", 1)
SafeAddString(NOTY_GALERTS_OPTION_2, "отключить", 1)

SafeAddString(NOTY_RAID_OPTION_0, "всех", 1)
SafeAddString(NOTY_RAID_OPTION_1, "друзей", 1)
SafeAddString(NOTY_RAID_OPTION_2, "членов гильдий", 1)
SafeAddString(NOTY_RAID_OPTION_3, "никого", 1)

SafeAddString(NOTY_MOTD_OPTION_0, "не отключать", 1)
SafeAddString(NOTY_MOTD_OPTION_1, "сообщение в чат", 1)
SafeAddString(NOTY_MOTD_OPTION_2, "отключить", 1)

SafeAddString(NOTY_GUILDLEAVE_OPTION_0, "никого", 1)
SafeAddString(NOTY_GUILDLEAVE_OPTION_1, "всех гильдии", 1)
SafeAddString(NOTY_GUILDLEAVE_OPTION_2, "указанных гильдий", 1)

SafeAddString(NOTY_LUAERR_OPTION_0, "не отключать", 1)
SafeAddString(NOTY_LUAERR_OPTION_1, "уведомление", 1)
SafeAddString(NOTY_LUAERR_OPTION_2, "сообщение в чат", 1)

SafeAddString(NOTYOU_LUAERR_MESSAGE, "Произошла ошибка Lua", 1)
SafeAddString(NOTYOU_LUAERR_HEADING, "Ошибка Lua", 1)
SafeAddString(NOTYOU_LUAERR_SHORT, "Ошибка Lua", 1)

SafeAddString(NOTYOU_LUAMEM_MESSAGE, "Дополнения исчерпали всю доступную им память", 1)
SafeAddString(NOTYOU_LUAMEM_HEADING, "Ошибка памяти Lua", 1)
SafeAddString(NOTYOU_LUAMEM_SHORT, "Ошибка памяти Lua", 1)

SafeAddString(NOTYOU_AVA_HEADER, "Альянс против альянса", 1)
SafeAddString(NOTYOU_AVA, "Настройки отключения", 1)
SafeAddString(NOTYOU_AVA_TOOLTIP, "Выберите, как вы хотите обрабатывать сообщения войны альянсов вне локации войны альянсов:\n|cFFFFFFне отключать|r - без изменений\n|cFFFFFFсообщение в чат|r - перенаправить сообщение в чат\n|cFFFFFFотключить|r - отключить сообщения", 1)

SafeAddString(NOTYOU_GROUPZONE_HEADER, "Групповые области", 1)
SafeAddString(NOTYOU_GROUPZONE, "Настройки отключения", 1)
SafeAddString(NOTYOU_GROUPZONE_TOOLTIP, "Выберите, как вы хотите обрабатывать сообщения о входе или выходе из групповой области:\n|cFFFFFFне отключать|r - без изменений\n|cFFFFFFсообщение в чат|r - перенаправить сообщение в чат\n|cFFFFFFотключить|r - отключить сообщения", 1)

SafeAddString(NOTYOU_FRIENDS_HEADER, "Сообщения о статусе друзей", 1)
SafeAddString(NOTYOU_FRIENDS_ACTIVITY, "Отключить сообщения о статусе друзей", 1)
SafeAddString(NOTYOU_FRIENDS_ACTIVITY_TOOLTIP, "Отключить сообщения в чат, когда друзья заходят или выходят из игры:\n- |cFFFFFF[@username] вошёл в игру персонажем [имя]|r\n- |cFFFFFF[@username] вышел из игры персонажем [имя]|r", 1)

SafeAddString(NOTYOU_TEXT_ALERTS_HEADER, "Текстовые уведомления", 1)
SafeAddString(NOTYOU_MOB_IMMUNE, "Отключить уведомление \"Цель невосприимчива\"", 1)
SafeAddString(NOTYOU_MOB_IMMUNE_TOOLTIP, "Отключить уведомления, которые часто появляются при сражениях с боссами:\n- |cFFFFFF".. GetErrorString(162) .."|r\n- |cFFFFFF".. GetErrorString(177) .."|r\n- |cFFFFFF" .. GetString("SI_ACTIONRESULT", ACTION_RESULT_MISSING_EMPTY_SOUL_GEM) .. "|r\n- |cFFFFFF" .. GetString("SI_ACTIONRESULT", ACTION_RESULT_IMMUNE) .. "|r", 1)
SafeAddString(NOTYOU_SCREENSHOT, "Отключить уведомление \"Скриншот сохранён\"", 1)
SafeAddString(NOTYOU_SCREENSHOT_TOOLTIP, "Отключить уведомление, когда вы делаете скриншот:\n- |cFFFFFFСкриншот сохранён в папке: <путь>|r", 1)
SafeAddString(NOTYOU_ENLIGHTENED, "Отключить уведомление о просвещении", 1)
SafeAddString(NOTYOU_ENLIGHTENED_TOOLTIP, "Отключить уведомление о просвещении\n- |cFFFFFFВы просвещены|r", 1)
SafeAddString(NOTYOU_CRAFTRESULT, "Отключить уведомления о создании предметов", 1)
SafeAddString(NOTYOU_CRAFTRESULT_TOOLTIP, "Отключить уведомления о создании предметов:\n- |cFFFFFF" .. GetString(SI_TRADESKILLRESULT119) .."|r\n- |cFFFFFF" .. GetString(SI_SMITHING_IMPROVEMENT_FAILED) .."|r\n- |cFFFFFF" .. GetString(SI_SMITHING_BLACKSMITH_EXTRACTION_FAILED) .."|r\n- |cFFFFFF" .. GetString(SI_SMITHING_DECONSTRUCTION_LEVEL_PENALTY) .. "|r\n- |cFFFFFF" .. GetString(SI_ALCHEMY_NO_YIELD) .. "|r\n- |cFFFFFF" .. GetString(SI_ENCHANT_NO_YIELD) .. "|r", 1)
SafeAddString(NOTYOU_REPAIR, "Отключить уведомления о ремонте", 1)
SafeAddString(NOTYOU_REPAIR_TOOLTIP, "Отключить уведомления о ремонте:\n- |cFFFFFF<Предмет> отремонтирован|r", 1)
SafeAddString(NOTYOU_ALERT_THROTTLING, "Задержка между одинаковыми уведомл.", 1)
SafeAddString(NOTYOU_ALERT_THROTTLING_TOOLTIP, "Показывать одинаковые уведомления только через выбранное количество секунд.", 1)

SafeAddString(NOTYOU_SOUND_HEADER, "Звуковые уведомления", 1)
SafeAddString(NOTYOU_ULTISOUND, "Отключить звук готовности абс. способности", 1)
SafeAddString(NOTYOU_ULTISOUND_TOOLTIP, "Выберите, когда вы хотите отключить звук готовности абсолютной способности.", 1)

SafeAddString(NOTYOU_MARKET_ADS, "Отключить предложения кронного магазина", 1)
SafeAddString(NOTYOU_MARKET_ADS_TOOLTIP, "Отключить предложения кронного магазина, которые отображаются при входе в игру.", 1)

SafeAddString(NOTYOU_CROWCRATES, "Отключить кронные ящики", 1)
SafeAddString(NOTYOU_CROWCRATES_TOOLTIP, "Скрыть иконку кронных ящиков и отключить горячую клавишу", 1)

SafeAddString(NOTYOU_MAIL_HEADER, "Диалог удаления письма", 1)
SafeAddString(NOTYOU_MAIL, "Отключить диалог \"Удаление письма\"", 1)
SafeAddString(NOTYOU_MAIL_TOOLTIP, "Отключить подтверждение при удалении письма.", 1)

SafeAddString(NOTYOU_FENCE_HEADER, "Скупщик краденого", 1)
SafeAddString(NOTYOU_FENCE, "Удалить диалог \"Can't buyback from fence\"", 1)
SafeAddString(NOTYOU_FENCE_TOOLTIP, "Отключить подтверждение при продаже редких вещей скупщику краденого.", 1)

SafeAddString(NOTYOU_GROUPS_HEADER, "Групповые диалоги", 1)
SafeAddString(NOTYOU_GROUPS_DISBAND, "Отключить диалог \"Покинуть группу\"", 1)
SafeAddString(NOTYOU_GROUPS_DISBAND_TOOLTIP, "Отключить подтверждение, когда вы покидаете группу.", 1)
SafeAddString(NOTYOU_GROUPS_LARGE, "Отключить диалог \"Large group conversion\"", 1)
SafeAddString(NOTYOU_GROUPS_LARGE_TOOLTIP, "Отключить подтверждение при создании большой группы.", 1)

SafeAddString(NOTYOU_CRAFT_HEADER, "Ремесленные диалоги", 1)
SafeAddString(NOTYOU_CRAFT, "Отключить диалог \"Попытка улучшения предмета\"", 1)
SafeAddString(NOTYOU_CRAFT_TOOLTIP, "Отключить подтверждение при попытке улучшить предмет экипировки.", 1)

SafeAddString(NOTYOU_CHAMELEON_HEADER, "Кронные мимические камни", 1)
SafeAddString(NOTYOU_CHAMELEON, "Убрать галочку кронных мимических камней", 1)
SafeAddString(NOTYOU_CHAMELEON_TOOLTIP, "Убрать галочку кронных мимических камней в окне создания предметов экипировки, если у вас нет таких камней.", 1)

SafeAddString(NOTYOU_RETICLE_HEADER, "Прицел", 1)
SafeAddString(NOTYOU_RETICLE_TAKE, "Отключить прицел для насекомых", 1)
SafeAddString(NOTYOU_RETICLE_TAKE_TOOLTIP, "Отключить взаимодействие с бабочками, мухами и т.д.", 1)

SafeAddString(NOTYOU_EMPTY_INTERACT, "Откл. взаимодействие c пуст. контейнерами", 1)
SafeAddString(NOTYOU_EMPTY_INTERACT_TOOLTIP, "Отключить взаимодействие с контейнером, когда он пуст.", 1)

SafeAddString(NOTYOU_NOREPORTONITEMS, "Убрать пункт \"Получить помощь\" из контекстного меню предмета", 1)
SafeAddString(NOTYOU_NOREPORTONITEMS_TOOLTIP, "Убрать пункт \"Получить помощь\" из контекстного меню предмета.", 1)

SafeAddString(NOTYOU_NOBINDALERT, "Не уведомлять при экипировке привязываемых вещей", 1)
SafeAddString(NOTYOU_NOBINDALERT_TOOLTIP, "Отключить подтверждение, когда вы надеваете предмет, который привязывается при экипировке.", 1)

SafeAddString(NOTYOU_NOPORTONLEADER, "Отключить диалог перемещения к лидеру группы", 1)
SafeAddString(NOTYOU_NOPORTONLEADER_TOOLTIP, "Отключить диалог, предлагающий вам переместиться к лидеру группы.", 1)

SafeAddString(NOTY_NOPORTONLEADER_0, "никогда", 1)
SafeAddString(NOTY_NOPORTONLEADER_1, "когда место назначения недоступно", 1)
SafeAddString(NOTY_NOPORTONLEADER_2, "всегда", 1)

SafeAddString(NOTYOU_TAMRIEL, "Скрыть всё на карте Тамриэля", 1)
SafeAddString(NOTYOU_TAMRIEL_TOOLTIP, "Скрыть все иконки на карте Тамриэля.", 1)

SafeAddString(NOTYOU_WAYSHRINES, "Дорожные святилища на карте Тамриэля", 1)
SafeAddString(NOTYOU_WAYSHRINES_TOOLTIP, "Выберите, как отображать дорожные святилища на карте Тамриэля.", 1)

SafeAddString(NOTYOU_DUNGEONS, "Подземелья на карте Тамриэля", 1)
SafeAddString(NOTYOU_DUNGEONS_TOOLTIP, "Выберите, как отображать групповые подземелья на карте Тамриэля.", 1)

SafeAddString(NOTYOU_UNOWNED_HOUSES, "Дома для покупки", 1)
SafeAddString(NOTYOU_UNOWNED_HOUSES_TOOLTIP, "Выберите, как отображать дома, которые можно приобрести, на карте Тамриэля.", 1)

SafeAddString(NOTYOU_OWNED_HOUSES, "Ваши дома", 1)
SafeAddString(NOTYOU_OWNED_HOUSES_TOOLTIP, "Выберите, как отображать дома, которыми вы владеете, на карте Тамриэля.", 1)

SafeAddString(NOTY_WAYSHRINE_OPTION_0, "показать", 1)
SafeAddString(NOTY_WAYSHRINE_OPTION_1, "показать столичные святилища", 1)
SafeAddString(NOTY_WAYSHRINE_OPTION_2, "скрыть всё", 1)

SafeAddString(NOTY_DUNGEONS_OPTION_0, "показать", 1)
SafeAddString(NOTY_DUNGEONS_OPTION_1, "показать только испытания", 1)
SafeAddString(NOTY_DUNGEONS_OPTION_2, "скрыть всё", 1)

SafeAddString(NOTY_UNOWNED_HOUSES_OPTION_0, "показать", 1)
SafeAddString(NOTY_UNOWNED_HOUSES_OPTION_1, "показать только в зонах/городах", 1)
SafeAddString(NOTY_UNOWNED_HOUSES_OPTION_2, "скрыть", 1)

SafeAddString(NOTYOU_NOWRITQUESTS, "Don't show Writ quests automatically", 1)
SafeAddString(NOTYOU_NOWRITQUESTS_TOOLTIP, "Don't show Writ quests automatically when looting a Master Writ", 1)

SafeAddString(NOTYOU_GUILDS_HEADER, "Приглашения в гильдии", 1)
SafeAddString(NOTYOU_GUILDS, "Блокировать приглашения в гильдии", 1)
SafeAddString(NOTYOU_GUILDS_TOOLTIP, "Блокировать сообщения и уведомления о приглашении в гильдии.", 1)

SafeAddString(NOTYOU_GROSTER_HEADER, "Гильдейские уведомления", 1)
SafeAddString(NOTYOU_GROSTER_HEADER_TOOLTIP, "Выберите, как обрабатывать гильдейские уведомления.", 1)
SafeAddString(NOTYOU_GROSTER, "Настройки отключения", 1)
SafeAddString(NOTYOU_GROSTER_TOOLTIP, "Выберите, как обрабатывать гильдейские уведомления:\n|cFFFFFFне отключать|r - без изменений\n|cFFFFFFсообщение в чат|r - перенаправить уведомления в чат\n|cFFFFFFотключить|r - отключить уведомления", 1)

SafeAddString(NOTYOU_RAIDSCORE_HEADER, "Уведомления о результатах рейдов", 1)
SafeAddString(NOTYOU_RAIDSCORE_HEADER_TOOLTIP, "Выберите, как вы хотите обрабатывать уведомления о результатах рейдов.", 1)
SafeAddString(NOTYOU_RAIDSCORE_ONLYFOR, "Показать результаты для:", 1)
SafeAddString(NOTYOU_RAIDSCORE_ONLYFOR_TOOLTIP, "Выберите, как вы хотите обрабатывать уведомления о результатах рейдов:\n|cFFFFFFвсех|r - без изменений\n|cFFFFFFдрузей|r - только, если рейд завершил друг\n|cFFFFFFчленов гильдий|r - только, если рейд завершил член гильдии (дополнительные фильтры ниже)\n|cFFFFFFникого|r - отключить все уведомления", 1)
SafeAddString(NOTYOU_RAIDSCORE_REDIRECT, "Перенаправлять уведомления в чат", 1)

SafeAddString(NOTYOU_MOTD_HEADER, "\"Сообщения дня\" гильдий", 1)
SafeAddString(NOTYOU_MOTD_HEADER_TOOLTIP, "Выберите, как вы хотите обрабатывать сообщения дня гильдий.", 1)
SafeAddString(NOTYOU_MOTD_BLOCK, "Настройки отключения", 1)
SafeAddString(NOTYOU_MOTD_BLOCK_TOOLTIP, "Выберите, как вы хотите обрабатывать сообщения дня гильдий:\n|cFFFFFFне отключать|r - без изменений\n|cFFFFFFсообщение в чат|r - перенаправить сообщение в чат\n|cFFFFFFотключить|r - отключить сообщения", 1)

SafeAddString(NOTYOU_GUILDLEAVE_HEADER, "Клавиша выхода из гильдий", 1)
SafeAddString(NOTYOU_GUILDLEAVE_HEADER_TOOLTIP, "Выберите, как вы хотите настроить отображение горячей клавиши выхода из гильдий", 1)
SafeAddString(NOTYOU_GUILDLEAVE_BLOCK, "Отключить для", 1)
SafeAddString(NOTYOU_GUILDLEAVE_BLOCK_TOOLTIP, "Выберите, как вы хотите настроить отображение горячей клавиши выхода из гильдий:\n|cFFFFFFникого|r - без изменений\n|cFFFFFFвсех гильдии|r - отключить для всех гильдий\n|cFFFFFFуказанных гильдий|r - выбрать гильдии, для которых нужно отключить клавишу", 1)

SafeAddString(NOTYOU_CAMERA_HEADER, "Камера и взаимодействие", 1)
SafeAddString(NOTYOU_CAMERA_INTERRUPT, "Не прерывать взаимодействие", 1)
SafeAddString(NOTYOU_CAMERA_INTERRUPT_TOOLTIP, "Не прерывать взаимодействие (сбор ресурсов, ловля рыбы и т.д.), когда вы открываете карту, инвентарь или другие окна.", 1)
SafeAddString(NOTYOU_CAMERA_ROTATE, "Не вращать камеру", 1)
SafeAddString(NOTYOU_CAMERA_ROTATE_TOOLTIP, "Не вращать камеру, когда вы открываете карту, инвентарь или другие окна.", 1)
SafeAddString(NOTYOU_CAMERA_ROTATE_STATS,			"Don't rotate game camera while showing status", 1)
SafeAddString(NOTYOU_CAMERA_ROTATE_STATS_TOOLTIP,	"Don't rotate game camera while showing status. If you turn this ON, you can't change outfit on status window by ESO feature.", 1)
SafeAddString(NOTYOU_CAMERA_ROTATE_INV,				"Don't rotate game camera while showing inventory", 1)
SafeAddString(NOTYOU_CAMERA_ROTATE_INV_TOOLTIP,		"Don't rotate game camera while showing inventory. If you turn this ON, you can't preview any item by ESO feature.", 1)

SafeAddString(NOTYOU_AUTOLOOTITEMS_HEADER, "Автомат. подбор", 1)
SafeAddString(NOTYOU_AUTOLOOTITEMS, "Автомат. подбор из контейнеров", 1)
SafeAddString(NOTYOU_AUTOLOOTITEMS_TOOLTIP, "Автоматически подбирать предметы из контейнеров, если включен автоматический подбор. Краденные вещи автоматически подбираются из контейнеров, если включена соответствующая настройка.", 1)

SafeAddString(NOTYOU_NOLOREREADER, "Не читать найденные книги", 1)
SafeAddString(NOTYOU_NOLOREREADER_TOOLTIP, "Не показывать на экране книгу, которую вы только что нашли, если вы не находитесь в библиотеке.", 1)

SafeAddString(NOTYOU_NOLOREDISCOVERIES, "Отключить сообщение \"Найдена книга знаний\"", 1)
SafeAddString(NOTYOU_NOLOREDISCOVERIES_TOOLTIP, "Выберите, как вы хотите обрабатывать сообщения о найденных книгах знаний:\n|cFFFFFFне отключать|r - без изменений\n|cFFFFFFсообщение в чат|r - перенаправить сообщение в чат\n|cFFFFFFотключить|r - отключить сообщения", 1)

SafeAddString(NOTYOU_NOSKILLSPROGRESS, "Отключить сообщение \"Навык повышен до ранга X\"", 1)
SafeAddString(NOTYOU_NOSKILLSPROGRESS_TOOLTIP, "Выберите, как вы хотите обрабатывать сообщения о повышении навыков:\n|cFFFFFFне отключать|r - без изменений\n|cFFFFFFсообщение в чат|r - перенаправить сообщение в чат\n|cFFFFFFотключить|r - отключить сообщения", 1)

SafeAddString(NOTYOU_NOCRAFTBAG_NOTIF, "Отключить уведомления о перемещении в ремесленную сумку", 1)
SafeAddString(NOTYOU_NOCRAFTBAG_NOTIF_TOOLTIP, "Не уведомлять, что ваши предметы были перемещены в ремесленную сумку.", 1)

SafeAddString(NOTYOU_NOCHATAUTOCOMPLETE, "Отключить автодополнение в чате", 1)
SafeAddString(NOTYOU_NOCHATAUTOCOMPLETE_TOOLTIP, "Отключить автодополение команд чата, такие как включение эмоций и переключение каналов.", 1)

SafeAddString(NOTYOU_NOCHATDISABLE, "Disable Chat Minimize at Trading House", 1)
SafeAddString(NOTYOU_NOCHATDISABLE_TOOLTIP, "Will disable chat Minimization at trading house scene", 1)

SafeAddString(NOTYOU_LUA_HEADER, "Ошибки Lua", 1)
SafeAddString(NOTYOU_LUA_MEMORY, "Перенаправлять ошибки Lua", 1)
SafeAddString(NOTYOU_LUA_MEMORY_TOOLTIP, "Показывать ошибки Lua в виде уведомление вместо всплывающего диалога.", 1)
SafeAddString(NOTYOU_LUA_ERROR, "Перенаправлять ошибки Lua", 1)
SafeAddString(NOTYOU_LUA_ERROR_TOOLTIP, "Показывать ошибки Lua в виде уведомление вместо всплывающего диалога.", 1)

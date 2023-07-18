﻿-- by ivann339, OlegKRS
Harvest.localizedStrings = {

	-- top level description
	["esouidescription"] = "Для подробной информации о дополнении и FAQ, посетите страницу на esoui.com",
	["openesoui"] = "Открыть ESOUI",
	["exchangedescription2"] = "Вы можете загрузить самые последние данные HarvestMap (позиции ресурсов), установив дополнение HarvestMap-Data. Для получения дополнительной информации см. описание дополнения на ESOUI.",
	
	["notifications"] = "Уведомления и предупреждения",
	["notificationstooltip"] = "Отображает уведомления и предупреждения в правом верхнем углу экрана.",
	["moduleerrorload"] = "Аддон <<1>> отключен.\nНет данных для этой области.",
	["moduleerrorsave"] = "Аддон <<1>> отключен.\nМестоположение ресурса не было сохранено.",
	
	-- outdated data settings
	["outdateddata"] = "Настройки для устаревших даных",
	["outdateddatainfo"] = "Эти настройки, связанные с данными, используются всеми учетными записями и персонажами на этом компьютере.",
	["timedifference"] = "Хранить только последние данные",
	["timedifferencetooltip"] = "HarvestMap будет хранить данные только за последние X дней.\nЭто предотвращает отображение старых данных, которые могут быть уже устаревшими.\nУстановите 0, чтобы сохранить любые данные независимо от их даты обновления игры.",
	["applywarning"] = "Как только старые удалены, они не могут быть восстановлены!",
	
	-- account wide settings
	["account"] = "Настройки для всех персонажей",
	["accounttooltip"] = "Все настройки ниже будут применены ко всем персонажам.",
	["accountwarning"] = "Изменение этой настройки перезагрузит UI.",
	
	-- map pin settings
	["mapheader"] = "Настройка отображения меток на карте",
	["mappins"] = "Включить отображения меток на мини-карте",
	["minimappins"] = "Включить метки на мини-карте",
	["mappinstooltip"] = "Поддерживаемые мини-карты: Votan, Fyrakin and AUI.",
	["level"] = "Показывать метки с ресурсами рядом с POI",
	["hasdrawdistance"] = "Показывать только ближайшие метки",
	["hasdrawdistancetooltip"] = "Если эта функция включена, HarvestMap будет создавать метки только для ресурсов, расположенных близко к игроку.\N Этот параметр влияет только на основную карту. На миникарте эта опция включается автоматически!",
	["hasdrawdistancewarning"] = "Этот параметр влияет только на игровую карту. На миникарте эта опция включается автоматически!",
	["drawdistance"] = "Расстояние до меток",
	["drawdistancetooltip"] = "Предел расстояния для которого будут отображаться метки на карте. Эта настройка также влияет на мини-карту!",
	["drawdistancewarning"] = "Эта настройка также влияет на мини-карту!",
	
	--mapvisiblepintypedescription = [[Видимые типы меток также можно выбрать на панели фильтров справа, рядом с игровой картой.]],
	visiblepintypes = "Видимые типы меток",
	custom_profile = "Свой",
	same_as_map = "То же, что и на карте",
	
	-- compass settings
	["compassheader"] = "Настройки компаса",
    ["compass"] = "Показывать метки на компасе",
	["compassdistance"] = "Максимальная дистанция до меток",
	["compassdistancetooltip"] = "Максимальное расстояние для меток в метрах, которые появляются на компасе.",
	
	-- 3d pin settings
	["worldpinsheader"] = "Настройки 3D меток",
	["worldpins"] = "Включить 3D метки",
	["worlddistance"] = "Максимальное расстояние 3D меток",
	["worlddistancetooltip"] = "Максимальное расстояние до 3D метки в метрах. Дальше выбранного значения, 3D метка не отображается.",
	["worldpinwidth"] = "Ширина 3D метки",
	["worldpinwidthtooltip"] = "Ширина 3D метки в сантиметрах.",
	["worldpinheight"] = "Высота 3D метки",
	["worldpinheighttooltip"] = "Высота 3D метки в сантиметрах.",
	["worldpinsdepth"] = "Использовать буфер глубины для 3D меток",
	["worldpinsdepthtooltip"] = "Если этот параметр отключен, 3D метки будут видны сквозь стены и другие объекты.",
	["worldpinsdepthwarning"] = "Из-за ошибки в ESO эта опция не работает, если в настройках видео игры выбрано среднее или низкое качество Sub-Sampling (субсэмплирования).",
	
	-- respawn timer settings
	["visitednodes"] = "Посещенные ресурсы и Помощник по сбору",
	["rangemultiplier"] = "Расстояние до посещенных ресурсов",
	["rangemultipliertooltip"] = "Ресурсы в пределах X метров, будут считаться таймером возрождения и помощником сбора как посещенные.",
	["usehiddentime"] = "Скрыть недавно посещенные ресурсы",
	["usehiddentimetooltip"] = "Метки будут скрыты, если вы недавно посетили их.",
	["hiddentime"] = "Продолжительность скрытия",
	["hiddentimetooltip"] = "Недавно посещенные ресурсы будут скрыты в течение X минут.",
	["hiddenonharvest"] = "Скрыть ресурсы только после сбора",
	["hiddenonharvesttooltip"] = "Включите эту опцию, чтобы скрывать метки, когда вы их собирали. Когда эта опция отключена, метки будут скрыты, если вы их посетите.",
	
	-- spawn filter
	spawnfilter = "Фильтры ресурсов",
	nodedetectionmissing = "Эти параметры могут быть включены только в том случае, если включена библиотека 'NodeDetection'.",
	spawnfilterdescription = [[Если эта функция включена, HarvestMap скроет метки для ресурсов, которые еще не восстановились. Например, если другой игрок уже собрал ресурс, то метка будет скрыта до тех пор, пока ресурс снова не станет доступным. Эта опция работает только для собираемого крафтового материала. Это не работает для контейнеров, такие как сундуки, тяжелые мешки или порталы псиджиков. Фильтр не работает, если другой аддон скрывает или изменяет масштаб компаса.]],
	spawnfilter_map = "Исполь фильтр на главной карте",
	spawnfilter_minimap = "Использовать фильтр на миникарте",
	spawnfilter_compass = "Использовать фильтр для меток на компасе",
	spawnfilter_world = "Использо фильтр для 3D меток",
	spawnfilter_pintype = "Включить фильтр для типов меток:",
	
	-- pin type options
	["pinoptions"] = "Общие настройки меток",
	["pinsize"] = "Размер метки",
	["pinsizetooltip"] = "Установить размер метки на карте.",
	["pincolor"] = "Цвет метки",
	["pincolortooltip"] = "Установить цвет меток на карте и компасе.",
	["savepin"] = "Сохраненить местоположение",
	["savetooltip"] = "Включает сохранение местоположения этого ресурса, при его обнаружении.",
	["pintexture"] = "Значок метки",
	
	-- pin type names
	["pintype1"] = "Кузнечное дело и Ювелирное дело",
	["pintype2"] = "Волокнистые растения",
	["pintype3"] = "Руны и Порталы Псиджиков",
	["pintype4"] = "Грибы",
	["pintype13"] = "Растения/Цветы",
	["pintype14"] = "Водяные растения",
	["pintype5"] = "Древесина",
	["pintype6"] = "Сундуки",
	["pintype7"] = "Растворители",
	["pintype8"] = "Места для рыбалки",
	["pintype9"] = "Тяжелые мешки",
	["pintype10"] = "Клад воров",
	["pintype11"] = "Взломанные сундуки",
	["pintype12"] = "Скрытые тайники",
	["pintype15"] = "Гигантские моллюски",
    -- pin type 16, 17 используются для Ювелирное дело и Порталы Псиджиков
    -- но локации такие же, как кузнечное дело и руны
	["pintype18"] = "Неизвестные ресурсы",
	["pintype19"] = "Корень Нирна",
	
	
	-- extra map filter buttons
	["deletepinfilter"] = "Удалить метки HarvestMap",
	["filterheatmap"] = "Режим тепловой карты",
	
	-- localization for the farming helper
	["goldperminute"] = "Золото в минуту:",
    ["farmresult"] = "Результат вычислений",
	["farmnotour"] = "HarvestFarm не смог просчитать маршрут для сбора с указанной минимальной длиной пути.",
	["farmerror"] = "HarvestFarm ошибка",
	["farmnoresources"] = "Ресурсы не найдены.\n На этой карте нет ресурсов или вы не выбрали ни один из типов ресурсов.",
	["farmsuccess"] = "HarvestFarm просчитал путь для сбора с <<1>> ресурсами на километр.\n\nНажмите на одну из точек пути, чтобы установить начальную точку пути.",
	["farmdescription"] = "HarvestFarm вычислит наиболее оптимальный путь с высоким содержанием ресурсов за один промежуток времени.\nПосле создания пути нажмите на один из выбранных ресурсов, чтобы задать начальную точку пути.",
	["farmminlength"] = "Минимальная длина пути",
	["farmminlengthtooltip"] = "Минимальная длина пути в километрах.",
	["farmminlengthdescription"] = "Чем длиннее путь, тем больше шансов что ресурс возродиться после прохождения вами полного цикла.\nОднако более короткий путь имеет лучшее соотношение ресурсов за единицу времени.",
	["tourpin"] = "Следующая цель вашего пути",
	["calculatetour"] = "Просчитать путь",
	["showtourinterface"] = "Интерфейс пути",
	["canceltour"] = "Отменить путь",
	["reverttour"] = "Развернуть направление",
	["resourcetypes"] = "Тип ресурсов",
	["skiptarget"] = "Пропустить цель",
	["removetarget"] = "Удалить цель",
	["nodesperminute"] = "Ресурсов в минуту",
	["distancetotarget"] = "Расстояние до след. ресурса",
	["showarrow"] = "Показывать направление",
	["removetour"] = "Удалить путь",
	["undo"] = "Отменить последнее изменение",
	["tourname"] = "Название пути: ",
	["defaultname"] = "Безымянный путь",
	["savedtours"] = "Сохраненные пути для этой карты:",
	["notourformap"] = "Для этой карты нет сохраненных путей.",
	["load"] = "Загрузить",
	["delete"] = "Удалить",
	["saveexiststitle"] = "Пожалуйста, Подтвердите",
	["saveexists"] = "Для этой карты уже существует путь с названием <<1>>. Вы хотите переписать его?",
	["savenotour"] = "Нет пути, который можно сохранить.",
	["loaderror"] = "Не удалось загрузить путь.",
	["removepintype"] = "Вы хотите удалить <<1>> из пути?",
	["removepintypetitle"] = "Подтвердите Удаление",
	
	-- extra harvestmap menu
    ["pinvisibilitymenu"] = "Расширенное Меню Фильтра Меток",
	["menu"] = "Меню HarvestMap",
	["farmmenu"] = "Редактор пути",
	["editordescription"] = [[В этом меню вы можете создавать и редактировать пути. Если в настоящее время другой активный путь отсутствует, вы можете создать путь, щелкнув по меткам карты. Если есть активный путь, вы можете отредактировать его, заменив подразделы:
	- Сначала нажмите на метку вашего (красная) пути.
	- Затем нажмите на метки, которые вы хотите добавить в свой путь. (Путь станет зеленым)
	- Наконец, снова нажмите на значок вашего красного пути.
	Зеленый путь теперь будет вставлен в красный путь.]],
	["editorstats"] = [[Количество ресурсов: <<1>>
	Расстояние: <<2>> м
	Ресурсов на километр: <<3>>]],

	filterprofiledescription = [[В меню фильтра профиля вы можете выбрать, какие типы меток вы хотите отображать. Вы можете создавать различные профили для карты, компаса и 3D меток. (Вы можете назначить привязку клавиш в настройках управления ESO, чтобы быстро открыть меню фильтра профиля.)]],
	filterprofilebutton = "Открыть Меню Фильтра Профиля",
	filtertitle = "Меню Фильтра Профиля",
	filtermap = "Фильтр Профиля для меток на карте",
	filtercompass = "Фильтр Профиля для меток на компасе",
	filterworld = "Фильтр Профиля для 3D Меток",
	unnamedfilterprofile = "Неназванный Профиль",
	defaultprofilename = "Фильтр Профиля по умолчанию",
	
	-- SI names to fit with ZOS api
	["SI_BINDING_NAME_SKIP_TARGET"] = "Пропустить цель",
	["SI_BINDING_NAME_TOGGLE_WORLDPINS"] = "Включить 3D метки",
	["SI_BINDING_NAME_TOGGLE_MAPPINS"] = "Включить метки на карте",
	["SI_BINDING_NAME_TOGGLE_MINIMAPPINS"] = "Включить метки на мини-карте",
	["SI_BINDING_NAME_HARVEST_SHOW_PANEL"] = "Открыть HarvestMap Редактор Пути",
	["SI_BINDING_NAME_HARVEST_SHOW_FILTER"] = "Открыть HarvestMap Меню Фильтра",
	["HARVESTFARM_GENERATOR"] = "Создать новый путь",
	["HARVESTFARM_EDITOR"] = "Редактировать путь",
	["HARVESTFARM_SAVE"] = "Сохранить/Загрузить путь",
}

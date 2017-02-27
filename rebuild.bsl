Перем Корень; // реквизит формы в оригинале 

Процедура КнопкаНажатие(Элемент)

	 Корень = "Z:\Users\klimenko\Documents\Миграция_XML";
	
	 ИзменитьИдентификаторы(Корень, "Отчет");
	 ИзменитьИдентификаторы(Корень, "Обработка");
	
КонецПроцедуры

Процедура ИзменитьИдентификаторы(Каталог, ТипФайлов)
	
	Если ТипФайлов = "Отчет" Тогда
		Подкаталог = "Reports";
		Тип = "Report";
	ИначеЕсли ТипФайлов = "Обработка" Тогда
		Подкаталог = "DataProcessors";
		Тип = "DataProcessor";
	Иначе
		ВызватьИсключение "НеизвестныйТипФайлов";
	КонецЕсли;
	
	// никогда так не пишите в прикладных решениях
	
	Точка = ".";
	
	ЗаменаЭлементов = Новый Массив;
	ЗаменаЭлементов.Добавить(Новый Структура("Условие,Замена", Новый Структура("ТекущийПуть,Имя", "\MetaDataObject",                                           "External" + Тип),     Новый Структура("Имя", Код("Тип"))));
	ЗаменаЭлементов.Добавить(Новый Структура("Условие,Замена", Новый Структура("ТекущийПуть,Имя", "\MetaDataObject\" + Тип + "\InternalInfo",                  "xr:ContainedObject"), Новый Структура("Имя", Стр("xr:GeneratedType"))));
	ЗаменаЭлементов.Добавить(Новый Структура("Условие,Замена", Новый Структура("ТекущийПуть,Имя", "\MetaDataObject\" + Тип + "\InternalInfo\xr:GeneratedType", "xr:ClassId"),         Новый Структура("Имя", Стр("xr:TypeId"))));
	ЗаменаЭлементов.Добавить(Новый Структура("Условие,Замена", Новый Структура("ТекущийПуть,Имя", "\MetaDataObject\" + Тип + "\InternalInfo\xr:GeneratedType", "xr:ObjectId"),        Новый Структура("Имя", Стр("xr:ValueId"))));
	
	
	ЗаменаАтрибутов = Новый Массив;
	//ЗаменаАтрибутов.Добавить(Новый Структура("Условие,Замена", Новый Структура("ТекущийПуть,Имя", "\MetaDataObject\" + Тип + "\InternalInfo\xr:GeneratedType", "name"), Новый Структура("Значение", Код("Тип") + "+" + Стр("Object.") + "+" + Код("ИмяОбъекта"))));
	Замена = Новый Структура("Условия,Замена", Новый Массив, Неопределено);
	Замена.Условия.Добавить("ТекущийПуть" + "=" + """\MetaDataObject\" + Тип + "\InternalInfo\xr:GeneratedType""");
	Замена.Условия.Добавить("Имя"         + "=" + """name""");
	Замена.Замена = Новый Структура("Значение", Код("Тип") + "+" + Стр("Object.") + "+" + Код("ИмяОбъекта"));
	ЗаменаАтрибутов.Добавить(Замена);
	
	Замена = Новый Структура("Условия,Замена", Новый Массив, Неопределено);
	Замена.Условия.Добавить("ИмяУзла" + "=" + """xr:GeneratedType""");
	Замена.Условия.Добавить("Имя"     + "=" + """name""");
	Замена.Условия.Добавить("СтрНачинаетсяС(Значение, """ + Тип + "TabularSection."")");
	Замена.Замена = Новый Структура("Значение", Код("Тип") + "+" + Стр("TabularSection.") + "+" + Код("ИмяОбъекта") + "+" + Стр(".") + "+" + Код("СтрПолучитьСтроку(СтрЗаменить(Значение, Точка, Символы.ПС), 3)"));
	ЗаменаАтрибутов.Добавить(Замена);
	
	Замена = Новый Структура("Условия,Замена", Новый Массив, Неопределено);
	Замена.Условия.Добавить("ИмяУзла" + "=" + """xr:GeneratedType""");
	Замена.Условия.Добавить("Имя"     + "=" + """name""");
	Замена.Условия.Добавить("СтрНачинаетсяС(Значение, """ + Тип + "TabularSectionRow."")");
	Замена.Замена = Новый Структура("Значение", Код("Тип") + "+" + Стр("TabularSectionRow.") + "+" + Код("ИмяОбъекта") + "+" + Стр(".") + "+" + Код("СтрПолучитьСтроку(СтрЗаменить(Значение, Точка, Символы.ПС), 3)"));
	ЗаменаАтрибутов.Добавить(Замена);
	
	ЗаменаТекста = Новый Массив;
	ЗаменаТекста.Добавить(Новый Структура("Условие,Замена", Новый Структура("ТекущийПуть", "\MetaDataObject\" + Тип + "\Properties\DefaultForm"),   Новый Структура("Значение", Код("Тип") + "+" + Стр(".") + "+" + Код("ИмяОбъекта") + "+" + Стр(".Form.") + "+" + Код("СтрПолучитьСтроку(СтрЗаменить(Значение, Точка, Символы.ПС), 4)"))));
	ЗаменаТекста.Добавить(Новый Структура("Условие,Замена", Новый Структура("ТекущийПуть", "\MetaDataObject\" + Тип + "\Properties\AuxiliaryForm"), Новый Структура("Значение", Код("Тип") + "+" + Стр(".") + "+" + Код("ИмяОбъекта") + "+" + Стр(".Form.") + "+" + Код("СтрПолучитьСтроку(СтрЗаменить(Значение, Точка, Символы.ПС), 4)"))));
	
	Патчи = Новый Соответствие;
	Патчи.Вставить(
	"ТекущийПуть = ""\MetaDataObject\"" + Тип + ""\InternalInfo\xr:GeneratedType"" И Чтение.КоличествоАтрибутов() = 0", 
	"Запись.ЗаписатьАтрибут(""name"", Тип + ""Manager."" + ИмяОбъекта);
	|Запись.ЗаписатьАтрибут(""category"", ""Manager"");
	|СтандартнаяОбработка = Ложь;");
	
	ЗаменыИД = Новый Соответствие;
	
	Для Каждого Файл Из НайтиФайлы(Каталог + "\" + Подкаталог, "*.xml") Цикл
		
		ИмяОбъекта = Файл.ИмяБезРасширения;
		ЗаменыИД.Очистить();
		
		Чтение = Новый ЧтениеXML;
		Чтение.ОткрытьФайл(Файл.ПолноеИмя);
		
		Запись = Новый ЗаписьXML;
		Запись.УстановитьСтроку();
		Запись.ЗаписатьОбъявлениеXML();
		
		Путь = Новый Массив;
		Путь.Добавить("");
		ТекущийПуть = Путь[Путь.ВГраница()];
		
		Пока Чтение.Прочитать() Цикл
			
			Если Чтение.ТипУзла = ТипУзлаXML.КонецЭлемента Тогда
				
				Запись.ЗаписатьКонецЭлемента();
				Путь.Удалить(Путь.ВГраница());
				ТекущийПуть = Путь[Путь.ВГраница()];
				
			ИначеЕсли Чтение.ТипУзла = ТипУзлаXML.НачалоЭлемента Тогда
				
				Имя = Чтение.Имя;
				
				Для Каждого Вариант Из ЗаменаЭлементов Цикл
					Если Вычислить(КодУсловия(Вариант.Условие)) Тогда
						Выполнить(КодЗамены(Вариант.Замена));
						Прервать;
					КонецЕсли;
				КонецЦикла;
				
				ИмяУзла = Имя;
				
				Запись.ЗаписатьНачалоЭлемента(Имя);
				Путь.Добавить(ТекущийПуть + "\" + Имя);
				ТекущийПуть = Путь[Путь.ВГраница()];
				
				СтандартнаяОбработка = Истина;
				
				Для Каждого УсловиеКод Из Патчи Цикл
					Если Вычислить(УсловиеКод.Ключ) Тогда
						Выполнить(УсловиеКод.Значение);
						Прервать;
					КонецЕсли;
				КонецЦикла;
				
				Если СтандартнаяОбработка Тогда
					ЧтениеАтрибута = "Чтение.ПервыйАтрибут()";
					Пока Вычислить(ЧтениеАтрибута) Цикл
						Имя = Чтение.Имя;
						Значение = Чтение.Значение;
						Если Имя = "uuid" Тогда
							Если ЗаменыИД.Получить(Значение) = Неопределено Тогда
								ЗаменыИД.Вставить(Значение, Строка(Новый УникальныйИдентификатор()));
							КонецЕсли;
							Значение = ЗаменыИД.Получить(Значение);
						Иначе
							Для Каждого Вариант Из ЗаменаАтрибутов Цикл
								Ок = Истина;
								Для Каждого Условие Из Вариант.Условия Цикл
									Ок = Ок И Вычислить(Условие);
									Если НЕ Ок Тогда
										Прервать;
									КонецЕсли;
								КонецЦикла;
								Если Ок Тогда
									//Если Вычислить(КодУсловия(Вариант.Условие)) Тогда
									Выполнить(КодЗамены(Вариант.Замена));
									Прервать;
								КонецЕсли;
							КонецЦикла;
						КонецЕсли;
						Запись.ЗаписатьАтрибут(Имя, Значение);
						ЧтениеАтрибута = "Чтение.СледующийАтрибут()";
					КонецЦикла;
				КонецЕсли;
				
			ИначеЕсли Чтение.ТипУзла = ТипУзлаXML.Текст Тогда
				
				Значение = Чтение.Значение;
				Попытка
					Если Значение = Строка(Новый УникальныйИдентификатор(Значение)) Тогда
						Если ЗаменыИД.Получить(Значение) = Неопределено Тогда
							ЗаменыИД.Вставить(Значение, Строка(Новый УникальныйИдентификатор()));
						КонецЕсли;
						Значение = ЗаменыИД.Получить(Значение);
					КонецЕсли;
				Исключение
					Для Каждого Вариант Из ЗаменаТекста Цикл
						Если Вычислить(КодУсловия(Вариант.Условие)) Тогда
							Выполнить(КодЗамены(Вариант.Замена));
							Прервать;
						КонецЕсли;
					КонецЦикла;
				КонецПопытки;
				
				Запись.ЗаписатьТекст(Значение);
				
			КонецЕсли;
		КонецЦикла;
		
		Чтение.Закрыть();
		
		Текст = Новый ТекстовыйДокумент;
		Текст.УстановитьТекст(Запись.Закрыть());
		Текст.Записать(Файл.ПолноеИмя);
		
	КонецЦикла;
	
КонецПроцедуры

Функция КодУсловия(Структура)
	Код = "ИСТИНА";
	Для Каждого КЗ Из Структура Цикл
		Код = Код + " И " + КЗ.Ключ + " = """ + КЗ.Значение + """";
	КонецЦикла;
	Возврат Код;
КонецФункции

Функция КодЗамены(Структура)
	Код = "";
	Для Каждого КЗ Из Структура Цикл
		Код = Код + "
		|" + КЗ.Ключ + " = Вычислить(""" + КЗ.Значение + """);"; 
	КонецЦикла;
	Возврат Код;
КонецФункции

Функция Код(Код)
	Возврат "Вычислить(""""""""""""""""""""+" + Код + "+"""""""""""""""""""")";
КонецФункции

Функция Стр(Стр)
	Возврат """""" + Стр + """""";
КонецФункции

Функция СтрНачинаетсяС(Строка, ПодстрокаПоиска)
	Возврат Найти(Строка, ПодстрокаПоиска) = 1;
КонецФункции

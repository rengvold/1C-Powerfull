
#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура ПолучитьДанные(Команда)
		ПолучитьДанныеНаСервере();
КонецПроцедуры


&НаКлиенте
Асинх Процедура ВыгрузитьДанныеCSV(Команда)
	
	Если ТабличныйДокумент.Область(2, 1).Текст = "" Тогда
		Сообщение = Новый СообщениеПользователю();
		Сообщение.Текст = "Сначала получите данные перед выгрузкой в CSV.";
		Сообщение.Сообщить();
		Возврат;
	КонецЕсли;
	
	Диалог = Новый ДиалогВыбораФайла(РежимДиалогаВыбораФайла.Сохранение);
	Диалог.Фильтр = "Файл CSV|*.csv";
	Диалог.Заголовок = "Куда сохранить файл?";
	
	Результат = Ждать Диалог.ВыбратьАсинх();
	
	Если Результат = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	ПутьКФайлу = Результат[0];
	Разделитель = ";";
	ЗаписатьФайлCSV(ПутьКФайлу, Разделитель);
	
	Сообщение = Новый СообщениеПользователю();
    Сообщение.Текст = "CSV файл успешно сформирован";
    Сообщение.Сообщить();
	
КонецПроцедуры

#КонецОбласти


#Область СлужебныеПроцедурыИФункции

&НаСервере
Процедура ПолучитьДанныеНаСервере()
	
	Запрос = Новый Запрос;
	Запрос.Текст =
		"ВЫБРАТЬ
		|	Услуги.Наименование,
		|	Услуги.Описание
		|ИЗ
		|	Справочник.Услуги КАК Услуги
		|ГДЕ
		|	НЕ Услуги.ЭтоГруппа";
	
	Выборка = Запрос.Выполнить().Выбрать();
	ТабличныйДокумент.Область(1, 1).Текст = "Наименование";
	ТабличныйДокумент.Область(1, 2).Текст = "Описание";
	
	НомерСтроки = 2;
	
	Пока Выборка.Следующий() Цикл
		ТабличныйДокумент.Область(НомерСтроки, 1).Текст = Выборка.Наименование;
		ТабличныйДокумент.Область(НомерСтроки, 2).Текст = Выборка.Описание;
		НомерСтроки = НомерСтроки + 1;
	КонецЦикла;
	
КонецПроцедуры

&НаСервере
Процедура ЗаписатьФайлCSV(ПутьКФайлу, Разделитель)
	
	Текст = Новый ЗаписьТекста();
	Текст.Открыть(ПутьКФайлу);
	
	НомерСтроки = 1;

	Пока Истина Цикл
        Если ТабличныйДокумент.Область(НомерСтроки, 1).Текст = "" Тогда
            Возврат;
        КонецЕсли;
        
        МассивСлов = Новый Массив;
        МассивСлов.Добавить(ЭкранироватьКавычкиИРазделителиДляФорматаCSV(ТабличныйДокумент.Область(НомерСтроки, 1).Текст, Разделитель)); 
        МассивСлов.Добавить(ЭкранироватьКавычкиИРазделителиДляФорматаCSV(ТабличныйДокумент.Область(НомерСтроки, 2).Текст, Разделитель)); 
        
        СтрокаСлова = СтрСоединить(МассивСлов, Разделитель);
        Текст.ЗаписатьСтроку(СтрокаСлова);
        
        НомерСтроки = НомерСтроки + 1; 
    КонецЦикла;
    
    Текст.Закрыть();

КонецПроцедуры

&НаСервере
Функция ЭкранироватьКавычкиИРазделителиДляФорматаCSV(Значение, Разделитель)
    Значение = СтрЗаменить(Значение, """", """""");
    Если СтрНайти(Значение, Разделитель) <> 0 Или СтрНайти(Значение, """") <> 0 Тогда
        Значение = """" + Значение + """"; 
    КонецЕсли;
    Возврат Значение;
КонецФункции

#КонецОбласти
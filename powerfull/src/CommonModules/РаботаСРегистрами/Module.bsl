Функция РозничнаяЦенаПродажиТовара(АктуальнаяДата, Товар) Экспорт
// Создать вспомогательный объект "Отбор".
Отбор = Новый Структура("Товар", Товар);
// Получить актуальные значения ресурсов регистра.
ЗначенияРесурсов = РегистрыСведений.ЦеныНаСпортТовары.ПолучитьПоследнее(АктуальнаяДата, Отбор);
Возврат ЗначенияРесурсов.Цена;
КонецФункции 

Функция ЦеныПродажиТовараНаДату(Дата, СписокТоваров) Экспорт 
	
	Запрос = Новый Запрос;
	Запрос.Текст = "ВЫБРАТЬ
	               |	ЦеныНаСпортТоварыСрезПоследних.Товар КАК Товар,
	               |	ЦеныНаСпортТоварыСрезПоследних.Цена КАК Цена
	               |ИЗ
	               |	РегистрСведений.ЦеныНаСпортТовары.СрезПоследних(&Период, Товар В (&СписокТоваров)) КАК ЦеныНаСпортТоварыСрезПоследних"; 

	Запрос.УстановитьПараметр("Период", Дата);
	Запрос.УстановитьПараметр("СписокТоваров", СписокТоваров);  
	
    РезультатЗапроса = Запрос.Выполнить();
	
	Выборка = РезультатЗапроса.Выбрать();	
	
	Результат = Новый Соответствие;
	
	Пока Выборка.Следующий() Цикл
		Результат.Вставить(Выборка.Товар, Выборка.Цена);
	КонецЦикла;
	
	Возврат Результат;
	
КонецФункции

Функция РозничнаяЦенаУслуг(АктуальнаяДата, Услуга) Экспорт
// Создать вспомогательный объект "Отбор".
Отбор = Новый Структура("Услуга", Услуга);
// Получить актуальные значения ресурсов регистра.
ЗначенияРесурсов = РегистрыСведений.ЦеныНаУслуги.ПолучитьПоследнее(АктуальнаяДата, Отбор);
Возврат ЗначенияРесурсов.Цена;
КонецФункции

Функция РозничнаяЦенаАбонементов(АктуальнаяДата, Абонемент) Экспорт
// Создать вспомогательный объект "Отбор".
Отбор = Новый Структура("Абонемент", Абонемент);
// Получить актуальные значения ресурсов регистра.
ЗначенияРесурсов = РегистрыСведений.ЦеныНаАбонементы.ПолучитьПоследнее(АктуальнаяДата, Отбор);
Возврат ЗначенияРесурсов.Цена;
КонецФункции
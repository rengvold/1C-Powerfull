&НаКлиенте
Процедура ОказываемыеУслугиУслугаПриИзменении(Элемент)
	
	// Получить текущую строку табличной части.
	СтрокаТабличнойЧасти = Элементы.ОказываемыеУслуги.ТекущиеДанные;
	
	// Установить цену.
	СтрокаТабличнойЧасти.Цена = РаботаСРегистрами.РозничнаяЦенаУслуг(Объект.Дата,СтрокаТабличнойЧасти.Услуга);       
		
КонецПроцедуры

&НаКлиенте
Процедура ОказываемыеУслугиПриИзменении(Элемент)
	
	Объект.СуммаДокумента = Объект.ОказываемыеУслуги.Итог("Цена");
	
КонецПроцедуры

&НаКлиенте
Процедура ВремяНачалоВыбора(Элемент, ДанныеВыбора, ВыборДобавлением, СтандартнаяОбработка)
	СтандартнаяОбработка = Ложь;
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗаписи(ПараметрыЗаписи)
	
	Оповестить("Изменение_Запись");
	
	
КонецПроцедуры

&НаСервере
Процедура ПередЗаписьюНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)
	
	ТекущийОбъект.Цвет = Новый ХранилищеЗначения(Цвет);
	
КонецПроцедуры

&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	
	Цвет = ТекущийОбъект.Цвет.Получить();
	
КонецПроцедуры

&НаКлиенте
Процедура ОформитьПродажу(Команда)
	
	Если Объект.Ссылка.Пустая() Тогда
		 Сообщение = Новый СообщениеПользователю;
		 Сообщение.Текст = "Сначала сохраните запись";
		 Сообщение.Сообщить();
		 Возврат;
	 КонецЕсли;
	 
	СтруктураПараметров = Новый Структура("Основание", Объект.Ссылка);
	ОткрытьФорму("Документ.РеализацияУслуг.ФормаОбъекта", СтруктураПараметров,,,,,,РежимОткрытияОкнаФормы.БлокироватьОкноВладельца);
	
КонецПроцедуры
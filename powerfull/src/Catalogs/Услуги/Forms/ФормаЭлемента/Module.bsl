
&НаКлиенте
Процедура Цены(Команда)
	Если Объект.Ссылка.Пустая() Тогда
		Возврат;
	КонецЕсли;
	
	ИмяОткрываемойФормы = "РегистрСведений.ЦеныНаУслуги.ФормаСписка";
	СтруктураОтбора = Новый Структура("Услуга", Объект.Ссылка);
	СтруктураПараметров = Новый Структура("Отбор", СтруктураОтбора); 
	ОткрытьФорму(ИмяОткрываемойФормы,СтруктураПараметров,ЭтотОбъект,,,,,РежимОткрытияОкнаФормы.БлокироватьОкноВладельца)
КонецПроцедуры


&НаКлиенте
Процедура ЦеныТоваров(Команда)
	
	Если Объект.Ссылка.Пустая() Тогда
		Возврат;
	КонецЕсли;
	
	ИмяОткрываемойФормы = "РегистрСведений.ЦеныНаСпортТовары.ФормаСписка";
	СтруктураОтбора = Новый Структура("Товар", Объект.Ссылка);
	СтруктураПараметров = Новый Структура("Отбор", СтруктураОтбора); 
	ОткрытьФорму(ИмяОткрываемойФормы,СтруктураПараметров,ЭтотОбъект,,,,,РежимОткрытияОкнаФормы.БлокироватьОкноВладельца)
	
КонецПроцедуры

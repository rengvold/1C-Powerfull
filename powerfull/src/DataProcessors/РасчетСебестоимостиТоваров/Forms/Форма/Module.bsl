&НаСервере
Процедура РассчитатьСебестоимостьНаСервере()
	
	ОбработкаОбъект = РеквизитФормыВЗначение("Объект");
	ОбработкаОбъект.РассчитатьСебестоимость();
	
КонецПроцедуры

&НаКлиенте
Процедура РассчитатьСебестоимость(Команда)
	РассчитатьСебестоимостьНаСервере();
	ПоказатьОповещениеПользователя("Расчет себестоимости", ,"Выполнен успешно");
КонецПроцедуры

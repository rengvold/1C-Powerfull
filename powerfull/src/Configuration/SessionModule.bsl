Процедура УстановкаПараметровСеанса(ТребуемыеПараметры)
	
	ИдентификаторПользователяИБ = ПользователиИнформационнойБазы.ТекущийПользователь().УникальныйИдентификатор;
	ТекущийСотрудник = Справочники.Сотрудники.НайтиПоРеквизиту("ИдентификаторПользователяИБ", ИдентификаторПользователяИБ);
	ПараметрыСеанса.ТекущийСотрудник = ТекущийСотрудник;
	
КонецПроцедуры


&НаКлиенте
Процедура ОбработкаКоманды(ПараметрКоманды, ПараметрыВыполненияКоманды)
	//{{_КОНСТРУКТОР_ПЕЧАТИ(ПоступлениеТоваров)
	ТабДок = Новый ТабличныйДокумент;
	ПоступлениеТоваров(ТабДок, ПараметрКоманды);

	ТабДок.ОтображатьСетку = Ложь;
	ТабДок.Защита = Ложь;
	ТабДок.ТолькоПросмотр = Ложь;
	ТабДок.ОтображатьЗаголовки = Ложь;
	ТабДок.Показать();
	//}}
КонецПроцедуры

&НаСервере
Процедура ПоступлениеТоваров(ТабДок, ПараметрКоманды)
	Документы.ПоступлениеТоваров.ПоступлениеТоваров(ТабДок, ПараметрКоманды);
КонецПроцедуры


&НаКлиенте
Процедура ОбработкаКоманды(ПараметрКоманды, ПараметрыВыполненияКоманды)
	//{{_КОНСТРУКТОР_ПЕЧАТИ(РеализацияУслуг)
	ТабДок = Новый ТабличныйДокумент;
	РеализацияУслуг(ТабДок, ПараметрКоманды);

	ТабДок.ОтображатьСетку = Ложь;
	ТабДок.Защита = Ложь;
	ТабДок.ТолькоПросмотр = Ложь;
	ТабДок.ОтображатьЗаголовки = Ложь;
	ТабДок.Показать();
	//}}
КонецПроцедуры

&НаСервере
Процедура РеализацияУслуг(ТабДок, ПараметрКоманды)
	Документы.РеализацияУслуг.РеализацияУслуг(ТабДок, ПараметрКоманды);
КонецПроцедуры

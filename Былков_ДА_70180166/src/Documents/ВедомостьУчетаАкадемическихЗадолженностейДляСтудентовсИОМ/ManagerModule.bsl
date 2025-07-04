
Процедура Печать(ТабДок, Ссылка) Экспорт
	
	Макет = Документы.ВедомостьУчетаАкадемическихЗадолженностейДляСтудентовсИОМ.ПолучитьМакет("Печать");
	Запрос = Новый Запрос;
	Запрос.Текст =
	"ВЫБРАТЬ
	|	ВедомостьУчетаАкадемическихЗадолженностейДляСтудентовсИОМ.Дата,
	|	ВедомостьУчетаАкадемическихЗадолженностейДляСтудентовсИОМ.Дисциплина,
	|	ВедомостьУчетаАкадемическихЗадолженностейДляСтудентовсИОМ.Номер,
	|	ВедомостьУчетаАкадемическихЗадолженностейДляСтудентовсИОМ.Основание,
	|	ВедомостьУчетаАкадемическихЗадолженностейДляСтудентовсИОМ.Оценка,
	|	ВедомостьУчетаАкадемическихЗадолженностейДляСтудентовсИОМ.Преподаватель,
	|	ВедомостьУчетаАкадемическихЗадолженностейДляСтудентовсИОМ.СтатусАкадемическойЗадолженности,
	|	ВедомостьУчетаАкадемическихЗадолженностейДляСтудентовсИОМ.Студент,
	|	ВедомостьУчетаАкадемическихЗадолженностейДляСтудентовсИОМ.ФормаКонтроля
	|ИЗ
	|	Документ.ВедомостьУчетаАкадемическихЗадолженностейДляСтудентовсИОМ КАК ВедомостьУчетаАкадемическихЗадолженностейДляСтудентовсИОМ
	|ГДЕ
	|	ВедомостьУчетаАкадемическихЗадолженностейДляСтудентовсИОМ.Ссылка В (&Ссылка)";
	Запрос.Параметры.Вставить("Ссылка", Ссылка);
	Выборка = Запрос.Выполнить().Выбрать();

	ОбластьЗаголовок = Макет.ПолучитьОбласть("Заголовок");
	Шапка = Макет.ПолучитьОбласть("Шапка");
	ТабДок.Очистить();

	ВставлятьРазделительСтраниц = Ложь;
	Пока Выборка.Следующий() Цикл
		Если ВставлятьРазделительСтраниц Тогда
			ТабДок.ВывестиГоризонтальныйРазделительСтраниц();
		КонецЕсли;

		ТабДок.Вывести(ОбластьЗаголовок);

		Шапка.Параметры.Заполнить(Выборка);
		ТабДок.Вывести(Шапка, Выборка.Уровень());

		ВставлятьРазделительСтраниц = Истина;
	КонецЦикла;
	
КонецПроцедуры

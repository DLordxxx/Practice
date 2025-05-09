
&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
	
	ПостроитьДинамикуНаСервере();
	
	
	
	
	
КонецПроцедуры

&НаСервере
Функция ПолучитьСтудентов(ВидФин)
	Запрос = Новый Запрос;
	Запрос.Текст = 
	"ВЫБРАТЬ
	|	КОЛИЧЕСТВО(*) КАК Количество
	|ИЗ
	|	Справочник.Студенты КАК Студенты
	|ГДЕ
	|	Студенты.СтатусРасмотрения = &СтатусРассмотрения
	|	И Студенты.ВидФинансирования = &ВидФин";
	
	Запрос.УстановитьПараметр("СтатусРассмотрения", Перечисления.СтатусРассмотрения.Одобрено);
	
	Если ВидФин = "Коммерческое" Тогда
		Запрос.УстановитьПараметр("ВидФин", Перечисления.ВидыФинансирования.КоммерческоеФинансирование);
	ИначеЕсли ВидФин = "Бюджетное" Тогда
		Запрос.УстановитьПараметр("ВидФин", Перечисления.ВидыФинансирования.БюджетноеФинансирование);
	КонецЕсли;
	
	РезультатЗапроса = Запрос.Выполнить().Выбрать();
	РезультатЗапроса.Следующий();
	КоличествоСтудентов = РезультатЗапроса.Количество;
	Возврат КоличествоСтудентов;
КонецФункции

&НаСервере                                                 
Процедура ПостроитьДинамикуНаСервере()
	Спидометр.Очистить();
	Спидометр.АвтоТранспонирование = Ложь;
	Спидометр.Обновление = Ложь;
	
	Платников = ПолучитьСтудентов("Коммерческое");
	Бюджетников = ПолучитьСтудентов("Бюджетное");
	ВсегоСтудентов = Платников + Бюджетников;

	Точка = Спидометр.УстановитьТочку("Количество студентов");
	
	Серия = Спидометр.Серии.Добавить("Всего студентов");	
	Спидометр.УстановитьЗначение(Точка, Серия, ВсегоСтудентов, "Всего студентов", Строка(ВсегоСтудентов) + " студентов");
	
	Серия = Спидометр.Серии.Добавить("Платников");	
	Спидометр.УстановитьЗначение(Точка, Серия, Платников, "Платников", Строка(Платников) + " платников");
	
	Серия = Спидометр.Серии.Добавить("Бюджетников");	
	Спидометр.УстановитьЗначение(Точка, Серия, Бюджетников, "Бюджетников", Строка(Бюджетников) + " бюджетников");
КонецПроцедуры 

&НаКлиенте
Процедура Возвратная(Команда)
	
	    Форма = ПолучитьФорму("Обработка.Академ_задолженность.Форма.Функционал_первый");
	    // Делаем открытие данной формы
	    Форма.Открыть();		
	
	
	
КонецПроцедуры






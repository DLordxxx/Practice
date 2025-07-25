
&НаСервере
Функция ПолучитьЛичныйИндексСотрудникаНаСервере(СсылкаНаСотрудника)
    
    Запрос = Новый Запрос;
    Запрос.Текст = 
    "ВЫБРАТЬ
    |	Сотрудники.IDСотрудника КАК IDСотрудника
    |ИЗ
    |	Справочник.Сотрудники КАК Сотрудники
    |ГДЕ
    |	Сотрудники.Ссылка = &СсылкаНаСотрудника";
    
    Запрос.УстановитьПараметр("СсылкаНаСотрудника", СсылкаНаСотрудника);
    Результат = Запрос.Выполнить();
    Выборка = Результат.Выбрать();
    
    Если Выборка.Следующий() Тогда
        Возврат Выборка.IDСотрудника;
    КонецЕсли;
    
    Возврат Неопределено;
КонецФункции

&НаКлиенте
Процедура СотрудникПриИзменении(Элемент)
	  Если ЗначениеЗаполнено(Объект.Сотрудник) Тогда
        ЛичныйИндексСотрудника = ПолучитьЛичныйИндексСотрудникаНаСервере(Объект.Сотрудник);
        Объект.Наименование = ЛичныйИндексСотрудника;
		
		Если ЗначениеЗаполнено(ЛичныйИндексСотрудника) Тогда
            Объект.Наименование = ЛичныйИндексСотрудника;
        КонецЕсли;
    КонецЕсли;
КонецПроцедуры 

&НаКлиенте
Процедура ПередЗаписью(Отказ, ПараметрыЗаписи)
	ПроверитьУникальностьСотрудника(Отказ, Объект.Наименование, Объект.Ссылка);
КонецПроцедуры

&НаСервере
Процедура ПроверитьУникальностьСотрудника(Отказ, Наименование, Ссылка)

    Если Не ЗначениеЗаполнено(Наименование) Тогда
        Возврат;
    КонецЕсли;
    
    Отказ = Ложь;
    
    Запрос = Новый Запрос;
    Запрос.Текст =
    "ВЫБРАТЬ
    |   ЛичныеИндексыСотрудников.Ссылка КАК Ссылка
    |ИЗ
    |   Справочник.ЛичныеИндексыСотрудников КАК ЛичныеИндексыСотрудников
    |ГДЕ
    |   ЛичныеИндексыСотрудников.Наименование = &Наименование
    |   И ЛичныеИндексыСотрудников.Ссылка <> &Ссылка";
    
    Запрос.УстановитьПараметр("Наименование", Наименование);
    Запрос.УстановитьПараметр("Ссылка", Ссылка);
    	
	РезультатЗапроса = Запрос.Выполнить();

    Если НЕ РезультатЗапроса.Пустой() Тогда
        Сообщить("Выбранный сотрудник уже записан в системе!");
        Отказ = Истина;
    КонецЕсли;

    
КонецПроцедуры
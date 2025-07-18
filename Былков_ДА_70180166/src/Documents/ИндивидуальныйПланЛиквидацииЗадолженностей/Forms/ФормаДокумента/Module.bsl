// Форма документа "ИндивидуальныйПланЛиквидацииЗадолженностей"
&НаСервере
Процедура ПроверитьУникальностьДатыИВремениПлана(Отказ)
    Если Не ЗначениеЗаполнено(Объект.ДатаПересдачи) 
        Или Не ЗначениеЗаполнено(Объект.Время)
        Или Не ЗначениеЗаполнено(Объект.Аудитория) Тогда
        Возврат;
    КонецЕсли;
    
    Отказ = Ложь;
    ОбщиеПроцедурыСистемы.ПроверитьУникальностьДатыИВремени(
        "ИндивидуальныйПланЛиквидацииЗадолженностей",
        Объект.ДатаПересдачи,
        Объект.Время,
        Объект.Аудитория,
        Объект.Ссылка,
        Отказ
    );
    
    Если Отказ Тогда
        Объект.Время = Неопределено;
        Объект.Аудитория = Неопределено;
        ВызватьИсключение("Документ с указанной датой, временем и аудиторией уже существует в системе! Укажите другие данные!");
    КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ПередЗаписью(Отказ, ПараметрыЗаписи)

 // Проверяем уникальность даты и времени
    ПроверитьУникальностьДатыИВремениПлана(Отказ);

КонецПроцедуры

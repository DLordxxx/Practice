
&НаКлиенте
Процедура ПриложенныеДокументыПриИзменении(Элемент)
	Если Объект.ПриложенныеДокументы = Истина Тогда
		Элементы.Подтверждение.Видимость = Истина;
		
	Иначе
		Элементы.Подтверждение.Видимость = Ложь;    
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ПодтверждениеНачалоВыбора(Элемент, ДанныеВыбора, ВыборДобавлением, СтандартнаяОбработка)
	ВыбратьФайл("Выбор подтверждающего документа", Новый ОписаниеОповещения("ПослеВыбораФайла", ЭтотОбъект));
КонецПроцедуры    

&НаКлиенте
Процедура ВыбратьФайл(ЗаголовокДиалога, Оповещение)  
    Диалог = Новый ДиалогВыбораФайла(РежимДиалогаВыбораФайла.Открытие);
    Диалог.Заголовок = ЗаголовокДиалога;
    Диалог.Показать(Оповещение);  
КонецПроцедуры

&НаКлиенте
Процедура ПослеВыбораФайла(ВыбранныеФайлы, Параметры) Экспорт
    Если ВыбранныеФайлы = Неопределено Или ВыбранныеФайлы.Количество() = 0 Тогда
        Возврат;
    КонецЕсли;

    ПутьКФайлу = ВыбранныеФайлы[0];
    // Обновление реквизита "Подтверждение" значением выбранного файла
    Объект.Подтверждение = ПутьКФайлу;  // Записываем путь к файлу в реквизит
КонецПроцедуры

&НаСервере
Процедура ПроведениеДокументаНаРассмотрение(Элемент) Экспорт
    // Проверяем условие проведенного документа
    Если Документы.ЗаявлениеНаПродлениеСроковЛиквидацииЗадолженности.Проведен Тогда
        Объект.СтатусРассмотрения = Перечисления.СтатусРассмотрения.НаРассмотрении;
    КонецЕсли;
КонецПроцедуры
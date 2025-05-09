
Процедура ОбработкаПроведения(Отказ, Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!

	// регистр ДатыПересдач
	Движения.ДатыПересдач.Записывать = Истина;
	Движение = Движения.ДатыПересдач.Добавить();
	Движение.Преподаватель = Преподаватель;
	Движение.Аудитория = Аудитория;
	Движение.Дисциплина = Дисциплина;
	Движение.ДатаВыдачи = Дата;
	Движение.ДатаПересдачи = ДатаПроведения;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры

Процедура ОбработкаЗаполнения(ДанныеЗаполнения, СтандартнаяОбработка)
	//{{__КОНСТРУКТОР_ВВОД_НА_ОСНОВАНИИ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	Если ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.ИдентификацияАкадемическихЗадолженностей") Тогда
		// Заполнение шапки
		Группа = ДанныеЗаполнения.Группа;
		ЛичныйИндекс = ДанныеЗаполнения.ЛичныйИндекс;
		Студент = ДанныеЗаполнения.Студент;
		Факультет = ДанныеЗаполнения.Факультет;
		ФормаОбучения = ДанныеЗаполнения.ФормаОбучения;
	КонецЕсли;
	//}}__КОНСТРУКТОР_ВВОД_НА_ОСНОВАНИИ
КонецПроцедуры



Процедура СоздатьПриказИзНаправлений() Экспорт
    // Создаем новый документ "Приказ"
    НовыйПриказ = Документы.ПриказОНазначенииКомиссииПоЛиквидацииЗадолженностей.СоздатьДокумент();
    
    // Устанавливаем свойства нового приказа
	//НовыйПриказ.Дата = ТекущаяДата(); // Устанавливаем текущую дату
	//НовыйПриказ.Номер = ПолучитьНомерПриказа(); // Или присваиваем номер другим образом
    
    // Получаем выборку документов "Направление на пересдачу"
    ВыборкаНаправлений = Документы.НаправлениеНаПересдачу.Выбрать();
    
    Пока ВыборкаНаправлений.Следующий() Цикл
        Направление = ВыборкаНаправлений.ПолучитьОбъект(); // Получаем текущий документ
        
        // Заполняем поля документа "Приказ" из документа "Направление на пересдачу"
        НовыйЭлементПриказ = НовыйПриказ.Элементы.Добавить(); // Добавляем элемент в приказ
        НовыйЭлементПриказ.Поле1 = Направление.Поле1; // Переносим значение поля1
        НовыйЭлементПриказ.Поле2 = Направление.Поле2; // Переносим значение поля2
        // Добавляйте другие поля по необходимости
    КонецЦикла;

    // Записываем созданный документ "Приказ"
    НовыйПриказ.Записать();
    
    Сообщить("Приказ успешно создан на основании направлений на пересдачу.");
КонецПроцедуры

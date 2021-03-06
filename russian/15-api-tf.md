\pagebreak

# Транспортный файл

## Что такое транспортный файл

Это файл в формате .csv, с помощью которого можно, не заходя в «Центр охраны», изменить данные, которые используются в сервисе [Услуги охраны](https://support.cnord.ru/hc/ru/articles/360018359152). Транспортный файл можно создать вручную или выгрузить его автоматически. Автоматическая выгрузка возможна только с помощью технического специалиста. 

Одна строка транспортного файла соответствует одной карточке объекта в «Центре охраны». Но если в строке указан номер договора, который используется во многих объектах, то данные изменятся во всех карточках объекта с этим номером договора. 

Все поля в строках имеют разделитель - точка с запятой. В «Центр охраны» передается только первые 6 полей строки.   
Каждому полю транспортного файла соответствует поле в карточке объекта «Центра охраны». Поэтому важно соблюдать порядок полей при создании файла.

*Пример*
Скриншот транспортного файла, созданного с помощью текстового редактора «Блокнот» в системе Windows.   

\imgcapt{img/15-1_trasnsportFile.png}{Пример транспортного файла}
*С помощью такого файла можно изменить данные для двух карточек объекта с номерами 38 и 55.*

## Какие поля содержит транспортный файл

**1 - Номер объекта**  
Только целое число. Например, 38 или 112.    
**2 - Номер договора**    
Любое значение, которое не содержит точку с запятой. Потому что этот символ является разделителем в csv-файле. Например, ДДУ-455.    
**3 - Баланс**    
Целые и десятичные числа, с разделителем - запятая. Возможно указать отрицательное значение. Например, 123,034 или -1200,45.    
**4 - Абонентская плата**   
Целые и десятичные числа с разделителем - запятая. Нельзя указать отрицательное значение. Например, 455,234 или 1200.   
**5 - Дата списания**   
Дата в формате гггг-мм-дд. Например, 2018-11-14.   
**6 - Уровень информирования**   
Целое число из диапазона от -1 до 3. Например, -1 или 2. Числа вне этого диапазона не принимаются.   

Обязательные поля: «Номер объекта» или «Номер договора». Должно быть заполнено хотя бы одно из этих полей. 

* Если будет заполнен только «Номер объекта», то строка применится к объекту с указанным номером.
* Если будет заполнен только «Номер договора, то строка применится ко всем объектам, имеющим указанный номер договора.
* Если будут заполнены оба поля, то строка применится к объекту с указанным номером, при условии, что объект имеет указанный номер договора.

При загрузке файла в «Центр охраны» значения запишутся в аналогичные поля карточки объекта в модуле «Менеджер объектов».

- «Номер договора» и «Номер объекта» расположены на вкладке «Объект». 
- «Баланс», «Абонентская плата», «Дата списания» и «Уровень информирования» на вкладке «Охрана».
  
Значение поля «Уровень информирования» из транспортного файла влияет на переключатель в области «Услуги охраны» на кладке «Охрана».

Описание того, как поля из транспортного файла отображаются в мобильном приложении клиентов, описано в статье [MyAlarm: Услуги охраны](https://support.cnord.ru/hc/ru/articles/360018359152) на сайте поддержки.

## Что такое уровень информирования

Значение уровня информирования (-1, 0, 1, 2 или 3)  в транспортном файле соответствует положению переключателя на вкладке «Охрана» в области «Услуги охраны».   

\imgcapt{img/15-2_trasnsportFile.png}{Менеджер объектов, вкладка Охрана}

- -1 Не отображать информацию в MyAlarm
- 0 Нет задолженности
- 1 Информировать о необходимости оплаты
- 2 Предупреждать о наличии задолженности
- 3 Запретить взятие под охраны и ограничить функции MyAlarm

Подробнее о том, как работает уровень информирования в статье [MyAlarm: Услуги охраны](https://support.cnord.ru/hc/ru/articles/360018359152) на сайте поддержки.

## Как создать транспортный файл

Транспортный файл можно создать вручную с помощью текстового редактора, Excel или любой другой похожей программы.

1. Откройте текстовый редактор, например, «Блокнот».
2. Создайте новый файл.
3. В строке перечислите через точку с запятой значения, которые хотите внести в карточку объекта.
4. Сохраните файл в формате *.csv.

**Важно!** При перечислении значений в строке, нужно точно соблюдать порядок полей. Поля в строке расположены в следующем порядке:

`1 номер объекта; 2 номер договора; 3 баланс; 4 абонентская плата; 5 дата списания; 6 уровень информирования`

Если вы ошибетесь и внесете значение баланса (номер 3), в поле абонентской платы (номер 4), то клиент увидит в приложении неверную информацию об абонентской плате.

Транспортный файл может создаваться автоматически программой, которая используется в охранном предприятии для учета данных, например, 1С. Настроить выгрузку транспортного файла может технический специалист, обслуживающий эту систему.

## Можно ли изменить только некоторые поля с помощью файла

В транспортном файле можно указать значения только для части полей.   
Номер объекта и номер договора - это идентификаторы объекта. Если указаны оба поля, то поиск объекта производится по двум полям сразу.   
Например, строка в транспортном файле `99;Договор-1;;;;` не внесет изменения в объект №99, если у номер договора не указан.

Так как номер договора является идентификатором объекта, его невозможно изменить с помощью транспортного файла.  

**Важно!** Нельзя просто удалить лишние поля из транспортного файла. Пустые поля должны быть разделены точкой с запятой.

\imgcapt{img/15-3_trasnsportFile.png}{Пример транспортного файла с частью данных}
*C помощью такого файла в карточку объекта 38 загрузится только дата списания.*

## Как изменить значения в нескольких карточках объекта

Если нужно изменить данные по нескольким объектам одновременно, создайте в файле соответствующее количество строк и для каждой из них укажите свои значения.    

\imgcapt{img/15-4_trasnsportFile.png}{Пример транспортного файла с частью данных}

## Как загрузить транспортный файл в Центр охраны

В «Центр охраны» файл загружается автоматически с помощью службы «Центра охраны» C.Nord HTTP-API Service. Чтобы данные из файла начали загружаться в «Центр охраны» автоматически, нужно сделать предварительные настройки, указав путь к файлу и частоту проверки изменений в нем. 

## Как настроить службу C.Nord HTTP-API Service

Параметры службы задаются в конфигурационном файле CNord.WebApi.Service.exe.config, расположенном в папке установки «Центра охраны». В большинстве случаев файл находится по пути: `C:\Program Files (x86)\Andromeda\HttpApiService\CNord.WebApi.Service.exe.config`.
Чтобы изменить его содержимое, файл должен быть открыт от имени администратора. После изменения файла необходимо перезапустить службу C.Nord HTTP-API Service.

В файле нужно сделать две настройки:

- Частота проверки транспортного файла и загрузки его в «Центр охраны».
- Путь к транспортному файлу.

**Частота проверки транспортного файла и загрузки его в «Центр охраны»** определяет в какие промежутке времени служба будет проверять файл и загружать его в «Центр охраны».

Чтобы изменить параметр:
1. Найдите в файле блок

```
<setting name="TransportFileCheckInterval" serializeAs="String">
 
       <value>00:30:00</value>
```

2. В тэге <value> укажите желаемое время проверки файла в формате чч:мм:сс.   
Минимальное значение - 10 секунд.

**Путь к транспортному файлу**
С помощью этого параметра служба определяет где и какой файл выбрать для загрузки
Чтобы изменить параметр:
1. Найдите в файле блок

```
<setting name="TransportFilePath" serializeAs="String">

        <value>C:\tf\transportfile.csv</value>
```

2. в тэге <value> укажите путь к файлу.   
Например, `C:\tf\transportfile.csv`

**Важно!** После настройки службы транспортный файл нужно положить в в папку, которую вы указали в конфигурационном файле.

### Что произойдет после настройки службы «C.Nord HTTP-API Service»

Служба проверит наличие файла по адресу, указанному в файле конфигурации.
Проверит изменился ли файл с момениа последней загрузки. Если изменился, данные из файла загрузятся в «Центр охраны». 
Если какая-то строка в транспортном файле ошибочна, она игнорируется. Остальные строки будут загружены.

# Техническая поддержка

Если при эксплуатации программного обеспечения «Центр охраны» возникли проблемы или пожелания по его улучшению, мы просим обращаться с ними в службу технической поддержки ООО НТКФ «Си-Норд» по электронной почте [support@cnord.ru](mailto:support@cnord.ru).

При обращении в службу технической поддержки с проблемой, необходимо указать эксплуатируемую версию программного обеспечения «Центр охраны» и описание возникшей неисправности. 

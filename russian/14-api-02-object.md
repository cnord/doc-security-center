\pagebreak

# Объект

Методы для управления объектами в базе данных «Центра охраны»: получение списка объектов или отдельного объекта, создание, изменение и удаление объекта.

## Поля объекта {#api-site-json}

Элемент JSON, содержащий поля объекта:

```json
{
    "Id": string,
    "AccountNumber": number,
    "Name": string,
    "ObjectPassword": string,
    "Address": string,
    "Phone1": string,
    "Phone2": string,
    "TypeName": string,
    "IsFire": boolean,
    "IsArm": boolean,
    "IsPanic": boolean,
    "DeviceTypeName": string,
    "EventTemplateName": string,
    "ContractNumber": string,
    "ContractPrice": number,
    "MoneyBalance": number,
    "PaymentDate": string,
    "DebtInformLevel": number,
    "Disabled": boolean,
    "DisableReason": number,
    "DisableDate": string,
    "AutoEnable": boolean,
    "AutoEnableDate": string,
    "CustomersComment": string,
    "CommentForOperator": string,
    "CommentForGuard": string,
    "MapFileName": string,
    "WebLink": string,
    "ControlTime": number,
    "CTIgnoreSystemEvent": bool,
    "IsContractPriceForceUpdate": boolean,
    "IsMoneyBalanceForceUpdate": boolean,
    "IsPaymentDateForceUpdate": boolean
}
```

\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Название поля} & \textbf{Тип} & \textbf{Поле в карточке объекта; примечание} \\ \midrule

Id & string & Идентификатор объекта \\ \arrayrulecolor{light-gray}\hline
AccountNumber & number & Номер объекта (почти всегда совпадает с номером, запрограммированным в контрольную панель, установленную на объекте) \\ \arrayrulecolor{light-gray}\hline
Name & string & Название объекта \\ \arrayrulecolor{light-gray}\hline
ObjectPassword & string & Пароль \\ \arrayrulecolor{light-gray}\hline
Address & string & Адрес объекта \\ \arrayrulecolor{light-gray}\hline
Phone1 & string & Телефон 1 \\ \arrayrulecolor{light-gray}\hline
Phone2 & string & Телефон 2 \\ \arrayrulecolor{light-gray}\hline
TypeName & string & Название типа объекта \\ \arrayrulecolor{light-gray}\hline
IsFire & boolean & Флаг наличия пожарной сигнализации на объекте \\ \arrayrulecolor{light-gray}\hline
IsArm & boolean & Флаг наличия охранной сигнализации на объекте \\ \arrayrulecolor{light-gray}\hline
IsPanic & boolean & Флаг наличия тревожной кнопки на объекте \\ \arrayrulecolor{light-gray}\hline
DeviceTypeName & string & Псевдоним типа оборудования на объекте. Возможные значения: см. ниже \\ \arrayrulecolor{light-gray}\hline
EventTemplateName & string & Название шаблона событий объекта \\ \arrayrulecolor{light-gray}\hline
ContractNumber & string & Номер договора \\ \arrayrulecolor{light-gray}\hline
ContractPrice & number & Сумма ежемесячного платежа по договору. Отображается в приложении MyAlarm \\ \arrayrulecolor{light-gray}\hline
MoneyBalance & number & Баланс лицевого счета.  Отображается в приложении MyAlarm \\ \arrayrulecolor{light-gray}\hline
PaymentDate & number & Дата ближайшего списания средств. Отображается в приложении MyAlarm \\ \arrayrulecolor{light-gray}\hline
DebtInformLevel & number & Уровень информирования клиента о состоянии услуг охраны. Отображается в приложении MyAlarm. Возможные значения: см. ниже \\ \arrayrulecolor{light-gray}\hline
Disabled & boolean & Флаг: объект отключен \\ \arrayrulecolor{light-gray}\hline
DisableReason & number & Код: причина отключения объекта (не используется) \\ \arrayrulecolor{light-gray}\hline
DisableDate & string & Дата отключения объекта \\ \arrayrulecolor{light-gray}\hline
AutoEnable & boolean & Флаг: необходимо автоматически включить объект \\ \arrayrulecolor{light-gray}\hline
AutoEnableDate & string & Дата автоматического включения объекта. Имеет значение только в том случае, если поле «AutoEnable» установлено в значение «True» \\ \arrayrulecolor{light-gray}\hline
CustomersComment & string & Комментарий к списку ответственных \\ \arrayrulecolor{light-gray}\hline
CommentForOperator & string & Комментарий для оператора \\ \arrayrulecolor{light-gray}\hline
CommentForGuard & string & Комментарий для ГБР \\ \arrayrulecolor{light-gray}\hline
MapFileName & string & Путь к файлу с картой объекта \\ \arrayrulecolor{light-gray}\hline
WebLink & string & Web-ссылка: ссылка на ресурс с дополнительной информацией об объекте \\ \arrayrulecolor{light-gray}\hline
ControlTime & number & Общее контрольное время (мин.) \\ \arrayrulecolor{light-gray}\hline
CTIgnoreSystemEvent & bool & Игнорировать системные события \\ \arrayrulecolor{light-gray}\hline
IsContractPriceForceUpdate & boolean & Признак принудительной записи поля ContractPrice (необходимо выставить true и пропустить поле ContractPrice при очистке) \\ \arrayrulecolor{light-gray}\hline
IsMoneyBalanceForceUpdate & boolean & Признак принудительной записи поля MoneyBalance (необходимо выставить true и пропустить поле MoneyBalance при очистке) \\ \arrayrulecolor{light-gray}\hline
IsPaymentDateForceUpdate & boolean & Признак принудительной записи поля PaymentDate (необходимо выставить true и пропустить поле PaymentDate при очистке) \\

\bottomrule
\end{tabularx}

### Значения поля DeviceTypeName

Псевдоним типа оборудования на объекте.

Соответствия значений псевдонима и названий типа оборудования:

\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{ll}
\textbf{Псевдоним} & \textbf{Название типа оборудования} \\ \midrule

cnord-gsm-cml & «Си-Норд GSM (CML)» \\ \arrayrulecolor{light-gray}\hline
lonta-202 & «Lonta-202» \\ \arrayrulecolor{light-gray}\hline
rs200 & «RS200» \\ \arrayrulecolor{light-gray}\hline
alarmview & «AlarmView» \\ \arrayrulecolor{light-gray}\hline
puper-type-5 & «Puper type 5» \\ \arrayrulecolor{light-gray}\hline
neman & «Neman» \\ \arrayrulecolor{light-gray}\hline
ritm & «Ритм» \\ \arrayrulecolor{light-gray}\hline
other & «Другое» \\

\bottomrule
\end{tabularx}

> Тип оборудования, установленного на объекте, указывается в модуле «Менеджер объектов», на вкладке «Оборудование».

### Значения поля DebtInformLevel

Уровень информирования клиента о состоянии услуг охраны. 

Возможные значения:

\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{cl}
\textbf{Значение} & \textbf{Описание} \\ \midrule

-1 & Не отображать информацию в MyAlarm \\ \arrayrulecolor{light-gray}\hline
0 & Нет задолженности \\ \arrayrulecolor{light-gray}\hline
1 & Информировать о необходимости оплаты \\ \arrayrulecolor{light-gray}\hline
2 & Предупреждать о наличии задолженности \\ \arrayrulecolor{light-gray}\hline
3 & Запретить взятие под охрану и ограничить функции MyAlarm \\

\bottomrule
\end{tabularx}

### Формат полей с датой и временем

Для полей `PaymentDate`, `DisableDate`, `AutoEnableDate` допустимые следующие форматы строковых значений:

- "`YYYY-MM-DD`";
- "`YYYY-MM-DDTHH:mm:ss`";
- "`YYYY-MM-DDTHH:mm:ssZ`";
- "`YYYY-MM-DDTHH:mm:ss.fffZ`".

## Получить список объектов (GET /api/Sites) {#api-sites-get-list}

Метод предназначен для получения списка объектов. В качестве критерия для поиска объекта могжет использоваться номер договора.

**URL** : `/api/Sites`

**Метод** : `GET`

### Параметры

#### contractNumber

Необязательный параметр.

Номер договора, который должен быть указан для возвращаемых объектов. Если значение для параметра не указано, то поиск объектов по номеру договора выполняться не будет.

#### startFrom

Необязательный параметр.

С какого по счету элемента возвращать данные. Если значение для параметра не указано, то метод вернет список, начиная с первого элемента.

Параметр `startFrom` совместно с параметром `pageSize` может использоваться, для получения большого списка объектов по частям («[пагинация](https://ru.wikipedia.org/wiki/%D0%9F%D0%B0%D0%B3%D0%B8%D0%BD%D0%B0%D1%86%D0%B8%D1%8F)»).

#### pageSize

Необязательный параметр.

Максимальное количество элементов, которое необходимо вернуть в результате выполнения запроса. Если значение для параметра не указано, то метод вернет количество элементов, не превышающее значение параметра [`DefaultPageSize`](#api-settings-default-page-size), указанное в настройках службы «C.Nord HTTP-API Service».

#### userName

Необязательный параметр.

Имя пользователя, от имени которого выполняется операция.

### Возможные статусы ответов

`200`, `403` – cм. «[Статусы ответов](#api-status-codes)».

### Возвращаемые данные

При успешном выполнении метод возвращает в теле ответа список элементов JSON с [полями объекта](#api-site-json).

### Пример использования

#### Пример выполнения запроса, в котором указано значение для параметра `contractNumber`

```bash
curl --request GET \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/Sites?contractNumber=2018-12/91&`
        `userName=crm-Ivanova-A-A'
```

**Status:** `200`

```json
[
    {
        "Id": "94df3af9-36c1-423b-aa88-fb505bda3fa4",
        "AccountNumber": 265,
        "Name": "Вестколл Северо-Запад",
        "ObjectPassword": "1234",
        "Address": "Митрофаньевское шоссе д.2 кор.2 лит.А",
        "Phone1": "нет",
        "Phone2": "",
        "TypeName": "магазин",
        "IsFire": true,
        "IsArm": true,
        "IsPanic": true,
        "DeviceTypeName": "other",
        "EventTemplateName": "Си-Норд GSM",
        "ContractNumber": "2018-12/91",
        "ContractPrice": 0,
        "MoneyBalance": 0,
        "PaymentDate": "1899-12-30T00:00:00",
        "DebtInformLevel": -1,
        "Disabled": false,
        "DisableReason": 0,
        "DisableDate": "1899-12-30T00:00:00",
        "AutoEnable": false,
        "AutoEnableDate": "1899-12-30T00:00:00",
        "CustomersComment": "",
        "CommentForOperator": "",
        "CommentForGuard": "",
        "MapFileName": "",
        "WebLink": "",
        "ControlTime": 0,
        "CTIgnoreSystemEvent": false
    },
    {
        "Id": "524bf1a5-76ce-43a7-9ed5-56291750933c",
        "AccountNumber": 282,
        "Name": "Инвест-Москва",
        "ObjectPassword": "4321",
        "Address": "Шостаковича ул. д. 3 к. 1",
        "Phone1": "785-03-39",
        "Phone2": "",
        "TypeName": "банк",
        "IsFire": true,
        "IsArm": true,
        "IsPanic": true,
        "DeviceTypeName": "cnord-gsm-cml",
        "EventTemplateName": "Си-Норд GSM",
        "ContractNumber": "2018-12/91",
        "ContractPrice": 0,
        "MoneyBalance": 0,
        "PaymentDate": "1899-12-30T00:00:00",
        "DebtInformLevel": -1,
        "Disabled": false,
        "DisableReason": 0,
        "DisableDate": "1899-12-30T00:00:00",
        "AutoEnable": false,
        "AutoEnableDate": "1899-12-30T00:00:00",
        "CustomersComment": "",
        "CommentForOperator": "",
        "CommentForGuard": "",
        "MapFileName": "",
        "WebLink": "",
        "ControlTime": 1,
        "CTIgnoreSystemEvent": true
    }
]
```

## Получить объект по номеру или идентификатору (GET /api/Sites) {#api-sites-get-single}

Метод предназначен для получения информации о конкретном объекте. Для поиска объекта может быть использован его идентификатор или номер.

**URL** : `/api/Sites`

**Метод** : `GET`

### Параметры

#### id

Обязательный параметр.

Идентификатор или номер объекта, информацию о котором нужно получить.

#### userName

Необязательный параметр.

Имя пользователя, от имени которого выполняется операция.

### Возможные статусы ответов

`200`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

### Возвращаемые данные

При успешном выполнении метод возвращает в теле ответа элемент JSON с [полями объекта](#api-site-json).

### Пример использования

#### Пример выполнения запроса, в котором в качестве параметра указан идентификатор объекта

```bash
curl --request GET \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/Sites?id=524bf1a5-76ce-43a7-9ed5-56291750933c&`
        `userName=crm-Ivanova-A-A'
```

**Status:** `200`

```json
{
    "Id": "524bf1a5-76ce-43a7-9ed5-56291750933c",
    "AccountNumber": 282,
    "Name": "Инвест-Москва",
    "ObjectPassword": "1234",
    "Address": "Шостаковича ул. д. 3 к. 1",
    "Phone1": "785-03-39",
    "Phone2": "",
    "TypeName": "банк",
    "IsFire": true,
    "IsArm": true,
    "IsPanic": true,
    "DeviceTypeName": "cnord-gsm-cml",
    "EventTemplateName": "Си-Норд GSM",
    "ContractNumber": "",
    "ContractPrice": 0,
    "MoneyBalance": 0,
    "PaymentDate": "1899-12-30T00:00:00",
    "DebtInformLevel": -1,
    "Disabled": false,
    "DisableReason": 0,
    "DisableDate": "1899-12-30T00:00:00",
    "AutoEnable": false,
    "AutoEnableDate": "1899-12-30T00:00:00",
    "CustomersComment": "При тревоге звонить Иванову.",
    "CommentForOperator": "",
    "CommentForGuard": "",
    "MapFileName": "",
    "WebLink": "",
    "ControlTime": 10,
    "CTIgnoreSystemEvent": false
}
```

#### Пример запроса, в котором в качестве параметра указан номер объекта

```bash
curl --request GET \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/Sites?id=282c&`
        `userName=crm-Ivanova-A-A'
```

## Создать объект (POST /api/Sites) {#api-sites-post}

Метод предназначен для создания нового объекта.

**URL** : `/api/Sites`

**Метод** : `POST`

### Параметры

#### userName

Необязательный параметр.

Имя пользователя, от имени которого выполняется операция.

### Тело запроса

В теле запроса должен быть передан элемент JSON с [полями объекта](#api-site-json), который нужно создать. При создании объекта обязательно указать только название для нового объекта. Значение для всех остальных полей, включая номер объекта, можно не указывать: будет использовано значение по умолчанию.

Если номер объекта не указан, то новому объекту будет присвоен свободный номер по формуле max(AccountNumber) + 1.

Если номер объекта указан и объект с таким номером уже есть в базе данных «Центра охраны», то метод вернет ошибку.

### Возможные статусы ответов

`201`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

### Возвращаемые данные

При успешном выполнении метод возвращает в теле ответа элемент JSON с информацией об идентификаторе и номере, которые получил созданный объект:

```json
{
    "Id": string,
    "AccountNumber": number
}
```

Если при выполнении запроса возникла ошибка, то запрос вернет код 400 и описание возникшей ошибки в теле ответа – см. «[Код 400: описание ошибки](#api-code-400-result)»

### Пример использования

#### Пример выполнения запроса, в котором номер для нового объекта не указан

```bash
curl --request POST \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url http://192.168.0.2:9002/api/Sites/ \
  --data '{"Name": "Ресторан \"У Палыча\"","Address": "Виноградная, 26",`
         `"Phone1": "+7 812 327 1633","ObjTypeName": "Ресторан",`
         `"DeviceTypeName": "cnord-gsm-cml",`
         `"EventTemplateName": "Си-Норд GSM"}'
```

**Status** : `201`

```bash
{
    "Id": "a4835f0e-8909-42fc-a878-217aef0a3aa2",
    "AccountNumber": 9001
}
```

#### Пример выполнения запроса, в котором указан номер существующего объекта

```bash
curl --request POST \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url http://192.168.0.2:9002/api/Sites/ \
  --data '{"AccountNumber": 9001,`
         `"Name": "Ресторан \"У Михалыча\"", "Address": "Виноградная, 26",`
         `"Phone1": "+7 812 327 1633","ObjTypeName": "Ресторан",`
         `"DeviceTypeName": "cnord-gsm-cml",`
         `"EventTemplateName": "Си-Норд GSM"}'
```

**Status** : `400`

```bash
{
    "Message": "Вставка: объект с указанным номером уже существует.",
    "SpResultCode": 205
}
```

## Изменить объект (PUT /api/Sites) {#api-sites-put}

Метод предназначен для изменения полей объекта.

**URL** : `/api/Sites`

**Метод** : `PUT`

### Параметры

#### id

Обязательный параметр.

Идентификатор объекта, который нужно изменить.

#### userName

Необязательный параметр.

Имя пользователя, от имени которого выполняется операция.

### Тело запроса

В теле запроса должен быть передан элемент JSON с [полями объекта](#api-site-json), которые нужно изменить. Если поле необходимо оставить без изменения, то оно не должно быть указано в эелементе JSON.

В случае если поле необходимо очитстить, то оно не должно быть указано и должен быть выставлен соответствующий признак принудительной записи поля. Список полей которые можно очистить представлен в таблице ниже:

\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Название поля} & \textbf{Тип} & \textbf{Признак принудительной записи (boolean)} \\ \midrule

ContractPrice & decimal & IsContractPriceForceUpdate \\ \arrayrulecolor{light-gray}\hline
MoneyBalance & decimal  & IsMoneyBalanceForceUpdate \\ \arrayrulecolor{light-gray}\hline
PaymentDate & string & IsPaymentDateForceUpdate \\

\bottomrule
\end{tabularx}

Идентификатор объекта передается параметром в заголовке запроса, поэтому поле `id` в элементе JSON может быть не указано или будет проигнорировано.

### Возможные статусы ответов

`200`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

### Возвращаемые данные

При успешном выполнении метод возвращает в теле ответа элемент JSON с [полями объекта](#api-site-json) – с учетом изменений, которые произошли в результате выполнения запроса.

Если при выполнении запроса возникла ошибка, то запрос вернет код 400 и описание возникшей ошибки в теле ответа – см. «[Код 400: описание ошибки](#api-code-400-result)»

### Пример использования

```bash
curl --request PUT \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://192.168.0.2:9002/api/Sites?id=524bf1a5-76ce-43a7-9ed5-56291750933c&`
        `userName=crm-Ivanova-A-A' \
  --data '{"Name": "Инвест-Москва-35","Address": "Шостаковича ул. д. 3 к. 1",`
         `"Phone1": "785-03-39","TypeName": "Банк"}'
```

## Удалить объект (DELETE /api/Sites) {#api-sites-delete}

Метод предназначен для удаления объекта из базы данных «Центра охраны».

**URL** : `/api/Sites`

**Метод** : `DELETE`

### Параметры

#### id

Обязательный параметр.

Идентификатор объекта, который нужно удалить.

#### userName

Необязательный параметр.

Имя пользователя, от имени которого выполняется операция.

### Возможные статусы ответов

`200`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

### Возвращаемые данные

При успешном выполнении метод не возвращает данных. Если при выполнении запроса возникла ошибка, то запрос вернет код 400 и описание возникшей ошибки в ответе – см. «[Код 400: описание ошибки](#api-code-400-result)»

### Пример использования

```bash
curl --request DELETE \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.0.0.2:9002/api/Sites?id=68b3fc63-10b7-4eeb-9308-769c1fb1e6d3&`
        `userName=crm-Ivanova-A-A'
```

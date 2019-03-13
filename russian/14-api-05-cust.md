# Ответственные лица

Методы для управления ответственными лицами объекта: получение списка ответственных лиц, создание, изменение или удаление ответственных лиц объекта.

## Поля ответственного лица {#api-customer-json}

Элементо JSON, содержащий все поля ответственного лица:

```json
{
    "Id": string,
    "OrderNumber": number,
    "UserNumber": number,
    "ObjCustName": string,
    "ObjCustTitle": string,
    "ObjCustPhone1": string,
    "ObjCustPhone2": string,
    "ObjCustPhone3": string,
    "ObjCustPhone4": string,
    "ObjCustPhone5": string,
    "ObjCustAddress": string,
    "IsVisibleInCabinet": boolean,
    "ReclosingRequest": boolean,
    "ReclosingFailure": boolean,
    "PINCode": string
}
```

\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Название поля} & \textbf{Тип} & \textbf{Поле в карточке объекта; примечание} \\ \midrule

Id & string & Идентификатор отвественного лица \\ \arrayrulecolor{light-gray}\hline
OrderNumber & number & Порядковый номер ответственного в списке \\ \arrayrulecolor{light-gray}\hline
UserNumber & number & Номер ответственного (номер пользователя на контрольной панели, может быть не задан) \\ \arrayrulecolor{light-gray}\hline
ObjCustName & string & ФИО \\ \arrayrulecolor{light-gray}\hline
ObjCustTitle & string & Должность \\ \arrayrulecolor{light-gray}\hline
ObjCustPhone1 & string & Мобильный телефон \\ \arrayrulecolor{light-gray}\hline
ObjCustPhone2 & string & Телефон 2 \\ \arrayrulecolor{light-gray}\hline
ObjCustPhone3 & string & Телефон 3 \\ \arrayrulecolor{light-gray}\hline
ObjCustPhone4 & string & Телефон 4 \\ \arrayrulecolor{light-gray}\hline
ObjCustPhone5 & string & Телефон 5 \\ \arrayrulecolor{light-gray}\hline
ObjCustAddress & string & Адрес \\ \arrayrulecolor{light-gray}\hline
IsVisibleInCabinet & boolean & Отображать в личном кабинете \\ \arrayrulecolor{light-gray}\hline
ReclosingRequest & boolean & Отправлять SMS о необходимости перезакрытия \\ \arrayrulecolor{light-gray}\hline
ReclosingFailure & boolean & Отправлять SMS об отказе от перезакрытия \\ \arrayrulecolor{light-gray}\hline
PINCode & string & PIN для Call-центра \\

\bottomrule
\end{tabularx}

## Получить список ответственных лиц объекта (GET /api/Customers) {#api-customers-get-list}

Метод предназначен для получения списка ответственных лиц объекта.

**URL** : `/api/Customers`

**Метод** : `GET`

### Параметры

#### siteId

Обязательный параметр.

Идентификатор объекта, список ответственных лиц которого нужно получить. Соответствует полю `Id` элемента JSON с [полями объекта](#api-site-json).

#### userName

Необязательный параметр.

Имя пользователя, от имени которого выполняется операция.

### Возможные статусы ответов

`200`, `403` – cм. «[Статусы ответов](#api-status-codes)».

### Возвращаемые данные

При успешном выполнении метод возвращает в теле ответа список элементов JSON с [полями ответственных лиц](#api-customer-json).

### Пример использования

```bash
curl --request GET \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/Customers?siteId=b8144107-31d1-4800-b83d-764f015a54a5&`
        `userName=crm-Ivanova-A-A'
```

**Status:** `200`

```json
[
	{
		"Id":"81d1b742-ea10-4c56-92fb-092c608d41ec",
		"OrderNumber":1,
		"UserNumber":null,
		"ObjCustName":null,
		"ObjCustTitle":null,
		"ObjCustPhone1":null,
		"ObjCustPhone2":null,
		"ObjCustPhone3":null,
		"ObjCustPhone4":null,
		"ObjCustPhone5":null,
		"ObjCustAddress":null,
		"IsVisibleInCabinet":null,
		"ReclosingRequest":null,
		"ReclosingFailure":null,
		"PINCode":null
	},
	{
		"Id":"c29632f8-01be-4e6f-83b7-34ac831eff25",
		"OrderNumber":2,
		"UserNumber":null,
		"ObjCustName":"Иванов Иван Иванович",
		"ObjCustTitle":"Главный производственный инженер",
		"ObjCustPhone1":"88005553535",
		"ObjCustPhone2":null,
		"ObjCustPhone3":null,
		"ObjCustPhone4":null,
		"ObjCustPhone5":null,
		"ObjCustAddress":null,
		"IsVisibleInCabinet":null,
		"ReclosingRequest":null,
		"ReclosingFailure":null,
		"PINCode":null
	}
]
```

## Получить ответственное лицо по идентификатору (GET /api/Customers) {#api-customers-get-single}

Метод предназначен для получения информации о конкретном ответственном лице. Для поиска ответственного лица должен быть использован его идентификатор.

**URL** : `/api/Customers`

**Метод** : `GET`

### Параметры

#### id

Обязательный параметр.

Идентификатор ответственного лица, информацию о котором нужно получить.

#### userName

Необязательный параметр.

Имя пользователя, от имени которого выполняется операция.

### Возможные статусы ответов

`200`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

### Возвращаемые данные

При успешном выполнении метод возвращает в теле ответа элемент JSON с [полями ответственного лица](#api-customer-json).

### Пример использования

```bash
curl --request GET \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/Customers?id=c29632f8-01be-4e6f-83b7-34ac831eff25&`
        `userName=crm-Ivanova-A-A'
```

**Status:** `200`

```json
{
	"Id":"c29632f8-01be-4e6f-83b7-34ac831eff25",
	"OrderNumber":2,
	"UserNumber":null,
	"ObjCustName":"Иванов Иван Иванович",
	"ObjCustTitle":"Главный производственный инженер",
	"ObjCustPhone1":"88005553535",
	"ObjCustPhone2":null,
	"ObjCustPhone3":null,
	"ObjCustPhone4":null,
	"ObjCustPhone5":null,
	"ObjCustAddress":null,
	"IsVisibleInCabinet":null,
	"ReclosingRequest":null,
	"ReclosingFailure":null,
	"PINCode":null
}
```

## Создать ответственное лицо (POST /api/Customers) {#api-customers-post}

Метод предназначен для создания нового ответственного лица для объекта.

**URL** : `/api/Customers`

**Метод** : `POST`

### Параметры

#### siteId

Обязательный параметр.

Идентификатор объекта, для которого нужно создать объект. Соответствует полю `Id` элемента JSON с [полями объекта](#api-site-json).

#### userName

Необязательный параметр.

Имя пользователя, от имени которого выполняется операция.

### Тело запроса

В теле запроса должен быть передан элемент JSON с [полями ответственного лица](#api-customer-json), который нужно создать. При создании ответственного лица не обязательно указывать все поля, в случае отсутствия будет использовано значение по умолчанию. Если указан идентификатор ответственного лица, то он будет проигнорирован.

Если номер ответственного лица не указан, то новому ответственному лицу будет присвоен свободный номер по формуле max(UserNumber) + 1.

Если номер ответственного лица указан и ответственного лица с таким номером уже есть в списке ответственных лиц объекта, то метод вернет ошибку.

### Возможные статусы ответов

`201`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

### Возвращаемые данные

При успешном выполнении метод возвращает в теле ответа элемент JSON с информацией об идентификаторе, который получило созданное ответственное лицо:

```json
{
    "Id": string
}
```

Если при выполнении запроса возникла ошибка, то запрос вернет код 400 и описание возникшей ошибки в теле ответа – см. «[Код 400: описание ошибки](#api-code-400-result)»

### Пример использования

```bash
curl --request POST \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/Customers?siteId=c29632f8-01be-4e6f-83b7-34ac831eff25&`
        `userName=crm-Ivanova-A-A' \
  --data '{ "ObjCustName" : "Иванов Иван Иванович",`
        `"ObjCustTitle": "Главный производственный инженер",`
        `"ObjCustPhone1": "88005553535" }'
```

**Status** : `201`

```bash
{
    "Id": "524bf1a5-76ce-43a7-9ed5-56291750933f"
}
```

## Изменить ответственное лицо (PUT /api/Customers) {#api-customers-put}

Метод предназначен для изменения полей ответственного лица.

**URL** : `/api/Customers`

**Метод** : `PUT`

### Параметры

#### id

Обязательный параметр.

Идентификатор ответственного лица, параметры которого нужно изменить.

#### userName

Необязательный параметр.

Имя пользователя, от имени которого выполняется операция.

### Тело запроса

В теле запроса должен быть передан элемент JSON с [полями ответственного лица](#api-customer-json), которые нужно изменить. Если поле необходимо оставить без изменения, то оно не должно быть указано в эелементе JSON.

Идентификатор объекта передается параметром в заголовке запроса, поэтому поле `id` в элементе JSON может быть не указано или будет проигнорировано.

### Возможные статусы ответов

`200`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

### Возвращаемые данные

При успешном выполнении метод возвращает в теле ответа элемент JSON с [полями ответственного лица](#api-customer-json) – с учетом изменений, которые произошли в результате выполнения запроса.

Если при выполнении запроса возникла ошибка, то запрос вернет код 400 и описание возникшей ошибки в теле ответа – см. «[Код 400: описание ошибки](#api-code-400-result)»

### Пример использования

```bash
curl --request PUT \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/Customers?id=c29632f8-01be-4e6f-83b7-34ac831eff25&`
        `userName=crm-Ivanova-A-A' \
  --data '{ "ObjCustName" : "Иванов Иван Иванович",`
         `"ObjCustTitle": "Инженер технолог",`
         `"ObjCustPhone1": "88005553232" }'
```

## Удалить ответственное лицо (DELETE /api/Customers) {#api-customers-delete}

Метод предназначен для удаления ответственного лица объекта.

**URL** : `/api/Customers`

**Метод** : `DELETE`

### Параметры

#### id

Обязательный параметр.

Идентификатор ответственного лица, которое нужно удалить.

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
  --url 'http://10.7.22.128:9002/api/Customers?id=524bf1a5-76ce-43a7-9ed5-56291750933f&`
        `userName=crm-Ivanova-A-A'
```
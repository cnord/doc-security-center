\pagebreak

# Нева

## Мобильный пользователь Невы {#api-neva-mobile-user-json}

```json
{
    "Phone" : string,
    "Name" : string
}

```
\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Название поля} & \textbf{Тип} & \textbf{Описание поля; примечание} \\ \midrule

Phone & string & Телефон пользователя \\ \arrayrulecolor{light-gray}\hline
Name & string & ФИО пользователя \\

\bottomrule
\end{tabularx}

## Получить мобильных пользователей Невы (GET /api/Neva/MobileUsers)

Метод, предназначенный для получения списка мобильных пользователей Невы.

**URL** : `/api/Neva/MobileUsers`

**Метод** : `GET`

### Тело запроса

json структура с параметрами:

#### startFrom

С какого по счету элемента возвращать данные. Если не указано - возвращается начиная с первого

#### pageSize

Размер страницы для вывода данных. Если не указано - то используется размер страницы по умолчанию из конфигурационного файла

### Возможные статусы ответов

`200`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

### Возвращаемые данные

При успешном выполнении метод возвращает в теле ответа список элементов JSON с [Полями мобильных пользователей Невы](#api-neva-mobile-user-json).

### Пример выполнения запроса

```bash
curl --request GET \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/Neva/MobileUsers?startFrom=1&pageSize=10'
```

**Status:** `200`

```json
[{
	"Phone": "+71234567890",
	"Name": "Иванов Иван Иванович"
},
{
	"Phone": "+71234567891",
	"Name": "Петров Пётр Петрович"
}, ...]
```

## Получить мобильного пользователя Невы (GET /api/Neva/MobileUser)

Метод предназначен для получения ФИО пользователя по номеру телефона.

**URL** : `/api/Neva/MobileUser`

**Метод** : `GET`

### Тело запроса

json структура с параметрами:

#### Phone

Телефон пользователя

### Возможные статусы ответов

`200`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

### Возвращаемые данные

При успешном выполнении метод возвращает в теле ответа элемент JSON с [Полями мобильного пользователя Невы](#api-neva-mobile-user-json).

### Пример выполнения запроса

```bash
curl --request GET \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/Neva/MobileUser' \
  --data '{`
        `"Phone" : "+71234567890"`
    `}'
```

**Status:** `200`

```json
{
	"Phone": "+71234567890",
	"Name": "Иванов Иван Иванович"
}
```

## Получить объекты мобильного пользователя Невы (GET /api/Neva/MobileUserSites)

Метод предназначен для получения объектов мобильного пользователя Невы.

**URL** : `/api/Neva/MobileUserSites`

**Метод** : `GET`

### Тело запроса

json структура с параметрами:

#### Phone

Телефон пользователя

#### startFrom

С какого по счету элемента возвращать данные. Если не указано - возвращается начиная с первого

#### pageSize

Размер страницы для вывода данных. Если не указано - то используется размер страницы по умолчанию из конфигурационного файла

### Возможные статусы ответов

`200`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

### Возвращаемые данные

При успешном выполнении метод возвращает в теле ответа список элементов JSON с [полями объекта](#api-site-json).

### Пример использования

```bash
curl --request GET \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/Neva/MobileUserSites' \
  --data '{`
        `"Phone" : "+71234567890",`
		`"startFrom" : 1,`
		`"pageSize" : 10`
    `}'
```

**Status:** `200`

```json
[
    {
        "Id": "94df3af9-36c1-423b-aa88-fb505bda3fa4",
        "Name": "Вестколл Северо-Запад",
        "Address": "Митрофаньевское шоссе д.2 кор.2 лит.А",
		...
		"State":
		{
			"IsArm" : True,
			"IsAlarm" : False,
			"IsPartArm" : False,
			"ArmDisArmDateTime" : "1899-12-30T00:00:00",
			"Parts":
			[
				{
					"PartNumber" : "1",
					"PartIsArm" : True,
					"PartIsAlarm" : False
				},
			...]
		}
    },
    {
        "Id": "524bf1a5-76ce-43a7-9ed5-56291750933c",
        "Name": "Инвест-Москва",
        "Address": "Шостаковича ул. д. 3 к. 1",
		...
		"State":
		{
			"IsArm" : True,
			"IsAlarm" : True,
			"IsPartArm" : False,
			"ArmDisArmDateTime" : "1899-12-30T00:00:00",
			"Parts":
			[
				{
					"PartNumber" : "1",
					"PartIsArm" : True,
					"PartIsAlarm" : True
				},
			...]
		}
    }
]
```
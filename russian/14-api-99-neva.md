\pagebreak

# Нева

## Мобильный пользователь Невы {#api-neva-mobile-user-json}

```json
{
    "RowNumber": number,
    "Phone" : string,
    "FIO" : string
}

```
\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Название поля} & \textbf{Тип} & \textbf{Описание поля; примечание} \\ \midrule

RowNumber & number & Порядковый номер (присутствует только при выводе списка мобильных пользователей) \\ \arrayrulecolor{light-gray}\hline
Phone & string & Телефон пользователя \\ \arrayrulecolor{light-gray}\hline
FIO & string & ФИО пользователя \\

\bottomrule
\end{tabularx}

## Получить мобильных пользователей Невы (GET /api/Neva/MobileUsers)

Метод, предназначенный для получения списка мобильных пользователей Невы.

**URL** : `/api/Neva/MobileUsers`

**Метод** : `GET`

### Параметры

#### startFrom

Необязательный параметр.

С какого по счету элемента возвращать данные. Если не указано - возвращается начиная с первого

#### pageSize

Необязательный параметр.

Размер страницы для вывода данных. Если не указано, используется значение `DefaultPageSize`. Максимальный размер страницы — 200: большее значение уменьшается до 200.

### Возможные статусы ответов

`200`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

### Возвращаемые данные

При успешном выполнении метод возвращает в теле ответа список элементов JSON с [Полями мобильных пользователей Невы](#api-neva-mobile-user-json).

### Пример выполнения запроса

```bash
curl --request GET \
  --header "apiKey: $SC_API_KEY" \
  --url 'http://10.7.22.128:9002/api/Neva/MobileUsers?startFrom=1&pageSize=10'
```

**Status:** `200`

```json
[{
    "RowNumber": 1,
    "Phone": "+71234567890",
    "FIO": "Иванов Иван Иванович"
},
{
    "RowNumber": 2,
    "Phone": "+71234567891",
    "FIO": "Петров Пётр Петрович"
}, ...]
```

## Получить мобильного пользователя Невы (GET /api/Neva/MobileUser)

Метод предназначен для получения ФИО пользователя по номеру телефона.

**URL** : `/api/Neva/MobileUser`

**Метод** : `GET`

### Тело запроса

В теле запроса должен быть передан объект json с полями.

#### Phone

Телефон пользователя в стандарте E.164.

Должен соответствовать регулярному выражению ^\+[0-9]{11,25}$

### Возможные статусы ответов

`200`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

### Возвращаемые данные

При успешном выполнении метод возвращает в теле ответа элемент JSON с [Полями мобильного пользователя Невы](#api-neva-mobile-user-json).

### Пример выполнения запроса

```bash
curl --header 'Content-Type: application/json' \
  --request GET \
  --header "apiKey: $SC_API_KEY" \
  --url 'http://10.7.22.128:9002/api/Neva/MobileUser' \
  --data '{"Phone" : "+71234567890"}'
```

**Status:** `200`

```json
{
	"Phone": "+71234567890",
	"FIO": "Иванов Иван Иванович"
}
```

## Получить объекты мобильного пользователя Невы (GET /api/Neva/MobileUserSites)

Метод предназначен для получения объектов мобильного пользователя Невы.

**URL** : `/api/Neva/MobileUserSites`

**Метод** : `GET`

### Параметры

#### startFrom

Необязательный параметр.

С какого по счету элемента возвращать данные. Если не указано - возвращается начиная с первого

#### pageSize

Необязательный параметр.

Размер страницы для вывода данных. Если не указано, используется значение `DefaultPageSize`. Максимальный размер страницы — 200: большее значение уменьшается до 200.

### Тело запроса

В теле запроса должен быть передан объект json с полями.

#### Phone

Телефон пользователя в стандарте E.164.

Должен соответствовать регулярному выражению ^\+[0-9]{11,25}$

### Возможные статусы ответов

`200`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

### Возвращаемые данные

При успешном выполнении метод возвращает в теле ответа список элементов JSON с [полями объекта](#api-site-json).

### Пример использования

```bash
curl --header 'Content-Type: application/json' \
  --request GET \
  --header "apiKey: $SC_API_KEY" \
  --url 'http://10.7.22.128:9002/api/Neva/MobileUserSites?startFrom=1&pageSize=10' \
  --data '{"Phone" : "+71234567890"}'
```

**Status:** `200`

В примере показаны отдельные поля ответа.

```json
[
    {
        "RowNumber": 1,
        "Id": "94df3af9-36c1-423b-aa88-fb505bda3fa4",
        "AccountNumber": 1,
		"CloudObjectID": 2,
        "Name": "Вестколл Северо-Запад",
        "Address": "Митрофаньевское шоссе д.2 кор.2 лит.А",

        "IsStateArm" : true,
        "IsStateAlarm" : false,
        "IsStatePartArm" : false,
        "StateArmDisArmDateTime" : "1899-12-30T00:00:00"
    },
    {
        "RowNumber": 2,
        "Id": "524bf1a5-76ce-43a7-9ed5-56291750933c",
        "AccountNumber": 2,
		"CloudObjectID": 3,
        "Name": "Инвест-Москва",
        "Address": "Шостаковича ул. д. 3 к. 1",

        "IsStateArm" : true,
        "IsStateAlarm" : true,
        "IsStatePartArm" : false,
        "StateArmDisArmDateTime" : "1899-12-30T00:00:00"
    }
]
```
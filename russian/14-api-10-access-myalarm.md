\pagebreak

# Управление доступом в MyAlarm

Методы для управления доступом в MyAlarm: Разрешение/запрет доступа или КТС, получение информации по конкретному пользователю и по объекту. Возможность подписаться/отписаться на класс событий или действие.

## Структуры данных управления доступом в MyAlarm

### Поля управления пользователем в MyAlarm  {#api-access-myalarm-info-json}

```json
{
    "CustGUID" : string,
    "UserID" : string,
    "UserRole" : number,
    "IsPanicEnabled" : boolean
}
```

\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Название поля} & \textbf{Тип} & \textbf{Поле в карточке объекта; примечание} \\ \midrule

CustGUID & string & Идентификатор пользователя \\ \arrayrulecolor{light-gray}\hline
UserID & string & Идентификатор пользователя в облаке \\ \arrayrulecolor{light-gray}\hline
UserRole & number & Тип доступа \\ \arrayrulecolor{light-gray}\hline
IsPanicEnabled & boolean & Разрешён или запрещён КТС \\

\bottomrule
\end{tabularx}

### Поля управления доступом пользователя в MyAlarm  {#api-access-myalarm-access-json}

```json
{
	"CustGUID" : string,
	"UserRole" : number
}
```

\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Название поля} & \textbf{Тип} & \textbf{Поле в карточке объекта; примечание} \\ \midrule

CustGUID & string & Идентификатор пользователя \\ \arrayrulecolor{light-gray}\hline
UserRole & number & Тип доступа \\

\bottomrule
\end{tabularx}

В зависимости от параметра UserRole пользователю будет разрешён или запрещён доступ: 
\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Значения поля (role)} & \textbf{Описание} \\ \midrule

0 & Запрещён доступ \\ \arrayrulecolor{light-gray}\hline
1 & Разрешён доступ, роль администратор \\ \arrayrulecolor{light-gray}\hline
2 & Разрешён доступ, роль пользователь \\

\bottomrule
\end{tabularx}

### Поля управления КТС пользователя в MyAlarm  {#api-access-myalarm-ktc-json}

```json
{
	"CustGUID" : string,
	"IsPanicEnabled" : boolean
}
```

\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Название поля} & \textbf{Тип} & \textbf{Поле в карточке объекта; примечание} \\ \midrule

CustGUID & string & Идентификатор пользователя \\ \arrayrulecolor{light-gray}\hline
IsPanicEnabled & boolean & Разрешён или запрещён КТС \\

\bottomrule
\end{tabularx}

### Поля подписки объектом классов событий в MyAlarm  {#api-access-myalarm-subscribe-class-json}

```json
{
    "ObjectID" : number,
    "SubID" : number
}
```

\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Название поля} & \textbf{Тип} & \textbf{Поле в карточке объекта; примечание} \\ \midrule

ObjectID & number & Идентификатор объекта \\ \arrayrulecolor{light-gray}\hline
SubID & number & Идентификатор класса события \\

\bottomrule
\end{tabularx}

### Поля подписки объектом действий  в MyAlarm  {#api-access-myalarm-subscribe-action-json}

```json
{
    "ObjectID" : number,
    "SubID" : number
}
```

\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Название поля} & \textbf{Тип} & \textbf{Поле в карточке объекта; примечание} \\ \midrule

ObjectID & number & Идентификатор объекта \\ \arrayrulecolor{light-gray}\hline
SubID & number & Идентификатор действия \\

\bottomrule
\end{tabularx}

## Получить список управления пользователями в MyAlarm по идентификатору объекта(GET /api/AccessMyAlarm) {#api-access-myalarm-list}

Метод предназначен для получения списка управления пользователями MyAlarm объекта.

**URL** : `/api/AccessMyAlarm`

**Метод** : `GET`

### Параметры

#### siteId

Обязательный параметр.

Идентификатор объекта, список управления пользователями в MyAlarm которого нужно получить. Соответствует полю `Id` элемента JSON с [полями объекта](#api-site-json).

#### userName

Необязательный параметр.

Имя пользователя, от имени которого выполняется операция.

### Возможные статусы ответов

`200`, `403` – cм. «[Статусы ответов](#api-status-codes)».

### Возвращаемые данные

При успешном выполнении метод возвращает в теле ответа список элементов JSON с [полями управления пользователем в MyAlarm](#api-access-myalarm-info-json).

### Пример использования

```bash
curl --request GET \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/AccessMyAlarm?siteId=b8144107-31d1-4800-b83d-764f015a54a5'
```

**Status:** `200`

```json
[
    {
        "CustGUID" : "524bf1a5-76ce-43a7-9ed5-56291750933d",
        "UserID" : "124bf1a5-76ce-43a7-9ed5-562917509332",
        "UserRole" : 2,
        "IsPanicEnabled" : true
    },
    {
        "CustGUID" : "524bf1a5-76ce-43a7-9ed5-56291750933b",
        "UserID" : "224bf1a5-76ce-43a7-9ed5-56291750933c",
        "UserRole" : 1,
        "IsPanicEnabled" : false
    }
]
```

## Получить управления пользователем в MyAlarm по идентификатору пользователя(GET /api/AccessMyAlarm) {#api-access-myalarm-single}

Метод предназначен для получения информации о доступе конкретного пользователя MyAlarm. Для поиска доступа конкретного пользователя MyAlarm должен быть использован его идентификатор.

**URL** : `/api/AccessMyAlarm`

**Метод** : `GET`

### Параметры

#### id

Обязательный параметр.

Идентификатор пользователя, информацию о котором нужно получить.

#### userName

Необязательный параметр.

Имя пользователя, от имени которого выполняется операция.

### Возможные статусы ответов

`200`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

### Возвращаемые данные

При успешном выполнении метод возвращает в теле ответа элемент JSON с [полями управления пользователем в MyAlarm](#api-access-myalarm-info-json).

### Пример использования

```bash
curl --request GET \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/AccessMyAlarm?id=524bf1a5-76ce-43a7-9ed5-56291750933e&`
        `userName=crm-Ivanova-A-A'
```

**Status:** `200`

```json
{
    "CustGUID" : "524bf1a5-76ce-43a7-9ed5-56291750933e",
    "UserID" : "124bf1a5-76ce-43a7-9ed5-562917509332",
    "UserRole" : 2,
    "IsPanicEnabled" : true
}
```

## Разрешить\\Запретить доступ пользователю (PUT /api/AccessMyAlarm) {#api-access-myalarm-set-access}

Метод предназначен для изменения доступа пользователю в MyAlarm

**URL** : `/api/AccessMyAlarm`

**Метод** : `PUT`

### Параметры

#### userName

Необязательный параметр.

Имя пользователя, от имени которого выполняется операция.

### Тело запроса

В теле запроса должен быть передан элемент JSON с [полями управления доступом пользователя в MyAlarm](#api-access-myalarm-access-json)

Все поля обязательные.

### Возможные статусы ответов

`200`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

### Возвращаемые данные

При успешном выполнении метод возвращает в теле ответа элемент JSON с [полями управления доступом пользователя в MyAlarm](#api-access-myalarm-access-json) – с учетом изменений, которые произошли в результате выполнения запроса.

Если при выполнении запроса возникла ошибка, то запрос вернет код 400 и описание возникшей ошибки в теле ответа – см. «[Код 400: описание ошибки](#api-code-400-result)»

### Пример использования

```bash
curl --request PUT \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/AccessMyAlarm' \
  --data '{ "CustGUID" : "524bf1a5-76ce-43a7-9ed5-56291750933f", "UserRole" : 2 }'
```

## Разрешить\\Запретить КТС пользователю (PUT /api/AccessMyAlarm) {#api-access-myalarm-set-ktc}

Метод предназначен для изменения КТС пользователю в MyAlarm

**URL** : `/api/AccessMyAlarm`

**Метод** : `PUT`

### Параметры

#### userName

Необязательный параметр.

Имя пользователя, от имени которого выполняется операция.

### Тело запроса

В теле запроса должен быть передан элемент JSON с [полями управления КТС пользователя в MyAlarm](#api-access-myalarm-ktc-json)

Все поля обязательные.

### Возможные статусы ответов

`200`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

### Возвращаемые данные

При успешном выполнении метод возвращает в теле ответа элемент JSON с [полями управления КТС пользователя в MyAlarm](#api-access-myalarm-ktc-json) – с учетом изменений, которые произошли в результате выполнения запроса.

Если при выполнении запроса возникла ошибка, то запрос вернет код 400 и описание возникшей ошибки в теле ответа – см. «[Код 400: описание ошибки](#api-code-400-result)»

### Пример использования

```bash
curl --request PUT \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/AccessMyAlarm' \
  --data '{ "CustGUID" : "524bf1a5-76ce-43a7-9ed5-56291750933f", "IsPanicEnabled" : true }'
```

## Подписать объект на класс событий (POST /api/AccessMyAlarm/Class) {#api-access-myalarm-subscribe-class}

Метод предназначен для подписки объекта на класс событий

**URL** : `/api/AccessMyAlarm/Class`

**Метод** : `POST`

### Параметры

#### userName

Необязательный параметр.

Имя пользователя, от имени которого выполняется операция.

### Тело запроса

В теле запроса должен быть передан элемент JSON с [полями подписки объектом классов событий в MyAlarm](#api-access-myalarm-subscribe-class-json)

Все поля обязательные.

### Возможные статусы ответов

`201`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

### Возвращаемые данные

При успешном выполнении метод возвращает в теле ответа элемент JSON с [полями подписки объектом классов событий в MyAlarm](#api-access-myalarm-subscribe-class-json) – с учетом изменений, которые произошли в результате выполнения запроса.

Если при выполнении запроса возникла ошибка, то запрос вернет код 400 и описание возникшей ошибки в теле ответа – см. «[Код 400: описание ошибки](#api-code-400-result)»

### Пример использования

```bash
curl --request POST \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/AccessMyAlarm/Class' \
  --data '{ "ObjectID" : 23, "SubID" : 55 }'
```

## Отписать объект от класса событий (DELETE /api/AccessMyAlarm/Class) {#api-access-myalarm-unsubscribe-class}

Метод предназначен для подписки объекта на класс событий

**URL** : `/api/AccessMyAlarm/Class`

**Метод** : `DELETE`

### Параметры

#### userName

Необязательный параметр.

Имя пользователя, от имени которого выполняется операция.

### Тело запроса

В теле запроса должен быть передан элемент JSON с [полями подписки объектом классов событий в MyAlarm](#api-access-myalarm-subscribe-class-json)

Все поля обязательные.

### Возможные статусы ответов

`200`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

### Возвращаемые данные

При успешном выполнении метод не возвращает данных. Если при выполнении запроса возникла ошибка, то запрос вернет код 400 и описание возникшей ошибки в ответе – см. «[Код 400: описание ошибки](#api-code-400-result)»

### Пример использования

```bash
curl --request DELETE \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/AccessMyAlarm/Class' \
  --data '{ "ObjectID" : 23, "SubID" : 55 }'
```

## Подписать объект на действие событий (POST /api/AccessMyAlarm/Action) {#api-access-myalarm-subscribe-action}

Метод предназначен для подписки объекта на действие

**URL** : `/api/AccessMyAlarm/Action`

**Метод** : `POST`

### Параметры

#### userName

Необязательный параметр.

Имя пользователя, от имени которого выполняется операция.

### Тело запроса

В теле запроса должен быть передан элемент JSON с [полями подписки объектом действий в MyAlarm](#api-access-myalarm-subscribe-action-json)

Все поля обязательные.

### Возможные статусы ответов

`201`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

### Возвращаемые данные

При успешном выполнении метод возвращает в теле ответа элемент JSON с [полями подписки объектом действий в MyAlarm](#api-access-myalarm-subscribe-action-json) – с учетом изменений, которые произошли в результате выполнения запроса.

Если при выполнении запроса возникла ошибка, то запрос вернет код 400 и описание возникшей ошибки в теле ответа – см. «[Код 400: описание ошибки](#api-code-400-result)»

### Пример использования

```bash
curl --request POST \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/AccessMyAlarm/Action' \
  --data '{ "ObjectID" : 23, "SubID" : 55 }'
```

## Отписать объект от действия событий (DELETE /api/AccessMyAlarm/Action) {#api-access-myalarm-unsubscribe-action}

Метод предназначен для подписки объекта на действие

**URL** : `/api/AccessMyAlarm/Action`

**Метод** : `DELETE`

### Параметры

#### userName

Необязательный параметр.

Имя пользователя, от имени которого выполняется операция.

### Тело запроса

В теле запроса должен быть передан элемент JSON с [полями подписки объектом действий в MyAlarm](#api-access-myalarm-subscribe-action-json)

Все поля обязательные.

### Возможные статусы ответов

`200`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

### Возвращаемые данные

При успешном выполнении метод не возвращает данных. Если при выполнении запроса возникла ошибка, то запрос вернет код 400 и описание возникшей ошибки в ответе – см. «[Код 400: описание ошибки](#api-code-400-result)»

### Пример использования

```bash
curl --request DELETE \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/AccessMyAlarm/Action' \
  --data '{ "ObjectID" : 23, "SubID" : 55 }'
```
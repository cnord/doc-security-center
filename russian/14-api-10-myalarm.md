\pagebreak

# Управление доступом в MyAlarm

Методы для управления доступом в MyAlarm: Разрешение/запрет доступа или КТС, получение информации по конкретному пользователю и по объекту. Возможность подписаться/отписаться на класс событий или действие.

## Структуры данных управления доступом в MyAlarm

### Пользователь MyAlarm {#api-myalarm-user-json}

```json
{
    "CustomerID" : Guid,
    "MobilePhone" : string,
    "MyAlarmPhone" : string,
    "Role" : string,
    "IsPanic" : string
}
```

\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Название поля} & \textbf{Тип} & \textbf{Поле в карточке объекта; примечание} \\ \midrule

CustomerID & Guid & Идентификатор пользователя \\ \arrayrulecolor{light-gray}\hline
MobilePhone & string & Телефон ответственного \\ \arrayrulecolor{light-gray}\hline
MyAlarmPhone & string & Телефон пользователя MyAlarm \\ \arrayrulecolor{light-gray}\hline
Role & string & Роль пользователя \\ \arrayrulecolor{light-gray}\hline
IsPanic & bool & Разрешён или запрещён КТС \\

\bottomrule
\end{tabularx}

### Объект пользователя MyAlarm {#api-myalarm-user-object-json}

```json
{
    "ObjectGUID" : Guid,
    "CustomerID" : Guid,
    "Role" : string,
    "IsPanic" : bool
}
```

\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Название поля} & \textbf{Тип} & \textbf{Поле в карточке объекта; примечание} \\ \midrule

ObjectGUID & Guid & Идентификатор объекта \\ \arrayrulecolor{light-gray}\hline
CustomerID & Guid & Идентификатор пользователя \\ \arrayrulecolor{light-gray}\hline
Role & string & Роль пользователя \\ \arrayrulecolor{light-gray}\hline
IsPanic & bool & Разрешён или запрещён КТС \\

\bottomrule
\end{tabularx}

## Стурктуры данных классов событий, действий и отмен

### Класс события с полями {#api-myalarm-event-class-json}

```json
{
    "EventClassID" : int,
    "Type" : string,
    "Name" : string
}
```

\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Название поля} & \textbf{Тип} & \textbf{Поле в карточке объекта; примечание} \\ \midrule

EventClassID & int & Идентификатор класса события \\ \arrayrulecolor{light-gray}\hline
Type & string & Тип класса событий (псевдоним) \\ \arrayrulecolor{light-gray}\hline
Name & string & Название класса событий \\

\bottomrule
\end{tabularx}

### Действие или отмена с полями {#api-myalarm-user-action-json}

```json
{
    "UserActionID" : int,
    "Type" : string,
    "Name" : string
}
```

\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Название поля} & \textbf{Тип} & \textbf{Поле в карточке объекта; примечание} \\ \midrule

UserActionID & int & Идентификатор действия и отмены \\ \arrayrulecolor{light-gray}\hline
Type & string & Тип действия и отмены (псевдоним) \\ \arrayrulecolor{light-gray}\hline
Name & string & Название действия и отмены \\

\bottomrule
\end{tabularx}

## Основные методы http-api

### Получить список пользователей MyAlarm объекта (GET /api/MyAlarm) {#api-myalarm-list}

Метод предназначен для получения списка пользователей MyAlarm объекта.

**URL** : `/api/MyAlarm`

**Метод** : `GET`

#### Параметры

##### siteId

Обязательный параметр.

Идентификатор объекта, список пользователями MyAlarm которого нужно получить. Соответствует полю `Id` элемента JSON с [полями объекта](#api-site-json).

##### userName

Необязательный параметр.

Имя пользователя, от имени которого выполняется операция.

#### Возможные статусы ответов

`200`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

#### Возвращаемые данные

При успешном выполнении метод возвращает в теле ответа список элементов JSON с [полями пользователя MyAlarm](#api-myalarm-user-json).

#### Пример использования

```bash
curl --request GET \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/MyAlarm?siteId=fd2cdaae-585e-44a3-804e-a24537f6de7a'
```

**Status:** `200`

```json
[
    {
        "CustomerID":"548de89a-8b93-4319-997d-8902d8fb2a8e",
        "MobilePhone":"89001122345",
        "MyAlarmPhone":"+79001122345",
        "Role":"admin",
        "IsPanic":false
    }
]
```

### Получить список объектов пользователя MyAlarm (GET /api/MyAlarm/UserObjects) {#api-myalarm-user-object-list}

Метод предназначен для получения списка объектов пользователя MyAlarm.

**URL** : `/api/MyAlarm/UserObjects`

**Метод** : `GET`

#### Параметры

##### phone

Обязательный параметр.

Телефон пользователя MyAlarm.

Примечание знак `+` необходимо заменить на `%2B`.

##### userName

Необязательный параметр.

Имя пользователя, от имени которого выполняется операция.

#### Возможные статусы ответов

`200`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

#### Возвращаемые данные

При успешном выполнении метод возвращает в теле ответа список элементов JSON с [полями объекта пользователя MyAlarm](#api-myalarm-user-object-json).

#### Пример использования

```bash
curl --request GET \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/MyAlarm/UserObjects?phone=%2B79001122345'
```

**Status:** `200`

```json
[
    {
        "ObjectGUID":"fd2cdaae-585e-44a3-804e-a24537f6de7a",
        "CustomerID":"548de89a-8b93-4319-997d-8902d8fb2a8e",
        "Role":1,
        "IsPanic":false
    }
]
```

### Предоставить/забрать доступ пользователю к MyAlarm (PUT /api/MyAlarm) {#api-myalarm-modify-access}

Метод предназначен для изменения доступа пользователю в MyAlarm

Примечание: при предоставлению доступа первому пользователю, объект будет подписан на все классы событий, действия и отмены.

Примечание: при снятии доступа у последнего пользователя, объект будет отписан от всех классов событий, действий и отмен.

Для смены роли пользователя ему сперва следует задать роль 'unlink' и только после этого можно заново задать уровень доступа.

**URL** : `/api/MyAlarm`

**Метод** : `PUT`

#### Параметры

##### custId

Обязательный параметр.

Идентификатор пользователя

##### role

Обязательный параметр.

Роль пользователя, допустимые значения: "unlink", "user", "admin"

##### userName

Необязательный параметр.

Имя пользователя, от имени которого выполняется операция.

#### Возможные статусы ответов

`200`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

#### Пример использования

```bash
curl --request PUT \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/MyAlarm?custId=548DE89A-8B93-4319-997D-8902D8FB2A8E&role=admin'
```

**Status:** `200`

### Модифицировать право на использование виртуальной КТС  (PUT /api/MyAlarm) {#api-myalarm-modify-kts}

Метод предназначен для изменения права на пользование виртуальной КТС пользователю MyAlarm

**URL** : `/api/MyAlarm`

**Метод** : `PUT`

#### Параметры

##### custId

Обязательный параметр.

Идентификатор пользователя

##### isPanic

Обязательный параметр.

`true` разрешить использование, `false` - запретить

##### userName

Необязательный параметр.

Имя пользователя, от имени которого выполняется операция.

#### Возможные статусы ответов

`200`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

#### Пример использования

```bash
curl --request PUT \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/MyAlarm?custId=548DE89A-8B93-4319-997D-8902D8FB2A8E&isPanic=true'
```

**Status:** `200`

## Управление подписками

### Получить список подписок объекта на классы событий \newline (GET /api/MyAlarm/EventClass) {#api-myalarm-event-class-list}

Метод предназначен для получения списка подписок объекта на классы событий

**URL** : `/api/MyAlarm/EventClass`

**Метод** : `GET`

#### Параметры

##### siteId

Обязательный параметр.

Идентификатор объекта, список пользователями MyAlarm которого нужно получить. Соответствует полю `Id` элемента JSON с [полями объекта](#api-site-json).

##### userName

Необязательный параметр.

Имя пользователя, от имени которого выполняется операция.

#### Возможные статусы ответов

`200`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

#### Возвращаемые данные

При успешном выполнении метод возвращает в теле ответа список элементов JSON с [полями класса событий](#api-myalarm-event-class-json).

#### Пример использования

```bash
curl --request GET \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/MyAlarm/EventClass?siteId=fd2cdaae-585e-44a3-804e-a24537f6de7a'
```

**Status:** `200`

```json
[
    {
        "EventClassID":3,
        "Type":"alarm",
        "Name":"Тревога"
    },{
        "EventClassID":4,
        "Type":"alarm",
        "Name":"Тихая тревога"
    }
]
```

### Получить список подписок объекта на действия и отмены \newline (GET /api/MyAlarm/UserAction) {#api-myalarm-user-action-list}

Метод предназначен для получения списка подписок объекта на действия и отмены

**URL** : `/api/MyAlarm/UserAction`

**Метод** : `GET`

#### Параметры

##### siteId

Обязательный параметр.

Идентификатор объекта, список пользователями MyAlarm которого нужно получить. Соответствует полю `Id` элемента JSON с [полями объекта](#api-site-json).

##### userName

Необязательный параметр.

Имя пользователя, от имени которого выполняется операция.

#### Возможные статусы ответов

`200`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

#### Возвращаемые данные

При успешном выполнении метод возвращает в теле ответа список элементов JSON с [полями действия или отмены](#api-myalarm-user-action-json).

#### Пример использования

```bash
curl --request GET \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/MyAlarm/UserAction?siteId=fd2cdaae-585e-44a3-804e-a24537f6de7a'
```

**Status:** `200`

```json
[
    {
        "UserActionID":2,
        "Type":"SendGuard",
        "Name":"Вызов группы"
    },{
        "UserActionID":3,
        "Type":"ArriveGuard",
        "Name":"Прибытие группы"
    }
]
```

### Модификация подписок объекта на классы событий \newline (PUT /api/MyAlarm/EventClass) {#api-myalarm-modify-event-class-list}

Метод предназначен для изменения списка подписок объекта на классы событий

**URL** : `/api/MyAlarm/EventClass`

**Метод** : `PUT`

#### Параметры

##### siteId

Обязательный параметр.

Идентификатор объекта, список пользователями MyAlarm которого нужно получить. Соответствует полю `Id` элемента JSON с [полями объекта](#api-site-json).

##### userName

Необязательный параметр.

Имя пользователя, от имени которого выполняется операция.

#### Тело запроса

В теле запроса должен быть передан элемент JSON со списком идентификаторов классов событий, например: `[1, 2, 3]`.

#### Возможные статусы ответов

`200`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

#### Пример использования

```bash
curl --request PUT \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/MyAlarm/EventClass?siteId=fd2cdaae-585e-44a3-804e-a24537f6de7a' \
  --data '[3, 4]'
```

**Status:** `200`

### Модификация подписок объекта на действия и отмены \newline (PUT /api/MyAlarm/UserAction) {#api-myalarm-modify-user-action-list}

Метод предназначен для изменения списка подписок объекта на действия или отмены

**URL** : `/api/MyAlarm/UserAction`

**Метод** : `PUT`

#### Параметры

##### siteId

Обязательный параметр.

Идентификатор объекта, список пользователями MyAlarm которого нужно получить. Соответствует полю `Id` элемента JSON с [полями объекта](#api-site-json).

##### userName

Необязательный параметр.

Имя пользователя, от имени которого выполняется операция.

#### Тело запроса

В теле запроса должен быть передан элемент JSON со списком идентификаторов действия или отмены, например: `[1, 2, 3]`.

#### Возможные статусы ответов

`200`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

#### Пример использования

```bash
curl --request PUT \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/MyAlarm/UserAction?siteId=fd2cdaae-585e-44a3-804e-a24537f6de7a' \
  --data '[3, 4]'
```

**Status:** `200`

## Списки классов событий, действий и отмен

### Получить список классов событий ЦО (GET /api/EventClasses) {#api-event-class-list}

Метод предназначен для получения списка классов событий Центра Охраны.

**URL** : `/api/EventClasses`

**Метод** : `GET`

#### Параметры

##### userName

Необязательный параметр.

Имя пользователя, от имени которого выполняется операция.

#### Возможные статусы ответов

`200`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

#### Возвращаемые данные

При успешном выполнении метод возвращает в теле ответа список элементов JSON с [полями класса событий](#api-myalarm-event-class-json).

#### Пример использования

```bash
curl --request GET \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/EventClasses'
```

**Status:** `200`

```json
[
    {
        "EventClassID":3,
        "Type":"alarm",
        "Name":"Тревога"
    },{
        "EventClassID":4,
        "Type":"alarm",
        "Name":"Тихая тревога"
    }, ...
]
```
### Получить список действий и отмен ЦО (GET /api/UserActions) {#api-user-action-list}

Метод предназначен для получения списка действий и отмен Центра Охраны.

**URL** : `/api/UserActions`

**Метод** : `GET`

#### Параметры

##### userName

Необязательный параметр.

Имя пользователя, от имени которого выполняется операция.

#### Возможные статусы ответов

`200`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

#### Возвращаемые данные

При успешном выполнении метод возвращает в теле ответа список элементов JSON с [полями действия или отмены](#api-myalarm-user-action-json).

#### Пример использования

```bash
curl --request GET \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/UserActions'
```

**Status:** `200`

```json
[
    {
        "UserActionID":3,
        "Type":"ArriveGuard",
        "Name":"Прибытие группы"
    },{
        "UserActionID":4,
        "Type":"CancelGuard",
        "Name":"Отмена вызова группы"
    }, ...
]
```








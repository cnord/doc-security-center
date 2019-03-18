\pagebreak

# Управление доступом в MyAlarm

Методы для управления доступом в MyAlarm: Разрешение/запрет доступа или КТС, получение информации по конкретному пользователю и по объекту. Возможность подписаться/отписаться на класс событий или действие.

## Структуры данных управления доступом в MyAlarm

// TODO описать структуру элементов списка #api-access-myalarm-list-item-json
// TODO описать структуру данных для получения информации о доступе пользователя #api-access-myalarm-single-json

### Поля управления доступом пользователя в MyAlarm  {#api-access-myalarm-access-json}

```json
{
	"id" : GUID,
	"role" : number
}
```

\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Название поля} & \textbf{Тип} & \textbf{Поле в карточке объекта; примечание} \\ \midrule

id & string & Идентификатор пользователя \\ \arrayrulecolor{light-gray}\hline
role & number & Тип доступа \\

\bottomrule
\end{tabularx}

В зависимости от параметра role пользователю будет разрешён или запрещён доступ: 
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
	"id" : GUID,
	"IsEnablePanik" : boolean
}
```

\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Название поля} & \textbf{Тип} & \textbf{Поле в карточке объекта; примечание} \\ \midrule

id & string & Идентификатор пользователя \\ \arrayrulecolor{light-gray}\hline
IsEnablePanik & boolean & Разрешён или запрещён КТС \\

\bottomrule
\end{tabularx}

### Поля подписок классов \\ действий управления доступом в MyAlarm  {#api-access-myalarm-subscribe-json}

```json
{
    "id" : number,
    "subId" : number
}
```

\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Название поля} & \textbf{Тип} & \textbf{Поле в карточке объекта; примечание} \\ \midrule

id & number & Идентификатор объекта \\ \arrayrulecolor{light-gray}\hline
subId & number & Идентификатор класса события или действия  \\

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

При успешном выполнении метод возвращает в теле ответа список элементов JSON с [полями списка управления пользователями в MyAlarm](#api-access-myalarm-list-item-json).

### Пример использования

```bash
curl --request GET \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/AccessMyAlarm?siteId=b8144107-31d1-4800-b83d-764f015a54a5'
```

**Status:** `200`

// TODO: привести пример json результата

## Получить управления доступом в MyAlarm по идентификатору пользователя(GET /api/AccessMyAlarm) {#api-access-myalarm-single}

Метод предназначен для получения информации о доступе конкретного пользователя MyAlarm. Для поиска доступа конкретного пользователя MyAlarm должен быть использован его идентификатор.

**URL** : `/api/AccessMyAlarm`

**Метод** : `GET`


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
  --data '{ "id" : "524bf1a5-76ce-43a7-9ed5-56291750933f", "role" : 2 }'
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
  --data '{ "id" : "524bf1a5-76ce-43a7-9ed5-56291750933f", "IsEnablePanik" : true }'
```

## Подписать объект на класс событий (POST /api/AccessMyAlarm) {#api-access-myalarm-subscribe-class}

// TODO

## Отписать объект от класса событий (DELETE /api/AccessMyAlarm) {#api-access-myalarm-unsubscribe-class}

// TODO

## Подписать объект на действие событий (POST /api/AccessMyAlarm) {#api-access-myalarm-subscribe-action}

// TODO

## Отписать объект от действия событий (DELETE /api/AccessMyAlarm) {#api-access-myalarm-unsubscribe-action}

// TODO
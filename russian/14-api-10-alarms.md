\pagebreak

# Тревоги

## Поля тревоги {#api-alarm-json}

Элемент JSON, содержащий поля события тревоги

```json
{
    "ObjectGUID": Guid,
    "RChannelName": string,
    "DateTime": DateTime,
    "AlarmIndex": long (Int64),
    "EventCode": string,
    "EventClassName": string,
    "EventClassType": string,
    "EventDesc": string,
    "PartNumber": int,
    "ZoneUser": int,
    "SaveDateTime": DateTime
}
```

\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Название поля} & \textbf{Тип} & \textbf{Описание} \\ \midrule

ObjectGUID & Guid & Идентификатор объекта \\ \arrayrulecolor{light-gray}\hline
RChannelName & string & Мнемоническое название и номер канала связи \\ \arrayrulecolor{light-gray}\hline
DateTime & string & Дата и время формирования события \\ \arrayrulecolor{light-gray}\hline
AlarmIndex & long (Int64) & Индекс группы тревог, к которой относится событие \\ \arrayrulecolor{light-gray}\hline
EventCode & string & Код события \\ \arrayrulecolor{light-gray}\hline
EventClassName & string & Класс события \\ \arrayrulecolor{light-gray}\hline
EventClassType & string & Псевдоним названия типа класса события \\ \arrayrulecolor{light-gray}\hline
EventDesc & string & Описание события \\ \arrayrulecolor{light-gray}\hline
PartNumber & number & Номер раздела, по которому сформировано событие \\ \arrayrulecolor{light-gray}\hline
ZoneUser & number & Номер зоны или пользователя \\ \arrayrulecolor{light-gray}\hline
SaveDateTime & string & Дата и время сохранения события в базе данных «Центра охраны» \\

\bottomrule
\end{tabularx}

Значение поля EventClassType всегда будет "alarm"

### Формат полей с датой и временем

Для полей `DateTime` и `SaveDateTime` строковое значение даты и времени имеет формат "`YYYY-MM-DDTHH:mm:ss.fff`". Часовой пояс даты и времени соответствует часовому поясу компьютера, на котором запущен модуль «Менеджер событий».

## Поля действия или отмены {#api-alarm-action-json}

```json
{
    "DateTime": DateTime,
    "UserName": string,
    "ActionName": string,
    "ActionType": string,
    "GuardName": string,
    "Comment": string
}
```

\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Название поля} & \textbf{Тип} & \textbf{Описание} \\ \midrule

DateTime & DateTime & Дата и время \\ \arrayrulecolor{light-gray}\hline
UserName & string & Имя пользователя \\ \arrayrulecolor{light-gray}\hline
ActionName & string & Действие \\ \arrayrulecolor{light-gray}\hline
ActionType & string & Тип действия \\ \arrayrulecolor{light-gray}\hline
GuardName & string & Название охраны \\ \arrayrulecolor{light-gray}\hline
Comment & string & Комментарий \\

\bottomrule
\end{tabularx}

## Получить список тревог за период (GET /api/Alarms)

Метод, предназначенный для получения событий тревоги за период. Метод возвращает не только события переданные охранным прибором, установленном на объекте, но и события сформированные программным обеспечением «Центр охраны».

**URL** : `/api/Alarms`

**Метод** : `GET`

### Параметры

#### dateFrom

Обязательный параметр

Начальная дата и время периода

#### dateTo

Необязательный параметр

Конечная дата и время периода

Примечание: Максимальное количество записей ограничено 1000, для получения всех записей нужно манипулировать начальной и конечной датой

#### userName

Необязательный параметр.

Имя пользователя, от имени которого выполняется операция.

#### Формат полей с датой и временем

Возможные строковые значения даты и времени для полей `dateFrom` и `dateTo`:

* `yyyyMMddHHmmss`

### Возможные статусы ответов

`200`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

### Возвращаемые данные

При успешном выполнении метод возвращает в теле ответа список элементов JSON с [полями события](#api-alarm-json).

### Пример выполнения запроса

```bash
curl --request GET \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/Alarms?dateFrom=20160102100013&dateTo=20190319150859'
```

**Status:** `200`


```json
[{
	"ObjectGUID": "fd2cdaae-585e-44a3-804e-a24537f6de7a",
	"RChannelName": "Sms3",
	"DateTime": "2019-03-19T15:08:57.41",
	"AlarmIndex": 2019031915085742,
	"EventCode": "E151",
	"EventClassName": "Тревога",
	"EventClassType": "alarm",
	"EventDesc": "Утечка газа.  ",
	"PartNumber": 0,
	"ZoneUser": 3,
	"SaveDateTime": "2019-03-19T15:08:57.57"
},
{
	"ObjectGUID": "fd2cdaae-585e-44a3-804e-a24537f6de7a",
	"RChannelName": "Gprs4",
	"DateTime": "2019-03-19T15:08:58.49",
	"AlarmIndex": 2019031915085742,
	"EventCode": "E136",
	"EventClassName": "Тревога",
	"EventClassType": "alarm",
	"EventDesc": "Снаружи.  ",
	"PartNumber": 0,
	"ZoneUser": 2,
	"SaveDateTime": "2019-03-19T15:08:58.9"
}, ...]
```

## Получить список действий или отмен по индексу тревоги (GET /api/Alarms)

Метод предназначен для получения списков действий или отмен по индексу тревоги

**URL** : `/api/Alarms`

**Метод** : `GET`

### Параметры

#### alarmIndex

Обязательный параметр.

Индекс тревоги.

#### userName

Необязательный параметр.

Имя пользователя, от имени которого выполняется операция.

### Возможные статусы ответов

`200`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

### Возвращаемые данные

При успешном выполнении метод возвращает в теле ответа список элементов JSON с [полями события](#api-alarm-action-json).

### Пример выполнения запроса

```bash
curl --request GET \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/Alarms?alarmIndex=2019031915085742'
```

**Status:** `200`

```json
[
    {
        "DateTime": "2019-02-17T12:08:50.24",
        "UserName": "Иванова",
        "ActionName": "Вызов группы",
        "ActionType": "ConfirmAlarm",
        "GuardName": "Название охраны",
        "Comment": "Комментарий"
    },
    {
        "DateTime": "2019-02-17T12:22:38.12",
        "UserName": "Петров",
        "ActionName": "Прибытие группы",
        "ActionType": "CancelAlarm",
        "GuardName": "Название охраны",
        "Comment": "Комментарий"
    }, ...
]
```


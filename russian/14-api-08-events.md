\pagebreak

# События

## Поля события {#api-event-json}

Элемент JSON, содержащий поля события

```json
{
    "Id": string,
    "RChannelName": string,
    "DateTime": string,
    "AccountNumber": number,
    "EventCode": string,
    "EventClassName": string,
    "EventClassType": string,
    "EventDesc": string,
    "PartNumber": number,
    "ZoneUser": number,
    "AlarmIndex": number,
    "SaveDateTime": string
}
```

\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Название поля} & \textbf{Тип} & \textbf{Описание} \\ \midrule

Id & string & Идентификатор объекта \\ \arrayrulecolor{light-gray}\hline
RChannelName & string & Мнемоническое название и номер канала связи \\ \arrayrulecolor{light-gray}\hline
DateTime & string & Дата и время формирования события \\ \arrayrulecolor{light-gray}\hline
AccountNumber & number & Номер объекта, по которому сформировано событие \\ \arrayrulecolor{light-gray}\hline
EventCode & string & Код события \\ \arrayrulecolor{light-gray}\hline
EventClassName & string & Название класса события \\ \arrayrulecolor{light-gray}\hline
EventClassType & string & Псевдоним названия типа класса события (см. ниже) \\ \arrayrulecolor{light-gray}\hline
EventDesc & string & Описание события \\ \arrayrulecolor{light-gray}\hline
PartNumber & number & Номер раздела, по которому сформировано событие \\ \arrayrulecolor{light-gray}\hline
ZoneUser & number & Номер зоны или пользователя \\ \arrayrulecolor{light-gray}\hline
AlarmIndex & number & Индекс группы тревог, к которой относится событие \\ \arrayrulecolor{light-gray}\hline
SaveDateTime & string & Дата и время сохранения события в базе данных «Центра охраны» \\

\bottomrule
\end{tabularx}

### Значения поля EventClassType

Псевдоним названия типа класса события.

> Тип класса события, указывается в модуле «Настройка системы», на вкладке «Классы событий».

Соответствия значений псевдонима и названий типа класса события:

\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{ll}
\textbf{Псевдоним} & \textbf{Название типа класса события} \\ \midrule

alarm & Тревога \\ \arrayrulecolor{light-gray}\hline
reset & Сброс \\ \arrayrulecolor{light-gray}\hline
fault & Неисправность \\ \arrayrulecolor{light-gray}\hline
restore & Восстановление \\ \arrayrulecolor{light-gray}\hline
arm & Взятие под охрану \\ \arrayrulecolor{light-gray}\hline
disarm & Снятие с охраны \\ \arrayrulecolor{light-gray}\hline
bypass & Исключение \\ \arrayrulecolor{light-gray}\hline
warning & Предупреждение \\ \arrayrulecolor{light-gray}\hline
other & Другое \\ \arrayrulecolor{light-gray}\hline
test & Тест \\

\bottomrule
\end{tabularx}

### Формат полей с датой и временем

Для полей `DateTime` и `SaveDateTime` строковое значение даты и времени имеет формат "`YYYY-MM-DDTHH:mm:ss.fff`". Часовой пояс даты и времени соответствует часовому поясу компьютера, на котором запущен модуль «Менеджер событий».

## Получить список событий (GET /api/Events) {#api-events-get-list}

Метод, предназначенный для получения событий. Метод возвращает не только события переданные охранным приборами, но и события сформированные программным обеспечением «Центр охраны».

**URL** : `/api/Events`

**Метод** : `GET`

### Параметры

#### id

Необязательный параметр.

Идентификатор или номер объекта, события которого должен вернуть метод.

Если не указан, возвращаются события по всем объектам.

#### startFrom

Необязательный параметр.

С какого по счету элемента возвращать данные. Если не указано - возвращается начиная с первого.

#### pageSize

Необязательный параметр.

Размер страницы для вывода данных. Если не указано - то используется размер страницы по умолчанию из конфигурационного файла

### Тело запроса

В теле запроса должен быть передан элемент JSON со значениями параметров, уточняющими интервал и типы классов для событий, которые необходимо вернуть.
Если ни для какого параметра значение не указано, то есть в теле передаются пустые скобки `{}`, то будет использовано значение по умолчанию. 

```json
{
    "startDate": string,
    "stopDate": string,
    "ectAlarm": boolean,
    "ectReset": boolean,
    "ectFault": boolean,
    "ectRestore": boolean,
    "ectArm": boolean,
    "ectDisarm": boolean,
    "ectBypass": boolean,
    "ectWarning": boolean,
    "ectOther": boolean,
    "ectTest": boolean,
    "duplicateEvent": boolean
}
```

\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{lllX}
\textbf{Параметр} & \textbf{Тип} & \textbf{Значение по умолчанию} & \textbf{Примечание} \\ \midrule

startDate & string & `Now` & Начало временного интервала, за который нужно вернуть события \\ \arrayrulecolor{light-gray}\hline
stopDate & string & `Now - 32 days` & Конец временного интервала, за который нужно вернуть события \\ \arrayrulecolor{light-gray}\hline
ectAlarm & boolean & true & Вернуть события с типом класса «Тревога» \\ \arrayrulecolor{light-gray}\hline
ectReset & boolean & true & Вернуть события с типом класса «Сброс» \\ \arrayrulecolor{light-gray}\hline
ectFault & boolean & true & Вернуть события с типом класса «Неисправность» \\ \arrayrulecolor{light-gray}\hline
ectRestore & boolean & true & Вернуть события с типом класса «Восстановление» \\ \arrayrulecolor{light-gray}\hline
ectArm & boolean & true & Вернуть события с типом класса «Взятие под охрану» \\ \arrayrulecolor{light-gray}\hline
ectDisarm & boolean & true & Вернуть события с типом класса «Снятие с охраны» \\ \arrayrulecolor{light-gray}\hline
ectBypass & boolean & true & Вернуть события с типом класса «Исключение» \\ \arrayrulecolor{light-gray}\hline
ectWarning & boolean & true & Вернуть события с типом класса «Предупреждение» \\ \arrayrulecolor{light-gray}\hline
ectOther & boolean & true & Вернуть события с типом класса «Другое» \\ \arrayrulecolor{light-gray}\hline
ectTest & boolean & false & Вернуть события с типом класса «Тест» \\ \arrayrulecolor{light-gray}\hline
duplicateEvent & boolean & false & Вернуть дублирующие события \\

\bottomrule
\end{tabularx}

#### Формат полей с датой и временем

Возможные строковые значения даты и времени для полей `startDate` и `stopDate`:

* `YYYY-MM-DD`
* `YYYY-MM-DDTHH:mm:ss`
* `YYYY-MM-DDTHH:mm:ss.fff`

Часовой пояс даты и времени соответствует часовому поясу компьютера, на котором запущен модуль «Менеджер событий».

### Возможные статусы ответов

`200`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

### Возвращаемые данные

При успешном выполнении метод возвращает в теле ответа список элементов JSON с [полями события](#api-event-json).

### Пример использования

#### Пример выполнения запроса, в котором указано только значение для идентификатора объекта

```bash
curl --request GET \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/Events?id=94df3af9-36c1-423b-aa88-fb505bda3fa4'
  --data '{
        }'
```

**Status:** `200`

```json
[
    {
        "Id": "94df3af9-36c1-423b-aa88-fb505bda3fa4",
        "RChannelName": "Gprs6",
        "DateTime": "2019-02-17T12:08:50.24",
        "AccountNumber": 265,
        "EventCode": "E110",
        "EventClassName": "Пожар",
        "EventClassType": "alarm",
        "EventDesc": "Запасной выход",
        "PartNumber": 1,
        "ZoneUser": 1,
        "AlarmIndex": 2019021711525158,
        "SaveDateTime": "2019-02-17T12:08:50.26"
    },
    {
        "Id": "94df3af9-36c1-423b-aa88-fb505bda3fa4",
        "RChannelName": "T3",
        "DateTime": "2019-02-17T12:22:38.12",
        "AccountNumber": 265,
        "EventCode": "R140",
        "EventClassName": "Сброс",
        "EventClassType": "reset",
        "EventDesc": "Запасной выход",
        "PartNumber": 1,
        "ZoneUser": 1,
        "AlarmIndex": 0,
        "SaveDateTime": "2019-02-17T12:22:38.143"
    },
    {
        "Id": "94df3af9-36c1-423b-aa88-fb505bda3fa4",
        "RChannelName": "Sms1",
        "DateTime": "2019-02-17T12:29:11.75",
        "AccountNumber": 265,
        "EventCode": "E624",
        "EventClassName": "Неисправность",
        "EventClassType": "fault",
        "EventDesc": "Буфер событий переполнен, есть потерянные события. Главный вход",
        "PartNumber": 1,
        "ZoneUser": 2,
        "AlarmIndex": 0,
        "SaveDateTime": "2019-02-17T12:29:11.767"
    }
]
```

#### Пример выполнения запроса, в котором указаны типы классов событий

```bash
curl --request GET \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/Events'
  --data '{`
        "startDate": "2019-02-01",`
        "stopDate": "2019-02-02"`
        "ectReset": false,`
        "ectFault": false,`
        "ectRestore": false,`
        "ectArm": false,`
        "ectDisarm": false,`
        "ectBypass": false,`
        "ectWarning": false,`
        "ectOther": false`
    }'
```

**Status:** `200`

```json
[
    {
        "Id": "94df3af9-36c1-423b-aa88-fb505bda3fa4",
        "RChannelName": "Gprs6",
        "DateTime": "2019-02-17T12:08:50.24",
        "AccountNumber": 265,
        "EventCode": "E110",
        "EventClassName": "Пожар",
        "EventClassType": "alarm",
        "EventDesc": "Запасной выход",
        "PartNumber": 1,
        "ZoneUser": 1,
        "AlarmIndex": 2019021711525158,
        "SaveDateTime": "2019-02-17T12:08:50.26"
    }
]
```

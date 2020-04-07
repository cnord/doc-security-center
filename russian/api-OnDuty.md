\pagebreak


# Методы API (/api/OnDuty) {#api-onduty}

## Авторизация (GET /api/OnDuty/Auth) {#api-onduty-put-auth}

Метод предназначен для авторизации и получения токена, используемого про вызове всех остальных методов.
“Время жизни” токена - 10 минут после последнего успешного вызова методов API.

**URL** : `/api/OnDuty/Auth`

**Метод** : `PUT`

#### Входные параметры
\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{lllX}
\textbf{Значение} & \textbf{Способ передачи} & \textbf{Тип данных} & \textbf{Описание} \\ \midrule
%Тест комментария
UserName & FromBody & string & Оператор \\ \arrayrulecolor{light-gray}\hline
Password & FromBody & string & Пароль \\
\bottomrule
\end{tabularx}

#### Выходные данные
\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Параметр} & \textbf{Тип данных} & \textbf{Описание} \\ \midrule
Token & string & Токен. Используется про вызове всех остальных методов. \\
\bottomrule
\end{tabularx}

#### Ошибки HTTP 400
Нет оператора с таким именем и паролем

#### Пример использования
```bash
curl --request PUT \
  --url ’http://10.7.22.128:9002/api/api/OnDuty/Auth’ \
  --data ’{ "UserName": "Иванов И.И.", "Password": "Пароль" }’

Ответ:

[{
    “Token“: “524bf1a576ce43a79ed556291750933c“
}]
```

## Получить подтвержденные тревоги \newline (GET /api/OnDuty/ConfirmedAlarms) {#api-onduty-get-confirmed-alarms}

Возвращает список подтвержденных тревог по объектам, принадлежащим регионам пользователя.

**URL** : `/api/OnDuty/ConfirmedAlarms`

**Метод** : `GET`

#### Входные параметры
\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{lllX}
\textbf{Значение} & \textbf{Способ передачи} & \textbf{Тип данных} & \textbf{Описание} \\ \midrule
%Тест комментария
Token & FromUri & string & Токен. Получен вызовом метода /Auth. \\
\bottomrule
\end{tabularx}

#### Выходные данные
\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Параметр} & \textbf{Тип данных} & \textbf{Описание} \\ \midrule
AlarmIndex & long (Int64) & Индекс подтвержденной тревоги. Нужен для методов /AlarmInfo, /AlarmAction. \\ \arrayrulecolor{light-gray}\hline
ObjectGUID & string & Идентификатор объекта. Нужен для методов /Object, /Events. \\
\bottomrule
\end{tabularx}

#### Пример использования
```bash
curl --request GET \
   --url ’http://10.7.22.128:9002/api/api/OnDuty/ConfirmedAlarms?Token=524bf1a576ce43a79ed556291750933c’

Ответ:

[
    {
        “AlarmIndex“: 2020030310245145,
        "ObjectGUID": "fd2cdaae-585e-44a3-804e-a24537f6de7a"
    },
    {
        “AlarmIndex“: 2020030315395806,
        "ObjectGUID": "548de89a-8b93-4319-997d-8902d8fb2a8e"
    }
]
```

## Получить информацию о тревоге \newline (GET /api/OnDuty/AlarmInfo) {#api-onduty-get-alarm-info}

Для хоть раз подтвержденных тревог по объекту пользователя.

**URL** : `/api/OnDuty/AlarmInfo`

**Метод** : `GET`

#### Входные параметры
\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{lllX}
\textbf{Значение} & \textbf{Способ передачи} & \textbf{Тип данных} & \textbf{Описание} \\ \midrule
%Тест комментария
Token & FromUri & string & Токен. Получен вызовом метода /Auth. \\ \arrayrulecolor{light-gray}\hline
AlarmIndex & FromBody & long (Int64) & Индекс тревоги. Получен вызовом метода /ConfirmedAlarms. \\
\bottomrule
\end{tabularx}

#### Выходные данные
\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Параметр} & \textbf{Тип данных} & \textbf{Описание} \\ \midrule
AlarmStatus & string & Состояние тревоги. Возможные значения: см. ниже. \\ \arrayrulecolor{light-gray}\hline
Alarms & ConfirmedAlarms & Список группы тревог (структуру описания см. ниже). \\ \arrayrulecolor{light-gray}\hline
AlarmActions & AlarmActions & Список выполненных действий (структуру см. ниже). \\ \arrayrulecolor{light-gray}\hline
AllowedActions & AllowedActions & Список разрешенных действий (структуру см. ниже). \\
\bottomrule
\end{tabularx}

**ConfirmedAlarms** - описание тревоги
\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Параметр} & \textbf{Тип данных} & \textbf{Описание} \\ \midrule
RChannelName & string & Мнемоническое название и номер канала связи. \\ \arrayrulecolor{light-gray}\hline
DateTime & string & Дата и время формирования события. \\ \arrayrulecolor{light-gray}\hline
EventCode & string & Код события. \\ \arrayrulecolor{light-gray}\hline
EventClassName & string & Название класса события. \\ \arrayrulecolor{light-gray}\hline
EventClassType & string & Псевдоним названия типа класса события. Возможные значения:  см. ниже. \\ \arrayrulecolor{light-gray}\hline
EventDesc & string & Описание события. \\ \arrayrulecolor{light-gray}\hline
PartNumber & number & Номер раздела, по которому сформировано событие. \\ \arrayrulecolor{light-gray}\hline
ZoneUser & number & Номер зоны или пользователя. \\ \arrayrulecolor{light-gray}\hline
SaveDateTime & string & Дата и время сохранения события в базе данных «Центра охраны». \\
\bottomrule
\end{tabularx}

**AlarmActions** - описание выполненного действия
\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Параметр} & \textbf{Тип данных} & \textbf{Описание} \\ \midrule
DateTime & string & Дата и время действия. \\ \arrayrulecolor{light-gray}\hline
UserName & string & Имя пользователя. \\ \arrayrulecolor{light-gray}\hline
ActionGUID & string & Идентификатор действия. \\ \arrayrulecolor{light-gray}\hline
ActionName & string & Действие. \\ \arrayrulecolor{light-gray}\hline
ActionType & string & Псевдоним названия типа действия. Возможные значения: см. ниже. \\ \arrayrulecolor{light-gray}\hline
GuardName & string & Название группы. \\ \arrayrulecolor{light-gray}\hline
GuardGUID & string & Идентификатор группы. \\ \arrayrulecolor{light-gray}\hline
Comment & string & Комментарий. \\
\bottomrule
\end{tabularx}


**AllowedActions** - описание разрешенного действия
\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Параметр} & \textbf{Тип данных} & \textbf{Описание} \\ \midrule
ActionName & string & Действие. \\ \arrayrulecolor{light-gray}\hline
ActionType & string & Псевдоним названия типа действия. Возможные значения: см. ниже. \\ \arrayrulecolor{light-gray}\hline
ActionGUID & string & Идентификатор действия. Нужен для метода /AlarmAction. \\
\bottomrule
\end{tabularx}

Значения поля **AlarmStatus** - псевдоним состояния тревоги.

Соответствие значений псевдонима состояниям тревоги:

\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{lX}
\textbf{Псевдоним} & \textbf{Состояние тревоги} \\ \midrule
Confirmed & Тревога подтверждена \\ \arrayrulecolor{light-gray}\hline
EndConfirmed & Завершено подтверждение тревоги \\ \arrayrulecolor{light-gray}\hline
Canceled & Тревога отменена \\
\bottomrule
\end{tabularx}

Значения поля **EventClassType** - псевдоним типа класса события.

Соответствие значений псевдонима типам классов событий:

\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{lX}
\textbf{Псевдоним} & \textbf{Название типа класса события} \\ \midrule
Alarm & Тревога \\ \arrayrulecolor{light-gray}\hline
Reset & Сброс \\ \arrayrulecolor{light-gray}\hline
Fault & Неисправность \\ \arrayrulecolor{light-gray}\hline
Restore & Восстановление \\ \arrayrulecolor{light-gray}\hline
Arm & Взятие под охрану \\ \arrayrulecolor{light-gray}\hline
Disarm & Снятие с охраны \\ \arrayrulecolor{light-gray}\hline
ByPass & Исключение \\ \arrayrulecolor{light-gray}\hline
Warning & Предупреждение \\ \arrayrulecolor{light-gray}\hline
Test & Тест \\ \arrayrulecolor{light-gray}\hline
Other & Другое \\
\bottomrule
\end{tabularx}

Значения поля **ActionType** - псевдоним типа действия.

Соответствия значений псевдонима названиям типа действия:

\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{lX}
\textbf{Псевдоним} & \textbf{Название типа действия} \\ \midrule
SendGuard & Вызов группы \\ \arrayrulecolor{light-gray}\hline
ArriveGuard & Прибытие группы \\ \arrayrulecolor{light-gray}\hline
CancelGuard & Отмена вызова группы \\ \arrayrulecolor{light-gray}\hline
UserComment & Комментарий оператора \\ \arrayrulecolor{light-gray}\hline
ReclosingRequest & Требуется перезакрытие \\ \arrayrulecolor{light-gray}\hline
ReclosingFailure & Отказ от перезакрытия \\ \arrayrulecolor{light-gray}\hline
ReclosingRequestSMS & Отправлено SMS с требованием о перезакрытии \\ \arrayrulecolor{light-gray}\hline
PhonographCall & Автоматизированный звонок \\ \arrayrulecolor{light-gray}\hline
Other & Другое \\ \arrayrulecolor{light-gray}\hline
CancelAlarm & Отмена тревоги \\ \arrayrulecolor{light-gray}\hline
ConfirmAlarm & Подтверждение тревоги \\ \arrayrulecolor{light-gray}\hline
EndConfirmedAlarm & Завершение подтвержденной тревоги \\
\bottomrule
\end{tabularx}

#### Ошибки HTTP 400
Нет такого AlarmIndex'а или тревога не была подтвержденной

#### Пример использования
```bash
curl --request GET\
   --url ’http://10.7.22.128:9002/api/api/OnDuty/AlarmInfo?Token=524bf1a576ce43a79ed556291750933c’ \
   --data ’{ "AlarmIndex": 2020030310245145 }’

Ответ:

[{
    “AlarmStatus“: ”Confirmed”,
    “ConfirmedAlarms”:
    [
        {
            "RChannelName": "Sms3",
            "DateTime": "2019-03-19T15:08:57.41",
            "EventCode": "E151",
            "EventClassName": "Тревога",
            "EventClassType": "alarm",
            "EventDesc": "Утечка газа. ",
            "PartNumber": 0,
            "ZoneUser": 3,
            "SaveDateTime": "2020-03-19T15:08:57.57"
        },
        {
            "RChannelName": "Gprs4",
            "DateTime": "2020-03-19T15:08:58.49",
            "EventCode": "E136",
            "EventClassName": "Тревога",
            "EventClassType": "alarm",
            "EventDesc": "Снаружи. ",
            "PartNumber": 0,
            "ZoneUser": 2,
            "SaveDateTime": "2019-03-19T15:08:58.9"
        }
    ]
    “AlarmActions”:
    [
        {
            "DateTime": "2019-02-17T12:22:38.12",
            "UserName": "Петров",
            “ActionGUID“: “DD6F345A-02B0-479E-8E71-49EF619730E4“,
            "ActionName": "Вызов полиции",
            "ActionType": "Other",
            "Comment": "Запасной выход"
        }
    ]
    “AllowedActions”:
    [
        {
            "ActionName": "Вызов группы",
            "ActionType": "SendGuard",
            “ActionGUID“: “BD87E4F7-CF90-4F5D-A192-C5ED8B501733“
        },
        {
            "ActionName": "Звонок на объект",
            "ActionType": "Other",
            “ActionGUID“: “BD87E4F7-CF90-4F5D-A192-C5ED8B501733“
        },
        {
            "ActionName": "Комментарий оператора",
            "ActionType": "Other",
            “ActionGUID“: “D627BC89-72A4-4242-9131-5C7C1EB5BD76“
        },
        {
            "ActionName": "Завершение подтвержденной тревоги",
            "ActionType": "EndConfirmedAlarm",
            “ActionGUID“: “466FA345-270B-49C9-8021-B35CE5462A4F“
        },
        {
            "ActionName": "Отмена тревоги",
            "ActionType": "CancelAlarm",
            “ActionGUID“: “30A015EE-CE2B-4522-A183-CE93ABE048B6“
        }
    ]
}]
```

## Получить описание объекта (GET /api/OnDuty/Object){#api-onduty-get-object}


**URL** : `/api/OnDuty/Object`

**Метод** : `GET`

#### Входные параметры
\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{lllX}
\textbf{Значение} & \textbf{Способ передачи} & \textbf{Тип данных} & \textbf{Описание} \\ \midrule
Token & FromUri & string & Токен. Получен вызовом метода /Auth. \\ \arrayrulecolor{light-gray}\hline
ObjectGUID & FromBody & string & Идентификатор объекта. Получен вызовом метода /ConfirmedAlarms. \\
\bottomrule
\end{tabularx}

#### Выходные данные
\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Параметр} & \textbf{Тип данных} & \textbf{Описание} \\ \midrule

AccountNumber & number & Номер объекта (почти всегда совпадает с номером, запрограммированным в контрольную панель, установленную на объекте). \\ \arrayrulecolor{light-gray}\hline
Name & string & Название объекта. \\ \arrayrulecolor{light-gray}\hline
ObjectPassword & string & Пароль. \\ \arrayrulecolor{light-gray}\hline
Address & string & Адрес объекта. \\ \arrayrulecolor{light-gray}\hline
Phone1 & string & Телефон 1. \\ \arrayrulecolor{light-gray}\hline
Phone2 & string & Телефон 2. \\ \arrayrulecolor{light-gray}\hline
TypeName & string & Название типа объекта. \\ \arrayrulecolor{light-gray}\hline
IsFire & boolean & Флаг наличия пожарной сигнализации на объекте. \\ \arrayrulecolor{light-gray}\hline
IsArm & boolean & Флаг наличия охранной сигнализации на объекте. \\ \arrayrulecolor{light-gray}\hline
IsPanic & boolean & Флаг наличия тревожной кнопки на объекте. \\ \arrayrulecolor{light-gray}\hline
DeviceTypeName & string & Псевдоним типа оборудования на объекте. Возможные значения: см. ниже. \\ \arrayrulecolor{light-gray}\hline
EventTemplateName & string & Название шаблона события объекта. \\ \arrayrulecolor{light-gray}\hline
ContractNumber & string & Номер договора. \\ \arrayrulecolor{light-gray}\hline
ContractPrice & number & Сумма ежемесячного платежа по договору. Отображается в приложении MyAlarm. \\ \arrayrulecolor{light-gray}\hline
MoneyBalance & number & Баланс лицевого счёта. Отображается в приложении MyAlarm. \\ \arrayrulecolor{light-gray}\hline
PaymentDate & string & Дата ближайшего списания средств. Отображается в приложении MyAlarm. \\ \arrayrulecolor{light-gray}\hline
DebtInformLevel & number & Уровень информирования клиента о состоянии услуг охраны. Отображается в приложении MyAlarm. Возможные значения: см. ниже. \\ \arrayrulecolor{light-gray}\hline
Disabled & boolean & Флаг: объект отключён. \\ \arrayrulecolor{light-gray}\hline
DisabledReason & number & Код: причина отключения объекта (не используется). \\ \arrayrulecolor{light-gray}\hline
DisableDate & string & Дата отключения объекта. \\ \arrayrulecolor{light-gray}\hline
AutoEnable & boolean & Флаг: необходимо автоматически включить объект. \\ \arrayrulecolor{light-gray}\hline
AutoEnableDate & string & Дата автоматического включения объекта. Имеет значение только в том случае, если поле "AutoEnable" установлено в значение "True". \\ \arrayrulecolor{light-gray}\hline
CustomersComment & string & Комментарий к списку ответственных. \\ \arrayrulecolor{light-gray}\hline
CommentForOperator & string & Комментарий для оператора. \\ \arrayrulecolor{light-gray}\hline
CommentForGuard & string & Комментарий для ГБР. \\ \arrayrulecolor{light-gray}\hline
MapFileName & string & Путь к файлу с картой объекта. \\ \arrayrulecolor{light-gray}\hline
WebLink & string & Web-ссылка: ссылка на ресурс с дополнительной информацией об объекте. \\ \arrayrulecolor{light-gray}\hline
ControlTime & number & Общее контрольное время (мин.). \\ \arrayrulecolor{light-gray}\hline
CTIgnoreSystemEvent & boolean & Игнорировать системные события. \\ \arrayrulecolor{light-gray}\hline
IsStateArm & bool? & Взят/снят/неизвестно. \\ \arrayrulecolor{light-gray}\hline
IsStateAlarm & bool? & Объект в тревоге - да/нет/неизвестно. \\ \arrayrulecolor{light-gray}\hline
IsStatePartArm & bool? & Частично - да/нет/неизвестно. \\ \arrayrulecolor{light-gray}\hline
StateArmDisArmDateTime & DateTime? & Время последнего взятия / снятия. \\
\bottomrule
\end{tabularx}

Значения поля **DeviceTypeName** - псевдоним типа оборудования на объекте.

Соответствия значений псевдонима и названий типа оборудования:

\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{lX}
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

Значения поля **DebtInformLevel** - уровень информирования клиента о состоянии услуг охраны. 

Возможные значения:
\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{cX}
\textbf{Значение} & \textbf{Описание} \\ \midrule
-1 & Не отображать информацию в MyAlarm \\ \arrayrulecolor{light-gray}\hline
0 & Нет задолженности \\ \arrayrulecolor{light-gray}\hline
1 & Информировать о необходимости оплаты \\ \arrayrulecolor{light-gray}\hline
2 & Предупреждать о наличии задолженности \\ \arrayrulecolor{light-gray}\hline
3 & Запретить взятие под охрану и ограничить функции MyAlarm \\
\bottomrule
\end{tabularx}

#### Ошибки HTTP 400
Нет такого объекта или объект не принадлежит региону пользователя

#### Пример использования
```bash
curl --request GET \
   --url ’http://10.7.22.128:9002/api/api/OnDuty/Object?Token=524bf1a576ce43a79ed556291750933c’ \
   --data ’{ "ObjectGUID": "fd2cdaae-585e-44a3-804e-a24537f6de7a” }’

Ответ:

[{
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
}]
```

## Получить события с объекта (GET /api/OnDuty/Events){#api-onduty-get-events}

**URL** : `/api/OnDuty/Events`

**Метод** : `GET`

#### Входные параметры
\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{lllX}
\textbf{Значение} & \textbf{Способ передачи} & \textbf{Тип данных} & \textbf{Описание} \\ \midrule
Token & FromUri & string & Токен. Получен вызовом метода /Auth. \\ \arrayrulecolor{light-gray}\hline
ObjectGUID & FromBody & string & Идентификатор объекта. Получен вызовом метода /ConfirmedAlarms. \\ \arrayrulecolor{light-gray}\hline
startFrom & FromBody & number & С какого по счету элемента возвращать данные. Если не указано - возвращается начиная с первого. \\ \arrayrulecolor{light-gray}\hline
pageSize & FromBody & number & Размер страницы для вывода данных. Если не указано - то используется размер страницы из конфигурационного файла. \\
\bottomrule
\end{tabularx}

#### Выходные данные
\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Параметр} & \textbf{Тип данных} & \textbf{Описание} \\ \midrule
AlarmIndex & long (Int64) & Индекс группы тревог, к которому относится событие. \\ \arrayrulecolor{light-gray}\hline
RChannelName & string & Мнемоническое название и номер канала связи. \\ \arrayrulecolor{light-gray}\hline
DateTime & string & Дата и время формирования события. \\ \arrayrulecolor{light-gray}\hline
EventCode & string & Код события. \\ \arrayrulecolor{light-gray}\hline
EventClassName & string & Название класса события. \\ \arrayrulecolor{light-gray}\hline
EventClassType & string & Псевдоним названия типа класса события. Возможные значения: см. ниже. \\ \arrayrulecolor{light-gray}\hline
EventDesc & string & Описание события. \\ \arrayrulecolor{light-gray}\hline
PartNumber & number & Номер раздела, по которому сформировано событие. \\ \arrayrulecolor{light-gray}\hline
ZoneUser & number & Номер зоны или пользователя. \\ \arrayrulecolor{light-gray}\hline
SaveDateTime & string & Дата и время сохранения события в базе данных «Центра охраны». \\
\bottomrule
\end{tabularx}

Значения поля **EventClassType** - псевдоним типа класса события.

Соответствия значений псевдонима названию типа класса события:

\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{lX}
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

> Тип класса события, указывается в модуле «Настройка системы», на вкладке «Классы событий».

#### Ошибки HTTP 400
Нет такого объекта или объект не принадлежит региону пользователя

#### Пример использования
```bash
curl --request GET \
   --url ’http://10.7.22.128:9002/api/api/OnDuty/Events?Token=524bf1a576ce43a79ed556291750933c’ \
   --data ’{ "ObjectGUID": "fd2cdaae-585e-44a3-804e-a24537f6de7a”, “startFrom“: 3 }’

Ответ:

[
    {
        "RowNumber": 3,
        "AlarmIndex": 2019021711525158,
        "RChannelName": "Gprs6",
        "DateTime": "2019-02-17T12:08:50.24",
        "EventCode": "E110",
        "EventClassName": "Пожар",
        "EventClassType": "alarm",
        "EventDesc": "Запасной выход",
        "PartNumber": 1,
        "ZoneUser": 1,
        "SaveDateTime": "2019-02-17T12:08:50.26"
    },
    {
        "RowNumber": 4,
        "AlarmIndex": 2020030310245145,
        "RChannelName": "Sms3",
        "DateTime": "2019-03-19T15:08:57.41",
        "EventCode": "E151",
        "EventClassName": "Тревога",
        "EventClassType": "alarm",
        "EventDesc": "Утечка газа. ",
        "PartNumber": 0,
        "ZoneUser": 3,
        "SaveDateTime": "2020-03-19T15:08:57.57"
    },
    {
        "RowNumber": 5,
        "AlarmIndex": 2020030310245145,
        "RChannelName": "Gprs4",
        "DateTime": "2020-03-19T15:08:58.49",
        "EventCode": "E136",
        "EventClassName": "Тревога",
        "EventClassType": "alarm",
        "EventDesc": "Снаружи. ",
        "PartNumber": 0,
        "ZoneUser": 2,
        "SaveDateTime": "2019-03-19T15:08:58.9"
    }
]
```

## Выполнить действие по тревоге \newline (PUT /api/OnDuty/AlarmAction){#api-onduty-put-alarm-action}

**URL** : `/api/OnDuty/AlarmAction`

**Метод** : `PUT`

#### Входные параметры
\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{lllX}
\textbf{Значение} & \textbf{Способ передачи} & \textbf{Тип данных} & \textbf{Описание} \\ \midrule
Token & FromUri & string & Токен. Получен вызовом метода /Auth. \\ \arrayrulecolor{light-gray}\hline
AlarmIndex & FromBody & long (Int64) & Индекс группы тревог, по которому выполняем действие. Получен вызовом метода /ConfirmedAlarms. \\ \arrayrulecolor{light-gray}\hline
ActionGUID & FromBody & string & Идентификатор действия. Получен вызовом метода /AlarmInfo. Одно из разрешенных действий (AllowedActions). \\ \arrayrulecolor{light-gray}\hline
GuardGUID & FromBody & string & Идентификатор группы. Получен вызовом метода /Guards. \\ \arrayrulecolor{light-gray}\hline
Comment & FromBody & string & Комментарий. \\
\bottomrule
\end{tabularx}

#### Ошибки HTTP 400
- Нет такого AlarmIndex'а
- Неправильный ActionGUID
- Нет такой группы
- При отмене тревоги по объекту есть работающая группа
- Группа вызвана на другой объект

#### Пример использования
```bash
curl --request PUT \
   --url ’http://10.7.22.128:9002/api/api/OnDuty/AlarmAction?Token=524bf1a576ce43a79ed556291750933c’ \
   --data ’{ "AlarmIndex": 2020030310245145, “ActionGUID“:”BD87E4F7-CF90-4F5D-A192-C5ED8B501733”, \
   “GuardGUID“:”C6800007-7F2B-4236-9E14-B1187A64E9DA”, “Comment“:”Вызов группы 1” }’
```

## Получить список ГБР для регионов пользователя \newline (GET /api/OnDuty/Guards) {#api-onduty-get-guards}

**URL** : `/api/OnDuty/Guards`

**Метод** : `GET`

#### Входные параметры
\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{lllX}
\textbf{Значение} & \textbf{Способ передачи} & \textbf{Тип данных} & \textbf{Описание} \\ \midrule
Token & FromUri & string & Токен. Получен вызовом метода /Auth. \\
\bottomrule
\end{tabularx}

#### Выходные данные
\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Параметр} & \textbf{Тип данных} & \textbf{Описание} \\ \midrule
GuardGUID & string & Идентификатор группы. Нужен для методов /AlarmAction, /GuardState. \\ \arrayrulecolor{light-gray}\hline
GuardName & string & Название группы. \\ \arrayrulecolor{light-gray}\hline
GuardDescription & string & Старший группы. \\ \arrayrulecolor{light-gray}\hline
GuardStatus & string & Псевдоним состояния группы. Возможные значения: см. ниже. \\ \arrayrulecolor{light-gray}\hline
ObjectGUID & string & Идентификатор объекта, на котором работает группа. Поле есть, если GuardStatus не “Ready”. \\
\bottomrule
\end{tabularx}

Значения поля **GuardStatus** - псевдоним состояния группы.

Соответствия значений псевдонима состоянию группы:

\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{lX}
\textbf{Псевдоним} & \textbf{Название типа класса события} \\ \midrule
Ready & Группа свободна \\ \arrayrulecolor{light-gray}\hline
Moving & Группа едет на объект \\ \arrayrulecolor{light-gray}\hline
OnObject & Группа находится на объекте \\
\bottomrule
\end{tabularx}

#### Пример использования
```bash
curl --request GET \
   --url ’http://10.7.22.128:9002/api/api/OnDuty/Guards?Token=524bf1a576ce43a79ed556291750933c’

Ответ:

[
    {
        “GuardGUID”: “C6800007-7F2B-4236-9E14-B1187A64E9DA“,
        “GuardName“: “Группа номер 1“,
        “GuardDescription“: “Сидоров И.А.“
        “GuardStatus“: Ready
    },
    {
        “GuardGUID”: “A722ECB6-6CF4-40E4-B98F-0C967A957CB8“,
        “GuardName“: “Группа номер 2“,
        “GuardDescription“: “Петров В.В.“
        “GuardStatus“: OnObject
        "ObjectGUID": "548de89a-8b93-4319-997d-8902d8fb2a8e"
    }
]
```

## Получить состояние группы \newline (GET /api/OnDuty/GuardState){#api-onduty-get-guard-state}

**URL** : `/api/OnDuty/GuardState`

**Метод** : `GET`

#### Входные параметры
\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{lllX}
\textbf{Значение} & \textbf{Способ передачи} & \textbf{Тип данных} & \textbf{Описание} \\ \midrule
Token & FromUri & string & Токен. Получен вызовом метода /Auth. \\
GuardGUID & FromBody & string & Идентификатор группы. Получен вызовом метода /Guards. \\
\bottomrule
\end{tabularx}

#### Выходные данные
\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Параметр} & \textbf{Тип данных} & \textbf{Описание} \\ \midrule
GuardGUID & string & Идентификатор группы. Нужен для методов /AlarmAction, /GuardState. \\ \arrayrulecolor{light-gray}\hline
GuardName & string & Название группы. \\ \arrayrulecolor{light-gray}\hline
GuardDescription & string & Старший группы. \\ \arrayrulecolor{light-gray}\hline
GuardStatus & string & Псевдоним состояния группы. Возможные значения: см. выше. \\ \arrayrulecolor{light-gray}\hline
ObjectGUID & string & Идентификатор объекта, на котором работает группа. Поле есть, если GuardStatus не “Ready”. \\
\bottomrule
\end{tabularx}

#### Ошибки HTTP 400
Нет такой группы

#### Пример использования
```bash
curl --request GET \
   --url ’http://10.7.22.128:9002/api/api/OnDuty/GuardState?Token=524bf1a576ce43a79ed556291750933c’
   --data ’{ "GuardGUID”: “A722ECB6-6CF4-40E4-B98F-0C967A957CB8” }’

Ответ:

[{
    “GuardName“: “Группа номер 2“,
    “GuardDescription“: “Петров В.В.“
    “GuardStatus“: OnObject
    "ObjectGUID": "548de89a-8b93-4319-997d-8902d8fb2a8e"
}]
```

# Порядок вызова методов{#api-onduty-call-order}
 
#### Авторизация
Использование API начинается с вызова метода /Auth с именем и паролем оператора Центра Охраны, под которым будет происходить текущий сеанс работы. В случае успешной авторизации метод вернет токен (пароль для текущего сеанса).

Этот токен будет использоваться для всех последующих вызовов методов текущего сеанса. “Время жизни“ токена ограничено 10-ю минутами после последнего успешного (без ошибки) вызова метода API.

Вся внешняя система может авторизоваться, как один оператор Центра Охраны, а можно авторизовать каждого оператора внешней системы индивидуально.

#### Получение подтвержденных тревог
Далее предполагается периодический вызов метода /ConfirmedAlarms для получения списка подтвержденных тревог (тревожных объектов). Метод возвращает пары идентификаторов объектов (ObjectGUID) и текущих индексов тревог (AlarmIndex) по ним.

#### Получение описание объекта
По идентификатору объекта (ObjectGUID) с помощью метода /Object можно получить информацию об объекте (карточку объекта). 

#### Получение событий объекта
По идентификатору объекта (ObjectGUID) с помощью метода /Events можно получить или обновить (только последние) информацию о событиях на объекте.

#### Получение информации о тревоге
По индексу тревоги (AlarmIndex) с помощью метода /AlarmInfo можно получить следующую информацию о тревоге:

- Текущее состояние тревоги (AlarmStatus)
- Список событий группы тревог (Alarms)
- Список действий выполненных по группе тревог (AlarmActions)
- Список действий разрешенных для данной группы тревог (AllowedActions)   

В случае “пропадания“ индекса тревоги из списка подтвержденных тревог этим методом, по текущему состоянию тревоги, можно определить причину - “Завершено подтверждение тревоги“ или “Тревога отменена“.

#### Получение списка ГБР
Для авторизованного оператора с помощью метода /Guards можно получить следующую информацию о доступных оператору группах быстрого реагирования:

- Идентификатор группы быстрого реагирования (GuardGUID)
- Название группы быстрого реагирования (GuardName)
- Старший группы быстрого реагирования (GuardDescription)
- Состояние группы быстрого реагирования на момент вызова метода (GuardStatus)
- Если группа быстрого реагирования “работает” на объекте дополнительно возвращается Идентификатор объекта (ObjectGUID)

#### Получение состояния группы
По идентификатору группы быстрого реагирования GuardGUID с помощью метода /GuardState можно получить аналогичную информацию для конкретной группы.

#### Выполнение действия по тревоге
С помощью метода /AlarmAction можно зарегистрировать (выполнить) действие оператора на объекте.

Может быть выполнено только действие из разрешенных для данной группы тревог (ActionGUID из AllowedActions), полученного из последнего вызова /AlarmInfo для этой тревоги. Если действие связано с использованием ГБР (ActionType или SendGuard или ArriveGuard или CancelGuard), GuardGUID получается из вызова метода /Guards.


# Описание возможных ошибок{#api-onduty-errors}

## Ошибка HTTP с кодом 401{#api-onduty-401-error}
Все запросы, кроме /Auth.

Токен не валиден. Либо неправильное значение, либо после последнего успешного (без ошибок) вызова метода API прошло более 10 минут. Теоретически возможна ситуация, когда во время работы в Центре Охраны сменились настройки авторизовавшегося пользователя. Требуется вызов метода /Auth для получения валидного токена.

## Ошибки HTTP с кодом 400{#api-onduty-400-error}

Если при выполнении запроса возникла ошибка с кодом 400, то в ответе будет и описание и код возникшей ошибки.
{ "Message": string, "SpResultCode": int }

Далее приведены предварительные описания ошибок. Окончательные описания и коды появятся после реализации.

#### Нет оператора с таким именем и паролем (/Auth)
В Центре Охраны нет Пользователя с заданными именем и паролем.

#### Нет такого AlarmIndex'а или тревога не была подтвержденной (/AlarmInfo)
Либо неправильное значение, либо в группе тревог с этим AlarmIndex'ом не было ни одного действия типа “Подтверждение тревоги“.

#### Нет такого объекта или объект не принадлежит региону пользователя (/Object и /Events)
Либо неправильное значение ObjectGUID, либо объект с таким ObjectGUID не принадлежит региону авторизованного пользователя.

#### Нет такого AlarmIndex'а (/AlarmAction)
Либо неправильное значение AlarmIndex, либо для тревоги с этим AlarmIndex’ом выполнены действия типа или “Отмена тревоги“ (CancelAlarm) или “Завершение подтвержденной тревоги” (EndConfirmedAlarm). Возможно какое-то из этих действий было выполнено на стороне Центра Охраны после последнего вызова /AlarmInfo. Требуется вызов метода /AlarmInfo для получения актуальной информации.

#### Неправильный ActionGUID (/AlarmAction)
Либо неправильное значение ActionGUID, либо действие с таким ActionGUID в данный момент недоступно. Возможно на стороне Центра Охраны после последнего вызова /AlarmInfo было выполнено какое-то действие, изменившее список разрешенных действий (AllowedActions). Требуется вызов метода /AlarmInfo для получения актуальной информации.

#### Нет такой группы (/GuardState и /AlarmAction)
Либо неправильное значение GuardGUID, либо группа с таким GuardGUID не привязана к региону пользователя или удалена. Требуется вызов метода /Guards для получения актуальной информации.

#### При отмене тревоги по объекту есть работающая группа (/AlarmAction).
Нельзя отменить тревогу по объекту, на котором работает группа быстрого реагирования. Требуется вызов методов /AlarmInfo и /GuardState для получения актуальной информации.

#### Группа вызвана на другой объект (/AlarmAction).
Нельзя выполнить действие с “работающей“ по другому объекту (другому AlarmIndex'у) группой реагирования. Требуется вызов метода /GuardState для получения актуальной информации.
 
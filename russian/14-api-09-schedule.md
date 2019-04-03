\pagebreak

# Расписание охраны объекта

Методы для управления расписанием охраны объекта: Получение, создание, изменение или удаление расписания объекта.

## Поля расписания охраны объекта {#api-schedule-json}

### Расписание охраны объекта

```json
{
    "ArmSchedule_EarlyArm" : boolean,
    "ArmSchedule_ControlArm" : boolean,
    "ArmSchedule_LaterArm" : boolean,
    "ArmSchedule_EarlyDisarm" : boolean,
    "ArmSchedule_ControlDisarm" : boolean,
    "ArmSchedule_LaterDisarm" : boolean,
    "ArmSchedule_Deviation" : number,
    "Intervals" : Interval[]
}
```

\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Название поля} & \textbf{Тип} & \textbf{Поле в карточке объекта; примечание} \\ \midrule

ArmSchedule\_EarlyArm & boolean & Контролировать ранне взятие под охрану объекта \\ \arrayrulecolor{light-gray}\hline
ArmSchedule\_ControlArm & boolean & Контролировать отсутствие взятия под охрану объекта \\ \arrayrulecolor{light-gray}\hline
ArmSchedule\_LaterArm & boolean & Контролировать позднее взятие под охрану объекта \\ \arrayrulecolor{light-gray}\hline
ArmSchedule\_EarlyDisarm & boolean & Контролировать раннее снятие с охраны объекта \\ \arrayrulecolor{light-gray}\hline
ArmSchedule\_ControlDisarm & boolean & Контролировать отсутствие снятия с охраны объекта \\ \arrayrulecolor{light-gray}\hline
ArmSchedule\_LaterDisarm & boolean & Контролировать позднее снятие с охраны объекта \\ \arrayrulecolor{light-gray}\hline
ArmSchedule\_Deviation & number & Отклонение расписания объекта \\ \arrayrulecolor{light-gray}\hline
Intervals & Interval[] & Интервалы расписания объекта \\

\bottomrule
\end{tabularx}

### Интервал расписания объекта (Interval)

```json
{
    "DayNumber" : number,
    "StartDT" : timespan,
    "StopDT" : timespan
}
```

\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Название поля} & \textbf{Тип} & \textbf{Поле в карточке объекта; примечание} \\ \midrule

DayNumber & number & День недели (от 1 до 7) \\ \arrayrulecolor{light-gray}\hline
StartDT & timespan & Начальное время \\ \arrayrulecolor{light-gray}\hline
StopDT & timespan & Конечное время \\

\bottomrule
\end{tabularx}

## Получить расписание охраны объекта (GET /api/SiteSchedule) {#api-schedule-get}

Метод предназначен для получения расписания охраны объекта.

**URL** : `/api/SiteSchedule`

**Метод** : `GET`

### Параметры

#### siteId

Обязательный параметр.

Идентификатор объекта, расписание охраны объекта, которого нужно получить. Соответствует полю `Id` элемента JSON с [полями объекта](#api-site-json).

#### userName

Необязательный параметр.

Имя пользователя, от имени которого выполняется операция.

### Возможные статусы ответов

`200`, `403` – cм. «[Статусы ответов](#api-status-codes)».

### Возвращаемые данные

При успешном выполнении метод возвращает в теле ответа элемент JSON с [полями расписания охраны объекта](#api-schedule-json).

### Пример использования

```bash
curl --request GET \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/SiteSchedule?siteId=082232F8-8B06-4F7A-ABCA-AFDCC5593283&`
        `userName=crm-Ivanova-A-A'
```

**Status:** `200`

```bash
{
    "ArmSchedule_EarlyArm" : false,
    "ArmSchedule_ControlArm" : false,
    "ArmSchedule_LaterArm" : false,
    "ArmSchedule_EarlyDisarm" : false,
    "ArmSchedule_ControlDisarm" : false,
    "ArmSchedule_LaterDisarm" : true,
    "ArmSchedule_Deviation" : 15,
    "Intervals" :
    [
        {
            "DayNumber" : 2,
            "StartDT" : "01:00",
            "StopDT" : "01:30"
        },
        {
            "DayNumber" : 1,
            "StartDT" : "01:00",
            "StopDT" : "01:30"
        },
        {
            "DayNumber" : 1,
            "StartDT" : "02:00",
            "StopDT" : "23:59:59"
        }
    ]
}
```

## Создать/изменить расписание охраны объекта (POST /api/SiteSchedule) {#api-schedule-update}

Метод предназначен для создания/изменения расписания охраны объекта.

**URL** : `/api/SiteSchedule`

**Метод** : `POST`

### Параметры

#### siteId

Обязательный параметр.

Идентификатор объекта, расписание охраны объекта, которого нужно получить. Соответствует полю `Id` элемента JSON с [полями объекта](#api-site-json).

#### userName

Необязательный параметр.

Имя пользователя, от имени которого выполняется операция.

### Тело запроса

В теле запроса должен быть передан элемент JSON с [полями расписания охраны объекта](#api-schedule-json), который нужно создать/изменить. При создании раздела обязательно указать только идентификатор объекта. Значения для всех остальных полей, можно не указывать: будет использовано значение по умолчанию.

Если расписание охраны объекта уже создано и отличается то оно будет перезаписано.

Если интервалы расписания охраны объекта пересекаются, то метод вернёт ошибку.

Для полей `StartDT`, `StopDT` допустим следующий формат строковых значений:

- "`HH:mm`";.
- "`HH:mm:ss`";.

где mm - минуты должны быть кратными 30, а ss - секунды всегда 00, за исключением последнего интервала за день, который может закончиться в 23:59:59

Поле `ArmSchedule_Deviation` может иметь значения 0, 5, 10, 15, 20, 25, 30.

### Возможные статусы ответов

`201`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

### Возвращаемые данные

При успешном выполнении метод возвращает в теле ответа элемент JSON с [полями расписания охраны объекта](#api-schedule-json) изменённого объекта.

Если при выполнении запроса возникла ошибка, то запрос вернет код 400 и описание возникшей ошибки в теле ответа – см. «[Код 400: описание ошибки](#api-code-400-result)»

### Пример использования

```bash
curl --request POST \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/SiteSchedule?siteId=082232F8-8B06-4F7A-ABCA-AFDCC5593283`
        `&userName=crm-Ivanova-A-A' \
  --data '{`
    `"ArmSchedule_EarlyArm" : false,`
    `"ArmSchedule_ControlArm" : false,`
    `"ArmSchedule_LaterArm" : false,`
    `"ArmSchedule_EarlyDisarm" : false,`
    `"ArmSchedule_ControlDisarm" : false,`
    `"ArmSchedule_LaterDisarm" : true,`
    `"ArmSchedule_Deviation" : 15,`
    `"Intervals" :`
    `[`
        `{`
            `"DayNumber" : 2,`
            `"StartDT" : "01:00",`
            `"StopDT" : "01:30"`
        `},`
        `{`
            `"DayNumber" : 1,`
            `"StartDT" : "01:00",`
            `"StopDT" : "01:30"`
        `},`
        `{`
            `"DayNumber" : 1,`
            `"StartDT" : "02:00",`
            `"StopDT" : "23:59:59"`
        `}`
    `]`
`}'
```

**Status** : `200`

```bash
{
    "ArmSchedule_EarlyArm" : false,
    "ArmSchedule_ControlArm" : false,
    "ArmSchedule_LaterArm" : false,
    "ArmSchedule_EarlyDisarm" : false,
    "ArmSchedule_ControlDisarm" : false,
    "ArmSchedule_LaterDisarm" : true,
    "ArmSchedule_Deviation" : 15,
    "Intervals" :
    [
        {
            "DayNumber" : 2,
            "StartDT" : "01:00",
            "StopDT" : "01:30"
        },
        {
            "DayNumber" : 1,
            "StartDT" : "01:00",
            "StopDT" : "01:30"
        },
        {
            "DayNumber" : 1,
            "StartDT" : "02:00",
            "StopDT" : "23:59:59"
        }
    ]
}
```

## Удалить расписание охраны объекта (DELETE /api/SiteSchedule) {#api-schedule-delete}

Метод предназначен для удаления расписания охраны объекта.

**URL** : `/api/SiteSchedule`

**Метод** : `DELETE`

### Параметры

#### siteId

Обязательный параметр.

Идентификатор объекта, расписание охраны объекта которого нужно удалить.

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
  --url 'http://10.7.22.128:9002/api/SiteSchedule?siteId=082232F8-8B06-4F7A-ABCA-AFDCC5593283&`
        `userName=crm-Ivanova-A-A'
```

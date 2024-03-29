\pagebreak

# Проверка КТС

## Начать проверку КТС (POST /api/CheckPanic) {#api-checkpanic-post}

Метод предназначен для запуска процедуры проверки КТС.

**URL** : `/api/CheckPanic`

**Метод** : `POST`

### Параметры

#### siteId

Обязательный параметр.

Идентификатор объекта, по которому нужно проверить КТС.

#### checkInterval

Необязательный параметр.

**Допустимый диапазон значений:** `[30, 180]`

Интервал в секундах, в течении которого будет продолжаться процедура проверки КТС. 

Если для параметра не задано значение, то будет использовано значение параметра [`DefaultCheckPanicInterval`](#api-settings-default-check-panic-interval), указанное в настройках службы «C.Nord HTTP-API Service».

Если для параметра задано значение, выходящее за пределы допустимого диапазона значений, то метод вернет ошибку (см. ниже).

#### stopOnEvent

Необязательный параметр.

Возможные значения: `True` / `False`.

Если для параметра задано значение `True`, то после получения первого же события о нажатии тревожной кнопки процедура проверки КТС будет прекращена, отсчет интервала, заданного параметром `checkInterval` будет прекрашен.

Если же для параметра задано значение `False`, то после получения первого события о нажатии тревожной кнопки, отсчет интервала, заданного параметром `checkInterval` будет продолжен и все события о нажатии тревожной кнопки, которые будут получены в течении этого интервала будут помечаться, как отключенные. Кроме того, повторный запуск процедуры проверки КТС для этого объекта будет возможен только после завершения отсчета этого интервала.

Если значение для параметра не задано, то будет использовано значение параметра [`DefaultCheckPanicStopOnEvent`](#api-settings-default-check-panic-stoponevent), указанное в настройках службы «C.Nord HTTP-API Service».

#### userName

Необязательный параметр.

Имя пользователя, от имени которого выполняется операция.

### Возможные статусы ответов

`200`, `403` – cм. «[Статусы ответов](#api-status-codes)».

### Возвращаемый результат

Результат проверки - в теле ответа, тип – `application/json`

```json
{
"Status": 200,
"Description": string,
"CheckPanicId": string
}
```

#### Status

Результат выполнения запроса, всегда равен 200.

#### Description

Результат запуска процедуры проверки КТС.

Возможные значения:

- `"has alarm"` – по объекту есть тревога, проверка КТС запрещена;
- `"already run"` – по объекту уже выполняется проверка КТС;
- `"success"` – проверка КТС начата;
- `"error"` - при выполнении запроса произошла ошибка;
- `"invalid checkInterval value"` – для параметра `checkInterval` задано значение, выходящее за пределы допустимого диапазона.

#### CheckPanicId

Идентификатор запущенной процедуры проверки КТС. Значение идентификатора необходимо использовать в качестве аргумента при вызове метода [`GET /api/CheckPanic`](#api-checkpanic-get).

### Пример использования

```bash
curl --request POST \
--header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
--url 'http://10.0.0.2:9002/api/CheckPanic?`
      `siteId=ae59ad78-6341-44dc-adb8-4803b7f02412&`
      `userName=automatic_panic_checker'
```

```json
{
    "Status": 200,
    "Description": "success",
    "CheckPanicId": "5b42d9f1-52f3-4144-9a4f-bd047c60e115"
}
```

## Получить результат проверки КТС \newline (GET /api/CheckPanic) {#api-checkpanic-get}

Метод предназначен для получения результата процедуры проверки КТС.

**URL** : `/api/CheckPanic`

**Метод** : `GET`

### Параметры

#### checkPanicId

Обязательный параметр.

Идентификатор процеудры проверки, для которой нужно получить результат. Идентификатор возвращается в результате вызова метода [`POST /api/CheckPanic`](#api-checkpanic-post).

#### userName

Необязательный параметр.

Имя пользователя, от имени которого выполняется операция.

### Возможные статусы ответов

`200`, `403` – cм. «[Статусы ответов](#api-status-codes)».

### Возвращаемые результаты

Результат проверки - в теле ответа, тип – `application/json`

```json
{
    "Status": 200,
    "Description": string
}
```

#### Status

Результат выполнения запроса, всегда равен 200.

#### Description

Результат выполнения процедуры проверки КТС.

Возможные значения:

- `"not found"` – проверка с указанным идентификатором не найдена;
- `"in progress"` – проверка с указанным идентификатором продолжается (не завершена): КТС не получена, тайм-аут не истек;
- `"success"` – проверка с указанным идентификатором успешно завершена;
- `"success, interval continues"` – проверка с указанным идентификатором успешно завершена, но продолжается отсчет интервала проверки;
- `"time out"` – проверка с указанным идентификатором завершена с ошибкой: истек интервал ожидания события КТС;
- `"error"` - при выполнении запроса произошла ошибка.

Максимальная продолжительность хранения информации о запущенной проверке КТС составляет 4 минуты (240 секунд) с момента начала проверки.

### Пример использования

```bash
curl --request GET \
    --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
    --url 'http://10.0.0.2:9002/api/CheckPanic?`
          `checkPanicId=5b42d9f1-52f3-4144-9a4f-bd047c60e115&`
          `userName=automatic_panic_checker'
```

```json
{
    "Status": 200,
    "Description": "in progress",
}
```

# Общая информация

В документе описаны методы API, предоставялемые службой «C.Nord HTTP-API Service», являющейся частью программного обеспечения «Центр охраны».
API организован в виде REST-сервисов, описание ресурсов и методов доступа к ним дано в последующих разделах.

## Ограничение доступа

Для доступа к методам API в заголовке каждого запроса должен присутствовать параметр «apiKey» со значением, равным ключу безопасности сервиса «C.Nord HTTP-API Service», например: `apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c`. Если ключ доступа не соответствует установленному, то методы будут возвращать код 403 (cм. «[Статусы ответов](#api-status-codes)»).

## Настройки службы «C.Nord HTTP-API Service»

Параметры службы задаются в конфигурационном файле `CNord.WebApi.Service.exe.config`, расположенном в папке установки «Центра охраны». Файл в формате XML, настройки службы находятся в разделе `CNord.WebApi.ApiSettings`. Для изменения значения параметра необходимо изменить значение элемента «value» соответствующего элемента setting.

### Url

Протокол, локальный адрес и порт, используя которые служба будет принимать запросы.

**Значение по умолчанию:** `http://*:9200`

### ExternalUrl

Внешний адрес, по которому к службе обращаются клиенты. От этого адреса строятся адреса в предоставляемых пользователям ссылках. Может не совпадать с локальным адресом (Url) если служба расположена за реверс-прокси.

**Значение по умолчанию:** `http://*:9200`

### Encoding

Название кодировки транспортного файла. Возможные значения:

* UTF-8;
* Unicode;
* Windows-1251.

**Значение по умолчанию:** `UTF-8`

### TransportFileCheckInterval

Интервал проверки наличия нового транспортного файла, в формате hh:mm:ss. Не может быть задано менее 10 секунд.

**Значение по умолчанию:** `00:10:00`

### CheckTransportFileOnStartup

Проверять ли наличие нового транспортного файла сразу при старте сервиса или ожидать истечения интервала (True/False)

**Значение по умолчанию:** `True`

### TransportFilePath

Полный путь к транспортному файлу. Если указывать относительный, то адрес будет проверяться от рабочей папки сервиса, которая находится в системной папке Windows.

**Значение по умолчанию:** `sc-api-tf.csv`

### TransportFileCheckerTempFile

Путь к временному файлу для хранения данных о последнем загруженном транспортном файле (используется для проверки наличия изменений в новой версии файла). При отсутствии файла он создается (если есть права создания по указанному пути). Рекомендуется указывать полный путь. Если указывать относительный путь, то адрес будет проверяться от рабочей папки сервиса, которая находится в системной папке Windows.

**Значение по умолчанию:** `workdb`

### ApiKey {#api-setting-api-key}

Ключ безопасности службы, который должен передаваться в заголовке любого запроса. Допустимое значение - произвольная строка. Если указано пустое значение, то обработка запросов будет отключена.

**Значение по умолчанию:** не задано (пустое)

### DefaultPageSize {#api-settings-default-page-size}

Размер страницы списка объектов, используемый по умолчанию (если клиент не передал в метод [`GET /api/Sites`](#api-sites-get-list) значение для параметра `pageSize`).

**Значение по умолчанию:** `100`

### EnableSwaggerUI

Включить или выключить возможность просмотра интерактивной документации по методам API – при открытии адреса сервис в браузере можно просмотреть доступные ресурсы и их методы, а так же провести вызовы операций. Доступные значения: True/False. Если параметр не указан, то просмотр документации доступен.

**Значение по умолчанию:** `False`

## Общий вид запросов

Методы API доступны посредством HTTP-запросов по URL вида:

`http://<хост>:<порт>/api/<methodName>`

Например:

`http://10.7.22.128:9002/api/Sites`

Если метод API требует передать параметры в теле запроса, то параметры должны передаваться в формате JSON.

Если метод API возвращает результат в теле ответа, то результат также возвращается в формате JSON.

## Ключ безопасности

В заголовке HTTP-запроса к _любому_ методу API должно быть указано значение параметра [`apiKey`](#api-setting-api-key), которое должно совпадать со значением одноименного параметра в настройках службы.

Если значение для параметра `apiKey` не задано или указано неверно, вызов любого метода API приведет к ошибке со статусом `403`.

## Статусы ответов {#api-status-codes}

Коды, приведенные в таблице ниже, соответсвуют кодам статуса протокола HTTP (HTTP Status Codes).

\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{lX}
\textbf{Код} & \textbf{Описание} \\ \midrule

200 & Запрос успешно выполнен \\ \arrayrulecolor{light-gray}\hline
201 & Запрос на создание новой сущности успешно выполнен \\ \arrayrulecolor{light-gray}\hline
400 & Ошибка при выполнении запроса. Подробное описание – в результате (см. ниже). \\ \arrayrulecolor{light-gray}\hline
403 & Доступ запрещен (отсутсвует или указан неправильный ключ безопасности) \\ \arrayrulecolor{light-gray}

\bottomrule
\end{tabularx}

## Код 400: описание ошибки {#api-code-400-result}

Если при выполнении запроса возникла ошибка с кодом 400, то в ответе будет и описание возникшей ошибки. Тип – `application/json`.

```json
{
    "Message": string,
    "SpResultCode": int
}
```

### Message

Текстовая строка с описанием возникшей ошибки.

### SpResultCode

Внутренний код ошибки. В большинстве случаев соответствует описанию ошибки.
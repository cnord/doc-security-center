\pagebreak

# Управление открытыми коллекторами 

Методы для получения состояния и управления открытыми коллекторами

## Возможные коды ошибок {#api-open-collector-errors-json}

\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Код} & \textbf{Сообщение} & \textbf{Примечание} \\ \midrule

1 & Device is not connected & Прибор не подключён к центру охраны \\ \arrayrulecolor{light-gray}\hline
2 & Device did not respond & Нет квитанции на команду \\ \arrayrulecolor{light-gray}\hline
3 & Invalid command format & Не верный формат команды, ошибка разбора параметров или др. ошибка \\ \arrayrulecolor{light-gray}\hline
10 & There was not enough space in the buffer to send & Не хватило места в буфере на отправку \\ \arrayrulecolor{light-gray}\hline
11 & The open collector cannot be managed because it is disabled or has a role assigned to it & Открытым коллектором нельзя управлять, так как он отключён или на него назначена роль \\ \arrayrulecolor{light-gray}\hline
12 & There is no space in the queue of actions to manage collectors & В очереди действий на управление коллекторами нет места \\ \arrayrulecolor{light-gray}\hline
13 & Parameter value error when it is not within the range of valid values & Ошибка значения параметра, когда оно не попало в диапазон допустимых значений \\ \arrayrulecolor{light-gray}\hline
14 & Open collector cannot be controlled as there is no communication with it & Открытым коллектором нельзя управлять, так как с ним нет связи \\ \arrayrulecolor{light-gray}\hline
9 & The site has more than a one partition & В качестве номера раздела был передан 0, а на объекте сконфигурирован больше, чем 1 раздел \\

\bottomrule
\end{tabularx}

## Получить состояние открытых коллекторов (GET /api/OpenCollectors/OcStates)

Метод предназначен для получения состояния открытых коллекторов

**URL** : `/api/OpenCollectors/OcStates`

**Метод** : `GET`

### Параметры

#### id

Обязательный параметр.

Идентификатор объекта, состояния открытых коллекторов которого должен вернуть метод.

#### code

Не обязательный параметр.

Код пользователя.

### Возможные статусы ответов

`200`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

### Возвращаемые данные

При успешном выполнении метод не возвращает данных. Если при выполнении запроса возникла ошибка, то запрос вернет код 400 и описание возникшей ошибки в ответе – см. «[Код 400: описание ошибки](#api-code-400-result)»

Коды возможных ошибок см. «[Возможные коды ошибок](#api-open-collector-errors-json)»

### Пример использования

#### Успешная постановка
```bash
curl --request POST \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/Parts/Arm?id=524bf1a5-76ce-43a7-9ed5-56291750933f`
```

**Status** : `200`

#### Постановка с ошибкой "Прибор не подключён к центру охраны"

```bash
curl --request POST \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/Parts/Arm?id=524bf1a5-76ce-43a7-9ed5-56291750933f&code=1234`
```

**Status** : `400`

```json
{
    "SpResultCode": 1,
    "Message": "Device is not connected"
},
```

#### Постановка с ошибкой "Отказ от взятия"

```bash
curl --request POST \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/Parts/Arm?id=524bf1a5-76ce-43a7-9ed5-56291750933f&code=1234`
```

**Status** : `400`

```json
{
    "SpResultCode": 6,
    "Message": "Refusal of arming"
},
```

## Снять раздел с охраны (POST /api/Parts/Disarm)

Метод предназначен для снятия раздела с охраны

**URL** : `/api/Parts/Disarm`

**Метод** : `POST`

### Параметры

#### id

Обязательный параметр.

Идентификатор раздела, который нужно снять с охраны. Соответствует полю `Id` элемента JSON с [полями раздела](#api-part-json).

#### code

Не обязательный параметр.

Код пользователя.

### Возможные статусы ответов

`200`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

### Возвращаемые данные

При успешном выполнении метод не возвращает данных. Если при выполнении запроса возникла ошибка, то запрос вернет код 400 и описание возникшей ошибки в ответе – см. «[Код 400: описание ошибки](#api-code-400-result)»

Коды возможных ошибок см. «[Возможные коды ошибок](#api-arm-disarm-errors-json)»

### Пример использования

#### Успешное снятие

```bash
curl --request POST \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/Parts/Disarm?id=524bf1a5-76ce-43a7-9ed5-56291750933f`
```

**Status** : `200`

#### Снятие с ошибкой "Запрещена удаленная постановка/снятие"

```bash
curl --request POST \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/Parts/Disarm?id=524bf1a5-76ce-43a7-9ed5-56291750933f`
```

**Status** : `400`

```json
{
    "SpResultCode": 5,
    "Message": "Remote arming/disarming forbidden"
},
```

#### Снятие с ошибкой "Неверный код (пользователь с переданным кодом не найден)"

```bash
curl --request POST \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/Parts/Disarm?id=524bf1a5-76ce-43a7-9ed5-56291750933f&code=1234`
```

**Status** : `400`

```json
{
    "SpResultCode": 7,
    "Message": "Incorrect code"
},
```

## Взять объект под охрану (POST /api/Sites/Arm)

Метод предназначен для взятия объекта под охрану. Этим методом может быть поставлен на охрану только объект, не имеющий описанных разделов.

**URL** : `/api/Sites/Arm`

**Метод** : `POST`

### Параметры

#### id

Обязательный параметр.

Идентификатор объекта, который нужно взять под охрану. Соответствует полю `Id` элемента JSON с [полями объекта](#api-site-json).

#### code

Не обязательный параметр.

Код пользователя.

### Возможные статусы ответов

`200`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

### Возвращаемые данные

При успешном выполнении метод не возвращает данных. Если при выполнении запроса возникла ошибка, то запрос вернет код 400 и описание возникшей ошибки в ответе – см. «[Код 400: описание ошибки](#api-code-400-result)»

Коды возможных ошибок см. «[Возможные коды ошибок](#api-arm-disarm-errors-json)»

### Пример использования

#### Успешная постановка
```bash
curl --request POST \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/Sites/Arm?id=524bf1a5-76ce-43a7-9ed5-56291750933f`
```

**Status** : `200`

#### Постановка с ошибкой "Прибор не подключён к центру охраны"

```bash
curl --request POST \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/Sites/Arm?id=524bf1a5-76ce-43a7-9ed5-56291750933f&code=1234`
```

**Status** : `400`

```json
{
    "SpResultCode": 1,
    "Message": "Device is not connected"
},
```

#### Постановка с ошибкой "У объекта есть разделы"

```bash
curl --request POST \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/Sites/Arm?id=524bf1a5-76ce-43a7-9ed5-56291750933f&code=1234`
```

**Status** : `400`

```json
{
    "Message": "Object has parts"
},
```

## Снять объект с охраны (POST /api/Sites/Disarm)

Метод предназначен для снятия объекта с охраны. Этим методом может быть снят с охраны только объект, не имеющий описанных разделов.

**URL** : `/api/Sites/Disarm`

**Метод** : `POST`

### Параметры

#### id

Обязательный параметр.

Идентификатор объекта, который нужно взять под охрану. Соответствует полю `Id` элемента JSON с [полями объекта](#api-site-json).

#### code

Не обязательный параметр.

Код пользователя.

### Возможные статусы ответов

`200`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

### Возвращаемые данные

При успешном выполнении метод не возвращает данных. Если при выполнении запроса возникла ошибка, то запрос вернет код 400 и описание возникшей ошибки в ответе – см. «[Код 400: описание ошибки](#api-code-400-result)»

Коды возможных ошибок см. «[Возможные коды ошибок](#api-arm-disarm-errors-json)»

### Пример использования

#### Успешное снятие

```bash
curl --request POST \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/Sites/Disarm?id=524bf1a5-76ce-43a7-9ed5-56291750933f`
```

**Status** : `200`

#### Снятие с ошибкой "Запрещена удаленная постановка/снятие"

```bash
curl --request POST \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/Sites/Disarm?id=524bf1a5-76ce-43a7-9ed5-56291750933f`
```

**Status** : `400`

```json
{
    "SpResultCode": 5,
    "Message": "Remote arming/disarming forbidden"
},
```

#### Снятие с ошибкой "Неверный код (пользователь с переданным кодом не найден)"

```bash
curl --request POST \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/Sites/Disarm?id=524bf1a5-76ce-43a7-9ed5-56291750933f&code=1234`
```

**Status** : `400`

```json
{
    "SpResultCode": 7,
    "Message": "Incorrect code"
},
```
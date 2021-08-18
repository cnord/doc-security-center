\pagebreak

# Взятие/снятие 

Методы для постановки/снятия раздела с охраны

## Возможные коды ошибок {#api-arm-disarm-errors-json}

\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Код} & \textbf{Сообщение} & \textbf{Примечание} \\ \midrule

1 & Device is not connected & Прибор не подключён к центру охраны \\ \arrayrulecolor{light-gray}\hline
2 & Device did not respond & Нет квитанции на команду \\ \arrayrulecolor{light-gray}\hline
3 & Invalid command format & Не верный формат команды, ошибка разбора параметров или др. ошибка \\ \arrayrulecolor{light-gray}\hline
4 & The partition is already armed/disarmed & Раздел уже поставлен/снят, синхронизация БД \\ \arrayrulecolor{light-gray}\hline
5 & Remote arming/disarming forbidden & Запрещена удалённая постановка/снятие \\ \arrayrulecolor{light-gray}\hline
6 & Refusal of arming & Отказ от взятия \\ \arrayrulecolor{light-gray}\hline
7 & Incorrect code & Неверный код (пользователь с переданным кодом не найден) \\ \arrayrulecolor{light-gray}\hline
8 & The partition with number does not exist & Раздел с номером не существует или на объекте не сконфигурированы разделы \\ \arrayrulecolor{light-gray}\hline
9 & The site has more than a one partition & В качестве номера раздела был передан 0, а на объекте сконфигурирован больше, чем 1 раздел \\

\bottomrule
\end{tabularx}

## Взять раздел под охрану (POST /api/Parts/Arm)

Метод предназначен для взятия раздела или объекта без разделов под охрану

**URL** : `/api/Parts/Arm`

**Метод** : `POST`

### Параметры

#### id

Не обязательный параметр.

Идентификатор раздела, который нужно взять под охрану. Соответствует полю `Id` элемента JSON с [полями раздела](#api-part-json).

#### siteId

Не обязательный параметр.

Идентификатор объекта без разделов, который нужно взять под охрану. Соответствует полю `Id` элемента JSON с [полями объекта](#api-site-json).


Один из идентификаторов id или siteId обязательно должен быть задан.

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
  --url 'http://10.7.22.128:9002/api/Parts/Arm?id=524bf1a5-76ce-43a7-9ed5-56291750933f`
```

**Status** : `200`

#### Постановка с ошибкой "Прибор не подключён к центру охраны"

```bash
curl --request POST \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/Parts/Aarm?id=524bf1a5-76ce-43a7-9ed5-56291750933f&code=1234`
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

#### Постановка с ошибкой "У объекта есть разделы"

```bash
curl --request POST \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/Parts/Arm?siteId=524bf1a5-76ce-43a7-9ed5-56291750933f&code=1234`
```

**Status** : `400`

```json
{
    "Message": "Object has parts"
},
```

## Снять раздел с охраны (POST /api/Parts/Disarm)

Метод предназначен для снятия раздела с охраны

**URL** : `/api/Parts/Disarm`

**Метод** : `POST`

### Параметры

#### id

Не обязательный параметр.

Идентификатор раздела, который нужно снять с охраны. Соответствует полю `Id` элемента JSON с [полями раздела](#api-part-json).

#### siteId

Не обязательный параметр.

Идентификатор объекта без разделов, который нужно взять под охрану. Соответствует полю `Id` элемента JSON с [полями объекта](#api-site-json).


Один из идентификаторов id или siteId обязательно должен быть задан.

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

#### Снятие с ошибкой "У объекта есть разделы"

```bash
curl --request POST \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/Parts/Disarm?siteId=524bf1a5-76ce-43a7-9ed5-56291750933f&code=1234`
```

**Status** : `400`

```json
{
    "Message": "Object has parts"
},
```

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
11 & Open collector is disabled or assigned a role & Открытый коллектор отключён или ему назначена роль \\ \arrayrulecolor{light-gray}\hline
12 & There is no space in the action queue & В очереди действий нет места \\ \arrayrulecolor{light-gray}\hline
13 & Parameter value error & Ошибка значения параметра \\ \arrayrulecolor{light-gray}\hline
14 & No open collector connection & Нет связи с открытым коллектором \\ \arrayrulecolor{light-gray}\hline

\bottomrule
\end{tabularx}

## Получить состояние открытых коллекторов (GET /api/OpenCollectors/OcStates)

Метод предназначен для получения состояния открытых коллекторов

**URL** : `/api/OpenCollectors/OcStates`

**Метод** : `GET`

### Параметры

#### id

Обязательный параметр.

Идентификатор объекта, состояния открытых коллекторов которого должен вернуть метод. Соответствует полю `Id` элемента JSON с [полями объекта](#api-site-json).

#### userName

Необязательный параметр.

Имя пользователя, от имени которого выполняется операция.

### Тело запроса

В теле запроса, при необходимости, может быть передан объект json с полем.

#### OcNumbers

Необязательный параметр.

Список, через запятую, номеров коллекторов, информацию по которым необходимо получить. Максимальное количество коллекторов 20.

### Возможные статусы ответов

`200`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

### Возвращаемые данные

При успешном выполнении метод возвращает элемент JSON, содержащий состояние открытых коллекторов:

```json
{
    "ChangeTime": string,
    "OcStates": [
        {
            "Number": number,
            "State": string
        },
        ...
    ]
}
```

\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Название поля} & \textbf{Тип} & \textbf{Примечание} \\ \midrule

ChangeTime & string & Время получения \\ \arrayrulecolor{light-gray}\hline
Number & number & Номер коллектора из настроек \\ \arrayrulecolor{light-gray}\hline
State & string & Состояние коллектора («open» - коллектор разомкнут, «close» - коллектор замкнут, «no connection» - с коллектором нет связи) \\ \arrayrulecolor{light-gray}\hline

\bottomrule
\end{tabularx}

Если при выполнении запроса возникла ошибка, то запрос вернет код 400 и описание возникшей ошибки в ответе – см. «[Код 400: описание ошибки](#api-code-400-result)»

Коды возможных ошибок см. «[Возможные коды ошибок](#api-open-collector-errors-json)»

### Пример использования

#### Запрос получения состояния всех открытых коллекторов
```bash
curl --request GET \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/OpenCollectors/OcStates?id=524bf1a5-76ce-43a7-9ed5-56291750933f`
```

**Status** : `200`

```json
{
    "ChangeTime": "2000-01-01T03:43:34",
    "OcStates": [
        {
            "Number": 0,
            "State": "close"
        },
        {
            "Number": 1,
            "State": "open"
        },
        {
            "Number": 2,
            "State": "open"
        },
        {
            "Number": 3,
            "State": "open"
        }
    ]
}
```

#### Запрос получения состояния выбранных коллекторов

```bash
curl --request GET \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/OpenCollectors/OcStates?id=524bf1a5-76ce-43a7-9ed5-56291750933f`
  --data '{"OcNumbers": "0,2"}'
```

**Status** : `200`

```json
{
    "ChangeTime": "2000-01-01T03:43:37",
    "OcStates": [
        {
            "Number": 0,
            "State": "close"
        },
        {
            "Number": 2,
            "State": "open"
        }
    ]
}
```

## Установить состояние открытого коллектора (POST /api/OpenCollectors/OcSet)

Метод предназначен для установки состояния открытого коллектора

**URL** : `/api/OpenCollectors/OcSet`

**Метод** : `POST`

### Параметры

#### id

Обязательный параметр.

Идентификатор объекта, состояния открытых коллекторов которого должен установить метод. Соответствует полю `Id` элемента JSON с [полями объекта](#api-site-json).

#### userName

Необязательный параметр.

Имя пользователя, от имени которого выполняется операция.

### Тело запроса

В теле запроса, должен быть передан объект json с полями:

```json
{
    "Number": number,
    "Action": string,
    "Interval": number
}
```

\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Название поля} & \textbf{Тип} & \textbf{Примечание} \\ \midrule

Number & number & Номер коллектора из настроек \\ \arrayrulecolor{light-gray}\hline
Action & string & Требуемое действие («pulse» – замкнуть коллектор на время, «close» - замкнуть коллектор, «open» – разомкнуть коллектор) \\ \arrayrulecolor{light-gray}\hline
Interval & number & Время в миллисекундах, на которое следует замкнуть коллектор в случае, если параметр «Action» принимает значение «pulse». Для беспроводного открытого коллектора в качестве времени допустимо устанавливать только целое число секунд от 1 до 255. \\ \arrayrulecolor{light-gray}\hline

\bottomrule
\end{tabularx}

### Возможные статусы ответов

`200`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

### Возвращаемые данные

При успешном выполнении метод не возвращает данных. Если при выполнении запроса возникла ошибка, то запрос вернет код 400 и описание возникшей ошибки в ответе – см. «[Код 400: описание ошибки](#api-code-400-result)»

Коды возможных ошибок см. «[Возможные коды ошибок](#api-open-collector-errors-json)»

### Пример использования

#### Успешная установка

Установить 1-й коллектор на 2 секунды

```bash
curl --request POST \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/OpenCollectors/OcSet?id=524bf1a5-76ce-43a7-9ed5-56291750933f`
  --data '{"Number": 1, "Action":  "pulse", "Interval": 2000}'
```

**Status** : `200`

\pagebreak

# Открытые коллектора

Методы для управления открытыми коллекторами.

## Поля открытого коллектора {#api-opencollector-json}

Элементо JSON, содержащий все поля открытого коллектора:

```json
{
    "Number" : number,
    "State" : string,
    "Interval" : number
}
```

\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Название поля} & \textbf{Тип} & \textbf{Поле в карточке открытого коллектора; примечание} \\ \midrule

Number & number & Номер открытого коллектора \\ \arrayrulecolor{light-gray}\hline
State & string & Состояние выхода открытого коллектора, возможные значения: см. ниже \\ \arrayrulecolor{light-gray}\hline
Interval & number & Время в миллисекундах, на которое следует замкнуть выход (Задаётся при изменении состояния открытого коллектора, от 1 до 10000 при значении State=pulse, во всех остальных случаях Interval должен быть null) \\

\bottomrule
\end{tabularx}

### Значение поля State

\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{llX}
\textbf{Состояние} & \textbf{Описание} \\ \midrule

open & Замкнуть открытый коллектор \\ \arrayrulecolor{light-gray}\hline
close & Разомкнуть открытый коллектор \\ \arrayrulecolor{light-gray}\hline
pulse & Замкнуть открытый коллектор на заданный интервал времени \\

\bottomrule
\end{tabularx}

## Получить состояние выходов открытых коллекторов (GET /api/OpenCollectors)

Метод предназначен для получения состояния выходов открытых коллекторов устройства

**URL** : `/api/OpenCollectors`

**Метод** : `GET`

### Параметры

#### id

Обязательный параметр.

Идентификатор объекта, состояние коллекторов устройства которого нужно получить. Соответствует полю `Id` элемента JSON с [полями объекта](#api-site-json).

### Возможные статусы ответов

`200`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

### Возвращаемые данные

При успешном выполнении метод возвращает в теле ответа элемент JSON со списком [полей открытого коллектора](#api-opencollector-json) – с учетом изменений, которые произошли в результате выполнения запроса.

Если при выполнении запроса возникла ошибка, то запрос вернет код 400 и описание возникшей ошибки в теле ответа – см. «[Код 400: описание ошибки](#api-code-400-result)»

### Пример использования

```bash
curl --request PUT \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/OpenCollectors?id=524bf1a5-76ce-43a7-9ed5-56291750933f`
```

**Status** : `200`

```bash
[
    {
        "Number": 1
        "State": "open"
	},
    {
        "Number": 2
        "State": "close"
	},
    {
        "Number": 3
        "State": "pulse"
	}
    ...
]
```

## Установить состояние выхода открытого коллектора (POST /api/OpenCollectors)

**URL** : `/api/OpenCollectors`

**Метод** : `POST`

### Параметры

#### id

Обязательный параметр.

Идентификатор объекта, состояние коллектора устройства которого нужно изменить. Соответствует полю `Id` элемента JSON с [полями объекта](#api-site-json).

### Тело запроса

В теле запроса должен быть передан элемент JSON с [полями открытого коллектора](#api-opencollector-json), которые нужно изменить.

### Возможные статусы ответов

`200`, `400`, `403` – cм. «[Статусы ответов](#api-status-codes)».

### Пример использования

Закрыть коллектор

```bash
curl --request PUT \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/OpenCollectors?id=524bf1a5-76ce-43a7-9ed5-56291750933f` \
  --data '{ "Number": 1, "State": "close"}'
```

**Status** : `200`

Открыть коллектор на 5 секунд

```bash
curl --request PUT \
  --header 'apiKey: 41c66fd22dcf4742b65e9f5ea5ebde1c' \
  --url 'http://10.7.22.128:9002/api/OpenCollectors?id=524bf1a5-76ce-43a7-9ed5-56291750933f` \
  --data '{ "Number": 1, "State": "pulse", "Inderval": 5000}'
```

**Status** : `200`
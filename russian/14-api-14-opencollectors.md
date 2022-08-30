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
3 & Invalid command format & Неверный формат команды, ошибка разбора параметров или др. ошибка \\ \arrayrulecolor{light-gray}\hline
10 & There was not enough space in the buffer to send & Не хватило места в буфере на отправку \\ \arrayrulecolor{light-gray}\hline
11 & Open collector is disabled or assigned a role & Открытый коллектор отключён или ему назначена роль \\ \arrayrulecolor{light-gray}\hline
12 & There is no space in the action queue & В очереди действий нет места \\ \arrayrulecolor{light-gray}\hline
13 & Parameter value error & Ошибка значения параметра \\ \arrayrulecolor{light-gray}\hline
14 & No open collector connection & Нет связи с открытым коллектором \\ \arrayrulecolor{light-gray}\hline
15 & Transmitter ID not defined & Для объекта не определен ID передатчика \\

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
State & string & Состояние коллектора («open» - коллектор разомкнут, «close» - коллектор замкнут, «no connection» - с коллектором нет связи) \\

\bottomrule
\end{tabularx}

Возвращаются состояния только тех коллекторов, которые доступны для управления. Состояние коллектора, если он отключен или ему назначена роль в автоматике, не возвращается.

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
Interval & number & Время в миллисекундах, на которое замыкается коллектор в случае, если параметр «Action» принимает значение «pulse», допустимые значения от 1 до 255000. \\
 & & Для беспроводного открытого коллектора допустимо устанавливать только целое число секунд. \\
 & & Для беспроводных устройств типа «СН-Включатель» и «СН-Розетка» режим «pulse» не поддерживается. \\

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

## Нумерация выходов

#### Норд GSM B312 (18.1)
\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{clc}
\textbf{Номер в настройках} & \textbf{Название} & \textbf{Номер в событии} \\ \midrule

0 & OUT1 & 1 \\ \arrayrulecolor{light-gray}\hline
1 & OUT2 & 2 \\ \arrayrulecolor{light-gray}\hline
2 & OUT3 & 3 \\ \arrayrulecolor{light-gray}\hline
3 & OUT4 & 4 \\ \arrayrulecolor{light-gray}\hline
4 & EX81.1.Z1 & 5 \\ \arrayrulecolor{light-gray}\hline
5 & EX81.1.Z2 & 6 \\ \arrayrulecolor{light-gray}\hline
6 & EX81.1.Z3 & 7 \\ \arrayrulecolor{light-gray}\hline
7 & EX81.1.Z4 & 8 \\ \arrayrulecolor{light-gray}\hline
8 & EX81.1.Z5 & 9 \\ \arrayrulecolor{light-gray}\hline
9 & EX81.1.Z6 & 10 \\ \arrayrulecolor{light-gray}\hline
10 & EX81.2.Z1 & 11 \\ \arrayrulecolor{light-gray}\hline
... & ... & ... \\ \arrayrulecolor{light-gray}\hline
33 & EX81.5.Z6 & 34 \\

\bottomrule
\end{tabularx}


#### Норд GSM C312 (18.2)
\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{clc}
\textbf{Номер в настройках} & \textbf{Название} & \textbf{Номер в событии} \\ \midrule

0 & OUT1 & 1 \\ \arrayrulecolor{light-gray}\hline
1 & OUT2 & 2 \\ \arrayrulecolor{light-gray}\hline
2 & OUT3 & 3 \\ \arrayrulecolor{light-gray}\hline
3 & OUT4 & 4 \\ \arrayrulecolor{light-gray}\hline
4 & EX81.1.Z1 & 5 \\ \arrayrulecolor{light-gray}\hline
5 & EX81.1.Z2 & 6 \\ \arrayrulecolor{light-gray}\hline
6 & EX81.1.Z3 & 7 \\ \arrayrulecolor{light-gray}\hline
7 & EX81.1.Z4 & 8 \\ \arrayrulecolor{light-gray}\hline
8 & EX81.1.Z5 & 9 \\ \arrayrulecolor{light-gray}\hline
9 & EX81.1.Z6 & 10 \\ \arrayrulecolor{light-gray}\hline
10 & - & - \\ \arrayrulecolor{light-gray}\hline
... & ... & ... \\ \arrayrulecolor{light-gray}\hline
24 & WRL-OC1 & 17 \\ \arrayrulecolor{light-gray}\hline
25 & WRL-OC2 & 18 \\ \arrayrulecolor{light-gray}\hline
... & ... & ... \\ \arrayrulecolor{light-gray}\hline
54 & WRL-OC31 & 47 \\

\bottomrule
\end{tabularx}


#### Сержант G215 (19.1)
\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{clc}
\textbf{Номер в настройках} & \textbf{Название} & \textbf{Номер в событии} \\ \midrule

0 & Z1 & 1 \\ \arrayrulecolor{light-gray}\hline
1 & Z2 & 2 \\ \arrayrulecolor{light-gray}\hline
2 & Z3 & 3 \\ \arrayrulecolor{light-gray}\hline
3 & Z4 & 4 \\

\bottomrule
\end{tabularx}


#### Link LTE G461 (52.1)
\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{clc}
\textbf{Номер в настройках} & \textbf{Название} & \textbf{Номер в событии} \\ \midrule

0 & Z1 & 1 \\ \arrayrulecolor{light-gray}\hline
1 & Z2 & 2 \\

\bottomrule
\end{tabularx}


#### Союз GSM (7.0), Союз GSM v3 (7.3), Союз GSM v7(7.7), ТР-100 GSM IV(11.0), ТР-100 GSM IV v3(11.3)
\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{clc}
\textbf{Номер в настройках} & \textbf{Название} & \textbf{Номер в событии} \\ \midrule

0 & REL & 1 \\

\bottomrule
\end{tabularx}


#### Норды (номера в событиях)
\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{clccccccc}
\textbf{Номер} & \textbf{Название} & \textbf{Норд} & \textbf{Норд} & \textbf{Норд} & \textbf{Mini} & \textbf{Mini} & \textbf{Air} & \textbf{Air} \\
\textbf{OC} & \textbf{ } & \textbf{5.1} & \textbf{5.2-5.7} & \textbf{9.0} & \textbf{13.2} & \textbf{13.3} & \textbf{15.1} & \textbf{15.2} \\ \midrule

0 & FIRE & 1 & 1 & 1 & - & - & - & - \\ \arrayrulecolor{light-gray}\hline
1 & DEFECT & 2 & 2 & 2 & - & - & - & - \\ \arrayrulecolor{light-gray}\hline
2 & LED G & - & 3 & 3 & - & - & - & - \\ \arrayrulecolor{light-gray}\hline
4 & FIRE2 & - & 5 & 5 & - & - & - & - \\ \arrayrulecolor{light-gray}\hline
5 & DEFECT2 & - & 6 & 6 & - & - & - & - \\ \arrayrulecolor{light-gray}\hline
6 & DISABL & - & 7 & 7 & - & - & - & - \\ \arrayrulecolor{light-gray}\hline
7 & Z1 & - & - & - & 1 & 1 & 1 & 1 \\ \arrayrulecolor{light-gray}\hline
8 & Z2 & - & - & - & 2 & 2 & 2 & 2 \\ \arrayrulecolor{light-gray}\hline
9 & Z3 & - & - & - & 3 & 3 & - & - \\ \arrayrulecolor{light-gray}\hline
10 & Z4 & - & - & - & 4 & 4 & - & - \\ \arrayrulecolor{light-gray}\hline
11 & - & - & - & - & - & - & - & - \\ \arrayrulecolor{light-gray}\hline
12 & EXT-Z1 & 9 & 9 & 9 & 5 & 5 & 5 & 5 \\ \arrayrulecolor{light-gray}\hline
13 & EXT-Z2 & 10 & 10 & 10 & 6 & 6 & 6 & 6 \\ \arrayrulecolor{light-gray}\hline
14 & EXT-Z3 & 11 & 11 & 11 & 7 & 7 & 7 & 7 \\ \arrayrulecolor{light-gray}\hline
15 & EXT-Z4 & 12 & 12 & 12 & 8 & 8 & 8 & 8 \\ \arrayrulecolor{light-gray}\hline
16 & EXT-Z5 & 13 & 13 & 13 & 9 & 9 & 9 & 9 \\ \arrayrulecolor{light-gray}\hline
17 & EXT-Z6 & 14 & 14 & 14 & 10 & 10 & 10 & 10 \\ \arrayrulecolor{light-gray}\hline
18 & EXT-Z7 & 15 & 15 & 15 & 11 & 11 & 11 & 11 \\ \arrayrulecolor{light-gray}\hline
19 & EXT-Z8 & 16 & 16 & 16 & 12 & 12 & 12 & 12 \\ \arrayrulecolor{light-gray}\hline
20 & EXT-Z9 & - & - & - & 13 & 13 & 13 & 13 \\ \arrayrulecolor{light-gray}\hline
21 & EXT-Z10 & - & - & - & 14 & 14 & 14 & 14 \\ \arrayrulecolor{light-gray}\hline
22 & EXT-Z11 & - & - & - & 15 & 15 & 15 & 15 \\ \arrayrulecolor{light-gray}\hline
23 & EXT-Z12 & - & - & - & 16 & 16 & 16 & 16 \\ \arrayrulecolor{light-gray}\hline
24 & WRL-OC1 & 17 & 17 & 17 & - & - & 17 & 17 \\ \arrayrulecolor{light-gray}\hline
25 & WRL-OC2 & 18 & 18 & 18 & - & - & 18 & 18 \\ \arrayrulecolor{light-gray}\hline
26 & WRL-OC3 & 19 & 19 & 19 & - & - & 19 & 19 \\ \arrayrulecolor{light-gray}\hline
... & ... & ... & ... & ... & ... & ... & ... & ... \\ \arrayrulecolor{light-gray}\hline
53 & WRL-OC30 & 46 & 46 & 46 & - & - & 46 & 46 \\ \arrayrulecolor{light-gray}\hline
54 & WRL-OC31 & 47 & 47 & 47 & - & - & 47 & 47 \\

\bottomrule
\end{tabularx}


#### Nord Pro B315 (41.1), Nord Pro B316 (51.1), Nord Pro B331 (51.3), Nord Max B516 (50.1), Nord Max LTE B562 (50.3), Nord Max B531 (50.5)
\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{clc}
\textbf{Номер в настройках} & \textbf{Название} & \textbf{Номер в событии} \\ \midrule

0 & OD-1 & 1 \\ \arrayrulecolor{light-gray}\hline
1 & OD-2 & 2 \\ \arrayrulecolor{light-gray}\hline
2 & OD-3 & 3 \\ \arrayrulecolor{light-gray}\hline
3 & OD-4 & 4 \\ \arrayrulecolor{light-gray}\hline
4 & EX81.1.Z1 & 5 \\ \arrayrulecolor{light-gray}\hline
5 & EX81.1.Z2 & 6 \\ \arrayrulecolor{light-gray}\hline
6 & EX81.1.Z3 & 7 \\ \arrayrulecolor{light-gray}\hline
7 & EX81.1.Z4 & 8 \\ \arrayrulecolor{light-gray}\hline
8 & EX81.1.Z5 & 9 \\ \arrayrulecolor{light-gray}\hline
9 & EX81.1.Z6 & 10 \\ \arrayrulecolor{light-gray}\hline
10 & EX81.2.Z1 & 11 \\ \arrayrulecolor{light-gray}\hline
... & ... & ... \\ \arrayrulecolor{light-gray}\hline
33 & EX81.5.Z6 & 34 \\

\bottomrule
\end{tabularx}


#### Nord Pro Air C315 (41.2), Nord Pro Air C316 (51.2), Nord Pro Air C331 (51.4), Nord Max Air C516 (50.2), Nord Max Air LTE C562 (50.4), Nord Max Air C531 (50.6)
\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{clc}
\textbf{Номер в настройках} & \textbf{Название} & \textbf{Номер в событии} \\ \midrule

0 & OD-1 & 1 \\ \arrayrulecolor{light-gray}\hline
1 & OD-2 & 2 \\ \arrayrulecolor{light-gray}\hline
2 & OD-3 & 3 \\ \arrayrulecolor{light-gray}\hline
3 & OD-4 & 4 \\ \arrayrulecolor{light-gray}\hline
4 & EX81.1.Z1 & 5 \\ \arrayrulecolor{light-gray}\hline
5 & EX81.1.Z2 & 6 \\ \arrayrulecolor{light-gray}\hline
6 & EX81.1.Z3 & 7 \\ \arrayrulecolor{light-gray}\hline
7 & EX81.1.Z4 & 8 \\ \arrayrulecolor{light-gray}\hline
8 & EX81.1.Z5 & 9 \\ \arrayrulecolor{light-gray}\hline
9 & EX81.1.Z6 & 10 \\ \arrayrulecolor{light-gray}\hline
10 & - & - \\ \arrayrulecolor{light-gray}\hline
... & ... & ... \\ \arrayrulecolor{light-gray}\hline
24 & WRL-OC1 & 17 \\ \arrayrulecolor{light-gray}\hline
25 & WRL-OC2 & 18 \\ \arrayrulecolor{light-gray}\hline
... & ... & ... \\ \arrayrulecolor{light-gray}\hline
54 & WRL-OC31 & 47 \\

\bottomrule
\end{tabularx}


#### Nord Mini D331 (53.2)
\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{clc}
\textbf{Номер в настройках} & \textbf{Название} & \textbf{Номер в событии} \\ \midrule

0 & Z1 & 1 \\ \arrayrulecolor{light-gray}\hline
1 & Z2 & 2 \\ \arrayrulecolor{light-gray}\hline
2 & Z3 & 3 \\ \arrayrulecolor{light-gray}\hline
3 & Z4 & 4 \\

\bottomrule
\end{tabularx}


#### Nord Mini Air F331 (55.2)
\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{clc}
\textbf{Номер в настройках} & \textbf{Название} & \textbf{Номер в событии} \\ \midrule

0 & Z1 & 1 \\ \arrayrulecolor{light-gray}\hline
1 & Z2 & 2 \\ \arrayrulecolor{light-gray}\hline
3 & - & - \\ \arrayrulecolor{light-gray}\hline
... & ... & ... \\ \arrayrulecolor{light-gray}\hline
24 & WRL-OC1 & 17 \\ \arrayrulecolor{light-gray}\hline
25 & WRL-OC2 & 18 \\ \arrayrulecolor{light-gray}\hline
... & ... & ... \\ \arrayrulecolor{light-gray}\hline
54 & WRL-OC31 & 47 \\

\bottomrule
\end{tabularx}


#### Sergeant GSM G231 (59.2)
\definecolor{light-gray}{gray}{0.7}
\renewcommand{\arraystretch}{1.4}
\begin{tabularx}{\textwidth}{clc}
\textbf{Номер в настройках} & \textbf{Название} & \textbf{Номер в событии} \\ \midrule

0 & OD-1 & 1 \\ \arrayrulecolor{light-gray}\hline
1 & OD-2 & 2 \\ \arrayrulecolor{light-gray}\hline
2 & OD-3 & 3 \\ \arrayrulecolor{light-gray}\hline
3 & OD-4 & 4 \\

\bottomrule
\end{tabularx}
EXT-Z1, EXT-Z2,.. – зоны/открытые коллектора РПШ-12.

\text{EX81.1.Z1 - это <расширитель EX81>.<порядковый номер EX81>.<название клеммы EX81>}

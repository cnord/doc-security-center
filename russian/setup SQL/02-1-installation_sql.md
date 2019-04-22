# Установка и настройка SQL Server Express 2017 для работы с ПО «Центр охраны»

## Введение

Перед установкой программного обеспечения «Центр охраны» необходимо проверить установлен ли какой-нибудь Microsoft SQL Server.

* Если установлен, то убедитесь, что имя экземпляра SQL отличается от «ANDROMEDA».
* Если SQL Server не установлен, то его нужно установить по нижеследующей инструкции.
Рекомендуется устанавливать Microsoft SQL Server 2017 или Microsoft SQL Server 2014.(параметры установки и настройки этих версий не различаются).

Установка Microsoft SQL Server Express будет состоять из следующих шагов:

1. Скачать дистрибутив с официального сайта. Запустить его установку.
2. В процессе установки задать имя экземпляра SQL - «ANDROMEDA».
3. Разрешить подключение к экземпляру по локальной сети.
4. Задать смешанный способ авторизации.

После установки нужно настроить SQL Server, указать порты для работы по сети, создать необходимые для этих портов правила в брандмауэре Windows.

## Установка SQL Express

### Где взять дистрибутив?

Для скачивания Microsoft SQL Server 2017 Express нужно перейти на ​[официальный сайт](https://www.microsoft.com/en-us/download/details.aspx?id=55994) компании Microsoft. Выбрать язык, на котором предполагается использование продукта, и нажать кнопку «скачать».

### Как установить?

1. Запустить установку Microsoft SQL Server 2017 Express от имени администратора.

\imgcapt{"setup SQL"/img_setup/2017/1.png}{}

2. Выбрать тип установки - Базовая.   
Начальные этапы программы установки выполняются на языке операционной системы.

\imgcapt{"setup SQL"/img_setup/2017/1.1.jpg}{}

3. Необходимо выбрать язык SQL Server и нажать кнопку «Принять».   
В данной инструкции рассмотрена установка англоязычного экземпляра. Для других языков SQL Server действия при установке не отличаются.

\imgcapt{"setup SQL"/img_setup/2017/1.2.jpg}{}

4. Выбрать папку для установки. Нажать кнопку «Установить».

\imgcapt{"setup SQL"/img_setup/2017/1.3.jpg}{}

5. Дождаться завершения скачивания и установки.

\imgcapt{"setup SQL"/img_setup/2017/1.4.jpg}{}

\imgcapt{"setup SQL"/img_setup/2017/1.5.jpg}{}

6. После завершения процесса установки нажать кнопку «Настроить». Откроется новое окно.

\imgcapt{"setup SQL"/img_setup/2017/1.6.jpg}{}

7. Нажать кнопку «Next».

\imgcapt{"setup SQL"/img_setup/2017/1.7.jpg}{}

8. Нажать кнопку «Next».

\imgcapt{"setup SQL"/img_setup/2017/1.8.jpg}{}

9.  Выбрать пункт новая инсталляция SQL Server и нажать кнопку «Next».

\imgcapt{"setup SQL"/img_setup/2017/1.9.jpg}{}

10.  Принять лицензию, установив галочку «I accept...» и нажать кнопку «Next».

\imgcapt{"setup SQL"/img_setup/2017/1.10.jpg}{}

11.  Убедится, что установлены все три галочки и нажать кнопку «Next».

\imgcapt{"setup SQL"/img_setup/2017/4.jpg}{}

12.  Задать имя экземпляра SQL: «ANDROMEDA». Нажать кнопку «Next».

\imgcapt{"setup SQL"/img_setup/2017/1.12.jpg}{}

13. Для сервиса SQL Server Database Engine перейти в редактирование имени аккаунта. Для этого в выпадающем меню выбрать <<Browse...>>.

\imgcapt{"setup SQL"/img_setup/2017/6.jpg}{}

14. В открывшемся окне нажать кнопку «Advanced...»

\imgcapt{"setup SQL"/img_setup/2017/7.jpg}{}

15. Нажать кнопку «Find Now».

\imgcapt{"setup SQL"/img_setup/2017/8.jpg}{}

16. В открывшемся списке выбрать поле «NETWORK SERVICE» и нажать кнопку «OK».

\imgcapt{"setup SQL"/img_setup/2017/9.jpg}{}

17. Убедиться, что в нижнем окне появилась запись NETWORK SERVICE. Нажать кнопку «OK».

\imgcapt{"setup SQL"/img_setup/2017/10.jpg}{}

18. Для сервиса SQL Server Database Engine и SQL Server Browser установить тип Automatic.

\imgcapt{"setup SQL"/img_setup/2017/11.jpg}{}

19. Нажать кнопку «Next»
20. Установить режим «Mixed Mode» и дважды ввести любой пароль.

\imgcapt{"setup SQL"/img_setup/2017/12.jpg}{}

21. Нажать кнопку «Next».   
Дождаться завершения процесса установки.

\imgcapt{"setup SQL"/img_setup/2017/13.jpg}{}


## Настройка SQL Server

Для настройки SQL Server нужно выполнить следующие действия:

1. Запустить SQL Server Configuration Manager

\imgcapt{"setup SQL"/img_setup/2017/set_1.png}{}

2. Выбрать слева SQL Server Network Configuration → Protocols for ANDROMEDA.
3. Двойным кликом на поле Named Pipes открыть свойства протокола.

\imgcapt{"setup SQL"/img_setup/2017/set_2.jpg}{}

4. Напротив Enabled установить «Yes». Нажать кнопку «OK».

\imgcapt{"setup SQL"/img_setup/2017/set_3.jpg}{}

5. Двойным кликом на поле TCP/IP открыть свойства протокола.

\imgcapt{"setup SQL"/img_setup/2017/set_4.jpg}{}

6. На вкладке Protocol напротив Enabled установить «Yes».
7. На вкладке IP Addresses перейти к блоку IP All.
Удалить значение напротив TCP Dynamic Ports. А для параметра TCP Port указать - 1433.
Нажать кнопку «OK».

\imgcapt{"setup SQL"/img_setup/2017/set_5.jpg}{}

\imgcapt{"setup SQL"/img_setup/2017/set_18.jpg}{}

8. Перезапустить SQL Server (ANDROMEDA) → правая кнопка → Restart.

\imgcapt{"setup SQL"/img_setup/2017/set_19.png}{}

Настройка SQL Server завершена.


## Настройка Windows Firewall

Для настройки Windows Firewall нужно выполнить следующие действия:

1. Открыть Панель управления. Выбрать Windows Firewall.

\imgcapt{"setup SQL"/img_setup/2017/fire1-7.jpg}{}

2. Выбрать в меню справа пункт «Advanced settings».

\imgcapt{"setup SQL"/img_setup/2017/fire8.jpg}{}

3. Добавить роль для TCP-порта.
В блоке Inbound Rules справа выбрать «New Rule..»

\imgcapt{"setup SQL"/img_setup/2017/fire9.jpg}{}

4. Выбрать «Port» и нажать кнопку «Next».

\imgcapt{"setup SQL"/img_setup/2017/fire10.jpg}{}

5. Установить переключатель в значение «TCP».
Для поля Specific local ports указать значение 1433.
Нажать кнопку «Next».

\imgcapt{"setup SQL"/img_setup/2017/fire11.jpg}{}

6. Убедиться, что выбран пункт «Allow the connection». Нажать кнопку «Next».

\imgcapt{"setup SQL"/img_setup/2017/fire12.jpg}{}

7. Убедиться, что выбраны все галочки. Нажать кнопку «Next».

\imgcapt{"setup SQL"/img_setup/2017/fire13.jpg}{}

8. Указать имя, например, SQLServerTCP. Нажать кнопку «Finish».

\imgcapt{"setup SQL"/img_setup/2017/fire14.jpg}{}

9.  Добавить роль для UDP-порта.
Выполнить шаг 3 и шаг 4.   
10. Установить переключатель в значение «UDP».
Для поля Specific local ports указать значение 1434.
Нажать кнопку «Next».

\imgcapt{"setup SQL"/img_setup/2017/fire15.jpg}{}

11. Указать имя, например, SQLServerUDP. Нажать кнопку «Finish».

\imgcapt{"setup SQL"/img_setup/2017/fire16.jpg}{}

Настройка брандмауэра завершена.


## Дополнительно

Если работа ПО «Центр охраны» или его сетевого места предполагается на ПК с операционной системой Windows XP или Microsoft SQL Server 2008, то дополнительно нужно сделать
следующие действия:

1. Перед началом установки ПО «Центр охраны» ​скачать с официального сайта​ и установить SQL Server Native Client: sqlncli.msi

\imgcapt{"setup SQL"/img_setup/2017/20.jpg}{}

2. После установки клиента, установите сетевое рабочее место ПО «Центр охраны».
3. На пк, где установлено сетевое место «Центра охраны», открыть файл Andromeda.ini (обычно он располагается по этому пути: C:\\Program Files (x86)\\Andromeda).
4. Заменить строку ​ _Provider=SQLNCLI11_ ​ на строку​ _Provider=SQLNCLI10._
5. Сохранить. Перезапустить сетевое место «Центра охраны».


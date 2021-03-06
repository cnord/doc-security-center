# Мастер базы данных

Модуль «Мастер базы данных» предназначен для выполнения следующих операций:

* проверка базы данных
* работа с резервными копиями базы данных
* импорт и экспорт данных

После запуска модуля «Мастер базы данных» нужно выбрать операцию, которую необходимо выполнить:

\imgcapt{img/AnDBWiz-BR.png}{Стартовое окно модуля «Мастер базы данных»}

## Проверка базы данных

Операцию проверки базы данных рекомендуется выполнять не реже, чем раз в месяц. Процедуры, входящие в операцию проверки базы, не имеют никаких настроек и выполняются автоматически. 

При выполнении проверки базы данных работу остальных модулей можно не прекращать. После завершения проверки рекомендуется перезапустить модуль «Дежурный оператор».

## Резервное копирование

Резервное копирование базы данных можно выполнять только на том компьютере, на котором выполнялась полная установка «Центра охраны».

Процедура резервного копирования не оказывает критического влияния на работу других модулей «Центра охраны». Тем не менее, при выполнении резервного копирования базы данных, возможно некоторое снижение производительности компьютера в целом. Этот факт нужно принимать во внимание при выборе времени для выполнения резервного копирования.

При создании резервной копии базы данных необходимо задать значения для параметров, управляющих операцией резервного копирования.

\imgcapt{img/AnDBWiz-BR-Back-02.png}{Окно настройки операции резервного копирования}

Параметр «Папка назначения» задает папку на жестком диске компьютера или сетевом ресурсе, в которой будет размещена резервная копия базы данных.

Имя файла резервной копии можно задать с помощью одноименного параметра. Несмотря на то, что никаких ограничений на именование файла резервной копии не накладывается, необходимо помнить, что для восстановления базы данных «Центра охраны» из резервной копии с помощью графического  интерфейса модуля «Мастер базы данных» нужно, чтобы имя файла начиналось с латинским символов «AB».

Обратите внимание, что резервная копия базы данных программного обеспечения «Центр охраны» создаётся в виде архива формата «ZIP», в который может быть включено несколько файлов, содержащих данные резервной копии. В случае, если размер файла архива превышает 4Gb, будет создан многотомный архив, все файлы которого будут необходимы при восстановлении базы данных из резервной копии.

Дополнительно к имени файла резервной копии и названия папки для ее размещения, необходимо указать тип резервной копии, которую нужно создать. Тип резервной копии определяет объем информации, которая будет включена в резервную копию. 

При выполнении _полного копирования_ в резервную копию базы данных будет включена вся информация, хранящаяся в базе данных на момент копирования, включая полученные события, действия операторов и отправленные SMS-сообщения за все время эксплуатации программного обеспечения «Центр охраны».

Если же выполнить _оперативное копирование_, то объем данных в резервной копии будет значительно меньше: в ней сохранятся события, действия операторов и SMS-сообщения только за последний месяц.

Исходя из объема сохраняемой при резервном копировании информации, рекомендуется полное резервное копирование выполнять не реже, чем один раз в месяц, а оперативное резервное копирование — не реже одного раза в сутки.

Для хранения резервных копий рекомендуется использовать не один, а несколько носителей информации, причем таких, которые физически не связаны с дисковой подсистемой компьютера, на котором хранится база данных «Центра охраны». Например, это может быть отдельный жесткий диск, флеш-накопитель или сетевой ресурс. 

Для того, чтобы увеличить надежность системы в целом, «Центр охраны» выполняет автоматическое резервное копирование. Оперативные копии базы данных сохраняются в папке «ANDROMEDA DATA\\SYSBACKUP», интервал создания автоматических резервных копий по умолчанию — 24 часа.

## Восстановление из резервной копии

Восстановление базы данных из резервной копии можно выполнять только на том компьютере, на который выполнялась полная установка программного обеспечения «Центр охраны». 

Перед тем, как приступить к восстановлению базы данных из резервной копии, необходимо остановить работу всех модулей «Центра охраны», включая модуль «Менеджер событий».

Версия базы данных, из которой производится восстановление, не имеет значения: сразу после восстановления модуль «Мастер базы данных» проверит версию восстановленных данных и, при необходимости, выполнит обновление.

\imgcapt{img/AnDBWiz-BR-Rest-02.png}{Окно настроек операции восстановления из резервной копии}

Имя файла резервной копии, из которой необходимо восстановить базу данных, можно указать с помощью одноименного параметра. Если резервная копия базы данных была создана в многотомном архиве, то при восстановлении из такой копии требуются все файлы архива.

Параметр «Установить для объектов текущее время как время приема последнего события» предназначен для того, чтобы сразу после восстановления базы данных из резервной копии не началась генерация событий об отсутствии контрольного события. Если при восстановлении базы данных из резервной копии установить этот флаг, то для для всех объектов в базе данных программного обеспечения «Центр охраны» отсчет контрольного времени начнется с момента завершения восстановления базы данных из резервной копии.

Подробнее о назначении параметра «Контрольное время объекта» можно ознакомится в главе, описывающей модуль «Менеджер объектов», раздел «Контрольное время».  

Восстановление базы данных рекомендуется производить в два этапа: сначала выполнить восстановление из самой свежей полной копии базы данных, а после этого — из актуальной оперативной копии. Таким образом, на первом этапе будет восстановлена вся имеющаяся история, а на втором этапе будет актуализирована постоянно изменяющаяся информация.

По завершению восстановления базы данных из резервной копии рекомендуется выполнить проверку базы данных. При этом необходимо помнить, что процедура проверки базы данных не блокирует работу других модулей «Центра охраны», поэтому ее можно выполнять после того, как будут запущены «Менеджер событий» и «Дежурный оператор».

## Импорт данных

Импорт данных можно выполнять только на том компьютере, на который выполнялась полная установка программного обеспечения «Центр охраны». 

Перед тем, как приступить к импорту данных, необходимо остановить работу всех модулей «Центра охраны», включая модуль «Менеджер событий».

\imgcapt{img/AnDBWiz-EI-Imp-And-01.png}{Окно выбора источника данных для операции импорта}

В Центре охраны, помимо других источников, возможно делать импорт из XML-файла.

### Импорт из XML-файла

С помощью импорта из XML-файла можно импортировать в «Центр охраны» базу объектов программного обеспечения «Кобра».

\imgcapt{img/AnDBWiz-EI-Imp-XML-02.png}{Окно настроек операции импорта из XML-файла}

С помощью параметра «Имя XML-файла» необходимо выбрать файл базы данных, указав к нему путь.

При выполнении импорта из XML-файла можно сдвинуть номера импортируемых объектов. Суть операции сдвига заключается в том, что к номерам объектов, информация о которых переносится в «Центр охраны», будет добавлено слагаемое, указанное при настройке процедуры импорта. Например, если в качестве значения параметра «Сдвиг номеров объектов» указано значение 10000, а номера объектов в XML-файле лежат в диапазоне 1 - 2000, то в базе данных «Центра охраны» эти объекты будут иметь номера в диапазон 10001 - 12000.

Подробнее о функции сдвига номеров объектов в источниках событий можно почитать в главе, посвященной модулю «Менеджер событий», в разделе «Источники событий».

## Экспорт данных

Программное обеспечение «Центр охраны» поддерживает экспорт информации об объектах в текстовый файл с разделителем значений.

\imgcapt{img/AnDBWiz-EI-Exp-Csv-02.png}{Окно выбора объектов и полей при настройке операции экспорта информации об объектах}

При выполнении экспорта необходимо выбрать объекты и поля (столбцы), информация о которых будет записана в файл экспорта.
Выбор объектов, информация о которых должна быть экспортирована, осуществляется установкой флага («галочки») в первой колонке строки с объектом.
Выбор полей, информация из которых будет записана в файл экспорта, осуществляется путем включения или выключения их отображения. В файл экспорта будет включена информация только из тех полей (столбцов), которые отображаются в таблице.

\imgcapt{img/AnDBWiz-EI-Exp-Csv-03.png}{Окно настройки операции экспорта информации об объектах}

С помощью параметра «Имя файла экспорта» можно задать папку и имя файла, в который должен быть выполнен экспорт.

Параметр «Символ-разделитель» предназначен для выбора символа, который будет использоваться в качестве разделителя полей в одной строке файла экспорта. Необходимо помнить, что строковые значения полей в файле экспорта заключены в двойные кавычки, что исключает возможность неправильного распознавания символа-разделителя при открытии файла экспорта.

## Параметры командной строки

Наряду с графическим интерфейсом пользователя модуль «Мастер базы данных» обладает возможностью управления с помощью параметров командной строки. 

Эта возможность может быть полезной в том случае, если в качестве планировщика заданий создания резервной копии базы данных или восстановления из резервной копии используется планировщик Windows, который обладает более развитыми возможностями, нежели планировщик, встроенный в модуль «Менеджер событий».

### Создание резервной копии базы данных

	AnDBWiz.exe 
		/BACKUPDB 
		/FOLDER:<Папка назначения 1>;<Папка назначения 2> 
		/TYPE:<Тип резервной копии> 
		/BACKUPCOUNT:<Количество файлов в папке назначения>

	/BACKUPDB
	
Данный параметр указывает, что модуль «Мастер базы данных» должен выполнить резервное копирование базы данных. Настройки процедуры резервного копирования задаются следующими за ним параметрами командной строки.

	/FOLDER:<Папка назначения 1>;<Папка назначения 2>
	
Одна или несколько папок, в которые будет помещена резервная копия базы данных. Должна быть указана, по крайней мере, одна папка. Названия папок должны быть заключены в кавычки. Если указывается несколько папок, то они должны быть разделены символом «точка с запятой». Допускается использование в названиях папок абсолютных путей.

	/TYPE:<Тип резервной копии>

Тип резервной копии, которую необходимо создать. Значение «0» для данного параметра соответствует необходимости создания оперативной резервной копии. Значение «1» означает, что нужно создать полную резервную копию базы данных. Параметр не является обязательным. Если значение параметра не задано, то будет создана оперативная резервная копия.

	/BACKUPCOUNT:<Количество файлов в папке назначения>

Данный параметр определяет максимально возможное количество файлов резервной копии базы данных в папке назначения. Если при создании резервной копии будет обнаружено, что количество файлов резервных копий такого же типа превышает максимально возможное, то самый старый по времени файл резервной копии будет удален. Параметр не является обязательным. Если значение параметра не задано, то в качестве значения для этого параметра будет использоваться значение 10.

### Восстановление базы данных из резервной копии

	AnDBWiz.exe 
		/RESTOREDB 
		/FOLDER:<Исходная папка> 
		/TYPE:<Тип резервной копии>

	/RESTOREDB

Данный параметр указывает, что модуль «Мастер базы данных» должен выполнить восстановление базы данных из резервной копии. Настройки процедуры восстановления базы данных задаются следующими за ним параметрами командной строки.

	/FOLDER:<Исходная папка>

Папка, в которой будет произведен поиск резервной копии базы данных, из которой будет выполнено восстановление. Если в указанной папке будет обнаружено несколько файлов резервной копии заданного типа, то будет произведено восстановление из самого нового по времени создания файла.

	/TYPE:<Тип резервной копии>

Тип резервной копии, из которой необходимо выполнить восстановление. Значение «0» для данного параметра соответствует необходимости восстановления из оперативной резервной копии. Значение «1» означает, что нужно восстановить базу данных из полной резервной копии. Параметр не является обязательным. Если значение параметра не задано, то будет выполнено восстановление из оперативной резервной копии.

### Пример использования параметров командной строки

	AnDBWiz.exe 
		/BACKUPDB 
		/FOLDER:"E:\Backup Data\Operational";"\\Storage\Andromeda Backup\Operational" 
		/BACKUPCOUNT:25

Приведенный набор параметров командной строки означает, что модуль «Мастер базы данных» должен создать оперативную копию базы данных и скопировать ее в папки `E:\Backup Data\Operational` и `\\Storage\Andromeda Backup\Operational`. 

При копировании резервной копии в папку назначения модуль «Мастер базы данных» должен проверить, что общее количество файлов оперативной резервной копии в папке назначения не превышает 24, а если их больше, то самый старый по времени создания файл резервной копии должен быть удален.

[id-11-05]: img/AnDBWiz-EI-Imp-And-02.png "Окно настроек операции импорта из базы данных программного обеспечения «Андромеда»"
[id-11-06]: img/AnDBWiz-EI-Imp-Str-02.png "Окно настроек операции импорта из базы данных программного обеспечения «Страж»"
[id-11-07]: img/AnDBWiz-EI-Imp-Csm-02.png "Окно настроек операции импорта из базы данных программного обеспечения «CSM32»"
[id-11-08]: img/AnDBWiz-EI-Imp-Csm-03.png "Окно настройки соответствия классов событий при импорте из базы данных программного обеспечения «CSM32»"
[id-11-11]: img/AnDBWiz-EI-Imp-GN-02.png "Окно настроек операции импорта из базы данных программного обеспечения «GuardNet»"
[id-11-12]: img/AnDBWiz-EI-Imp-Nmn-02.png "Окно настроек операции импорта из базы данных программного обеспечения «Неман»"

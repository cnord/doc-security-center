# Облачные сервисы {#cloud-services}

Облако - это инфраструктурный программно-аппаратный комплекс. Оно предоставляет сервисы для улучшения качества предлагаемых частным охранным предприятием услуг.

«Панель инженера» отображает доступные для управления приборы и предоставляет возможность их удаленного конфигурирования и обновления прошивки.

Облачным сервисом также является «Тревога в ГБР». Данное приложение обеспечивает быстрое взаимодействие между оператором «Центра охраны» и сотрудниками ГБР. Кроме того, оно позволяет ГБР получить необходимую информацию об объекте и его состоянии.

Помимо данных сервисов, доступны различные web-интерфейсы. Например, с помощью «Интерфейса партнера» частное охранное предприятие может управлять услугами Облака. Здесь можно настроить один из облачных сервисов, например,  «Тревога в ГБР».

Пользователь «Центра охраны» может выбрать один из режимов работы с облачными сервисами в зависимости от степени интеграции с Облаком. Полная интеграция позволяет использовать все облачные сервисы. Частичная - только сервис, предоставляющий удаленный доступ к оборудованию на объекте. Запрещая передачу каких-либо данных в Облако, пользователь отказывается от использования всех облачных сервисов.

## Call-центр

### Получение информации о состоянии объекта

Предоставляемая «Call-центром» услуга «Получение информации о состоянии объекта» позволяет проверить состояние охраняемого объекта. Данная услуга подключается в административной панели учетной записи партнера.

Удостовериться в том, что объект находится в ожидаемом состоянии, необходимо по разным причинам. В частности, объект может быть не взят под охрану из-за неисправности охранного оборудования или по причине нарушения канала связи. При использовании GPRS или GSM связи на SIM-карте могут закончиться деньги.

Для проверки состояния объекта клиент ЧОП должен позвонить на специальный номер предприятия. После этого он может самостоятельно выбрать услугу «Получение информации о состоянии объекта» с помощью голосового меню, ввести номер объекта и при необходимости ПИН-код. Клиент ЧОП может узнать ПИН-код в «Личном кабинете» партнера, а оператор «Центра охраны» - в «Менеджере объектов» на вкладке «Ответственные лица».

\imgcapt{img/CldSrvcs-02-CallCenterServices.png}{Выбор услуг при звонке в «Call-центр»}

ПИН-код следует запрашивать в целях повышения уровня безопасности для сохранения конфиденциальной информации о состоянии объекта. Включить запрос ПИН-кода для звонков о состоянии охраняемого объекта можно в панели управления учетной записи партнера.

Благодаря облачному сервису «Call-центр» количество звонков, переводимых на оператора, снижается. Это особенно важно в часы пик, когда сотрудники предприятий приходят или уходят с работы, снимая или ставя объект на охрану соответственно. Автоматическая обработка звонков для подтверждения снятия и взятия под охрану позволяет операторам «Центра охраны» заниматься своей основной обязанностью, а именно - отработкой тревог.

### Проверка КТС

Тревожная кнопка устанавливается в ювелирных салонах, ломбардах, банках, кафе, аптеках и во многих других предприятиях. При этом частное охранное предприятие составляет договор, в котором прописывается периодичность обязательной проверки тревожной кнопки клиентом ЧОП: например, один раз в день. 

Проверить тревожную кнопку на работоспособность позволяет предоставляемая сервисом «Call-центр» услуга «Проверка КТС». Данная услуга подключается в административной панели учетной записи партнера.

Для проверки тревожной кнопки клиент ЧОП должен позвонить на специальный номер предприятия. После этого он может самостоятельно выбрать услугу «Контроль тревожной кнопки» с помощью голосового меню, ввести номер объекта и ПИН-код. Клиент ЧОП может узнать ПИН-код в «Личном кабинете» партнера, а оператор «Центра охраны» - в «Менеджере объектов» на вкладке «Ответственные лица».

После этого клиент должен нажать тревожную кнопку. Если она работает, в «Центре охраны» возникает тревога, которая автоматически отменяется по причине «Тест». При этом «Call-центр» сообщает клиенту об исправности тревожной кнопки, а в журнале событий регистрируется совершение проверки тревожной сигнализации.

## Web-интерфейс партнера

Воспользоваться административной панелью для настройки облачных сервисов частное охранное предприятие может после регистрации в Облаке учетной записи партнера. 

### Регистрация учетной записи партнера

Для регистрации партнера в Облаке следует открыть в браузере веб-страницу по адресу [cloud.cnord.net](https://cloud.cnord.net). На странице приведена краткая справочная информация по облачным услугам, которые могут быть настроены в административной панели.

\imgcapt{img/CldSrvcs-04-WebSite.png}{Веб-интерфейс партнера}

Для создания учетной записи необходимо выбрать вкладку «Регистрация партнера». В поле «Электронная почта» нужно ввести адрес электронной почты партнера, а в поле «UID "Центра охраны"» - уникальный идентифицирующий номер установленного «Центра охраны».

\imgcapt{img/CldSrvcs-05-Registration.png}{Регистрация партнера}

Узнать UID «Центра охраны» можно, запустив «Менеджер событий». После этого необходимо вызвать выпадающее меню, кликнув на появившейся в системной области панели задач Windows иконке модуля. Здесь следует выбрать пункт меню «Связь с облаком...».

\imgcapt{img/CldSrvcs-06-CloudConnection.png}{Связь с Облаком}

При этом откроется одноименное окно, содержащее вкладку «UID "Центра охраны"». На ней можно копировать UID Центра охраны для последующей вставки номера в поле браузера. Для этого нужно кликнуть по иконке «Копировать» напротив поля «UID».

\imgcapt{img/CldSrvcs-07-UIDCopying.png}{Копирование UID}

После ввода необходимых данных на странице регистрации учетной записи партнера следует нажать кнопку «Зарегистрироваться». 

На указанную при регистрации электронную почту будет отправлено письмо. Для завершения регистрации следует подтвердить адрес электронной почты, пройдя по ссылке, приведенной в письме. 

При первой авторизации на сайте появится форма, которую следует заполнить. Здесь следует проверить и при необходимости изменить контактную информацию, указанную при регистрации «Центра охраны». А именно: имя и фамилию, а также мобильный телефон партнера; наименование, город и адрес организации. Кроме того, здесь предлагается создать и подтвердить пароль для входа в аккаунт партнера.

### Повторная регистрация учетной записи партнера

Если требуется создать новую учетную запись партнера взамен существующей, можно пройти повторную регистрацию. Например, этим можно воспользоваться при потере регистрационных данных партнера. Также повторную регистрацию можно осуществить для обеспечения защиты данных при увольнении администратора аккаунта.

Для повторной регистрации необходимо создать новый UID. Это можно сделать в окне «Связь с облаком...» на вкладке «UID "Центра охраны"». Таким образом, в данном окне можно не только узнать информацию об UID «Центра охраны», но и создать новый UID. 

\imgcapt{img/CldSrvcs-08-NewUID.png}{Создание нового UID}

Для этого следует нажать на кнопку «Создать новый UID». Центр охраны будет автоматически удален из панели управления учетной записи партнера. С помощью нового UID можно добавить данный «Центр охраны» к другой учетной записи или создать новую учетную запись партнера.  

Создавать новый UID можно не чаще одного раза в сутки. При использовании услуги «Call-центр» после смены UID «Центра охраны» следует также изменить UID в телефонном роутере.

Важно: смена UID возможна при выполненном подключении к Облаку и открытых для компьютера, на котором запущен модуль «Менеджер объектов», портах 80 и 443 протокола TCP.

### Вход в аккаунт партнера

Для входа в аккаунт уже зарегистрированного партнера на веб-странице [cloud.cnord.net](https://cloud.cnord.net) нужно выбрать вкладку «Войти». Здесь необходимо ввести адрес электронной почты в поле «Электронная почта» и пароль, указанный после регистрации партнера, в поле «Пароль».

\imgcapt{img/CldSrvcs-09-Login.png}{Вход в аккаунт партнера}

Для выхода из аккаунта следует кликнуть по ссылке «Выйти», расположенной на панели в верхней части окна.

### Управление «Центрами охраны»

В панели управления партнёра присутствует информация о «Центре охраны», указанная при регистрации «Центра охраны» в Облаке. При необходимости можно добавить новый Центр охраны, нажав кнопку «Добавить "Центр охраны"». При этом откроется одноименная форма, в которой нужно ввести UID зарегистрированного в Облаке «Центра охраны» и нажать кнопку «Добавить». 

Если UID принадлежит к еще не привязанному к партнеру «Центру охраны», то он будет закреплен за данным партнером. В обратном случае рекомендуется сменить UID установленного «Центра охраны».

Для удаления «Центра охраны» нужно кликнуть по иконке «Корзина» напротив центра охраны и подтвердить удаление.

### Настройка облачных сервисов {#cloud-services-settings}

В административной панели приведена информация о добавленных «Центрах охраны». А именно: наименование и адрес организации, а также электронная почта и телефон администратора «Центра охраны».

\imgcapt{img/CldSrvcs-10-AdminPanel.png}{Административная панель учетной записи партнера}

Для каждого «Центра охраны» можно настроить услугу «Call-центр». Прежде всего следует подключить телефонный роутер. Пройдя по соответствующей ссылке, можно прочитать инструкцию по его подключению. Для заявки на приобретение телефонного роутера следует воспользоваться одноименной ссылкой. 

Если телефонный роутер подключен, в секции «Call-центр» можно вызвать окно «Настройка Call-центра». Окно предназначено для выбора услуг «Call-центра»: подтверждение снятий или взятий под охрану (без запроса ПИН-кода или только по запросу ПИН-кода), проверка КТС (с запросом ПИН-кода). Кроме того, здесь можно загрузить файл приветствия в формате WAV, либо установить стандартное приветствие. Размер файла для загрузки не должен превышать 10 Мб.

\imgcapt{img/CldSrvcs-11-CallCenter.png}{Настройка услуги «Call-центр» в учетной записи партнера}

На электронную почту администратора партнера можно отправить статистику использования услуги «Call-центр». Статистика генерируется в формате Microsoft Excel за определенный период: текущие или предыдущие сутки, текущая или прошедшая неделя, текущий или предыдущий месяц. В статистике приводится количество звонков и средняя продолжительность всех звонков, звонков проверки состояния, проверки КТС, звонков с переключением на операторов, а также средняя продолжительность сброшенных звонков.

В секции «Тревога в ГБР» можно узнать и при необходимости изменить пароли доступа к одноименному мобильному приложению.

\imgcapt{img/CldSrvcs-12-AlarmPassword.png}{Пароли доступа к приложению «Тревога в ГБР»}

Кроме того, в панели управления можно настроить «Личный кабинет». Для этого следует указать такие данные, как название частного охранного предприятия, ссылка на сайт, телефон технической поддержки и электронная почта технической поддержки. Эта информация будет отображаться в личном кабинете клиентов.

\imgcapt{img/CldSrvcs-13-PrivateOffice.png}{Настройка услуги "Личный кабинет" в учетной записи партнера}

В секции «Ситуационная карта» приведены три ссылки на ситуационные карты. Ссылки удобно копировать для последующей передачи разным ответственным лицам с помощью специальной функции «Копировать в буфер». Таким образом, для перехода по ссылке авторизация не требуется. 

\imgcapt{img/CldSrvcs-14-SituationalMapLink.png}{Настройка услуги "Ситуационная карта" в учетной записи партнера}

Поле «Комментарий» к каждой ссылке предназначен для задания необходимой информации: например, здесь можно указать, кто использует данную ссылку для доступа к ситуационной карте. 

Если необходимо запретить какому-либо ответственному лицу доступ к карте по выданной ссылке, ссылку можно обновить. В этом случае при переходе по устаревшей ссылке карта будет недоступна, а если ссылка уже была открыта в браузере, данные перестанут обновляться.

## Панель инженера

Приложение «Панель инженера» предназначено для удаленной настройки оборудования, установленного на объекте, а также для обновления версии программного обеспечения приборов.

Для того, чтобы инженер мог удаленно изменить настройки, на объекте должен быть установлен один из следующих приборов:

* «Норд GSM» или «Норд GSM (WRL)»
* «Сержант GSM»
* «Союз GSM (OEM) или «Союз GSM (BOX)»
* Передатчик «ТР-100 GSM III», подключенный к контрольной панели производства фирмы «Си-Норд» или «PIMA Electronic Systems Ltd.»

Для того, чтобы инженер мог получить доступ к сервису, для него должна быть создана учетная запись. 

Создать учетную запись инженера можно на вкладке «Инженеры» модуля «Менеджер персонала». При создании учетной записи на электронный адрес инженера высылается письмо. Инженер должен пройти по указанной в письме ссылке и на открывшейся при этом странице создать и подтвердить пароль для доступа к «Панели инженера». После ввода данных необходимо нажать кнопку «Зарегистрироваться» для завершения регистрации в Облаке.

Для того, чтобы оператор «Центра охраны» мог создать учетную запись для инженера или изменить её настройки, ему должно быть предоставлено разрешение на редактирование инженеров.

После успешной регистрации на странице отобразится ссылка для перехода на главную страницу «Панели инженера». На данной странице под заголовком «Доступные объекты» будут приведены ссылки на интерфейсы удаленного программирования объектов, доступ к которым разрешен инженеру. В каждой ссылке указан номер объекта и разрешенное время доступа к объекту (например, «Объект №314, доступ к объекту разрешен с 15:55 25.08.2013 до 16:55 25.08.2013»).

\imgcapt{img/CldSrvcs-15-EngineerWebSite.png}{Панель инженера}

Разрешить инженеру доступ к объектам может пользователь Центра охраны, наделенный соответствующим правом, с помощью вкладки «Обслуживание» модуля «Менеджер объектов».

Пройти по какой-либо из указанных в web-интерфейсе ссылке инженер может только в то время, которое разрешено ему для доступа к объекту. При этом он попадает на страницу «Удаленная клавиатура». Здесь представлен интерфейс web-клавиатуры, которая идентична установленной на объекте. Таким образом, интерфейс удаленного программирования реализует поведение реальной клавиатуры, подключенной к прибору. Информация о том, как кнопки дублируются на клавиатуре, приведена в web-интерфейсе справа от клавиатуры.

\imgcapt{img/CldSrvcs-16-EngineerWebSite-02.png}{Web-клавиатура}

Следует отметить, что при возникновении неполадок во время работы с web-клавиатурой, выводится текст ошибки и выполняется переход на главную страницу интерфейса, содержащую список объектов. Например, если web-клавиатура не используется более пяти минут, сеанс связи с объектом завершается. При этом выводится сообщение вида: «Истек период ожидания действий по конфигурированию прибора. Для обеспечения безопасности сеанс связи с объектом №314 завершен».

Если по какой-либо причине нарушено соединение с объектом, клавиатура на объекте выключается. При этом текст ошибки будет следующим: «Истек период ожидания ответа от прибора. Для обеспечения безопасности сеанс связи с объектом №314 завершен».

Если при открытии web-клавиатуры или ее использовании обнаруживается, что объект поставлен под охрану, выводится сообщение вида: «Объект №314 в настоящий момент взят под охрану. Для того чтобы получить доступ к web-клавиатуре объекта, необходимо снять его с охраны».

При завершении работы с web-интерфейсом инженера можно выйти из системы, кликнув по ссылке «Выйти», расположенной на главной панели страницы.

Для последующего входа в web-интерфейс следует пройти по ссылке [keyboard.cnord.net](https://keyboard.cnord.net/) и ввести адрес электронной почты и пароль, созданный при регистрации. После этого необходимо нажать кнопку «Войти». Для восстановления пароля следует воспользоваться ссылкой «Забыли пароль?». В появившемся окне необходимо ввести адрес электронной почты и нажать кнопку «Восстановить пароль». При этом на указанный адрес будет выслано письмо, содержащее ссылку для восстановления пароля.

## Личный кабинет

Облачный сервис «Личный кабинет» позволяет клиентам частного охранного предприятия получать информацию о своих объектах. 

Доступ к «Личному кабинету» предоставляется зарегистрированному в Облаке пользователю, имеющему учетную запись администратора «Личного кабинета».

Создание учетной записи администратора возможно на вкладке «Администраторы ЛК» модуля «Менеджер персонала». Здесь же можно отправить администратору приглашение для регистрации в Облаке. При этом на мобильный номер администратора будет отправлено SMS-сообщение, содержащее адрес страницы для регистрации в «Личном кабинете» ([my.cnord.net](https://my.cnord.net/)) и специальный код для регистрации.

\imgcapt{img/CldSrvcs-17-PersonalAccount.png}{Веб-интерфейс «Личный кабинет»}

Пройдя по указанной в SMS-сообщении ссылке, следует выбрать вкладку «Регистрация». При регистрации необходимо указать адрес электронной почты, создать и подтвердить пароль, а также ввести код, указанный в SMS-сообщении. После ввода данных следует нажать кнопку «Зарегистрироваться».

\imgcapt{img/CldSrvcs-18-PersonalAccount-01.png}{Регистрация в «Личном кабинете»}

На указанный адрес почты будет отправлено письмо, содержащее ссылку для подтверждения регистрации. После перехода по ссылке регистрация будет завершена.

Для входа в «Личный кабинет» следует открыть веб-страницу по адресу [my.cnord.net](https://my.cnord.net/) и ввести указанные при регистрации адрес электронной почты и пароль, после чего нажать на кнопку «Войти».

\imgcapt{img/CldSrvcs-19-PersonalAccount-02.png}{Вход в «Личный кабинет»}

В заголовке «Личного кабинета» отображается название выбранного для работы объекта. Если администратор «Личного кабинета» имеет доступ к нескольким объектам, выбрать тот или иной объект для работы в «Личном кабинете» можно с помощью кнопки выбора объекта.

Предоставить администратору «Личного кабинета» доступ к тому или иному объекту «Центра охраны» можно на вкладке «Личный кабинет» модуля «Менеджер объектов».

На вкладке «Информация по объекту» веб-интерфейса «Личный кабинет» приводится информация, указанная в карточке объекта. В поле «Объект» отображается номер и тип объекта, в поле «Сигнализация» - типы установленной сигнализации. Адрес и комментарий для ГБР, а также телефоны объекта указаны в полях «Адрес», «Телефон 1» и «Телефон 2». В поле «Комментарий» приводится комментарий для оператора. Если объект размещен на карте, здесь также представлена карта с указанием месторасположения объекта.

\imgcapt{img/CldSrvcs-20-PersonalAccount-03.png}{Информация об объекте в «Личном кабинете»}

Вкладка «Отчет о снятиях и взятиях под охрану» содержит сведения о снятиях и взятиях объекта под охрану за выбранный период. Отчет может быть построен за неделю, за текущий месяц, а также за предыдущий месяц. В отчете указывается дата и время события, его тип, а также Ф.И.О. пользователя, выполнившего снятие или взятие под охрану, или номер пользователя.

\imgcapt{img/CldSrvcs-21-PersonalAccount-04.png}{Отчет о снятиях и взятиях под охрану в «Личном кабинете»}

Вкладка «Call-центр» отображается в «Личном кабинете», когда подключен и настроен Телефонный роутер. На вкладке «Call-центр» представлена памятка по работе с данным сервисом. Есл-и на объекте установлена КТС и подключена услуга «Call-центра» по ее проверке или при проверке состояния объектов запрашивается пин-код, на вкладке указаны также пин-коды ответственных лиц.

\imgcapt{img/CldSrvcs-22-PersonalAccount-05.png}{«Call-центр» в «Личном кабинете»}

Если на объекте установлен видеороутер, «Личный кабинет» содержит вкладку «Видеонаблюдение». На вкладке отображается потоковое видео с установленных на объекте видеокамер, подключенных к видеороутеру.

\imgcapt{img/CldSrvcs-23-PersonalAccount-06.png}{Видеонаблюдение в «Личном кабинете»}

[id-13-01]: img/CldSrvcs-01-RouterConnection.png "Подключение Телефонного роутера"
[id-13-03]: img/CldSrvcs-03-SituationalMap.png "Ситуационная карта"
[id-13-03-00]: img/CldSrvcs-03-SituationalMap-00.png "Ситуационная карта: кластер"
[id-13-03-01]: img/CldSrvcs-03-SituationalMap-01.png "Ситуационная карта: объект"
[id-13-03-02]: img/CldSrvcs-03-SituationalMap-02.png "Ситуационная карта: тревожный объект"
[id-13-03-03]: img/CldSrvcs-03-SituationalMap-03.png "Ситуационная карта: свободная ГБР"
[id-13-03-04]: img/CldSrvcs-03-SituationalMap-04.png "Ситуационная карта: ГБР на реагировании"

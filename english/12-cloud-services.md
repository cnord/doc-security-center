# Cloud Services {#cloud-services}

The cloud is an infrastructure software and hardware complex. It provides services to improve the quality of services offered by the private security company.

"Alarm to Guard" is also a cloud service. This application provides fast interaction between the Security Center operator and Guard employees. Besides, it allows the Guard to get the necessary information about the site and its status.

In addition to these services, various web-interfaces are available. For example, with the help of the "Partner interface" a private security company can manage the Cloud services. It is possible to configure one of the cloud services, for example, "Alarm to Guard."

The "Engineer Interface" displays a site available for control and provides the ability to remotely control the equipment on it.

The Security Center user can select one of the modes of operation with cloud services, depending on the degree of integration with the Cloud. Full integration allows to use all cloud services. Partial means only a service that provides remote access to equipment on a site. By prohibiting transfer of any data to the Cloud, the user refuses to use all cloud services.

## Call center

### Getting Information about Site Status

The service "Get information about site status" provided by the "Call Center" allows to check the status of the protected site. This service can be enabled in the administrator panel of the partner account.

It is necessary to make sure that the site is in the expected state for various reasons. In particular, the site may not be armed due to a malfunction of the security equipment or due to a communication channel failure. When using GPRS or GSM connection, the SIM card money may run out.

To check the site status, the client of the private security company shall call the special company number. After that, he/she can independently select the service "Get information about site status" using the voice menu, enter the site number and, if necessary, a PIN code. The client of the private security company can get the PIN code in the "Personal account" of the partner, and the Security Center operator - in the "Site manager" on the "Responsible persons" tab.

![Selection of services when calling to "Call Center"][id-13-02]

The PIN code shall be requested to increase the level of security for maintaining confidential information about the site status. It is possible to enable the PIN request for calls about the status of the protected site in the control panel of the partner account.

Due to the cloud service "Call Center" the number of calls transferred to the operator is reduced. This is especially important during peak hours, when employees of enterprises come or go from work, arming or disarming sites, respectively. Automatic handling of calls to confirm arming and disarming allows the Security Center operators to performs their primary duties, namely, handling alarms.

### Panic button check

The panic button is installed in jewelry salons, pawnshops, banks, cafes, pharmacies and many other enterprises. In this case, the private security company makes a contract, which specifies the frequency of the mandatory check of the panic button by the client of the private security service: for example, once a day. 

The "Panic button check" service provided by the "Call Center" can be used to check the panic button serviceability. This service can be enabled in the administrator panel of the partner account.

To check the panic button, the client shall call the special number of the company. After that, he/she can independently select the service "Panic button check" using the voice menu, enter the site number and PIN. The client of the private security company can get the PIN code in the "Personal account" of the partner, and the Security Center operator - in the "Site manager" on the "Responsible persons" tab.

After that, the client shall press the panic button. If it works, an alarm signal is sent to the Security Center, which is automatically canceled due to the "Test" cause. In this case, the "Call Center" informs the client about the serviceability of the panic button, and the alarm log is recorded in the event log.

## Partner’s Web-Interface

The private security company can use the administrator panel to configure the cloud services after registering partner account in the Cloud. 

### Partner Account Registration

To register a partner in the Cloud, open web page at https://cloud.cnord.net. The page contains a brief background on cloud services that can be configured in the administrator panel. 

![Partner web-interface][id-13-04]

To create an account, select the "Partner Registration" tab. Enter the partner's email address in the field "E-mail", and unique identifying number of the installed Security Center in the "UID" field of the Security Center.

![Partner registration][id-13-05]

Start the "Event Manager" to get the UID of the Security Center. After that, open the drop-down menu by clicking on the icon of the module that appeared in the system tray of the Windows task bar. Select the "Connection to the cloud..." menu item. 

![Connection to the cloud][id-13-06]

The window of the same name opens with the "UID" tab of the Security Center. Copy the Security Center UID for the subsequent insertion of the number in the browser field. To do this, click on the "Copy" icon near the "UID" field.

![UID copying][id-13-07]

After entering the necessary information on the registration page of the partner account, click the "Register" button. 

A letter will be sent to the e-mail specified at registration. To complete the registration, confirm the e-mail address by following the link in the letter. 

During the first authorization, a form will appear on the site, which shall be filled in. Check and, if necessary, change the contact information specified when registering the Security Center. Namely: name and surname, as well as the partner's mobile phone; name, city and address of the organization. Besides, it is proposed to create and confirm a password to enter the partner's account.

### Partner Account Re-Registration

If it is necessary to create a new partner account instead of an existing one, it is possible to re-register. For example, use this function if you lose your the partner registration information. Also, it is possible to re-register to ensure data protection when the administrator of the account is dismissed.

To re-register, create a new UID. This can be done in the window "Connection to the cloud..." on the "UID" tab of the Security Center. Thus, in this window it is possible not only to get information about the UID of the Security Center, but also create a new UID. 

![Creating a new UID][id-13-08]

To do this, click on the "Create a new UID" button. The Security Center will be automatically deleted from the partner account control panel. Use the new UID to add this Security Center to another account or create a new partner account.  

It is allowed to create a new UID no more than once a day. When using the Call Center service after changing the UID of the Security Center, also change the UID in the telephone router.

Important: UID change is possible when the connection to the Cloud is made and when TCP ports 80 and 443 are opened for the computer on which the "Site manager" module is running.

### Login to Partner Account

To log in to an account of an already registered partner on the https://cloud.cnord.ru/ web- page, select the "Log in" tab. Shall enter the e-mail address in the "E-mail" field and the password specified after the partner registration in the "Password" field.

![Login to partner account][id-13-09]

To exit the account, click on the "Log out" link located in the panel at the top of the window.

### Management of Security Centers

The partner control panel contains information about the Security Center, specified when registering the Security Center in the Cloud. If necessary, it is possible to add a new Security Center by clicking the "Add Security Center" button. In this case, the form of the same name opens, in which you need to enter the UID of the Security Center registered in the Cloud and click the "Add" button. 

If the UID belongs to the Security Center, not yet associated with the partner, then it will be assigned to this partner. In the opposite case, it is recommended to change the UID of the installed Security Center.

To delete the Security Center, click on the "Cart" icon near the security center and confirm the deletion.

### Setting up Cloud Services {#cloud-services-settings}

The administrator panel provides information about the added Security Centers. Namely: name and address of the organization, as well as e-mail and telephone number of the Security Center administrator. 

![Administrator panel of the partner account][id-13-10]

For each Security Center it is possible to configure the "Call Center" service. First, connect a telephone router. Click on the corresponding link to read the instruction on its connection. To leave an order to purchase a telephone router, use the same link. 

If the telephone router is connected, open the "Call Center setup" window in the "Call Center" section. The window is intended for selecting the services of the "Call Center": confirmation of disarming or arming (without requesting a PIN code or only upon requesting a PIN code), panic button check (upon requesting a PIN code). Besides, it is possible to download a welcome file in WAV format, or set a standard greeting. The download file size shall not exceed 10 MB.

![Setting the "Call Center" service in the partner account][id-13-11]

Send statistics on the usage of the Call Center service to the e-mail of the partner's administrator. The statistics is generated in Microsoft Excel format over a certain period: current or previous day, current or past week, current or previous month. The statistics shows the number of calls and the average duration of all calls, status test calls, panic button checks, calls with switching to operators, and the average duration of hanged up calls.

To know and, if necessary, change passwords to the mobile application go to "Alarm to Guard" section.

![Passwords to the "Alarm to Guard" application][id-13-12]

Besides, it is possible to configure the "Personal account" in the control panel. To do this, fill in the name of a private security company, link to the site, telephone number for technical support, and technical support email. This information will be displayed in the client account.

![Setting up the "Personal account" service in the partner account][id-13-13]

Three links to situational maps are given in "Situational map" section. Links can be conveniently copied for later transmission to different responsible persons using the special function "Copy to clipboard". Therefore, it is no necessary to log in to go to the link. 

![Setting up the "Situational chart" service in the partner account][id-13-14]

The "Comment" field for each link is intended for specifying the necessary information: for example, it is possible to specify who uses this link to access the situational map. 

If it is necessary to block any responsible person to access the map by the link, the link can be updated. In this case, in case of clicking on the outdated link, the map will be unavailable, and if the link has already been opened in the browser, the data will no longer be updated.

## Engineering Panel

The "Engineering panel" application is intended for remote configuration of equipment installed on the site, as well as for updating the software version of the devices.

In order for the engineer to remotely change the settings, one of the following devices shall be installed on the site:

* **Nord GSM** or **Nord GSM WRL**
* **Nord GSM Mini** or **Nord GSM Air**
* **Soyuz GSM**
* **TR-100 GSM IV**

In order for an engineer to access the service, an account shall be created for him/her. 

It is possible to create engineer account on the "Engineers" tab of the "Personnel manager" module. When creating an account, an email is sent to the engineer's email address. The engineer shall click on the link in the letter and create and confirm the password for accessing the "Engineering panel" on the page that opens. After entering the data, it is necessary to click the "Register" button to complete the registration in the Cloud.

In order for the Security Center operator to create an account for the engineer or change its settings, he/she shall be given permission to edit the engineers.

After successful registration, a link will be displayed on the page to the main page of the "Engineering panel". On this page, links to remote programming interfaces of sites will be given in "Available sites", access to which is allowed to the engineer. Each link specifies the site number and the allowed access time to the site (for example, "Site No. 314, access to the site is allowed from 15:55 25.08.2013 till 16:55 25.08.2013").

![Engineering panel][id-13-15]

The Security Center user, who has the corresponding permission, can grant the engineer access to sites using the "Maintenance" tab of the "Site manager" module. 

The engineer can go to any of the links specified in the web interface only at the time that is allowed to him/her to access the site. At the same time, he/she enters the "Remote keyboard" page. The page contains the interface of the web-keyboard, which is identical to the one installed on the site. Thus, the remote programming interface implements the behavior of the real keyboard connected to the device. Information on how the buttons are duplicated on the keyboard is shown in the web interface to the right of the keyboard. 

![Web keyboard][id-13-16]

It shall be noted that if an error occurs while working with the web keyboard, the error text is displayed and the interface goes to the main page with a list of sites. For example, if the web keyboard is not used for more than five minutes, the communication session with the site is completed. At the same time, the following message is displayed: "The waiting period for actions to configure the device has expired. To ensure security, the communication session with site No. 314 is completed".

If the connection to the site is lost for any reason, the keypad on the site is disabled. In this case, the error text is as follows: "The waiting period for the response from the device has expired. To ensure security, the communication session with site No. 314 is completed".

If when the web keyboard is opened or used it turns out that the site is armed, the following message is displayed: "Site No. 314 is currently armed. To access the web keyboard disarm the site".

After the work is finished, the engineer shall exit the system by clicking on the "Exit" link located on the main panel of the page.

To log in to the web-interface, go to https://keyboard.cnord.net/ and enter the e-mail address and password created at registration. After that, click the "Login" button. To recover a password, click on the link "Forgot your password?". In the appeared window it is necessary to enter the e-mail address and press the button "Restore password". At the same time, a letter containing a link for password restoration will be sent to the specified address.

## Personal Account

The "Personal account" Cloud service allows clients of a private security company to receive information about their sites. 

Access to "Personal account" is provided to a user registered in the Cloud who has an account of the Administrator of the "Personal account". 

It is possible to create an administrator account on the "Administrators of personal account" tab of the "Personnel manager" module. Here it is possible to send an invitation to register in the Cloud to an administrator. At the same time, an SMS message will be sent to the mobile number of the administrator, containing a link to the page for registration in the Personal Account (https://my.cnord.net/) and a special code for registration.

!["Personal account" web interface][id-13-17]

Click on the link specified in the SMS message and select the "Registration" tab. When registering, specify the email address, create and confirm a password, and enter the code specified in the SMS message. After entering the data, click on the "Register" button.

![Registration in the "Personal account"][id-13-18]

A letter containing a link to confirm registration will be sent to the specified mail address. After clicking on the link, registration will be completed.

To enter the "Personal account", open the web page at https://my.cnord.net/ and open the "Login" tab. Here it is necessary to enter the e-mail address and password specified during registration and click "Login".

!["Login to the "Personal account"][id-13-19]

The "Personal account" title displays the name of the selected site. If the administrator of the "Personal account" has access to several sites, it is possible to select a site to work in the "Personal account" using the site selection button.

It is possible to give the administrator of the "Personal account" access to a particular site of the Security Center on the "Personal account" tab of the "Site manager" module.

The "Site information" tab of the "Personal account" web interface contains the information, specified in the site card. The "Site" field displays the number and type of the site, the "Alarm" field - the types of the installed alarm. The address and commentary for the Guard, as well as site telephone numbers are indicated in the fields "Address", "Phone 1" and "Phone 2". The "Comment" field contains a comment for the operator. If the site is located on the map, here is also a map showing the location of the site.

![Information about the site in the "Personal account"][id-13-20]

The "Report on arming and disarming" tab contains information on the arming and disarming of the site over the selected period. The report can be generated for a week, current month, and also the previous month. The report contains the date and time of the event, its type, and also name, surname of the user who performed arming or disarming, or the user number.

![Report on arming and disarming in the "Personal account"][id-13-21]

The "Call Center" tab is displayed in the "Personal account" when the telephone router is connected and configured. A memo for working with this service can be found on the "Call Center" tab. If a panic button is installed on the site and the "Call Center" service is activated to check it, or if a PIN code is requested when checking the status of sites, the PIN codes of responsible persons are also indicated on the tab.

!["Call Center" in "Personal account"][id-13-22]

If a video router is installed on the site, the "Personal account" contains the "Video surveillance" tab. The tab displays streaming video from the cameras installed on the site and connected to the video router.

![Video surveillance in "Personal account"][id-13-23]

It is also possible to use the "Personal account" cloud service on mobile devices using the "MyAlarm" application. Download links can be found on the login page of the "Personal Account" at https://my.cnord.net/.

[id-13-01]: img/CldSrvcs-01-RouterConnection.png "Telephone router connection"
[id-13-02]: img/CldSrvcs-02-CallCenterServices.png "Selection of services when calling to "Call Center""
[id-13-03]: img/CldSrvcs-03-SituationalMap.png "Situational map"
[id-13-03-00]: img/CldSrvcs-03-SituationalMap-00.png "Situational map: cluster"
[id-13-03-01]: img/CldSrvcs-03-SituationalMap-01.png "Situational map: site"
[id-13-03-02]: img/CldSrvcs-03-SituationalMap-02.png "Situational map: alarm site"
[id-13-03-03]: img/CldSrvcs-03-SituationalMap-03.png "Situational map: free Guard"
[id-13-03-04]: img/CldSrvcs-03-SituationalMap-04.png "Situational map: Guard is on response"
[id-13-04]: img/CldSrvcs-04-WebSite.png "Partner web-interface"
[id-13-05]: img/CldSrvcs-05-Registration.png "Partner registration"
[id-13-06]: img/CldSrvcs-06-CloudConnection.png "Connection to the cloud"
[id-13-07]: img/CldSrvcs-07-UIDCopying.png "UID copying"
[id-13-08]: img/CldSrvcs-08-NewUID.png "Creating a new UID"
[id-13-09]: img/CldSrvcs-09-Login.png "Login to partner account"
[id-13-10]: img/CldSrvcs-10-AdminPanel.png "Administrator panel of the partner account"
[id-13-11]: img/CldSrvcs-11-CallCenter.png "Setting the "Call Center" service in the partner account"
[id-13-12]: img/CldSrvcs-12-AlarmPassword.png "Passwords to the "Alarm to Guard" application"
[id-13-13]: img/CldSrvcs-13-PrivateOffice.png "Setting up the "Personal account" service in the partner account"
[id-13-14]: img/CldSrvcs-14-SituationalMapLink.png "Setting up the "Situational chart" service in the partner account"
[id-13-15]: img/CldSrvcs-15-EngineerWebSite.png "Engineering panel"
[id-13-16]: img/CldSrvcs-16-EngineerWebSite-02.png "Web keyboard"
[id-13-17]: img/CldSrvcs-17-PersonalAccount.png ""Personal account" web interface"
[id-13-18]: img/CldSrvcs-18-PersonalAccount-01.png "Registration in the "Personal account""
[id-13-19]: img/CldSrvcs-19-PersonalAccount-02.png ""Login to the "Personal account""
[id-13-20]: img/CldSrvcs-20-PersonalAccount-03.png "Information about the site in the "Personal account""
[id-13-21]: img/CldSrvcs-21-PersonalAccount-04.png "Report on arming and disarming in the "Personal account""
[id-13-22]: img/CldSrvcs-22-PersonalAccount-05.png ""Call Center" in "Personal account""
[id-13-23]: img/CldSrvcs-23-PersonalAccount-06.png "Video surveillance in "Personal account""

# Cloud Services {#cloud-services-2}

The cloud is an infrastructure software and hardware complex. It provides services to improve the quality of services offered by the private security company.

<!-- "Alarm to Guard" is also a cloud service. This application provides fast interaction between the Security Center operator and Guard employees. Besides, it allows the Guard to get the necessary information about the site and its status.

In addition to these services, various web-interfaces are available. For example, with the help of the "Partner interface" a private security company can manage the Cloud services. It is possible to configure one of the cloud services, for example, "Alarm to Guard." -->

The "Engineer Interface" displays a site available for control and provides the ability to remotely control the equipment on it.

The Security Center user can select one of the modes of operation with cloud services, depending on the degree of integration with the Cloud. Full integration allows to use all cloud services. Partial means only a service that provides remote access to equipment on a site. By prohibiting transfer of any data to the Cloud, the user refuses to use all cloud services.

<!-- ## Call center

### Getting Information about Site Status

The service "Get information about site status" provided by the "Call Center" allows to check the status of the protected site. This service can be enabled in the administrator panel of the partner account.

It is necessary to make sure that the site is in the expected state for various reasons. In particular, the site may not be armed due to a malfunction of the security equipment or due to a communication channel failure. When using GPRS or GSM connection, the SIM card money may run out.

To check the site status, the client of the private security company shall call the special company number. After that, he/she can independently select the service "Get information about site status" using the voice menu, enter the site number and, if necessary, a PIN code. The client of the private security company can get the PIN code in the "Personal account" of the partner, and the Security Center operator - in the "Site manager" on the "Responsible persons" tab.

\imgcapt{img/CldSrvcs-02-CallCenterServices.png}{Selection of services when calling to Call Center}

The PIN code shall be requested to increase the level of security for maintaining confidential information about the site status. It is possible to enable the PIN request for calls about the status of the protected site in the control panel of the partner account.

Due to the cloud service "Call Center" the number of calls transferred to the operator is reduced. This is especially important during peak hours, when employees of enterprises come or go from work, arming or disarming sites, respectively. Automatic handling of calls to confirm arming and disarming allows the Security Center operators to performs their primary duties, namely, handling alarms.

### Panic button check

The panic button is installed in jewelry salons, pawnshops, banks, cafes, pharmacies and many other enterprises. In this case, the private security company makes a contract, which specifies the frequency of the mandatory check of the panic button by the client of the private security service: for example, once a day.

The "Panic button check" service provided by the "Call Center" can be used to check the panic button serviceability. This service can be enabled in the administrator panel of the partner account.

To check the panic button, the client shall call the special number of the company. After that, he/she can independently select the service "Panic button check" using the voice menu, enter the site number and PIN. The client of the private security company can get the PIN code in the "Personal account" of the partner, and the Security Center operator - in the "Site manager" on the "Responsible persons" tab.

After that, the client shall press the panic button. If it works, an alarm signal is sent to the Security Center, which is automatically canceled due to the "Test" cause. In this case, the "Call Center" informs the client about the serviceability of the panic button, and the alarm log is recorded in the event log. -->


## Engineering Panel

The "Engineering panel" application is intended for remote configuration of equipment installed on the site, as well as for updating the software version of the devices.

In order for the engineer to remotely change the settings, one of the following devices shall be installed on the site:

* **Nord GSM** or **Nord GSM WRL**
* **Nord GSM Mini** or **Nord GSM Air**
* **Soyuz GSM**
* **TR-100 GSM IV**

In order for an engineer to access the service, an account shall be created for them. 

It is possible to create engineer account on the "Engineers" tab of the "Personnel manager" module. When creating an account, an email is sent to the engineer's email address. The engineer shall click on the link in the letter and create and confirm the password for accessing the "Engineering panel" on the page that opens. After entering the data, it is necessary to click the "Register" button to complete the registration in the Cloud.

In order for the Security Center operator to create an account for the engineer or change its settings, he/she shall be given permission to edit the engineers.

After successful registration, a link will be displayed on the page to the main page of the "Engineering panel". On this page, links to remote programming interfaces of sites will be given in "Available sites", access to which is allowed to the engineer. Each link specifies the site number and the allowed access time to the site (for example, "Site No. 314, access to the site is allowed from 15:55 25.08.2013 till 16:55 25.08.2013").

\imgcapt{img/CldSrvcs-15-EngineerWebSite.png}{Engineering panel}

The Security Center user, who has the corresponding permission, can grant the engineer access to sites using the "Maintenance" tab of the "Site manager" module. 

The engineer can go to any of the links specified in the web interface only at the time that is allowed to him/her to access the site. At the same time, he/she enters the "Remote keyboard" page. The page contains the interface of the web-keyboard, which is identical to the one installed on the site. Thus, the remote programming interface implements the behavior of the real keyboard connected to the device. Information on how the buttons are duplicated on the keyboard is shown in the web interface to the right of the keyboard.

\imgcapt{img/CldSrvcs-16-EngineerWebSite-02.png}{Web keyboard}

It shall be noted that if an error occurs while working with the web keyboard, the error text is displayed and the interface goes to the main page with a list of sites. For example, if the web keyboard is not used for more than five minutes, the communication session with the site is completed. At the same time, the following message is displayed: "The waiting period for actions to configure the device has expired. To ensure security, the communication session with site No. 314 is completed".

If the connection to the site is lost for any reason, the keypad on the site is disabled. In this case, the error text is as follows: "The waiting period for the response from the device has expired. To ensure security, the communication session with site No. 314 is completed".

If when the web keyboard is opened or used it turns out that the site is armed, the following message is displayed: "Site No. 314 is currently armed. To access the web keyboard disarm the site".

After the work is finished, the engineer shall exit the system by clicking on the "Exit" link located on the main panel of the page.

To log in to the web-interface, go to [keyboard.cnord.net](https://keyboard.cnord.net/) and enter the e-mail address and password created at registration. After that, click the "Login" button. To recover a password, click on the link "Forgot your password?". In the appeared window it is necessary to enter the e-mail address and press the button "Restore password". At the same time, a letter containing a link for password restoration will be sent to the specified address.


[id-13-01]: img/CldSrvcs-01-RouterConnection.png "Telephone router connection"
[id-13-03]: img/CldSrvcs-03-SituationalMap.png "Situational map"
[id-13-03-00]: img/CldSrvcs-03-SituationalMap-00.png "Situational map: cluster"
[id-13-03-01]: img/CldSrvcs-03-SituationalMap-01.png "Situational map: site"
[id-13-03-02]: img/CldSrvcs-03-SituationalMap-02.png "Situational map: alarm site"
[id-13-03-03]: img/CldSrvcs-03-SituationalMap-03.png "Situational map: free Guard"
[id-13-03-04]: img/CldSrvcs-03-SituationalMap-04.png "Situational map: Guard is on response"
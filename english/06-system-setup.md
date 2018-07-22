# System Setup

The "System setup" module is intended to change the service directories of the Security Center, for example, event templates or site types.

## Event Classes

In the Security Center software, the created events are divided into several types:

* Alarm
* Warning
* Arming
* Disarming
* Fault
* Restore
* Exception
* Test
* Other 
* Alarm reset

The event type determines the handling. For example, events of the "Alarm" type require obligatory operator’s actions, called alarm handling. Besides, alarms, which handling is not started or completed, change the current status of sites. When handling events that have the "Arming" or "Disarming" type, the site status also changes.

The list of event types is predefined and cannot be changed by the user. Event classes are intended to group the events and manage them. The event class defines its type, in this case it is possible to create several classes with the "Alarm" type and define individual action lists and cancellations for each alarm.

!["Event classes" tab][id-06-01]

Use the "Event classes" tab to change the list of used event classes. 

To save the changes made on this tab, the user shall have the "Edit event classes" permission for the "System setup" module.

The event class defines the appearance of the event in the list of received events of the "Duty operator" module. Color, font, background color - all these properties of the event class can be changed in the "System setup" module.

In addition to the attributes responsible for displaying events, it is possible to specify an audio file that will be played when an event is received.

For event classes of the "Alarm" type, there are action lists and cancellations, which the operator can register during alarm handling. It is important that it is possible to define not only the list of actions, but also their sequence during display. 

Since event classes define appearance, sound and alarm script, the Security Center ensures that these parameters remain unchanged for already registered events. In other words, any changes and even deletion of event classes do not affect events that are already accepted and registered in the database. If the color or size of the font, used to display the event or the type of the event, is changed, these changes will only apply to new events, those that will be registered in the database after the changes are made.

#### Replacing Event Class
If the Security Center has been in operation for a long time, then there is a possibility that the list of event classes is littered. For example, it contains duplicate classes or information about classes that are no longer used. However, it is impossible to remove these classes, because there are events that are described by these classes. To cope with this problem, it is possible to replace duplicates or unused event classes with their current analogs.
To replace the obsolete event class with the one currently in use, use the "Replace..." button. 

!["Replace event class" window][id-06-02]

In the window that appears, select the event class that will be used instead of the replaced one, and also specify the need to delete the event class that is being replaced.

## Event Templates

The same event that occurred on the site can be transmitted to the Security Center in different ways. The notification format, in which information about the event will be received, depends on the type of the transmitting equipment and communication channel. 

An event template is a list of events that can be received when decoding notifications from a site.

The event template is an integral characteristic of the site. It is possible to specify the event template that shall be used for the site in the "Site manager" module.

!["Event templates" tab][id-06-03]

Use the "Event templates" tab to change the list of templates used by the Security Center. Besides, it is possible to change the description of the events in the template.

To save the changes made on this tab, the user shall have the "Edit event templates" permission for the "System setup" module.

Changes that are made to the description of the template events on the System setup tab affect all sites that use this event template. It is strongly recommended not to make changes to the site event template without a valid reason.

It is impossible to delete the event template used in site description. If the template that the user wants to delete is used as an event template for a site, the attempt to delete will be completed with an error.

#### Replacing Event Template

It shall be noted that the quality of the event templates supplied with the Security Center is constantly improving, that is why when describing sites it is recommended to use the latest versions of the event templates.
To replace the obsolete template for sites with another, more relevant, use the function of replacing event templates. 
To replace the obsolete event template with the one currently in use, use the "Replace..." button. 

!["Event template replacing" window][id-06-04]

In the window that appears, select an event template that shall be used instead of the replaced one, and also specify the need to delete the obsolete event template.


#### Event Editing

If you change the template events, changes to the database are saved immediately after the user has made changes to the template event. It is not possible to undo changes. 

When creating a new event or changing an existing event, it is possible to specify all event attributes in the "Edit event" window.

!["Edit event" window][id-06-05]

* "Receive channel type" - when decoding an event, it is important which channel was used when it was received by the Security Center. For example, the same event code can be decoded in different ways, for events received via radio and phone. If the event code is defined for both specific communication channels and for "Any" communication channel, the decoding for the "Any" communication channel is applied only if the decoding for a specific communication channel is not found. 

* "Event code" is the significant part of the message sent from the site. It is the code that identifies the change that has occurred to the control panel on the site. Event codes can be of different lengths, it depends on the format (protocol) and communication channel used during information transmission from the site device to the central station. The Security Center supports event codes up to 25 characters in length.

* "Event class" is an event class that will be mapped to the received code when decoding an event. The event class defines the appearance of the event in the event list, as well as a list of possible actions for handling, if the event class is "Alarm".

* "Part number" is an attribute that can be used to further identify the event during decoding. If the protocol of exchange with the site device contains the number of the part to which the event relates, then the event will be identified not only by the code and the receiving channel, but also by the part number. Besides, the part number is used when generating the event description automatically: if the part number is not a zero, and the event description contains the macro `%part%`, then instead of the macro, the description of the site part corresponding to the part number received from the site will be inserted.

* "Zone/User" is an attribute that can be used depending on how the informative format (protocol) is used to transmit information from the control panel to the Security Center. 

> Let’s suppose that the panel, when transmitting to the station, uses the ContactID protocol, which, among other things, sends the number of the tripped zone or the number of the user who performed the site disarming. In this case, the Security Center ignores the zone or user number specified in the event description and always uses the value received from the panel: the zone number, which was sent from the panel, will be used to decode the event. 

> Now let’s consider the situation when the panel, when transmitting to the station, uses the EPAF protocol, in which only the site number and event code are transmitted. The zone or user numbers are not explicitly transmitted, but the relationship between the event code and zone or user number is known. In this case, the zone or user number is specified in the event template - according to the event code, and it is the value specified in the template that will be used to form the event description.

> As an example, let’s consider an alarm message in the first zone transmitted via different protocols. In the ContactID protocol, this message will be transmitted in the form of E130 code and zone number 1. When forming the description, the Security Center will immediately perform the substitution of the description of the first zone in the event description. While in the EPAF protocol the same message will be transmitted only in the form of AA code and to get the number of the zone corresponding to this code, the Security Center will have to look into the event template.

* "Event description" is an arbitrary text string describing the event. 
	
> When describing events, it is recommended to use the macros `%user%` and `%zone%`. If a macro is found in the description of the event during its decoding, a value corresponding to the name of the zone (macro `%zone%`) or the name of the responsible person (macro `%user%`) will be inserted in the description. In this case, the zone or user number will be taken from the event itself. 
	
> Information about zones and responsible persons on the site is very important. It is possible to enter this information for the site in the "Site manager" module.

## Actions {#system-setup-actions}

!["Actions" tab][id-06-06]

The "Actions" tab is intended for changing the list of actions that an operator can register during alarm handling.

To save the changes made on this tab, the user shall have the "Edit operator actions" permission for the "System setup" module.

The following types of actions are defined in the Security Center software:

* "Call a guard" - when registering this type of action, the operator will have to specify the guard that was called to the site. If a guard has been called to the site, then the site alarm can be canceled only after the guard's arrival to the site or the cancellation of its call is registered. The list of guards used by the Security Center can be changed in the "Personnel manager" module.

* "Guard arrival" - action of the "Guard arrival" type is available for registration only after the guard call to the site is registered. When registering an action with the "Guard arrival" type, the operator will have to select the guard, the arrival of which he/she is registering.

* "Guard call cancellation" - registration of cancellation of a guard call is available only after its call to the site is registered. When registering a call cancellation, the operator will have to select the guard which call cancellation is being performed by the operator.

* "Operator's comment" - this type of action allows the operator to enter arbitrary text associated with the alarm handling. Actions of this type can be registered at any stage of alarm handling. It is recommended to include this type of action in action lists for all alarms that are available in the Security Center.

* "Reclosing request" - this type of action allows the operator to automatically inform the responsible persons about the need to reclose the site. When registering this type of action, SMS message is sent to the responsible persons, for whom an alert about reclosing request is set in the "Site manager" module. The SMS contains the number, name and address of the site to be opened, inspected and reclosed once the cause of the alarm has been eliminated.

* "Reclosing failure" - this type of action allows the operator to automatically inform the responsible persons about the refusal of the person responsible to reclose. When registering an action of this type, the operator shall select the responsible person of the site who has refused to come for reclosing. List contains only those responsible persons, who are notified about the need to reclose according to the "Site Manager" module setting. In this case, the full name the responsible person, who refused to reclose, is displayed in the "Note" field when the action is written to the event log. When registering this type of action, SMS message is sent to the responsible persons, for whom an alert about reclosing refusal is set in the "Site manager" module. The SMS contains the name of the responsible person, who refused to reclose, as well as the site number, name and address.

* "Other" - actions of the "Other" type are informational in nature and are used for quick registration of actions often used during alarm handling (call to the responsible person, call to police, etc.). Actions of this type can be registered at any stage of alarm handling.

The list of actions with the "Other" type is recommended to be constantly updated, so that they correspond to the tactics of the guard used at the moment. A good source for new actions with the "Other" type can be registered operator comments.

Action of any type can be made mandatory for execution during alarm handling. To do this, select the action in the list and check the "Mandatory action" box.

## Alarm Cancellations

!["Alarm cancellation" tab][id-06-07]

Use the "Alarm cancellation" tab to edit the list of reasons recorded when canceling alarms.

To save the changes made on this tab, the user shall have the "Edit alarm cancellations" permission for the "System setup" module.

The list of available alarm cancellations is closely related to the site protection tactics and is of great importance in analyzing the company performance.

The Security Center software contains several analytical reports ensuring evaluation of the most common causes for canceling alarms, including in the context of sites. 
To use these reports, it is necessary to maintain a list of cancellations of alarms in the current state and clearly regulate the use of each cancellation in the operator’s instructions.

## Site Types

!["Site types" tab][id-06-08]

The "Site types" tab is used to manage the list of site types. 

To save the changes made on this tab, the user shall have the "Edit site types" permission for the "System setup" module.

The site type is a mandatory property of a site. The site type is used for the convenience of organizing (sorting, grouping) the list of sites, for example, when viewing site properties or creating reports. It is possible to specify the type for a site in the "Site manager" module.

## Site fields

!["Site fields" tab][id-06-09]

Use the "Site fields" tab to change the list of additional fields that will be available when filling the site card.

To save the changes made on this tab, the user shall have the "Edit site fields" permission for the "System setup" module.

When creating a list of fields, it is possible to set their sequence when they are displayed in the site card.

If the values of a field are a list of previously known values, then it is possible to fill this list by specifying the appropriate type for the field. In this case, the list of values does not limit the ability to specify a value for the site field manually, if necessary.

There are two fields in the list of site fields, for which it is recommended to change only the list of possible values. These fields are "*Customer part equipment" and "*Customer zone equipment". As their names suggest, they are intended so that it was more convenient to fill in the values for the "Equipment" field when editing parts and zones of sites in the "Site manager" module.

[id-06-01]: img/syssetup-03.png ""Event classes" tab"
[id-06-02]: img/syssetup-03-01.png ""Replace event class" window"
[id-06-03]: img/syssetup-01.png ""Event templates" tab"
[id-06-04]: img/syssetup-01-01.png ""Event template replacing" window"
[id-06-05]: img/syssetup-01-02.png ""Edit event" window"
[id-06-06]: img/syssetup-04.png ""Actions" tab"
[id-06-07]: img/syssetup-05.png ""Alarm cancellation" tab"
[id-06-08]: img/syssetup-02.png ""Site types" tab"
[id-06-09]: img/syssetup-06.png ""Site fields" tab"

## Object Manager

“Object Manager” module is designed to manage description of objects available in the “Security Center” software.

### Object

In the “Object” tab you can specify basic descriptive information about an object: number, name, address, phone numbers, etc.

### Parts

“Parts” tab allows you save information about sections (areas) into which an object is divided and what equipment is used to arrange sections of an object. 

The list of equipment installed in the section can be modified in the “System Setup” module – in the “Fields of Objects” tab, “*Object part equipment” field.

It should be noted that the description of sections at objects mechanism allows you to fulfill the following tasks :

* Parts identified by their serial numbers. 
This is actual for panels which support function of loops integrating into independent sections and for which the “Contact ID protocol” is “native”.

* Areas identified by object numbers. 
This option is necessary for panels which do not use the “Contact ID protocol” to transmit information to monitoring center but support loops integration into independent areas each one of which has its own number of object.

* Objects which use different numbers when working over different communication channels. 
Such situation is possible in case when additional communicators (e.g. radio transmitters) are installed at already equipped objects but numbers of objects at which they are installed are already used in radio channel. In this case you can program a panel in such a way that different object numbers would be used by phone and by radio by means of having these numbers been described as object sections.

### Zones  

In the “Zones” tab you can give detailed description of object security lines including information about equipment being used and membership of loops in the object sections.

The list of equipment installed in a loop can be modified in the “System Setting” module – in the “Fields of Objects” tab, “Object zone equipment” field.

Information about zones is very important part of object description as it is used when generating descriptions of events received form an object. Thus, if event about alarm in the loop number one is received from an object then the description of loop number one from an object card is inserted in the event description which would be created for handling by the “Security Center” operator. 

### Persons in charge

The “Persons in charge” is designed for entering information about persons in charge of an object: names, addresses, phone numbers. We recommend you to include in the persons in charge list the users who possess personal code of object putting under and taking off from guarding, and additionally, user code number programmed in the panel should correspond to a responsible person number. In this case (as with loops) the information about user who has executed putting under or taking off from guarding will be included in the description of an event handled by the “Security Center” operator.

### Security

In the “Security” you can modify parameters connected with rules and mode of object security.
**Place under long-term arm**. The field is designed to switch on long-term security mode of object and to specify operating time of this mode. The long-term security mode is intended to control situations when object for some reasons is to be (or should be) under guard for a long time. 

Control of long-term security of object is implemented as follows: 
* at start time of long-term security the fact of putting object under guard is checked. 
* if the object is not under guard system event with ZZXC code is created. In case when the object continues to be not under guard the system event with ZZXC code is repeated at intervals specified in the “Event Manager’ settings. 
* If during the interval specified as long-term security time the object is removed from guard the system event with ZZXE code is created, after which long-term security cycle accordingly begins again with generation of system event with ZZXC code and with waiting for object arming.

**Turn off Object**.  The field is intended to turn off an object starting from some time. If the object is turned off the events which have been received from it are processed as follows:

* First, when these events are received the “Duty Operator” turns off accompanying sound. I.e., all events continue to be displayed, events with class types of “Arming” and “Disarming” continue to change object status but there is no sound when events from this object are received.
* Secondly, when events with the “Alarm” class type are received the system (specifically – Event Manager) creates cancellation for them. In other words, if an object is turned off, and an alarm comes from it then in addition to lack of alarm sound this alarm is also automatically cancelled.

**Automatically Turn on Object**. In case when an object is turned off this property permits to turn it on automatically at specified time.

### Control time

The “Control Time” tab is designed to manage one of the most important object performance control parameters.

Object control time identifies time interval during which any event should be received from the object. Any event means that an event may be received over any of communication channels (e.g. radio, phone), and may be system event. In case when no event is received during interval system event with ZZXA code is created. 

Object control time setting can be made so that all communication channels used by object will be tracked separately. 

### Security schedule

In the “Security Schedule” tab you can specify for each day of week time periods when an object has to be under guard and also turn on control of this rule by the “Security Center”.

### Template of events

“Template of Events” is intended for modification of events codes template which is used in the description of events received form an object, for turning off alarm events and for modification of properties for an specific event code for a given object. 

It should be noted that quality of event templates provided with new versions of the “Security Center” is constantly improved therefore we recommend to use the latest versions of event templates in the describing objects.

In order to replace outdated event template with its latest version you can use event template replacement function implemented in the “System Setting” module.

In the “Template of Events” tab you can modify a description of any event. However you should understand that performed modifications will concern the given object only and will not be represented in basic template of event codes or any other object. Due to the fact that it is highly difficult to track modifications of event template for an object we recommend not to practice them without critical necessity.

By its significance turning off alarm event is very similar to turning off an object with only difference that it relates to one event code only. When turned off event is received there is no event accompanying sound in the “Duty Operator” module, and the “Event Manager” creates automatic cancellation for given alarm. It is necessary to emphasize that in contrast to alarm cancellation for turned off an object, alarm cancellation for turned off event will cancel only this event; object guarding continues in the full scope excluding an event code that has been turned off.

It is possible to turn off an event for limited time interval only which is specified when turning off is executed. On the expiry of this interval the event will be automatically turned on. Turned off event can be turned on at any moment manually.

All operations for event turning off/on are accompanied by creation of system events. So, when event is turned off system event with ZZXM code is created, when event is automatically turned on the system event with ZZXN code is created, and when event is turned on by an operator (manual turn on) system event with ZZXO code is created. 

System events generation permits to track clearly the operations for turning off events.

### Additional characteristics

In the “Additional Characteristics” tab you can specify values of additional characteristics of objects (user fields). Field list management is implemented in the “System Setting”. module.

In case when value for some additional object characteristic is not defined its value can be left empty. When additional characteristics are displayed in the object card only those with specified values are present in the list of characteristics.

### Altonika

The tab "Altonika" is intended to adjust the parameters of object which are specific for Altonika equipment.

#### Equipment type

For correct operation of algorithms of  "Security Center" signal processing  it is necessary to specify the correct system type of the equipment used on object: «Lonta-202» or «RS-200». In case the object has an equipment of other system, it is necessary to specify type "Another".

#### Signal levels

For object on which system "Lonta-202" equipment is used it is possible to change value for trigger levels of the signal accepted from object. If the signal level, accepted from object, becomes less than value set in the field «Warning level» the system event with code ZZXV will be created.

If the signal level, accepted from object, is less than value set in the field «Alarm level» the system event with code ZZXU will be created. By means of system events with codes ZZXV and ZZXU it is possible to control automatically level of signal, accepted from objects, drawing of attention of the operator only to those objects where his interference is required.

It is necessary to mark that  in the module «Duty operator»  function of review of accepted signal  level is accessible for objects on which system "Lonta-202" equipment is installed. At an object card there is a bookmark which allows to display signal level  in the form of the diagram or  in the form of the table of values.

#### The transmitter

In the situation when some object devices are connected to one radio transmitter of system "Lonta-202", for identification of such devices it is necessary to specify object transmitter number in the field «Object number», and number of category which corresponds to the device in the field «Category number» . 

The values specified in fields «Object number» and «Category number» have priority in relation to standard numbers of "Security Center" objects: at reception of events first the values entered on a bookmark of "Altonika" are viewed and only then – values of objects' numbers.


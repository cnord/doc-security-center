## System Setup

The “System Setting” module is intended for modification of the “Security Center” service reference guides properties, for instance, event templates or object types.

### Event classes

In the “Security Center” software, the events being created are divided into the several types:

* Alarm 
* Warning 
* Arming 
* Disarming 
* Defect 
* Reconstitution 
* Elimination 
* Test 
* Others 
* Reset 

The type of event determines method of its handling. Thus events of the “Alarm” type require compulsory actions by an operator called response to alarm. Additionally, the alarms response to which is not started or not finished change current status of objects. When responding to events of the “Arming” or the “Disarming” type, object status also changes.

The list of event types is predefined and can’t be changed by user. To combine events in groups and manage them classes of events are intended. The class of event determines its type. In this case you can create several classes of the “Alarm” type and define for each class individual lists of alarm responses and their cancellations.

In the “Event classes” tab you can edit the list of event classes being used.
The event class determines appearance of event in the list of received events of the “Duty Operator” module. Color, style of type, background color – all these event class properties can be changed in the “System Setup” module.

In addition to attributes responsible for events display it is possible to specify sound file which will be played when an event will be received.

For the event classes having the “Alarm” type lists of actions and cancellations are available which can be recorded by an operator when executing alarm response. It is important that you can determine not only the list of actions but also their sequence. 

If the “Security Center” is operated long enough there is possibility that the list of event classes is contaminated. For example, there are duplicated classes in it or it contains information about classes which already are not used. Nevertheless, the “Security Center” prevents their deleting because there are events for which these classes are used in the descriptions. To solve this problem it is possible to replace duplicates or not used event classes with their actual analogs.

### Templates of events

The same event occurred on object can be transmitted to the “Security Center” in different ways. Event format in which information about event will be received depends on type of transmitting equipment and communication channel. 

The list of events which can be received after decoding events from objects is called the “Template of Events”. 

Template of Events is inherent characteristics of object. You can specify template of events which should be used for an object in the “Object Manager” module.

In the “Templates of Events” tab you can modify the list of templates used by the “Security Center”. Additionally, you can modify the description of events contained in a template.
When describing events it is recommended to use `%user%` and `%zone%` macros. If during the event decoding a macro is found in its description then in the description the value is inserted which corresponds to loop a name (`%zone%` macro) or a responsible person name (`%user%` macro). In this case loop or user number will be taken from the very event. 

Information about loops and responsible persons on the object is very important. This information for an object can be entered in the “Object Manager” module.

The interesting feature of an event description in template consists in possibility to determine an event up to a channel over which it has been received. Hence, the same event code received, for example, by phone or over GPRS can be described in different ways.

It should be noted that the quality of event templates provided with the new versions of the “Security Center” is constantly improved therefore we recommend to use the latest versions of event templates in the describing objects.

In order to specify another, more actual template for objects instead of outdated one you can implement event template replacement function. 

### Actions

The “Actions” tab is intended for modification of list of actions which an operator can record during the executing alarm response.

The following types of actions are defined in the “Security Center” software:

* **Send guard**. When recording action of this type an operator will need to specify response guard which has been sent to an object. If a guard has been sent to an object then an object alarm can be cancelled only after the guard arrival to an object or its call cancellation is recorded.
* **Guard arrival**. The action of the “Guard arrival” type is available for recording only after the send guard to an object has been recorded. When the recording action of the “Guard arrival” type an operator will have to select a guard which arrival he is recording.
* **Guard cancellation**. Guard cancellation recording is available only after its send to an object has been recorded.When recording guard cancellation an operator should select a guard which call cancellation he executes.
* **Operator comment**. Action of this type allows an operator to enter a user-defined text connected with process of alarm response. Actions of this type can be recorded in any step of alarm response. It is recommended to include an action of this type in the action lists for all alarms available in the “Security Center”.
* **Other**. Actions of the “Other” type are for informational purposes only and used for quick recording the actions frequently used in the alarm response (call to a responsible person, police call, etc.) Actions of this type can be recorded in any step of alarm response.
We recommend to refresh the list of actions of the “Other” type permanently in order they would correspond to current security policy. Recorded operator comments can be good source for new actions of the “Other” type.

The list of response guards used by the “Security Center” can be modified in the “Personnel Manager” module.

### Cancellations of alarms

In the “Cancellations of alarms” you can edit the list of reasons recorded in the event of alarm cancellation.

The list of available alarm cancellations is closely connected with an object security policy being used and is of great importance for enterprise efficiency analysis.

The “Security Center” software contains several analytical reports which allow you to evaluate reasons for alarm cancellations including evaluation in relation to objects. 

In order to make use of these reports you should maintain the list of alarm cancellations in current status, and orderly schedule the use of each cancellation in the operator’s instructions.

### Types of objects

The “Type of objects” tab is designed to manage the list of object types. Object type is mandatory property of any object. Object type is used to simplify management (sorting, grouping) of objects list for example during object properties viewing or report generation. Object type can be specified in the “Object Manager” module.

### Fields of objects

In the “Fields of Objects” tab you can modify the list of additional fields which will be available during filling-in the object card.

During generation of fields list you can define their sequence order in which they will be displayed in the object card.
If values of any field represents the list of foregone values then you can fill-in this list by specifying corresponding type for the field. In this case the list of values does not limit the possibility to specify a value for the object field manually if necessary.

In the list of object fields there are two fields for which it is recommended to change the list of possible values only. These are the “Object Section Equipment” and the “Object Loop Equipment” fields. As it follows from their names, they are intended to simplify filling-in the values for Equipment  field while editing sections and loops of objects in
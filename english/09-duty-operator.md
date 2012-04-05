## Duty Operator

“Duty Operator” is designed to monitor operative state of objects, view incoming events and record alarm response actions.

As with all other the “Security Center” modules, the “Duty Operator” module downloads only those objects which use is permitted in the computer where this module is running. You can preset number intervals of objects which can be used at specific network workstation in the “Personnel Manager” module.

### Objects

Main window of the module is split into two horizontal parts. In the upper part of the module main window, object icons are displayed. Icon color represents current state of object. If it is blue the object is under guard, if it is green the object is removed from guard, if it is grey the object is turned off. Red circle or box means that there is an alarm for an object the response for which is not finished yet. In this case red circle means that no actions have been recorded for this alarm yet. Object icons are displayed in the tabs that group objects by the basic states. 

You should remember that alarms received from turned off objects are processed by the system automatically, immediately upon receipt. Arming and disarming events which has been from turned off objects do not change their state. Thus, turned off object can’t be alarming, armed or disarmed. It is always displayed as a grey icon.

### Events

In the lower part of the “Duty Operator” main window, received events and guards are displayed. 

Events are divided into three categories each one of which is displayed in the separate tab: 

* **All events**. In this tab all events received from objects are displayed, excluding events which has been filtered out.
More detailed description of filtering rules is given in the section on the “Personnel Manager” module.
* **Alarms**. In the “Alarms” tab alarm events for which response is not finished yet are displayed. As with the “All Alarms” tab, here only those events are displayed which have been filtered.
* **Events for object**. In this tab events for the selected object are displayed. If necessary, in this tab you can turn on displaying all events received from an object including filtered out events.

In the “Guards” tab, guards used by the “Security Center” as well as their current states are displayed.

### Alarm response

If an alarm event for an object is recorded at the time when for the same object there is another event with unfinished response then these events are united in the group and further processed together. Just the same these events will be displayed together both during responded alarms viewing and during the alarm reports generation in the “Report Manager” module.

In the alarm response window all alarms included in the response group are displayed . The list of actions and cancellations recordable by an operator contains all actions associated with event classes which are included in the response group.

### Module settings

Access to the “Duty Operator” module settings is governed by rights which can be preset in the “Personnel Manager” module. Additionally, you can restrict an operator access to the module settings; also you can inhibit an operator to close the “Duty Operator” module. These restrictions can be useful not only for unexperienced operators but for all operating attendants because unintentional module closing or locking module main window by settings window can negatively affect process of alarm response.

#### General

The Pause at start  parameter sets a pause which will be hold by the “Duty Operator” module at start. The parameter can be useful if labels of the “Event Manager” and “Duty Operator” modules are located in the “Autoloading” or otherwise loaded automatically at the operational system start. To start the “Duty Operator” module requires running the “Event manager” module, and starting and full initialization of the latter can require some time. 

If value for the “Scroll to new event” is set then at receipt of new events from objects, the list in the “All Events” window is automatically scrolled so that new event is visible.
You can adjust a total number of events displayed in the “Duty Operator” module using the “Event display interval”. You should remember that the greater is display interval the longer will be the “Duty Operator” module initialization and the higher will be this module requirements to computer resources.

#### Alarm response 

If at receipt of a new alarm event it is necessary that “Duty Operator” module alerts operator you should set value for the “Activation at alarm” parameter.

In case when the “Duty Operator” module contains alarm for which no actions are recorded for too long time the “Repeat alarm sound at intervals” can be useful. If non-zero value is set for this parameter then in case of lack of actions at alarm during preset time the “Duty Operator” behaves as this alarm is newly received: it plays an alarm sound and opens an alarm response window if this is allowed for the alarm response window by the “Automatic opening” parameter.

“Automatic closing” and “Automatic change to next alarm” parameters determine an alarm response window behavior at the moment when a current alarm response is finished. If the first parameter value is set the alarm response window is closed. If the second parameter value is set then the next by time of receipt alarm is loaded to alarm response window. If values are set for both parameters then first the attempt is done to load the next alarm and if it is not present the alarm response window is closed.

#### Hot keys 

In the “Hot keys” tab you can set key combinations on the keyboard for quick access to basic functions of the “Duty Operator” module.

It should be noted that hot keys for actions and cancellations are assigned automatically when a list is created. But using the “Do not use Alt for actions and cancellations” you can waive “Alt + digit” combination for quick recording actions or cancellations and use only digits.
The “Add hot keys to headings” permits to display assigned to operations hot keys in the headings of buttons. 

#### Dialing

If a modem or any device supporting dialing control via TAPI interface is connected to a computer then in the “Dialing” tab you can specify the list of devices which the “Duty Operator” module can use for dialing.

Dialing begins from left-clicking any phone number of an object which is displayed in the object card.

If dialed number is busy the “Duty Operator” module may redial it if value for the “Redial if Line Is Busy” parameter is set.

#### Andromeda Persona

The “Security Center” software may be used together with the “Andromeda Persona” software. Among other things, the object list of the “Security Center” can be loaded to the “Persona” whereupon these objects can be placed on the ground map.

Additionally, state changes of objects and guards can be transferred from the “Security Center” to the “Persona” so that the “Persona” could automatically display alarm objects on the map and also display the state of guards which are called to objects.

In the “Andromeda Persona” you can enable integration of the “Duty Operator” module with the “Andromeda Persona” software as well as permit automatic display of alarm objects and guard states in the “Persona”.


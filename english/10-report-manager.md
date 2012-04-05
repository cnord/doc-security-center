## Report Manager

The “Report Manager” module is designed to create reports on the operation of objects, the “Security Center” and security enterprise personnel.

In the module the “Report Manager” report forms a generator is built-in with the help of which you can modify existing reports or create new ones.

### Event reports

When you create event reports you should remember about filtration algorithms which are used in events recording. More detailed information about event filtration is given in the section on the “Event Manager”, here however we would like to note that filtered-out events may be included in the created reports if necessary.

All event reports (unless otherwise stated) are created with regard to the selected objects and event classes. Due to this the reports can be created to fulfill various tasks including specific for the particular security enterprise.

The first three event reports (“01 – Time Sorting”, “02 – Object Sorting” and “03 – With Object Grouping”) are designed to view received from the objects events in different representations. It should be noted that if for an object the sections with their own object numbers are created then events from these sections are represented in the event reports. In this case an object number of a section is shown in parenthesis after an object number.

#### Events from undeclared objects

The “04 - Events from undeclared objects” report is designed to view events which the “Security Center” could not associate with any of existing objects. As with the “Events from Undeclared Objects” module, this report is intended to identify errors made during the object equipment programming or in the object description in the “Security Center”. For this report (for natural reasons) objects and event classes selected during its creation do not matter.

#### Objects without events

Purpose of the “05 – List of objects without events” report is dual. 
The simplest task is to get using it the list of objects from which not any event has been received within preset time interval. To do this you should select all objects in the object list, and all object classes in the event classes list. 

More interesting task – to find, for example, all objects of the “Bank” type from which not any fault has been received within the last month. To do this you should select all objects of correct type and event classes of the “Fault” type. The report created with such parameters will contain only desired objects.

#### Time deviation

With the help of the “06- By time deviation” you can verify correctness of automatic field test interval programming and correctness of filling in the “Control time” field in the object card. When a report is generated an average time interval between events from an object is calculated whereupon it is compared with object control time. If difference of values exceeds threshold preset during the report creation such object is highlighted in the list. Depending on algorithms used by the control panels to calculate time of creation for the next automatic test, in the process of report creation all events with class type not the “Test” can be excluded.

#### Event class statistics

The “07 – Statistics” report is necessary to calculate number of events of preset classes which have been received from an object within a period. Primarily, this report is useful for identification of objects with various faults. For example, if during a report creation you choose the “Fault 220V” event class, it is possible to calculate how many times within preset period there were problems with electrical power supply at object. To include in the report only such objects which really require attention you can preset during the report creation the minimum number of events of each of preset classes which needs to be obtained to include an object in the report.

It should be noted that to use this report effectively user should create individual classes for those events which monitoring is of interest for him.

#### Sent SMS

Reports belonging to the “08 – Sent SMS” – “12 – SMS, grouping by objects” group are intended to control operation of the “SMS Extender” event hadler. With the help of these reports you can obtain information about SMS messages which have been created during handling object events as well as about time of delivery of these SMS messages to recipient.

#### Channel statistics

Depending on settings with which the “13 – By communication channels” report will be created, this report allows you fulfill several tasks. First, it is possible to evaluate which channels are employed by an object and to what extent by means of calculating number of events received from this object over each of communication channels. Secondly, it is possible to evaluate loading of individual channel by calculating number of events received over this channel from all selected objects.

#### State statistics

With the help of the “14 – Object state” report it is possible to calculate number and duration of situations when an object was in the certain state. 

Each state of an object in the context of this report is described by two events: the first event signals that the object has changed to known state; when the second event is received it is considered that the object has exited this state. Good examples of object states are power supply fault or communication channel fault.

For example, when electric power supply is interrupted at site the event recording presence of fault is created, and once the fault has been eliminated the event of electric power supply restoration is created. If it is necessary to calculate how many times an object was in “electric power supply interruption” state, as well as the total duration of this state of the object then during creation of this report you should specify classes of events corresponding to fault and restoration of electrical power supply.

States of interest for the “Security Center” users may be quite different. In order to use actively this report when working with the “Security Center” you should create individual classes for those events that record start and finish of .an object staying in the state of interest to a user.

### Alarm reports

All alarm events recorded by the “Security Center” require mandatory response from an operator. If an alarm event for an object is recorded at the time when for the same object there is another event with unfinished response then these events are united in the group and further processed together. Alarm responses are executed in the “Duty Operator” module. During an alarm response an operator records in the “Security Center” any actions he has executed in response to alarm. When an operator has finished response he cancels an alarm while recording time and result of response.

Most of alarm reports during the creation permit to verify if it is necessary to include data on alarms for which there were no calls of guards. This is due to the fact that such alarms are considered as technological or false by many security enterprises. Therefore some reports should not contain such alarms, and other reports should contain such reports only.
When an alarm report is created it is necessary to select objects and alarm event classes to be included in the report. If during the report creation it is important to select only those alarms for which certain actions have been recorded then you can directly specify necessary actions of operators.

#### Standard report and Report for operator

The “01 – For Operator” report is intended for viewing alarms in which responses particular operator took part. And with the “02 – Standard” report you can view all recorded alarms and actions for them. Additionally, when creating this report you can output only those alarms for which there were no guard calls.

#### Alarm cancellation statistics

When creating the “03 – By number of cancellations” report you can specify minimum number of cancellations which have been recorded within a period. If in this case you select some particular cancellation, for example, the “Equipment fault” and specify that number of such cancellations must be at least 5, then you can obtain report which contains all objects for which alarms were cancelled not less than 5 times with reason specification as the “Equipment fault”.

The “03 – Cancellation statistics” report is designed to calculate number of selected cancellations recorded within the preset period. With the help of this report you can see which reasons for alarm cancellations are recorded more often than others and to what extent. For instance, you can see what portion alarms take which were cancelled as false.
In addition to counting total number of cancellations for all selected objects, the report makes possible to detail cancellations for objects in order to see at which objects more false alarms or alarms with guard calls.

Using the “03b – Summary for cancellations” report you can see one more variant of cancellations detailing for objects. The report is easier for viewing than previous one but there is one restriction – not more than four cancellations can be included in it. As with the previous one this report allows to make sure visually which objects attract attention in the general list by the causes of alarms taking place at them.

The “03c – Summary for cancellation with comment” report allows to select one reason for an alarm cancellation, count number of alarms which have been cancelled for this reason and additionally - to output all comments which have been recorded by operators when responding to these alarms. If an operator alarm response algorithm requires making comments when recording situations accompanying response then this report is very useful for the analysis of alarm causes and problems which appear when responding to them.

The last of summarized reports on the alarm cancellations – the ”05 – Cancellations by days” – allows to select one reason for an alarm cancellation and count how many times this reason have been used in each day of selected period. In addition to this the report allows to select one additional object characteristic which will also be included in the report. 
Let us suppose that with the help of previous reports it has become clear that for a month there were many false alarms for an object. Using the “05 – Cancellations by days” report you can find out how these alarms were distributed among days of a month: weather they took place every day or during particular shifts of some persons. 

#### Alarms and events

The “04 – With events” report represents a combination of two reports – an event report and alarm report. When creating this report you can select not only events of the “Alarm” type but also other events. In this case events with the “Alarm” class type and actions that have been recorded during their execution really determine which objects are included in the report. Events with other class types will be included in the report after the standard alarm report will be created.

Events that have been received before and after an alarm can be useful for identification causes of alarm therefore this report most often is used just for this purpose.

### Reports on guarding time

Purpose of this group of reports consists in providing information about time during which an object was under guard or in specifying weather an object was under guard in the prescribed time.

#### Time under guard

The “01 – With Total Time” report allows to view daily arms and disarms of an object for time period during which an object was under guard as well as time during which an object should be guarded according to the guarding schedule.

When arms and disarms of objects are outputted forced filtration of these events is performed: if several arms have been received in sequence, only the first of them is included in the report. But if several disarms go in sequence only the last removal is included in the report.
The time during which an object had to be under guard according to a schedule does not depend on whether the guarding schedule control is enabled or not. Thus even if the object guarding schedule is not controlled it in case can be used for comparison of supposed and actual time of an object being under guard.

With the help of the “02- In brief” report you can obtain simply sum of time during which an object was under guard within given period. This report can be useful in cases when payment for security services depends on time during which an object was under guard.

#### Security state

There are rather common situations when it is necessary to find out the state of a particular object at definite day and time. To fulfill such task the “03 – Security state” report is designed. When you create the report you should select date, time and object security state of interest. 

### Guards reports

Analysis of guards operation makes possible to evaluate quality of rendered security services and fairness of guards. Moreover, by associating guard calls with objects you can distinguish objects to which response guards are called more often than to other objects and make certain organizational conclusions in regard to these objects.

Guards reports resembles alarm reports, but they are oriented to specificity associated with the guard operation – count of arrival time, average arrival time/ number of calls and so on.
In order to make alarms and guards reports actually useful the alarm response procedure should be associated with actions and cancellation reasons of alarms which are recorded by operators. First, it is necessary to distinguish typical situations which causes alarms. Secondly, it is necessary to create actions and cancellations of alarms in response to these situations. Thirdly, it is necessary to train an operator to identify typical situations, act in accordance with developed for them rules and record just those actions and cancellations which correspond to the emerged situation.

#### Guards operation

The “01 – Guards operation” report is designed to output all alarms within the period for which calls of selected guards were recorded. 

#### Visit statistics

The next report – “02 – Visit statistics” represents main statistics associated with guards operation over a period: total number of guard calls, number of calls which were cancelled, time which guard employed in calls as well as average guard arrival time. The report can be useful for the evaluation of a guard workload as well as for identification of most and least loaded guards.

#### Average number of calls

With the help of the “03 – Average number of calls” report it is possible to count total number of fast response teams calls to objects as well as average number of team calls to objects per month. 

This report is used to identify objects to which teams are called most frequently.

#### Response time

Purpose of the “04 – Response time” report is evaluation of time period from the alarm receiving till the call of guard and its arrival to the object. When creating the report you can specify the maximum allowable values of these intervals in order to include in the report only those alarms where these values have been exceeded.

#### Cancellation statistics

As with the similar alarm report, the “05 – Cancellation statistics” allows to count number of recorded reasons for alarm cancellations for a period but in relation to the selected response groups.

Using this report you can evaluate how many alarms for which guard has been called were false and why they were false.

### Object reports

Set of object reports is designed to create hardcopy for the basic data of the “Security Center”: objects, operators, event templates event handlers.

#### Objects

The “01 – List of objects”, “02 – Minimal card”, “03 – Short card” and “04 – Full card” reports are designed to view and print information about objects in different representations and different volume.

The “06 – Control time” report allows to output objects for which control time is within limits preset during the report creation. The report can be useful for object ranking if control time for an object is set in accordance with its importance.

#### Operators

Using the “05 – Operators” report you can print out the list of the “Security Center” software users and their rights in the modules.

#### Templates of events

Various information about use of event templates can be obtained with the help of the “07 – List of Event templates”. Depending on parameters which have been set during the report creation you can know which templates are used for objects and which templates are not used. For those templates which are used number of objects which are using them can be counted.
If in addition to the list of event templates it is necessary to obtain descriptions of objects which are included in one or another template you can use the “08 – Codes of event templates”. 

#### Event handlers

The “09 – SMS Transmitters” report is designed to view and print information about settings of the “SMS Extenders” event handlers. With the help of this report you can obtain information about all handlers that are used for selected objects or about only those of them for which particular number of recipient is specified.


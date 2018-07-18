# Report Manager

The "Report manager" module is intended to create reports on the operation of sites, Security Center and security company personnel.

A report form generator is built in the "Report manager” module, with which it is possible to modify the existing reports or create new ones.

## Event Reports

When creating event reports, remember about the filtering algorithms that are used when registering events. See more information about filtering events in the section on the "Event manager" module, here it shall be noted that if necessary, it is possible to include the filtered events in the generated reports.

Unless otherwise specified, all event reports , are created taking into account the selected sites and event classes. Due to this, reports can be created for solving various tasks, including those specific for a particular security company.

The first three event reports ("01 - Sort by time", "02 - Sort by sites" and "03 - Grouping by sites") are intended for viewing the events received from sites in different views. It shall be noted that if parts with their own site numbers are created for a site, the events from these parts are displayed in the event reports. In this case the site number of the part is indicated in parentheses after the site number.

### Events from Undescribed Sites

The report "04 - From undescribed sites" is intended for viewing events that the Security Center failed to associate with any of the existing sites. Like the "Events from undescribed sites” module, this report is intended to identify errors made during programming of site equipment, or when describing sites in the Security Center. For obvious reasons, the sites and event classes selected during its creation do not matter for this report.

### Sites without Events

The purpose of the report "05 - List of sites without events" is twofold. It used to get a list of sites from which no events were received within a given period of time in the simplest way. To do this, select all sites from the list of sites, and in the list of event classes select all event classes. 

Another more interesting task, for which the report can be used, is to find, for example, all sites of the "Bank" type, from which there have not been any faults during the last month. To do this, select all sites of the desired type and event classes that have the “Fault” type. The report created on the basis of such parameters will contain only the desired sites.

### Time Deviation

Using the report "06 - By time deviation” to check the correct programming of the interval of the automatic test on the site and correct filling of the "Control time" field in the site card. When creating the report, the average time interval between events from the site is calculated, after which it is compared with the target time of the site. 

If the difference of values is greater than the threshold specified at the time of report creation, then such site will be highlighted in the list. Depending on the algorithms used by the control panels to calculate time for creation of the next automatic test, it is possible to exclude all events which class type is not "Test" when creating the report.

### Statistics by Class

The report "07 - Statistics" is needed to calculate the number of events of the given classes that were received from the site over a period. First of all, the report is useful for identifying sites with faults of various kinds. For example, if you select the event class “AC Fault" when creating the report, you can calculate how many times over the given period the site had power supply problems. To include only those sites that you really need to pay attention to in the report, when creating a report, it is possible to set the minimum number of events for each of the specified classes that shall be received for the site to be included in the report.

It shall be noted that for the effective use of this report, the user shall create separate classes for those events, which are of interest to him/her.

### Sent SMS

Reports that belong to the group "08 - Sent SMS" - "12 - SMS, grouping by sites" are intended for monitoring the operation of the event handler "SMS message repeater". Use these reports to get information about SMS messages that were created when handling events by sites, as well as the time of delivery of these SMS messages to the recipient.

### Statistics by Channels

Depending on the settings with which the report "13 - Via communication channels" will be created, it can be used to solve several tasks. First, it is possible to estimate which communication channels are used by the site and to what extent, after calculating how many events are received from it on each of the communication channels. Second, it is possible to estimate the load of a separate communication channel by counting the number of events received from it from all selected sites.

### Statistics by Status

Use the report "14 - Site status” to calculate the number and duration of situations when the site has a certain status. 
Each status of a site within this report is characterized by two events: the first event signals that the site has passed to a known state, when the second event is received, it is considered that the site is not already in this state. Good examples of site status are power or communication channel failures.

For example, if there is a power failure at the site, an event will be created that records failure, and after the failure is eliminated, an event about power supply restoration will be created. If it is necessary to calculate how many times the site was in a "power failure” state, and in addition - what is the total duration of this state, then when creating this report, specify the event classes corresponding to the failure and restoration of the power supply.

The states of interest to users of the Security Center can be very different. In order for this report to be actively used when working with the Security Center, it is necessary to create separate classes for those events that register the beginning and completion of state, which of interest to the user.

## Alarm Reports

All alarm events registered by the Security Center require mandatory handling by the operator. If an alarm event is registered for the site at the moment when there is another unhandled event on the same site, then such events are combined into a group and further handled together. The alarms are handled in the "Duty operator" module. When handling an alarm, the operator registers the actions that he/she performed during the alarm handling in the Security Center. After the handling, the operator cancels the alarm by registering the handling time and result.

During creation, most alarm reports allow to specify whether to include data on the alarms for which there were no calls from the guards. This is due to the fact that such alarms are considered temporary or false by many security companies. Therefore, in some reports there shall not be such alarms, and in some, on the contrary, there shall only be such alarms.

When creating alarm reports, select sites and alarm event classes to be included in the report. If, when creating a report, it is important to select only those alarms for which certain actions were registered, it is possible to explicitly specify the actions of the operators that are required.

### Standard Report and Report by Operator

The report "01 - By operator" is intended for viewing alarms, which were handled by a certain operator. And with the help of the report "02 - Standard" it is possible to see all registered alarms and actions for them. Additionally, when creating this report, it is possible to display only those alarms for which there were no guard calls.

### Statistics by Alarm Cancellations

When creating the report "03 - By number of cancellations", it is possible to specify the minimum number of cancellations that shall be registered over a period. If you select any specific cancellation, for example, “Equipment fault", and specify that there shall be at least 5 such cancellations, you can get a report that will include all sites which alarms have been canceled at least 5 times since indicating the cause of "Equipment fault".

The report "03a - Statistics by cancellations" is intended for calculating the number of selected cancellations registered over a given period. With its help, it is possible to see what causes of alarm cancellation are registered more often than others and how much. For example, it is possible to see what percentage of the alarms that were canceled are false.
In addition to counting the total number of cancellations for all selected sites, the report allows to detail site cancellations in order to see on which particular sites there were more false alarms or alarms on which there were guard calls.

With the help of the report "03b - Summary by cancellations", it is possible to see one more option for detailing site cancellations. It is more convenient to view the report than the previous one, but there is a limit - it can include no more than four cancellations. Just like the previous one, this report allows to know which sites are highlighted in the common list by the causes of the alarms that occur on them.

The report "03c - Summary by cancellations with comment" allows to select one cause for canceling an alarm, to calculate the number of alarms, during which cancellation the cause was indicated, and besides - to display all the comments that the operators registered when during handling of these alarms. If the algorithm for handling alarms by operators requires comments when registering situations accompanying handling, this report will be very useful in analyzing the causes of alarms, as well as the problems that arise when they are handled.

The last of the summary alarms cancellation reports, "05 - Cancellations by day" allows to select one cause for canceling an alarm and calculate how many times this cause was used on each day over the selected period. Besides, the report allows to select one additional characteristic of the site, which will also be included in the report. 

Suppose that with the help of previous reports it was discovered that there were a lot of false alarms for the site during a month. Using the report "05 - Cancellations by day" it is possible to find out how these alarms were distributed by the days of the month: they occurred every day or during someone's specific shifts. 

### Alarms and Events

The report "04 - With events" is a combination of two reports - event report and alarm report. When creating this report, it is possible to select not only event classes with the "Alarm" type, but also others. In this case, it is the events with the type of the "Alarm" class and the actions that were registered during their handling, that determine which sites will be included in the report. Events with other types of classes will be included in the report after the standard alarm report is created.

Events that were received before and after an alarm can be useful in finding out the causes for the occurrence of an alarm, so this report is most often used for this purpose.

## Reports by Arm Time

The purpose of this group of reports is to provide information about the time during which the site was armed, or to specify whether the site was armed at a specified time.

### Arm Time

The report "01 - With the amount of time" allows to see the daily site arming and disarming over a period, the time during which the site armed, and also the time during which the site had to be armed in accordance with arm schedule.

When displaying the site arming and disarming, these events are mandatory filtered: if several armings are received one by one, only the first one will be included in the report. If several disarmings are received one by one, only the last disarming will be included in the report.

The time, over which the site was supposed to be armed according to the schedule, does not depend on whether the monitoring of the arm schedule is included for the site. Thus, even if the site arm schedule is not monitored, it can still be used to compare the estimated and actual period of the site arming.

With the help of the report "02 - Briefly" it is possible to get simply the amount of the time during which the site was armed over a given period. This report can be useful in cases when payment for security services depends on the time during which the site was armed.

### Arm Status

Often there are situations when it is necessary to find out in which state the site was on a particular day and time. To solve this problem, the report "03 - Arm Status" is used. When creating a report, select the date, time and arm status of the required site. 

## Reports by guards

The analysis of the guard operation allows to assess the quality of the security services provided and reliability of guards. Besides, by linking guard calls to sites, it is possible to highlight the sites to which the guards are called more often than to the rest and make some organizational conclusions with respect to these sites.

The report on the guards resembles alarm reports, except that they are focused on the specifics associated with the work of guards – counting the arrival time, average time of arrival, number of calls, etc.

In order for alarm reports and reports by guards to be truly useful, the alarm handling procedure shall be linked to the actions and causes for canceling the alarms that are registered by operators. First, it is necessary to identify the typical situations that are the cause of alarms. Second, to handle these situations, it is necessary to create actions and alarm cancellations. Third, it is necessary to train the operator to identify typical situations, to act in accordance with the rules developed for them and to register exactly those actions and cancellations that correspond to a certain situation.

### Guard Performance

The report "01 - Guard Performance" is intended for displaying all alarms over the period for which calls of selected guards were registered. 

### Statistics of Responses

The next report, "02 - Statistics of responses", shows the main statistics related to the performance of guards over a period: total number of group calls, number of calls that were canceled, time which the guard spent on calls, and average arrival time of the guard. The report can be useful for estimating the workload of a guard, as well as for identifying the most and least loaded guards.

### Average Number of Calls

Use the report "03 - Average number of calls” to calculate the total number of calls for guards to sites, as well as the average number of guard calls to site per month. This report is used to identify the sites to which the guards are called most often.

### Response Time

The purpose of the report is "04 - Response time" is to estimate the time that elapses from the time the alarm is received to the call of the guard and its arrival at the site. When creating a report, it is possible to specify the maximum allowed values for these intervals, so that only those alarms are included in the report, where these values were exceeded.

### Statistics by Cancellations

Just like the similar alarm report, the report "05 - Statistics by cancellations" allows to calculate the number of registered causes of alarm cancellation over a period, but only for the selected guards. With the help of this report, it is possible to estimate how many of the alarms to which the guard was called were false and why.

## Site Reports

A set of site reports is intended to create a hard copy for the main data of the Security Center: sites, operators, event templates and event handlers.

### Sites

The reports "01 - List of sites", "02 - Minimal card", "03 - Short card" and "04 - Full card" are intended for viewing and printing information about sites in different views and in different volumes.

The report "06 - Control time" allows to display sites which control time is within the limits defined during the report creation. The report can be useful when ranking sites, if the control time for the site is set according to its importance.

### Operators

Use the report"05 - Operators” to print a list of users of the Security Center software and their rights in the modules.

### Event Templates

A variety of information about using event templates can be obtained using the report "07 - List of event templates". Depending on the parameters that were specified when creating the report, it is possible to find out which templates are used for sites, and which ones are not. For those templates that are used, it is possible to count the number of sites that use them.

If in addition to the list of event templates it is possible to get descriptions of events that are included in a particular template, then use the report "08 - Event template codes". 

### Event Handlers

The report "09 - SMS message repeaters" is intended for viewing and printing information about the settings of the event handlers “SMS message repeaters”. It is used to get information about all handlers that are used for the selected sites, or only those that have a specific recipient number.

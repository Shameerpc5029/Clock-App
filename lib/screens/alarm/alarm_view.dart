import 'dart:developer';

import 'package:clock_app/common/style/colors.dart';
import 'package:clock_app/common/style/sizes.dart';
import 'package:clock_app/db/alarm_helper.dart';
import 'package:clock_app/main.dart';
import 'package:clock_app/model/alarm_info.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';

import 'package:timezone/timezone.dart';

class AlarmView extends StatefulWidget {
  const AlarmView({
    super.key,
  });

  @override
  State<AlarmView> createState() => _AlarmViewState();
}

class _AlarmViewState extends State<AlarmView> {
  DateTime? _alarmTime;
  late String _alarmTimeString;
  bool _isRepeatSelected = false;
  AlarmHelper alarmHelper = AlarmHelper();
  Future<List<AlarmInfo>>? _alarms;
  List<AlarmInfo>? _currentAlarms;

  @override
  void initState() {
    _alarmTime = DateTime.now();
    alarmHelper.initializeDatabase().then((value) {
      log('------database intialized');
      loadAlarms();
    });
    super.initState();
  }

  void loadAlarms() {
    _alarms = alarmHelper.getAlarms();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Alarm",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        KSizedBox().height20,
        Expanded(
          child: FutureBuilder(
            future: _alarms,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                _currentAlarms = snapshot.data;
              }
              if (snapshot.hasData) {
                return Container(
                  padding: const EdgeInsets.all(20),
                  child: ListView(
                    physics: const ScrollPhysics(),
                    children: snapshot.data!.map<Widget>((alarm) {
                      var alarmTime =
                          DateFormat('hh:mm aa').format(alarm.alarmDateTime!);
                      var gradientColor = GradientTemplate
                          .gradientTemplate[alarm.gradientColorIndex ?? 0]
                          .colors;
                      return Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: gradientColor,
                            begin: Alignment.bottomLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: gradientColor.last.withOpacity(0.4),
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: const Offset(4, 4),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.label,
                                  color: Colors.white,
                                ),
                                KSizedBox().width5,
                                Text(alarm.title.toString()),
                                const Spacer(),
                                Switch(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  value: _isRepeatSelected,
                                  onChanged: (value) {
                                    _isRepeatSelected = value;
                                  },
                                  activeColor: Colors.white,
                                )
                              ],
                            ),
                            const Text("Mon-Fri"),
                            KSizedBox().height5,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  alarmTime,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                IconButton(
                                  onPressed: () {
                                    alarmHelper.delete(alarm.id);
                                    loadAlarms();
                                  },
                                  icon: const Icon(
                                    CupertinoIcons.delete_simple,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }).followedBy([
                      if (_currentAlarms!.length < 5)
                        DottedBorder(
                          color: AppColors.clockOutline,
                          strokeWidth: 1,
                          dashPattern: const [5],
                          strokeCap: StrokeCap.butt,
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(24),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.clockBG,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: TextButton(
                              onPressed: () {
                                _alarmTimeString =
                                    DateFormat('HH:mm').format(DateTime.now());

                                showModalBottomSheet(
                                  useRootNavigator: true,
                                  context: context,
                                  clipBehavior: Clip.antiAlias,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(24),
                                    ),
                                  ),
                                  builder: (context) {
                                    return StatefulBuilder(
                                      builder: (context, setModalState) {
                                        return Container(
                                          color: Colors.black26,
                                          padding: const EdgeInsets.all(32),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              TextButton(
                                                onPressed: () async {
                                                  var selectedTime =
                                                      await showTimePicker(
                                                    context: context,
                                                    initialTime:
                                                        TimeOfDay.now(),
                                                  );
                                                  if (selectedTime != null) {
                                                    final now = DateTime.now();
                                                    var selectedDateTime =
                                                        DateTime(
                                                            now.year,
                                                            now.month,
                                                            now.day,
                                                            selectedTime.hour,
                                                            selectedTime
                                                                .minute);
                                                    _alarmTime =
                                                        selectedDateTime;
                                                    setModalState(() {
                                                      _alarmTimeString =
                                                          DateFormat('HH:mm')
                                                              .format(
                                                                  selectedDateTime);
                                                    });
                                                  }
                                                },
                                                child: Text(
                                                  _alarmTimeString,
                                                  style: const TextStyle(
                                                      fontSize: 32),
                                                ),
                                              ),
                                              ListTile(
                                                title: const Text('Repeat'),
                                                trailing: Switch(
                                                  onChanged: (value) {
                                                    setModalState(() {
                                                      _isRepeatSelected = value;
                                                    });
                                                  },
                                                  value: _isRepeatSelected,
                                                ),
                                              ),
                                              const ListTile(
                                                title: Text('Sound'),
                                                trailing: Icon(
                                                    Icons.arrow_forward_ios),
                                              ),
                                              const ListTile(
                                                title: Text('Title'),
                                                trailing: Icon(
                                                    Icons.arrow_forward_ios),
                                              ),
                                              FloatingActionButton.extended(
                                                onPressed: () {
                                                  onSaveAlarm(
                                                      _isRepeatSelected);
                                                },
                                                icon: const Icon(Icons.alarm),
                                                label: const Text('Save'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                              style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              child: Column(
                                children: [
                                  const Icon(
                                    CupertinoIcons.add_circled,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                  KSizedBox().height10,
                                  Text(
                                    'Add Alarm',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      else
                        const Center(
                          child: Text(
                            "Your alarm list is full",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                    ]).toList(),
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              );
            },
          ),
        )
      ],
    );
  }

  void scheduleAlarm(
      DateTime scheduledNotificationDateTime, AlarmInfo alarmInfo,
      {required bool isRepeating}) async {
    var scheduledNotificationDateTime = alarmInfo.alarmDateTime;
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'channelId',
      'channelName',
      importance: Importance.max,
    );

    var iOSPlatformChannelSpecifics = const DarwinNotificationDetails(
      sound: 'a_long_cold_sting.wav',
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.schedule(
      0,
      "Clock App",
      alarmInfo.title,
      scheduledNotificationDateTime!,
      platformChannelSpecifics,
    );
    if (isRepeating) {
      await flutterLocalNotificationsPlugin.showDailyAtTime(
        0,
        'Clock App',
        alarmInfo.title,
        Time(
          scheduledNotificationDateTime.hour,
          scheduledNotificationDateTime.minute,
          scheduledNotificationDateTime.second,
        ),
        platformChannelSpecifics,
      );
    } else {
      await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'Clock App',
        alarmInfo.title,
        TZDateTime.from(scheduledNotificationDateTime, local),
        platformChannelSpecifics,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );
    }
  }

  void onSaveAlarm(bool isRepeating) {
    DateTime? scheduleAlarmDateTime;
    if (_alarmTime!.isAfter(DateTime.now())) {
      scheduleAlarmDateTime = _alarmTime;
    } else {
      scheduleAlarmDateTime = _alarmTime!.add(const Duration(days: 1));
    }

    var alarmInfo = AlarmInfo(
      alarmDateTime: scheduleAlarmDateTime,
      gradientColorIndex: _currentAlarms?.length,
      title: 'alarm',
    );
    alarmHelper.insertAlarm(alarmInfo);
    if (scheduleAlarmDateTime != null) {
      scheduleAlarm(scheduleAlarmDateTime, alarmInfo, isRepeating: isRepeating);
    }
    Navigator.pop(context);
    loadAlarms();
  }

  void deleteAlarm(int? id) {
    alarmHelper.delete(id);
    loadAlarms();
  }
}

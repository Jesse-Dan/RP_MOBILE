// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields, must_be_immutable
import 'package:flutter/material.dart';
import 'package:recenth_posts/src/utils/components/profile_icon.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';
import 'package:sticky_grouped_list/sticky_grouped_list.dart';

import '../../../../logic/services/date_service/date_time_service.dart';
import '../../../../utils/components/action_btn.dart';
import '../../../../utils/components/app_divider.dart';
import '../../../../utils/components/app_notifier.dart';
import '../../../../utils/enums/enums.dart';
import '../../../../utils/style/app_dimentions.dart';
import '../../../base/base_scaffold.dart';

class ChatsUseriew extends StatefulWidget {
  static const String routeName = '/chats.user.view';

  const ChatsUseriew({
    super.key,
  });

  @override
  State<ChatsUseriew> createState() => _ChatsUseriewState();
}

class _ChatsUseriewState extends State<ChatsUseriew> {
  String getDayOfTheWeek(DateTime day) {
    DateTime now = DateTime.now();

    if (day.year == now.year && day.month == now.month && day.day == now.day) {
      return 'Today';
    }

    switch (day.weekday) {
      case DateTime.sunday:
        return 'Sunday';
      case DateTime.monday:
        return 'Monday';
      case DateTime.tuesday:
        return 'Tuesday';
      case DateTime.wednesday:
        return 'Wednesday';
      case DateTime.thursday:
        return 'Thursday';
      case DateTime.friday:
        return 'Friday';
      case DateTime.saturday:
        return 'Saturday';
      default:
        return 'Invalid day';
    }
  }

  final GroupedItemScrollController itemScrollController =
      GroupedItemScrollController();

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        addbodyPadding: false,
        addAppBar: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        appbar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ProfileIcon(
                margin: EdgeInsets.all(0),
              ),
              const SizedBox(width: 26),
              Text(
                'Annette Black',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF0B0B0B),
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0.08,
                ),
              ),
            ],
          ),
          centerTitle: false,
        ),
        physics: const BouncingScrollPhysics(),
        backgroundColor: AppColors.kbrandWhite,
        body: 1 == 1
            ? Center(
                child: Text('jesse'),
              )
            : SizedBox(
                height: MediaQuery.of(context).size.height - 180,
                width: MediaQuery.of(context).size.width,
                child: chats.isEmpty
                    ? Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 260,
                          height: 75,
                          child: Text(
                            'Send a message',
                            style: TextStyle(
                              color: Color(0xFF232323),
                              fontSize: 24,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                    : StickyGroupedListView<Chat, DateTime>(
                        itemScrollController: itemScrollController,
                        elements: chats,
                        groupBy: (Chat element) => element.date,
                        floatingHeader: true,
                        reverse: false,
                        groupSeparatorBuilder: (Chat element) => Container(
                            color: AppColors.kbrandWhite,
                            width: double.infinity,
                            margin: EdgeInsets.only(bottom: AppDimentions.k16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  getDayOfTheWeek(element.date),
                                  style: TextStyle(
                                    color: Color(0xFF8D8D8D),
                                    fontSize: 14,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(width: AppDimentions.k16),
                                AppDivider.build(
                                    width:
                                        MediaQuery.of(context).size.width / 1.4,
                                    height: 1.5)
                              ],
                            )),
                        itemBuilder: (context, Chat element) {
                          return NotificationTile(
                            notification: element,
                          );
                        },
                        // Row(children: [Icon(element.icon), Text((element.name))]),
                        // itemComparator: (e1, e2) => e2.name.compareTo(e1.name), // optional
                        // elementIdentifier: (element) =>
                        //     element, // optional - see below for usage
                        //  itemScrollController: itemScrollController, // optional
                        order: StickyGroupedListOrder.DESC, // optional
                      ),
              ));
  }
}

class NotificationTile extends StatelessWidget {
  final Chat notification;
  NotificationTile({
    super.key,
    required this.notification,
  });

  String? getNotifictionIcon(notification) {
    switch (notification.notificationType) {
      case NotificationType.ACTION:
        return 'bold_frame.svg';
      case NotificationType.SECURITY:
        return 'carbon_security.svg';
      default:
        return null;
    }
  }

  double? getNotifictionIconSize(notification) {
    switch (notification.notificationType) {
      case NotificationType.ACTION:
        return 24;
      case NotificationType.SECURITY:
        return 24;
      default:
        return null;
    }
  }

  DateTimeService dateTimeService = DateTimeService();

  @override
  Widget build(BuildContext context) {
    return notification.notificationType == NotificationType.FAVORITE
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 26,
                  child: Row(children: [
                    ActionBtn(imgUrl: 'user.svg'),
                    const SizedBox(width: AppDimentions.k16),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '${notification.user.firstName} ',
                            style: TextStyle(
                              color: Color(0xFF0B0B0B),
                              fontSize: 16,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: 'favourite your post',
                            style: TextStyle(
                              color: Color(0xFF464646),
                              fontSize: 16,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
                const SizedBox(height: AppDimentions.k16),
                ListTile(
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignOutside,
                        color: Color(0xFFEFEFEF),
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    leading: ProfileIcon(
                      height: 40,
                      width: 40,
                      margin: EdgeInsets.all(0),
                    ),
                    title: Text(
                      '${notification.user.firstName} ${notification.user.lastName}',
                      style: TextStyle(
                        color: Color(0xFF0B0B0B),
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w700,
                        height: 0.10,
                      ),
                    ),
                    subtitle: Text(
                      notification.user.userId,
                      style: TextStyle(
                        color: Color(0xFF464646),
                        fontSize: 14,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                        height: 0.10,
                      ),
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        AppNotifier.notifyAction(context,
                            message:
                                '${notification.user.firstName} added to Favorite');
                      },
                      child: Container(
                        width: 130,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: ShapeDecoration(
                          color: Color(0xFFD75B6B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          'Favourite back',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          )
        : ListTile(
            leading: ProfileIcon(
              height: getNotifictionIconSize(notification),
              width: getNotifictionIconSize(notification),
              margin: EdgeInsets.all(0),
              imageUrl: getNotifictionIcon(notification) ?? '',
            ),
            title: Text(
              notification.title,
              style: TextStyle(
                color: Color(0xFF0B0B0B),
                fontSize: 16,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        notification.content,
                        style: TextStyle(
                          color: Color(0xFF464646),
                          fontSize: 14,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        dateTimeService.convertToPredefinedFormat(
                            notification.date,
                            PredefinedDateFormat.time12HourFormat),
                        style: TextStyle(
                          color: Color(0xFF6A6A6A),
                          fontSize: 12,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.left,
                      )
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 18,
                    )),
              ],
            ),
          );
  }
}

class Chat {
  final String id;
  final String content;
  final String title;
  final NotificationType notificationType;
  final User user;
  final DateTime date;

  Chat({
    required this.id,
    required this.content,
    required this.title,
    required this.notificationType,
    required this.user,
    required this.date,
  });
}

class User {
  final int id;
  final String userId;
  final String firstName;
  final String lastName;
  final String? imgUrl;

  User(
      {required this.userId,
      required this.id,
      required this.firstName,
      required this.lastName,
      this.imgUrl});
}

// Creating Users
final User user1 = User(
    userId: '@RP002KLDMS',
    id: 1,
    firstName: 'John',
    lastName: 'Doe',
    imgUrl: '...');
final User user2 = User(
    id: 2,
    firstName: 'Alice',
    lastName: 'Smith',
    imgUrl: '...',
    userId: '@RP01KLOE');
final User user3 =
    User(id: 3, firstName: 'Bob', lastName: 'Johnson', userId: '@RP002KOP4');

// Creating Notifications linked to Users
final Chat notification1 = Chat(
    id: '1',
    content: 'This is notification 1 content FAVORITE',
    title: 'Notification 1',
    notificationType: NotificationType.FAVORITE,
    user: user1,
    date: DateTime(2020, 8, 2, 12));

final Chat notification2 = Chat(
    id: '2',
    content: 'This is notification 2 content ACTION',
    title: 'Notification 2',
    notificationType: NotificationType.ACTION,
    user: user2,
    date: DateTime(2023, 12, 15, 0));

final Chat notification3 = Chat(
    id: '3',
    content: 'This is notification 3 content ACTION',
    title: 'Notification 3',
    notificationType: NotificationType.ACTION,
    user: user3,
    date: DateTime.now());

final Chat notification4 = Chat(
    id: '2',
    content: 'This is notification 2 content SECURITY',
    title: 'Notification 2',
    notificationType: NotificationType.SECURITY,
    user: user2,
    date: DateTime(2023, 12, 15, 0));
final Chat notification5 = Chat(
    id: '2',
    content: 'This is notification 2 content FAVORITE',
    title: 'Notification 2',
    notificationType: NotificationType.FAVORITE,
    user: user2,
    date: DateTime(2023, 12, 15, 0));
final Chat notification6 = Chat(
    id: '2',
    content: 'This is notification 2 content SECURITY',
    title: 'Notification 2',
    notificationType: NotificationType.SECURITY,
    user: user2,
    date: DateTime(2020, 8, 2, 12));
final Chat notification7 = Chat(
    id: '2',
    content: 'This is notification 2 content FAVORITE',
    title: 'Notification 2',
    notificationType: NotificationType.FAVORITE,
    user: user2,
    date: DateTime(2020, 8, 2, 12));

List<Chat> chats = [
  notification1,
  notification2,
  notification3,
  notification4,
  notification5,
  notification6,
  notification7
];

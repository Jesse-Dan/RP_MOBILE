// ignore_for_file: non_constant_identifier_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:navigation_system/go/go.dart';
import 'package:recenth_posts/src/utils/components/profile_icon.dart';
import 'package:recenth_posts/src/utils/style/app_colors.dart';
import 'package:sticky_grouped_list/sticky_grouped_list.dart';

import '../../../../logic/services/date_service/date_time_service.dart';
import '../../../../utils/enums/enums.dart';
import '../../../../utils/style/app_dimentions.dart';
import '../../../base/base_scaffold.dart';

class ChatDetailsView extends StatefulWidget {
  static const String routeName = '/chats.details.view';
  final List<Chat> chatsData;
  final User reciever;
  const ChatDetailsView({
    super.key,
    required this.chatsData,
    required this.reciever,
  });

  @override
  State<ChatDetailsView> createState() => _ChatDetailsViewState();
}

class _ChatDetailsViewState extends State<ChatDetailsView> {
  final GlobalKey key = GlobalKey();

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
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      addbodyPadding: false,
      addAppBar: true,
      bottomSheet: ChatTextField(
        textEditingController: textEditingController,
      ),
      appbar: AppBar(
        leading: IconButton(
          onPressed: () {
            Go(context).pop();
          },
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
              '${widget.reciever.firstName} ${widget.reciever.lastName}',
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
      body: Padding(
        padding: const EdgeInsets.only(bottom: 120.0),
        child: SizedBox(
          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: widget.chatsData
                  .where((element) =>
                      element.reciever.id == widget.reciever.id ||
                      element.sender.id == 1)
                  .toList()
                  .isEmpty
              ? Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 260,
                    height: 75,
                    child: Text(
                      'Be thee first \nSend a message',
                      style: TextStyle(
                        color: Color(0xFF232323),
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : StickyGroupedListView<Chat, DateTime>(
                  physics: NeverScrollableScrollPhysics(),
                  itemScrollController: itemScrollController,
                  shrinkWrap: true,
                  elements: widget.chatsData
                      .where((element) =>
                          element.reciever.id == widget.reciever.id ||
                          element.sender.id == 1)
                      .toList(),
                  groupBy: (Chat element) => element.date,
                  floatingHeader: true,
                  reverse: false,
                  groupSeparatorBuilder: (Chat element) => Container(
                    alignment: Alignment.center,
                    width: 60,
                    height: 27,
                    margin: EdgeInsets.only(
                        bottom: AppDimentions.k20, top: AppDimentions.k20),
                    decoration: BoxDecoration(
                        color: Color(0xFFF7F7F7),
                        borderRadius: BorderRadius.circular(4)),
                    child: Text(
                      getDayOfTheWeek(element.date),
                      style: TextStyle(
                        color: Color(0xFF0B0B0B),
                        fontSize: 14,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  itemBuilder: (context, Chat element) {
                    return MessageTile(
                      chat: element,
                    );
                  },

                  order: StickyGroupedListOrder.ASC, // optional
                ),
        ),
      ),
    );
  }
}

class ChatTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  const ChatTextField({
    super.key,
    required this.textEditingController,
  });

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 25),
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: AppDimentions.k16,
      ),
      decoration: BoxDecoration(
          border: Border.symmetric(
              vertical: BorderSide(color: AppColors.kgrayColor50))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 318,
            height: 64,
            padding: EdgeInsets.all(20),
            decoration: ShapeDecoration(
              color: Color(0xFFF7F7F7),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            child: TextFormField(
              onChanged: (val) {
                setState(() {});
              },
              controller: widget.textEditingController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: widget.textEditingController.text.isEmpty
                ? null
                : () {
                    chats.add(Chat(
                        id: 5,
                        content: 'jesse loves you ',
                        sender: user1,
                        reciever: user4,
                        date: DateTime(2023, 12, 15, 0),
                        seen: false));
                    setState(() {});
                  },
            child: Container(
              width: 48,
              height: 48,
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                color: widget.textEditingController.text.isEmpty
                    ? AppColors.kprimaryColor200
                    : AppColors.kprimaryColor700,
                shape: OvalBorder(),
              ),
              child:
                  SvgPicture.asset('assets/icons/carbon_send-alt-filled.svg'),
            ),
          )
        ],
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  final Chat chat;
  MessageTile({
    super.key,
    required this.chat,
  });

  String? getNotifictionIcon(chat) {
    switch (chat.chatType) {
      case NotificationType.ACTION:
        return 'bold_frame.svg';
      case NotificationType.SECURITY:
        return 'carbon_security.svg';
      default:
        return null;
    }
  }

  double? getNotifictionIconSize(chat) {
    switch (chat.chatType) {
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
          alignment: chat.sender.id == 1
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.all(AppDimentions.k16),
            decoration: ShapeDecoration(
              color: chat.sender.id == 1
                  ? AppColors.kprimaryColor700
                  : AppColors.kgrayColor50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9)),
            ),
            child: Column(
              crossAxisAlignment: chat.sender.id == 1
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: chat.sender.id == 1
                      ? const EdgeInsets.only(right: 8.0)
                      : const EdgeInsets.only(left: 8.0),
                  child: SizedBox(
                    width: 194,
                    child: Text(
                      'Hi, good morning Katrina, how are you doing ?😊😊',
                      style: TextStyle(
                        color: chat.sender.id == 1
                            ? AppColors.kbrandWhite
                            : AppColors.kblackColor,
                        fontSize: 14,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppDimentions.k16 / 2),
                chat.sender.id == 1
                    ? Row(
                        mainAxisAlignment: chat.sender.id == 1
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '08:35',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                              letterSpacing: -0.41,
                            ),
                          ),
                          const SizedBox(width: 4),
                          SvgPicture.asset(
                            'assets/icons/ci_check-all.svg',
                            height: 15,
                            width: 15,
                          )
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          '08:35',
                          style: TextStyle(
                            color: chat.sender.id == 1
                                ? AppColors.kbrandWhite
                                : AppColors.kblackColor,
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                            letterSpacing: -0.41,
                          ),
                        ),
                      ),
              ],
            ),
          )),
    );
  }
}

class Chat {
  final int id;
  final String content;
  final User sender;
  final User reciever;
  final DateTime date;
  final bool seen;

  Chat({
    required this.id,
    required this.content,
    required this.sender,
    required this.reciever,
    required this.date,
    required this.seen,
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
final User user3 = User(
  id: 3,
  firstName: 'Bob',
  lastName: 'Johnson',
  userId: '@RP002KOP4',
);
final User user4 = User(
  id: 4,
  firstName: 'Finn',
  lastName: 'Danladi',
  userId: '@RP4449203',
);
List<User> users = [user1, user2, user3, user4];

// Creating Chats linked to Users
final Chat chat1 = Chat(
    id: 0,
    content: 'Hi, good morning Katrina, how are you doing ?😊😊',
    sender: user1,
    reciever: user2,
    date: DateTime(2023, 12, 15, 0),
    seen: false);
final Chat chat2 = Chat(
    id: 0,
    content: 'Hi, good morning Katrina, how are you doing ?😊😊',
    sender: user1,
    reciever: user2,
    date: DateTime(2023, 12, 15, 0),
    seen: false);
final Chat chat3 = Chat(
    id: 0,
    content: 'Hi, good morning Katrina, how are you doing ?😊😊',
    sender: user2,
    reciever: user3,
    date: DateTime(2023, 12, 15, 0),
    seen: false);
final Chat chat4 = Chat(
    id: 0,
    content: 'Hi, good morning Katrina, how are you doing ?😊😊',
    sender: user3,
    reciever: user1,
    date: DateTime(2023, 12, 15, 0),
    seen: false);
final Chat chat5 = Chat(
    id: 0,
    content: 'Hi, good morning Katrina, how are you doing ?😊😊',
    sender: user2,
    reciever: user1,
    date: DateTime(2023, 12, 15, 0),
    seen: false);
final Chat chat6 = Chat(
    id: 0,
    content: 'Hi, good morning Katrina, how are you doing ?😊😊',
    sender: user2,
    reciever: user3,
    date: DateTime(2023, 12, 15, 0),
    seen: false);
final Chat chat7 = Chat(
    id: 0,
    content: 'Hi, good morning Katrina, how are you doing ?😊😊',
    sender: user2,
    reciever: user1,
    date: DateTime(2023, 12, 15, 0),
    seen: true);
final Chat chat8 = Chat(
    id: 0,
    content: 'Hi, good morning Katrina, how are you doing ?😊😊',
    sender: user1,
    reciever: user3,
    date: DateTime(2023, 12, 15, 0),
    seen: false);
final Chat chat9 = Chat(
    id: 0,
    content: 'Hi, good morning Katrina, how are you doing ?😊😊',
    sender: user2,
    reciever: user1,
    date: DateTime(2023, 12, 15, 0),
    seen: false);
final Chat chat10 = Chat(
    id: 0,
    content: 'Hi, good morning Katrina, how are you doing ?😊😊',
    sender: user1,
    reciever: user3,
    date: DateTime(2023, 12, 15, 0),
    seen: true);

List<Chat> chats = [
  chat1,
  chat2,
  chat3,
  chat4,
  chat5,
  chat6,
  chat7,
  chat8,
  chat9,
  chat10
];

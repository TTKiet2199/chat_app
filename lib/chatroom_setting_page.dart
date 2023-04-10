import 'package:chat_app/app_theme/colors.dart';
import 'package:chat_app/data_user.dart';
import 'package:chat_app/models/user.dart';
import 'package:chat_app/personal_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatroomSettingPage extends StatefulWidget {
  ChatroomSettingPage({Key? key, required this.settingData}) : super(key: key);
  User settingData;
  @override
  State<ChatroomSettingPage> createState() => _ChatroomSettingPageState();
}

class _ChatroomSettingPageState extends State<ChatroomSettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorTheme,
      appBar: AppBar(
        title: const Text(
          'Chatroom Setting',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 15, left: 30),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 24),
                    child: Text(
                      'Chatroom',
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      child: Container(
                        height: 40,
                        width: 130,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFF03A9F1)),
                        child: Center(
                          child: Text(
                              widget.settingData.isGroup == false
                                  ? 'Block'
                                  : 'New User',
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Container(
                        height: 40,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFFF18303)),
                        child: Center(
                          child: Text(
                              widget.settingData.isGroup == false
                                  ? 'Turn Off Notifications'
                                  : 'Delete Chatroom',
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: 24),
                    child: Text('Team',
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.only(left: 30),
                  itemCount: widget.settingData.numberMember,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              InkWell(
                                child: Container(
                                    margin: const EdgeInsets.only(bottom: 15),
                                    height: 44,
                                    width: 44,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xFF7A8194),
                                          width: 2),
                                      borderRadius: BorderRadius.circular(34),
                                      image: widget.settingData.isGroup == true
                                          ? dataUser[index].image
                                          : widget.settingData.image,
                                    )),
                                onTap: () {},
                              ),
                              SizedBox(
                                width: 296,
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                      widget.settingData.isGroup == true
                                          ? (dataUser[index].username == null
                                              ? 'error'
                                              : dataUser[index].username!)
                                          : (widget.settingData.username ??
                                              'error'),
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                InkWell(
                                  child: Container(
                                      height: 40,
                                      width: 120,
                                      margin: const EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: const Color(0xFF373E4E)),
                                      child: const Center(
                                        child: Text('Full Access',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white)),
                                      )),
                                  onTap: () {
                                    widget.settingData.isGroup == false
                                        ? Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    PersonalPage(
                                                        dataPerson: widget
                                                            .settingData))))
                                        : Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    PersonalPage(
                                                        dataPerson:
                                                            dataUser[index]))));
                                  },
                                ),
                                InkWell(
                                  child: Container(
                                    height: 40,
                                    width: 185,
                                    margin: const EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color(0xFF7A8194)),
                                    child: const Center(
                                      child: Text('Reglar Access',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white)),
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                                InkWell(
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            width: 1,
                                            color: const Color(0xFFF18303)),
                                        color: const Color(0xFF373E4E)),
                                    child: SvgPicture.asset(
                                        '/Users/truongthekiet/dev/chatapp/assets/image/icon/icontrash.svg'),
                                  ),
                                  onTap: () {},
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}

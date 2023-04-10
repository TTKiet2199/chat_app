import 'package:chat_app/app_theme/colors.dart';
import 'package:chat_app/items/input_chat_item.dart';
import 'package:chat_app/models/user.dart';
import 'package:flutter/material.dart';
import 'chatroom_setting_page.dart';

class MesPage extends StatefulWidget {
  MesPage({Key? key, required this.data}) : super(key: key);
  User data;

  @override
  State<MesPage> createState() => _MesPageState();
}

class _MesPageState extends State<MesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorTheme,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Row(
          children: [
            widget.data.isGroup == true
                ? Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 40, top: 5),
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: widget.data.image),
                      ),
                      Container(
                        height: 35,
                        width: 35,
                        margin: const EdgeInsets.only(left: 25),
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0xFF414756),
                        ),
                        child: Center(
                          child: Text(
                            '+${widget.data.numberMember}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(
                    height: 44,
                    width: 44,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: widget.data.image),
                  ),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(widget.data.isGroup == true
                    ? (widget.data.tenGroup ?? "error")
                    : (widget.data.username ?? 'error')),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) =>
                        ChatroomSettingPage(settingData: widget.data))));
              },
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) =>
                      ChatroomSettingPage(settingData: widget.data))));
            },
          )
        ],
      ),
      body: const InputChat(),
    );
  }
}

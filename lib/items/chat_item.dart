import 'package:chat_app/data_user.dart';
import 'package:chat_app/message_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          padding: const EdgeInsets.only(top: 25),
          itemCount: dataUser.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              child: Container(
                margin: const EdgeInsets.only(bottom: 26),
                child: Row(
                  children: <Widget>[
                    dataUser[index].isGroup == false
                        ? Container(
                            margin: const EdgeInsets.only(left: 40),
                            height: 35,
                            width: 35,
                            alignment: Alignment.bottomRight,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: dataUser[index].image,
                            ))
                        : Stack(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 40, top: 15),
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    image: dataUser[index].image),
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
                                    '+${dataUser[index].numberMember}',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                    Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(children: <Widget>[
                              SizedBox(
                                width: 220,
                                child: Text(
                                  dataUser[index].isGroup == true
                                      ? (dataUser[index].tenGroup ?? "error")
                                      : (dataUser[index].username ?? 'error'),
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                              ),
                              Text(DateFormat.yMd().format(DateTime.now()),
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.white)),
                            ]),
                            const Padding(padding: EdgeInsets.only(top: 5)),
                            Text(
                              dataUser[index].content == null
                                  ? "error"
                                  : dataUser[index].content!,
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.white),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => MesPage(data: dataUser[index]))));
              },
            );
          }),
    );
  }
}

import 'package:chat_app/models/mes.dart';
import 'package:flutter/material.dart';

class MesContentItem extends StatelessWidget {
  const MesContentItem({
    Key? key,
    required this.messages,
  }) : super(key: key);
  final List<Mes> messages;
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Align(
        alignment: Alignment.topCenter,
        child: ListView.builder(
            padding: const EdgeInsets.only(top: 35, left: 35, right: 35),
            itemCount: messages.length,
            itemBuilder: (context, index) {
              return Align(
                  alignment: Alignment.topRight,
                  child: Container(
                      margin: const EdgeInsets.only(left: 95),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFF272A35)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.5),
                        child: messages[index].text == null
                            ? messages[index].anh
                            : Text(
                                messages[index].text!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: 'Roboto-Bold.ttf'),
                              ),
                      )));
            }),
      );
    });
  }
}

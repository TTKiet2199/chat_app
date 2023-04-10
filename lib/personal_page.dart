import 'package:chat_app/app_theme/colors.dart';
import 'package:chat_app/models/user.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PersonalPage extends StatefulWidget {
  PersonalPage({Key? key, required this.dataPerson}) : super(key: key);
  User dataPerson;

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        backgroundColor: colorTheme,
        appBar: AppBar(
            title: Text(widget.dataPerson.username == null
                ? 'error'
                : widget.dataPerson.username!)),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF03A9F1), width: 2),
                  borderRadius: BorderRadius.circular(20),
                  image: widget.dataPerson.image),
            ),
          ),
          Container(
              margin: const EdgeInsets.all(15),
              child: Text(
                'Date Of Birth: ${DateFormat.yMMMd().format(widget.dataPerson.dateOfBirth!)}',
                style: widget.dataPerson.fontsize,
              )),
          Container(
              margin: const EdgeInsets.only(left: 15, bottom: 15),
              child: Text(
                'Age: ${widget.dataPerson.age}',
                style: widget.dataPerson.fontsize,
              )),
          Container(
              margin: const EdgeInsets.only(left: 15, bottom: 15),
              child: Text(
                'Email: ${widget.dataPerson.email}',
                style: widget.dataPerson.fontsize,
              )),
          Container(
              margin: const EdgeInsets.only(left: 15, bottom: 15),
              child: Text(
                'Phone: ${widget.dataPerson.sdt}',
                style: widget.dataPerson.fontsize,
              )),
        ]),
      );
    });
  }
}

import 'package:chat_app/models/login.dart';
import 'package:chat_app/models/mes.dart';
import 'package:chat_app/models/user.dart';
import 'package:flutter/material.dart';

final dataUser = [
  User(
      id: 1,
      username: 'AHIHHI',
      sdt: 0900908778,
      email: 'ahihi123@gmail.com',
      dateOfBirth: DateTime.utc(1999, 01, 02),
      age: 23,
      content: 'content',
      fontsize: const TextStyle(
          color: Colors.white, fontSize: 20, fontFamily: 'Roboto-Bold.ttf'),
      image: const DecorationImage(
          image: AssetImage(
              '/Users/truongthekiet/dev/chatapp/assets/image/useravarta/userimage1.jpg'),
          fit: BoxFit.cover),
      color: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[Color(0xFFFFE81D), Color(0xFF00F0FF)]),
      numberMember: 5,
      tenGroup: 'Nhom A',
      isGroup: true),
  User(
      id: 2,
      username: 'KHOA',
      sdt: 0987656478,
      email: 'khoale123@gmail.com',
      dateOfBirth: DateTime.parse('1995-04-19'),
      age: 27,
      content: 'content',
      fontsize: const TextStyle(
          color: Colors.white, fontSize: 20, fontFamily: 'Roboto-Bold.ttf'),
      image: const DecorationImage(
          image: AssetImage(
              '/Users/truongthekiet/dev/chatapp/assets/image/useravarta/userimage2.png'),
          fit: BoxFit.cover),
      color: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[Color(0xFF03A9F1), Color(0xFFA0025A)]),
      numberMember: 1,
      isGroup: false),
  User(
      id: 3,
      username: 'TU',
      sdt: 0987677859,
      email: 'tuback123@gmail.com',
      dateOfBirth: DateTime.utc(1998, 05, 28),
      age: 24,
      content: 'content',
      fontsize: const TextStyle(
          color: Colors.white, fontSize: 20, fontFamily: 'Roboto-Bold.ttf'),
      image: const DecorationImage(
          image: AssetImage(
              '/Users/truongthekiet/dev/chatapp/assets/image/useravarta/userimage3.png'),
          fit: BoxFit.cover),
      color: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[Color(0xFFB347EA), Color(0xFF09F9BF)]),
      numberMember: 3,
      tenGroup: 'Nhom B',
      isGroup: true),
  User(
      id: 4,
      username: 'HUNG',
      content: null,
      sdt: 0988734565,
      email: 'vuongtuananh123@gmail.com',
      dateOfBirth: DateTime.utc(1995, 04, 22),
      age: 27,
      fontsize: const TextStyle(
          color: Colors.white, fontSize: 20, fontFamily: 'Roboto-Bold.ttf'),
      image: const DecorationImage(
          image: AssetImage(
              '/Users/truongthekiet/dev/chatapp/assets/image/useravarta/userimage4.png'),
          fit: BoxFit.cover),
      color: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color.fromARGB(255, 255, 67, 29),
            Color.fromARGB(255, 212, 255, 0)
          ]),
      numberMember: 4,
      tenGroup: 'Nhom C',
      isGroup: true),
  User(
      id: 5,
      username: 'NAM',
      sdt: 0988435636,
      email: 'namahihi123@gmail.com',
      dateOfBirth: DateTime.utc(1998, 3, 8),
      age: 24,
      content: 'content',
      fontsize: const TextStyle(
          color: Colors.white, fontSize: 20, fontFamily: 'Roboto-Bold.ttf'),
      image: const DecorationImage(
          image: AssetImage(
              '/Users/truongthekiet/dev/chatapp/assets/image/useravarta/userimage5.png'),
          fit: BoxFit.cover),
      color: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color.fromARGB(255, 255, 29, 180),
            Color.fromARGB(255, 47, 0, 255)
          ]),
      numberMember: 1,
      isGroup: false),
];

addDataUser(User content) {
  dataUser.add(content);
}

final dataMes = [
  Mes(
      // anh: Image.asset(''),
      // '/Users/truongthekiet/dev/chatapp/assets/image/useravarta/userimage1.jpg'),
      font: const TextStyle(
          color: Colors.white, fontSize: 15, fontFamily: 'Roboto-Bold.ttf'),
      nguoiGui: true),
  Mes(
      font: const TextStyle(
          color: Colors.white, fontSize: 15, fontFamily: 'Roboto-Bold.ttf'),
      nguoiGui: false),
];
addDataMes(Mes text) {
  dataMes.add(text);
}

final dataLogin = [LoginInfo(loginName: '', passWord: '')];

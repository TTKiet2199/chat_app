import 'package:flutter/material.dart';

class User {
  String? username;
  String? content;
  DecorationImage? image;
  int? id;
  DateTime? time;
  LinearGradient? color;
  bool? isGroup;
  int? numberMember;
  String? tenGroup;
  int? sdt;
  TextStyle? fontsize;
  String? email;
  int? age;
  DateTime? dateOfBirth;
  String? pass;
  User(
      {this.pass,
      this.fontsize,
      this.age,
      this.dateOfBirth,
      this.email,
      this.sdt,
      this.id,
      this.tenGroup,
      required this.username,
      this.content,
      this.image,
      this.time,
      this.color,
      this.numberMember,
      this.isGroup});
  User.user2(this.color, this.content);
}

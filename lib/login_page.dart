import 'package:chat_app/home.dart';
import 'package:chat_app/models/login.dart';

import 'package:chat_app/register_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginInfo _value = LoginInfo(loginName: '', passWord: '');
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _usernameController.addListener(() {
      final String text = _usernameController.text.toLowerCase();
      _usernameController.value = _usernameController.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
    _passwordController.addListener(() {
      final String text = _passwordController.text.toLowerCase();
      _passwordController.value = _passwordController.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                height: 50,
                width: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue),
                child: const Center(
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: TextFormField(
                  controller: _usernameController,
                  onChanged: (text) {
                    _value.loginName = text;
                  },
                  decoration: const InputDecoration(
                      icon: Icon(Icons.person), labelText: 'Email/Username:'),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: TextFormField(
                  controller: _passwordController,
                  onChanged: ((text) {
                    _value.passWord = text;
                  }),
                  decoration: const InputDecoration(
                      icon: Icon(Icons.key), labelText: 'Password:'),
                ),
              ),
              Row(
                children: [
                  InkWell(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 25, right: 10),
                      height: 40,
                      width: 180,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red),
                      child: const Center(
                          child: Text(
                        'SIGN IN',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                    ),
                    onTap: () {
                      _value.loginName!.isEmpty || _value.passWord!.isEmpty
                          ? (ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Please enter an email or a username'))))
                          : Navigator.of(context).push(MaterialPageRoute(
                              builder: ((context) => const HomePage())));
                    },
                  ),
                  InkWell(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 25),
                      height: 40,
                      width: 180,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey),
                      child: const Center(
                          child: Text(
                        'SIGN UP',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => const RegisterPage())));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

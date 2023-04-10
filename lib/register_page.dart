import 'package:chat_app/home.dart';
import 'package:chat_app/login_page.dart';
import 'package:chat_app/models/register.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterInfo _register =
      RegisterInfo(registerName: '', registerPass: '');
  final TextEditingController _regisName = TextEditingController();
  final TextEditingController _regisPass = TextEditingController();
  @override
  void initState() {
    super.initState();
    _regisName.addListener(() {
      final String text = _regisName.text.toLowerCase();
      _regisName.value = _regisName.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
    _regisPass.addListener(() {
      final String text = _regisPass.text.toLowerCase();
      _regisPass.value = _regisPass.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  void dispose() {
    _regisName.dispose();
    _regisPass.dispose();
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
                    'SIGN UP',
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
                  controller: _regisName,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.person), labelText: 'Email/Username:'),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: TextFormField(
                  controller: _regisPass,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.key), labelText: 'Password:'),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: TextFormField(
                  controller: _regisPass,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.key),
                      labelText: 'Enter Password Again:'),
                ),
              ),
              InkWell(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 25),
                  height: 40,
                  width: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red),
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
                  _regisName.text.isEmpty || _regisPass.text.isEmpty
                      ? (ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                                  Text('Please enter an email or a username'))))
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
                    'CANCEL',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => LoginPage())));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

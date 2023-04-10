import 'dart:io';
import 'package:chat_app/items/mesenger_content_item.dart';
import 'package:chat_app/models/mes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class InputChat extends StatefulWidget {
  const InputChat({Key? key}) : super(key: key);

  @override
  State<InputChat> createState() => _InputChatState();
}

class _InputChatState extends State<InputChat> {
  Future<File?> pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return null;
      return File(image.path);
    } on PlatformException {
      return null;
    }
  }

  final TextEditingController _mesController = TextEditingController();
  Mes _content = Mes(text: '', anh: Image.asset(''));
  final List<Mes> _newMes = <Mes>[];
  @override
  void initState() {
    super.initState();
    _mesController.addListener(() {
      final String text = _mesController.text.toLowerCase();
      _mesController.value = _mesController.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  void dispose() {
    _mesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: MesContentItem(
            messages: _newMes,
          ),
        ),
        Expanded(
          flex: 0,
          child: Container(
            margin: const EdgeInsets.only(left: 25, right: 20, bottom: 25),
            child: Row(children: <Widget>[
              Expanded(
                child: SizedBox(
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: null,
                    controller: _mesController,
                    onChanged: (text) {
                      _content.text = text;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      filled: true,
                      fillColor: Color(0xFF272A35),
                      hintText: 'Write',
                      hintStyle: TextStyle(fontSize: 16, color: Colors.white),
                      contentPadding:
                          EdgeInsets.only(top: 12, bottom: 12, left: 20),
                    ),
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _newMes.add(_content);
                    _content = Mes(text: '');
                    _mesController.text = '';
                  });
                },
                child: SvgPicture.asset(
                    '/Users/truongthekiet/dev/chatapp/assets/image/icon/iconMes.svg'),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 15,
                ),
              ),
              InkWell(
                onTap: () async {
                  final imageFile = await pickImage();
                  if (imageFile != null) {
                    _newMes.add(_content);
                    _content = Mes(anh: Image.file(imageFile));
                  }
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFF00AC83)),
                  child: SvgPicture.asset(
                      '/Users/truongthekiet/dev/chatapp/assets/image/icon/iconCam.svg'),
                ),
              )
            ]),
          ),
        ),
      ],
    );
  }
}

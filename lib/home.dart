import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'app_theme/colors.dart';
import 'items/chat_item.dart';
import 'items/story_item.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: colorTheme,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 35, top: 51),
              child: Row(
                children: <Widget>[
                  SvgPicture.asset(
                      '/Users/truongthekiet/dev/chatapp/assets/image/icon/icon1.svg'),
                  const Padding(padding: EdgeInsets.only(left: 15)),
                  const Text(
                    'USER NAME',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Roboto-Bold.ttf'),
                  ),
                  InkWell(
                    child: Container(
                      margin: const EdgeInsets.only(left: 80),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: const Color(0xFF7A8194), width: 2)),
                      child: const Center(
                          child: Icon(
                        Icons.logout,
                        color: Colors.white,
                      )),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => LoginPage())));
                    },
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 25, top: 20, right: 20),
              child: Row(children: <Widget>[
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        filled: true,
                        fillColor: Colors.black,
                        hintText: 'Search...',
                        hintStyle:
                            const TextStyle(fontSize: 16, color: Colors.white),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 20),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: InkWell(
                            onTap: () {},
                            child: SvgPicture.asset(
                                '/Users/truongthekiet/dev/chatapp/assets/image/icon/iconsearch.svg'),
                          ),
                        ),
                      ),
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.only(
                  left: 15,
                )),
                InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(
                      '/Users/truongthekiet/dev/chatapp/assets/image/icon/iconadd.svg'),
                ),
              ]),
            ),
            Container(
              margin: const EdgeInsets.only(left: 35, top: 20),
              child: const Text(
                'Chatrooms',
                style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                    fontFamily: "Roboto-Bold.ttf"),
              ),
            ),
            const StoryItem(),
            const ChatItem()
          ],
        ),
      ),
    );
  }
}

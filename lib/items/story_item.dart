import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import '../../data_user.dart';
import '../message_page.dart';

class StoryItem extends StatefulWidget {
  const StoryItem({Key? key}) : super(key: key);

  @override
  State<StoryItem> createState() => _StoryItemState();
}

class _StoryItemState extends State<StoryItem> {
  num position = 0.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 140,
          child: ListView.builder(
              padding: const EdgeInsets.only(left: 25, top: 15),
              scrollDirection: Axis.horizontal,
              itemCount: dataUser.length,
              itemBuilder: ((context, index) {
                return InkWell(
                  onTap: (() {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) =>
                            MesPage(data: dataUser[index]))));
                    setState(() {
                      position = index;
                    });
                  }),
                  child: Container(
                    margin: const EdgeInsets.only(right: 20),
                    width: 95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: dataUser[index].image,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 82, left: 10),
                      child: Text(
                        dataUser[index].username ?? "error",
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto-Blod.ttf',
                            color: Colors.white),
                      ),
                    ),
                  ),
                );
              })),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 31),
          child: DotsIndicator(
            dotsCount: dataUser.length,
            position: position.toDouble(),
            decorator: const DotsDecorator(
                color: Color.fromARGB(253, 92, 87, 87),
                activeColor: Color(0xFFC4C4C4)),
          ),
        )
      ],
    );
  }
}

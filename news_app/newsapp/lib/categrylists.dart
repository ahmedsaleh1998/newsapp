import 'package:flutter/material.dart';
import 'package:newsapp/main.dart';
import 'package:newsapp/provider.dart';
import 'package:newsapp/textstyle.dart';
import 'package:provider/provider.dart';

class list_of_categories extends StatefulWidget {
  @override
  _list_of_categoriesState createState() => _list_of_categoriesState();
}

class _list_of_categoriesState extends State<list_of_categories> {
  List<category> categoris = [
    category('general', 'assets/images/generalnews.jpg'),
    category('health', 'assets/images/healthnews.jpg'),
    category('science', 'assets/images/sciencenews.jpg'),
    category('sports', 'assets/images/sports news.jpg'),
    category('technology', 'assets/images/technologynews.jpg'),
    category('entertenment', 'assets/images/entertainment-news.png'),
    category('business', 'assets/images/businessnews.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Container(
        color: Colors.black54,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 10,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoris.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.height / 7,
                child: GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 7,
                        height: MediaQuery.of(context).size.width / 7,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                                image: AssetImage(categoris[index].image),
                                fit: BoxFit.fill)),
                      ),
                      Expanded(
                        child: textTheme(
                          text: categoris[index].name,
                          textcolor: Colors.white,
                          textsize: 15,
                          wight: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class category {
  String name;
  String image;
  category(this.name, this.image);
}

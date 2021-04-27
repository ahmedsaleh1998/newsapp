import 'package:flutter/material.dart';
import 'package:newsapp/arabic.dart';

import 'package:newsapp/categrylists.dart';
import 'package:newsapp/englishfile.dart';

import 'package:newsapp/global.dart';
import 'package:newsapp/provider.dart';
import 'package:newsapp/splashscreen.dart';
import 'package:newsapp/textstyle.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(Splashscreen());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var title1 = textTheme(
      text: 'Egyption', textcolor: Colors.white, wight: true, textsize: 21);
  var title2 = textTheme(
      text: 'News', textcolor: Colors.blue, wight: true, textsize: 21);
  String laguage = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    laguage = '';
  }

  @override
  Widget build(BuildContext context) {
    List<category> categoris = [
      category('general', 'assets/images/generalnews.jpg'),
      category('health', 'assets/images/healthnews.jpg'),
      category('science', 'assets/images/sciencenews.jpg'),
      category('sports', 'assets/images/sports news.jpg'),
      category('technology', 'assets/images/technologynews.jpg'),
      category('entertainment', 'assets/images/entertainment-news.png'),
      category('business', 'assets/images/businessnews.jpg'),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 7,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.search_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {}),
              IconButton(
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {}),
            ],
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [title1, title2],
            ),
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(
                  child: Text(categoris[0].name),
                ),
                Tab(
                  child: Text(categoris[1].name),
                ),
                Tab(
                  child: Text(categoris[2].name),
                ),
                Tab(
                  child: Text(categoris[3].name),
                ),
                Tab(
                  child: Text(categoris[4].name),
                ),
                Tab(
                  child: Text(categoris[5].name),
                ),
                Tab(
                  child: Text(categoris[6].name),
                ),
              ],
            ),
          ),
          body: lang(
            language: laguage,
          ),
          drawer: Drawer(
            child: Column(
              children: [
                Container(
                  height: 200,
                  color: Colors.grey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [title1, title2],
                  ),
                ),
                Card(
                  color: Colors.blue[200],
                  child: ListTile(
                    leading: Icon(Icons.add_box_outlined),
                    title: Text(
                      'Arab News',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        laguage = 'ar';
                      });
                    },
                  ),
                ),
                ////////////////
                Card(
                  color: Colors.green[200],
                  child: ListTile(
                    leading: Icon(Icons.add_box_outlined),
                    title: Text('English News',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontStyle: FontStyle.normal,
                        )),
                    onTap: () {
                      setState(() {
                        laguage = 'en';
                      });
                    },
                  ),
                ), ////////
                Card(
                  color: Colors.red[200],
                  child: ListTile(
                    leading: Icon(Icons.add_box_outlined),
                    title: Text('All news',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          fontStyle: FontStyle.normal,
                        )),
                    onTap: () {
                      setState(() {
                        laguage = '';
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class lang extends StatelessWidget {
  @override
  String language;
  lang({this.language});
  Widget build(BuildContext context) {
    var x = this.language;
    if (x == 'ar') {
      return TabBarView(
        children: [
          Container(
            child: Column(
              children: [
                newslistar(
                  categoryname: 'general',
                ),
              ],
            ),
          ),
          ///////////////////////////
          Container(
            child: Column(
              children: [
                newslistar(
                  categoryname: 'health',
                ),
              ],
            ),
          ),
          ///////////////////////
          Container(
            child: Column(
              children: [
                newslistar(
                  categoryname: 'science',
                ),
              ],
            ),
          ),
          ///////////////////////////////
          Container(
            child: Column(
              children: [
                newslistar(
                  categoryname: 'sports',
                ),
              ],
            ),
          ),
          /////////////////////
          Container(
            child: Column(
              children: [
                newslistar(
                  categoryname: 'technology',
                ),
              ],
            ),
          ),
          // /////////////////////
          Container(
            child: Column(
              children: [
                newslistar(
                  categoryname: 'entertainment',
                ),
              ],
            ),
          ),
          ///////////////////////
          Container(
            child: Column(
              children: [
                newslistar(
                  categoryname: 'business',
                ),
                // list_of_categories()
              ],
            ),
          ),
        ],
      );
    } else {
      if (x == 'en') {
        return TabBarView(
          children: [
            Container(
              child: Column(
                children: [
                  newslisten(
                    categoryname: 'general',
                  ),
                ],
              ),
            ),
            ///////////////////////////
            Container(
              child: Column(
                children: [
                  newslisten(
                    categoryname: 'health',
                  ),
                ],
              ),
            ),
            ///////////////////////
            Container(
              child: Column(
                children: [
                  newslisten(
                    categoryname: 'science',
                  ),
                ],
              ),
            ),
            ///////////////////////////////
            Container(
              child: Column(
                children: [
                  newslisten(
                    categoryname: 'sports',
                  ),
                ],
              ),
            ),
            /////////////////////
            Container(
              child: Column(
                children: [
                  newslisten(
                    categoryname: 'technology',
                  ),
                ],
              ),
            ),
            // /////////////////////
            Container(
              child: Column(
                children: [
                  newslisten(
                    categoryname: 'entertainment',
                  ),
                ],
              ),
            ),
            ///////////////////////
            Container(
              child: Column(
                children: [
                  newslisten(
                    categoryname: 'business',
                  ),
                  // list_of_categories()
                ],
              ),
            ),
          ],
        );
      } else {
        return TabBarView(
          children: [
            Container(
              child: Column(
                children: [
                  newslist(
                    categoryname: 'general',
                  ),
                ],
              ),
            ),
            ///////////////////////////
            Container(
              child: Column(
                children: [
                  newslist(
                    categoryname: 'health',
                  ),
                ],
              ),
            ),
            ///////////////////////
            Container(
              child: Column(
                children: [
                  newslist(
                    categoryname: 'science',
                  ),
                ],
              ),
            ),
            ///////////////////////////////
            Container(
              child: Column(
                children: [
                  newslist(
                    categoryname: 'sports',
                  ),
                ],
              ),
            ),
            /////////////////////
            Container(
              child: Column(
                children: [
                  newslist(
                    categoryname: 'technology',
                  ),
                ],
              ),
            ),
            // /////////////////////
            Container(
              child: Column(
                children: [
                  newslist(
                    categoryname: 'entertainment',
                  ),
                ],
              ),
            ),
            ///////////////////////
            Container(
              child: Column(
                children: [
                  newslist(
                    categoryname: 'business',
                  ),
                  // list_of_categories()
                ],
              ),
            ),
          ],
        );
      }
    }
  }
}

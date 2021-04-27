import 'package:flutter/material.dart';
import 'package:newsapp/textstyle.dart';

class Descriptionpage extends StatefulWidget {
  String description, image, title, publishedat;
  Descriptionpage({this.description, this.image, this.publishedat, this.title});
  @override
  _DescriptionpageState createState() => _DescriptionpageState();
}

class _DescriptionpageState extends State<Descriptionpage> {
  var title1 = textTheme(
      text: 'Egyption', textcolor: Colors.white, wight: true, textsize: 21);
  var title2 = textTheme(
      text: 'News', textcolor: Colors.blue, wight: true, textsize: 21);
  Descriptionpage page;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
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
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(children: [
            Stack(
              children: [
                Center(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(widget.image),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black, width: 3),
                              color: Colors.green,
                            ),
                            width: MediaQuery.of(context).size.width / 1.1,
                            height: MediaQuery.of(context).size.height / 3,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            width: MediaQuery.of(context).size.width / 1.1,
                            height: MediaQuery.of(context).size.height / 2.4,
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        widget.title,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.normal,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 60),
                                    child: Text(
                                      widget.description,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.icecream),
                title: Text('Arab News'),
                onTap: () {
                  setState(() {});
                },
              ),
              ////////////////
              ListTile(
                leading: Icon(Icons.icecream),
                title: Text('English News'),
                onTap: () {
                  setState(() {});
                },
              ), ////////
              ListTile(
                leading: Icon(Icons.icecream),
                title: Text('All news'),
                onTap: () {
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

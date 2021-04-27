import 'package:flutter/material.dart';
import 'package:newsapp/categrylists.dart';
import 'package:newsapp/descriptionpage.dart';
import 'package:newsapp/provider.dart';
import 'package:newsapp/selectdata.dart';

import 'package:newsapp/textstyle.dart';

class newslisten extends StatefulWidget {
  String categoryname;
  // String language;
  newslisten({this.categoryname});
  @override
  _newslistState createState() => _newslistState();
}

class _newslistState extends State<newslisten> {
  var data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String catg = widget.categoryname.toString();
    data = Alldata.getallposts(catg, 'en');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: data,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.27,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Descriptionpage(
                            description: snapshot.data[index].description,
                            image: snapshot.data[index].urlToImage,
                            publishedat: snapshot.data[index].publishedAt,
                            title: snapshot.data[index].title,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 3,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width / 1,
                                height: MediaQuery.of(context).size.height / 4,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: snapshot
                                                    .data[index].urlToImage !=
                                                null
                                            ? NetworkImage(
                                                snapshot.data[index].urlToImage)
                                            : AssetImage(
                                                'assets/images/generalnews.jpg'),
                                        fit: BoxFit.fill)),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: textTheme(
                                  text: snapshot.data[index].title,
                                  textsize: 12,
                                  wight: true,
                                  textcolor: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 150),
                              child: textTheme(
                                text: snapshot.data[index].publishedAt,
                                textsize: 10,
                                wight: true,
                                textcolor: Colors.black38,
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
        } else
          return Padding(
            padding: const EdgeInsets.only(top: 250),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
      },
    );
  }
}

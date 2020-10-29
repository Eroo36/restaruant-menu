import 'package:flutter/material.dart';
import "package:yaml/yaml.dart";
import 'package:flutter/services.dart';

import 'package:restaurant_menu/screens/menuler.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yeni Sipariş'),
        backgroundColor: Colors.redAccent,
      ),
      body: FutureBuilder(
          future: rootBundle.loadString("menu.yaml"),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              var yaml = loadYaml(snapshot.data);
              return GridView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: yaml['menus'][0]['items'].length,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.15, crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(MenulerScreen.routeName,
                            arguments: {
                              "name": yaml['menus'][0]['items'][index]['items'],
                              "menus": yaml['menus']
                            });
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 4,
                        margin: EdgeInsets.all(5),
                        child: Column(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                ClipRRect(
                                  child: Image.asset(
                                    yaml['menus'][0]['items'][index]['image'],
                                    scale: 10 / 3,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                yaml['menus'][0]['items'][index]['name'],
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }
}

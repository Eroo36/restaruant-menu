import 'package:flutter/material.dart';
import 'package:restaurant_menu/screens/process_complete_screen.dart';
import 'package:restaurant_menu/screens/submenu1_screen.dart';

class MenulerScreen extends StatelessWidget {
  static const routeName = '/menuler';

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;

    List name = arguments['name']; // Menüler.items
    return Scaffold(
        appBar: AppBar(
          title: Text('Siparişinizi oluşturun'),
          backgroundColor: Colors.redAccent,
        ),
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int i) {
            return GestureDetector(
              onTap: () {
                List subMenus =
                    name[i]['subMenus']; // Menüler.items.name.subMenus
                if (subMenus != null) {
                  if (i == 6) {
                    Navigator.of(context).pushNamed(
                      SubMenuScreen1.routeName,
                      arguments: {
                        'subMenus': subMenus,
                        'menus': arguments['menus'][i],
                        'allMenus': arguments['menus']
                      },
                    );
                    return;
                  }
                  Navigator.of(context).pushNamed(
                    SubMenuScreen1.routeName,
                    arguments: {
                      'subMenus': subMenus,
                      'menus': arguments['menus'][i + 1],
                      'allMenus': arguments['menus']
                    },
                  );
                } else {
                  Navigator.of(context)
                      .pushNamed(ProcessCompleteScreen.routeName);
                } // DONE
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 4,
                margin: EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        ClipRRect(
                          child: Image.asset(name[i]['image']),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Flexible(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Text(
                                  name[i]['name'].toString() +
                                      '        \$' +
                                      name[i]['price'].toString(),
                                  style: TextStyle(fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: name.length,
        ));
  }
}

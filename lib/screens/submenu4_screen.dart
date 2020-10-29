import 'package:flutter/material.dart';
import 'package:restaurant_menu/screens/submenu5_screen.dart';

class SubMenuScreen4 extends StatelessWidget {
  static const routeName = '/submenu4-screen';
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    List yanLezzetList = arguments['allMenus'][9]['items'];

    return Scaffold(
        appBar: AppBar(
          actions: [
            CircleAvatar(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(SubMenuScreen5.routeName,
                      arguments: {'allMenus': arguments['allMenus']});
                },
                child: Text('Geç'),
              ),
              radius: 20,
              backgroundColor: Colors.amber,
            ),
          ],
          title: Text('Tatlı Seçin'),
          backgroundColor: Colors.redAccent,
        ),
        body: GridView.builder(
          physics: BouncingScrollPhysics(),
            itemCount: yanLezzetList.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1, crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(SubMenuScreen5.routeName,
                      arguments: {'allMenus': arguments['allMenus']});
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 4,
                  margin: EdgeInsets.all(15),
                  child: Stack(
                    children: [
                      ClipRRect(
                        child: Image.asset(yanLezzetList[index]['image']),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(7),
                        child: Text(
                          yanLezzetList[index]['name'] +
                              '  \$' +
                              yanLezzetList[index]['price'].toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        alignment: Alignment.bottomCenter,
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}

import 'package:flutter/material.dart';
import 'package:restaurant_menu/screens/process_complete_screen.dart';
import 'package:restaurant_menu/screens/submenu2_screen.dart';

class SubMenuScreen1 extends StatelessWidget {
  static const routeName = '/submenu1-screen';

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    List menuItems = arguments['menus']['items'];
    return Scaffold(
        appBar: AppBar(
          title: Text('Siparişinizi oluşturun'),
          backgroundColor: Colors.redAccent,
        ),
        body: GridView.builder(
            physics: BouncingScrollPhysics(),
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1, crossAxisCount: 2),
            itemCount: menuItems.length,
            itemBuilder: (BuildContext context, int index) {
              var prices;
              if (menuItems[index]['price'] != null) {
                prices = '+\$' + menuItems[index]['price'].toString();
              } else {
                prices = '+\$0';
              }

              return GestureDetector(
                onTap: () {
                  if (arguments['subMenus'] != null) {
                    Navigator.of(context)
                        .pushNamed(SubMenuScreen2.routeName, arguments: {
                      'allMenus': arguments['allMenus'],
                    });
                  } else {
                    Navigator.of(context)
                        .pushNamed(ProcessCompleteScreen.routeName);
                  }
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
                        child: Image.asset(menuItems[index]['image']),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(7),
                        child: Text(
                          menuItems[index]['name'] + ' ' + prices.toString(),
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

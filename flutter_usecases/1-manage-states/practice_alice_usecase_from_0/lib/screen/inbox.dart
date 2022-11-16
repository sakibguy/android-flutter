import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Inbox extends StatefulWidget {
  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {
  Color numBGColor = HexColor("#d1fae5");
  Color numColor = HexColor("#065f46");
  Color drawerCategoryColor = HexColor("#9CA3AF");
  Color drawerTextColor = HexColor("#6B7180");
  Color drawerLeftTextColor = HexColor("#4B5563");
  late final String title = "title---";

  @override
  Widget build(BuildContext context) {
    // You can also use `Map` but for the sake of simplicity I'm using two separate `List`.
    final List<int> _list = List.generate(20, (i) => i);
    final List<bool> _selected = List.generate(20, (i) => false); // Fill it with false initially

    final ButtonStyle style = TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
    );

    return Material(
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            // leading: Icon(Icons.menu, color: Colors.black),
            // leading: Image(image: AssetImage('assets/other_imgs/fi_menu.png')),
            title: Row(
              children: [
                Text(
                  "My Assigned",
                  style: TextStyle(color: Colors.black),
                ),
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "4",
                      style: TextStyle(
                        color: numColor,
                        backgroundColor: numBGColor,
                      ),
                    ))
              ],
            ),
            backgroundColor: Colors.white,
            actions: <Widget>[
              Image(
                image: AssetImage('assets/other_imgs/fi_search.png'),
              ),
              Image(image: AssetImage('assets/other_imgs/filter.png')),
              Image(
                image: AssetImage('assets/other_imgs/avatar.png'),
              )
            ],
          ),
          body: Container(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (_, index) {
                        return Card(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ListTile(
                                  tileColor: _selected[index] ? Colors.greenAccent : null, // If current item is selected show blue color
                                  onTap: () => setState(() => _selected[index] = !_selected[index]),
                                  // tileColor: true ? Colors.greenAccent : null,
                                  leading: CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/other_imgs/telegram.png'),
                                  ),
                                  title: Text(
                                    "Jorge Webber",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text("Can I speak to your manager?",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  trailing: Column(
                                    children: [
                                      Text("2m"),
                                      Image(
                                          image: AssetImage(
                                              'assets/other_imgs/yellow_pin.png'))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                        child:
                        Image(image: AssetImage('assets/other_imgs/line.png'))))
              ],
            ),
          ),
          drawer: Drawer(
            // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                // const DrawerHeader(
                //   decoration: BoxDecoration(
                //     color: Colors.blue,
                //   ),
                //   child: Text('GENERAL'),
                // ),
                Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: ListTile(
                    title: Text('GENERAL',
                      style: TextStyle(color: drawerCategoryColor),
                    ),
                  ),
                ),
                ListTile(
                  title: Text('All Assigned',
                    style: TextStyle(color: drawerLeftTextColor),
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                  trailing: Text('24',
                    style: TextStyle(color: drawerTextColor),
                  ),
                ),
                ListTile(
                  title: Text('Unassigned',
                    style: TextStyle(color: drawerLeftTextColor),
                  ),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                  trailing: Text('8',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                ListTile(
                  title: Text('All Snoozed',
                    style: TextStyle(color: drawerLeftTextColor),
                  ),
                  onTap: () {

                  },
                  trailing: Text('0',
                    style: TextStyle(color: drawerTextColor),
                  ),
                ),
                ListTile(
                  title: Text('All closed',
                    style: TextStyle(color: drawerLeftTextColor),
                  ),
                  onTap: (){

                  },
                ),

                Divider(
                    color: drawerCategoryColor
                ),

                ListTile(
                  title: Text('MY TICKETS',
                    style: TextStyle(color: drawerCategoryColor),
                  ),
                ),
                ListTile(
                  title: Text('My Assigned',
                    style: TextStyle(color: drawerLeftTextColor),
                  ),
                  onTap: () {

                  },
                  trailing: Text('24',
                    style: TextStyle(color: drawerTextColor),
                  ),
                ),
                ListTile(
                  title: Text('My Snoozed',
                    style: TextStyle(color: drawerLeftTextColor),
                  ),
                  onTap: () {

                  },
                  trailing: Text('12',
                    style: TextStyle(color: drawerTextColor),
                  ),
                ),
                ListTile(
                  title: Text('My Closed',
                    style: TextStyle(color: drawerLeftTextColor),
                  ),
                  onTap: () {

                  },
                ),
                Divider(
                    color: drawerCategoryColor
                ),
                ListTile(
                    title: Text("PRIVATE VIEWS",
                        style: TextStyle(color: drawerCategoryColor)
                    )
                ),
                ListTile(
                  title: Text('Facebook Store',
                    style: TextStyle(color: drawerLeftTextColor),
                  ),
                  onTap: () {

                  },
                ),
                ListTile(
                    title: Text('IG Store',
                      style: TextStyle(color: drawerLeftTextColor),
                    ),
                    onTap: () {

                    }
                ),
                ListTile(
                    title: Text('WhatsApp Store',
                      style: TextStyle(color: drawerLeftTextColor),
                    ),
                    onTap: () {

                    }
                ),

                Divider(
                    color: drawerCategoryColor
                ),

                ListTile(
                  leading: Image(
                      image: AssetImage('assets/other_imgs/filter_gray.png')
                  ),
                  title: const Text('Filter'),
                  onTap: () {

                  },
                ),
                ListTile(
                    leading: Image(
                        image: AssetImage('assets/other_imgs/get_help.png')
                    ),
                    title: Text('Get Help',
                      style: TextStyle(color: drawerLeftTextColor),
                    ),
                    onTap: () {

                    }
                )
              ],
            ),
          ),
        )
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: Text(title)),
  //     body: const Center(
  //       child: Text('My Page!'),
  //     ),
  //     drawer: Drawer(
  //       // Add a ListView to the drawer. This ensures the user can scroll
  //       // through the options in the drawer if there isn't enough vertical
  //       // space to fit everything.
  //       child: ListView(
  //         // Important: Remove any padding from the ListView.
  //         padding: EdgeInsets.zero,
  //         children: [
  //           const DrawerHeader(
  //             decoration: BoxDecoration(
  //               color: Colors.blue,
  //             ),
  //             child: Text('Drawer Header'),
  //           ),
  //           ListTile(
  //             title: const Text('Item 1'),
  //             onTap: () {
  //               // Update the state of the app
  //               // ...
  //               // Then close the drawer
  //               Navigator.pop(context);
  //             },
  //           ),
  //           ListTile(
  //             title: const Text('Item 2'),
  //             onTap: () {
  //               // Update the state of the app
  //               // ...
  //               // Then close the drawer
  //               Navigator.pop(context);
  //             },
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

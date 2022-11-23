// /*
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
// */


// CODE FROM SCRATCH
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_ogg_piano/flutter_ogg_piano.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   String _platformVersion = 'Unknown';
//   FlutterOggPiano fop = FlutterOggPiano();
//
//   List<String> files = ["piano.ogg", "piano2.ogg"];
//
//   bool initialized = false;
//
//   int _count = 1;
//   int _pitch = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//
//     if(!initialized) {
//       loadPianoSounds();
//     }
//   }
//
//   // Platform messages are asynchronous, so we initialize in an async method
//   Future<void> initPlatformState() async {
//     String platformVersion;
//     // Platform messages may fail, so we use a try/catch PlatformException
//
//     try {
//       platformVersion = (await FlutterOggPiano.platformVersion) ?? _platformVersion;
//     } on PlatformException {
//       platformVersion = 'Failed to get platform version.';
//     }
//
//     // If the widget was removed from the tree
//     // while the asynchronous platform message was in flight,
//     // we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if(!mounted) return;
//
//     setState(() {
//       _platformVersion = platformVersion;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text("Plugin example app"),
//         ),
//       ),
//     );
//   }
//
//   Future<void> loadPianoSounds() async {
//     fop.init(mode: MODE.LOW_LATENCY);
//
//     for(int i = 0; i < files.length; i++) {
//       String name = "assets/" + files[i];
//
//       ByteData data = await rootBundle.load(name);
//
//       await fop.load(src: data, name: files[i], index: i, forceLoad: true);
//     }
//
//     initialized = true;
//   }
// }


import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ogg_piano/flutter_ogg_piano.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  FlutterOggPiano fop = FlutterOggPiano();

  List<String> files = ["piano.ogg", "piano2.ogg"];

  bool initialized = false;

  int _count = 1;
  int _pitch = 0;

  @override
  void initState() {
    super.initState();
    initPlatformState();

    if(!initialized) {
      loadPianoSounds();
    }
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = (await FlutterOggPiano.platformVersion) ?? _platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () {
                    if(initialized) {
                      fop.play(index: 0, note: 0);
                    }
                  }, child: Text("Play Sound 1")
                  ),
                  ElevatedButton(onPressed: () {
                    if(initialized) {
                      fop.play(index: 1, note: 0);
                    }
                  }, child: Text("Play Sound 2"),)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(child: Text("Pitch"),),
                      Row(
                        children: [
                          Ink(
                            decoration: ShapeDecoration(
                              color: Colors.lightBlue,
                              shape: CircleBorder(),
                            ),
                            child: IconButton(
                              splashRadius: 24,
                              splashColor: Colors.lightBlueAccent,
                              onPressed: () {
                                setState(() {
                                  _pitch++;
                                });
                              },
                              icon: Icon(Icons.arrow_upward, color: Colors.white70,),
                            ),
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(6, 0, 6, 0)),
                          Container(
                            width: 72,
                            height: 36,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey[100],
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(4,4),
                                      blurRadius: 4,
                                      color: Colors.grey[600]!
                                  )
                                ]
                            ),
                            child: Center(
                              child: Text(_pitch.toString()),
                            ),
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(6, 0, 6, 0)),
                          Ink(
                            decoration: ShapeDecoration(
                              color: Colors.lightBlue,
                              shape: CircleBorder(),
                            ),
                            child: IconButton(
                              splashRadius: 24,
                              splashColor: Colors.lightBlueAccent,
                              onPressed: () {
                                setState(() {
                                  _pitch--;
                                });
                              },
                              icon: Icon(Icons.arrow_downward, color: Colors.white70,),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: () {
                        if(initialized) {
                          fop.play(index: 0, note: _pitch);
                        }
                      }, child: Text("Play Sound 1")),
                      ElevatedButton(onPressed: () {
                        fop.play(index: 1, note: _pitch);
                      }, child: Text("Play Sound 2")),
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Ink(
                    decoration: ShapeDecoration(
                      color: Colors.lightBlue,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      splashRadius: 24,
                      splashColor: Colors.lightBlueAccent,
                      onPressed: () {
                        setState(() {
                          _count++;
                        });
                      },
                      icon: Icon(Icons.arrow_upward, color: Colors.white70,),
                    ),
                  ),
                  Container(
                    width: 72,
                    height: 36,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[100],
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(4,4),
                              blurRadius: 4,
                              color: Colors.grey[600]!
                          )
                        ]
                    ),
                    child: Center(
                      child: Text(_count.toString()),
                    ),
                  ),
                  Ink(
                    decoration: ShapeDecoration(
                      color: Colors.lightBlue,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      splashRadius: 24,
                      splashColor: Colors.lightBlueAccent,
                      onPressed: () {
                        setState(() {
                          _count = max(--_count, 1);
                        });
                      },
                      icon: Icon(Icons.arrow_downward, color: Colors.white70,),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: () {
                        if(initialized) {
                          Map<int, List<Float64List>> maps = Map();

                          List<Float64List> sounds = [];

                          Float64List data = Float64List(3);

                          data[0] = 0;
                          data[1] = 0;
                          data[2] = _count.toDouble();

                          sounds.add(data);

                          maps[0] = sounds;

                          fop.playInGroup(maps);
                        }
                      }, child: Text("Play Sound 1 $_count time${_count == 1 ? "" : "s"}")),
                      ElevatedButton(onPressed: () {
                        if(initialized) {
                          Map<int, List<Float64List>> maps = Map();

                          List<Float64List> sounds = [];

                          Float64List data = Float64List(3);

                          data[0] = 0;
                          data[1] = 0;
                          data[2] = _count.toDouble();

                          sounds.add(data);

                          maps[1] = sounds;

                          fop.playInGroup(maps);
                        }
                      }, child: Text("Play Sound 2 $_count time${_count == 1 ? "" : "s"}")),
                      ElevatedButton(onPressed: () {
                        if(initialized) {
                          Map<int, List<Float64List>> maps = Map();

                          List<Float64List> sounds = [];

                          Float64List data = Float64List(3);

                          data[0] = 0;
                          data[1] = 0;
                          data[2] = _count.toDouble();

                          sounds.add(data);

                          maps[1] = sounds;
                          maps[0] = sounds;

                          fop.playInGroup(maps);
                        }
                      }, child: Text("Play Both $_count time${_count == 1 ? "" : "s"}"))
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: () {
                    if(initialized) {
                      fop.play(index: 0, note: 0, pan: -1.0);
                    }
                  }, child: Text("Play Sound 1 in left")),
                  ElevatedButton(onPressed: () {
                    if(initialized) {
                      fop.play(index: 0, note: 0, pan: 1.0);
                    }
                  }, child: Text("Play Sound 1 in right"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loadPianoSounds() async {
    fop.init(mode: MODE.LOW_LATENCY);

    for(int i = 0; i < files.length; i++) {
      String name = "assets/"+files[i];

      ByteData data = await rootBundle.load(name);

      await fop.load(src: data, name: files[i], index: i, forceLoad: true);
    }

    initialized = true;
  }
}
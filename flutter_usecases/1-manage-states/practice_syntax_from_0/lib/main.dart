/*
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'BP: State Management',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: "SMDemo HomePage"),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   final String title;
//
//   const MyHomePage({super.key, required this.title});
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text("You have pushed the button this many times."),
//             Text(widget.title),
//             Text(widget.title),
//             Text(widget.title),
//             Text(widget.title),
//             Text('$_counter'),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'MA Practice',
//       home: const MyStateApp(title: "SW Demo Showing"),
//     );
//   }
// }
//
// class MyStateApp extends StatefulWidget {
//   final String title;
//   const MyStateApp({super.key, required this.title});
//
//   @override
//   State<MyStateApp> createState() => _MyStateAppState();
// }
//
// class _MyStateAppState extends State<MyStateApp> {
//   int _counter = 0;
//
//   // Define method: way 1
//   void _increaseCounter() => {
//     setState(() => {
//       _counter++
//     })
//   };
//
//   // Define method: way 2
//   // void _increaseCounter() => {
//   //   setState(() {
//   //     _counter++;
//   //   })
//   // };
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         actions: <Widget>[
//           IconButton(
//             onPressed: () => {
//               ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text('This is a snackbar')))
//             },
//             icon: Icon(Icons.arrow_forward_ios_rounded),
//             tooltip: 'Arrow',
//           )
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("Text 1"),
//             Text("Text 2"),
//             Text('$_counter'),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => {
//           _increaseCounter()
//         },
//         tooltip: 'FA tooltip',
//         child: const Icon(Icons.add)
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:practice_syntax_from_0/app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My GetX App",
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
    ),
  );
}*/


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_syntax_from_0/app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "GMA Title",
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
    )
  );
}

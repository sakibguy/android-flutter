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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_syntax_from_0/app/dio/DioController.dart';
import 'package:practice_syntax_from_0/app/dio/DioModel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dio Get",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Text 1"),
                Text("Text 2"),
                Text("Text 3"),
                Expanded(
                    child: FutureBuilder<List<Article>>(
                      future: DioController().fetchNewsArticle(),
                      builder: (context, snapshot) {
                        if(!snapshot.hasData) {
                          var data = snapshot.data.toString();
                          print('[---ok---] snapshot $data');
                          return Center(child: CircularProgressIndicator());
                        } else {
                          List<Article> newsArticle = snapshot.data!;

                          return ListView.builder(
                              itemCount: newsArticle.length,
                              itemBuilder: (context, index) {
                                return NewsTile(article: newsArticle[index]);
                              }
                          );
                        }
                      },
                    ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}

class NewsTile extends StatelessWidget {
  final Article article;

  const NewsTile({required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: ListTile(
        onTap: null,
        title: Text(
          article.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          article.description,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),
        leading: article.urlToImage != null
          ? Container(
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(article.urlToImage)
                ),
              ),
            )
          : null,
      ),
    );
  }
}


import 'package:flutter/material.dart';

import 'controller/news_controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "News App",
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Discover",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                )
              ),
              Text(
                "Find interesting article & news",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: FutureBuilder (
                  future: NewsController().fetchNewsArticle(),
                  builder: (context, snapshot) {
                    if(!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator(),);
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(snapshot.data![index].title),
                            subtitle: Text(snapshot.data![index].title),
                            leading: Text(snapshot.data![index].title),
                            trailing: Text(snapshot.data![index].title),
                          );
                        },
                      );
                    }
                  },
                ),
              )
            ],
          ),
        )
      )
    );
  }
}



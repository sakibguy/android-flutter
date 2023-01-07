/*
import 'package:flutter/material.dart';

void main() {
  runApp(const AutocompleteExampleApp());
}

class AutocompleteExampleApp extends StatelessWidget {
  const AutocompleteExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("AppBar"),
        ),
        body: const Center(
          child: AutocompleteBasicExample(),
        ),
      ),
    );
  }
}

class AutocompleteBasicExample extends StatelessWidget {
  const AutocompleteBasicExample({super.key});

  static const List<String> _kOptions = <String>[
    'abir',
    'abbabi',
    'arfan',
    'amit'
  ];

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          if(textEditingValue.text == '') {
            return const Iterable<String>.empty();
          }
          return _kOptions.where((String option) {
            return option.contains(textEditingValue.text.toLowerCase());
          });
        },
        onSelected: (String selection) {
          debugPrint('You just selected $selection');
        },
    );
  }
}*/

import 'package:autocomplete/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:autocomplete/country_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AutoCompleteDemo(),
    );
  }
}


const List<Country> countryOptions = <Country>[
  Country(name: 'Lambda Bags', size: 30370000),
  Country(name: 'Online Clothing Store', size: 44579000),
  Country(name: 'Online Clothing Store', size: 8600000),
  Country(name: 'MyAura', size: 110879),
  Country(name: 'Online Clothing Store', size: 9984670),
  Country(name: 'Denmark', size: 42916),
  Country(name: 'Europe', size: 10180000),
  Country(name: 'India', size: 3287263),
  Country(name: 'North America', size: 24709000),
  Country(name: 'South America', size: 17840000),
];

class AutoCompleteDemo extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _AutoCompleteDemoState();
}

class _AutoCompleteDemoState extends State<AutoCompleteDemo> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.green;
      }
      return Colors.green;
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:Text('Flutter AutoComplete Demo'),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Autocomplete<Country>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            return countryOptions
                .where((Country county) => county.name.toLowerCase()
                .startsWith(textEditingValue.text.toLowerCase())
            )
                .toList();
          },
          displayStringForOption: (Country option) => option.name,
          fieldViewBuilder: (
              BuildContext context,
              TextEditingController fieldTextEditingController,
              FocusNode fieldFocusNode,
              VoidCallback onFieldSubmitted
              ) {
            return TextField(
              controller: fieldTextEditingController,
              focusNode: fieldFocusNode,
              style: const TextStyle(fontWeight: FontWeight.bold),
            );
          },
          onSelected: (Country selection) {
            print('Selected: ${selection.name}');
          },
          optionsViewBuilder: (
              BuildContext context,
              AutocompleteOnSelected<Country> onSelected,
              Iterable<Country> options
              ) {
            return Align(
              alignment: Alignment.topLeft,
              child: Material(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AliceColors.ALICE_GREY_200),
                          /*boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              //blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],*/
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 12.0, left: 16.0),
                                    child: Text("Unselect All",
                                      style: TextStyle(color: AliceColors.ALICE_BLUE),
                                    ),
                                  )
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: /*300*/ MediaQuery.of(context).size.width - 32,
                            height: 300,
                            // color: /*Colors.cyan*/ Colors.white,
                            child: ListView.builder(
                              padding: EdgeInsets.all(10.0),
                              itemCount: options.length,
                              itemBuilder: (BuildContext context, int index) {
                                final Country option = options.elementAt(index);

                                return GestureDetector(
                                  /*onTap: () {
                          onSelected(option);
                        },*/
                                  child: ListTile(
                                    title: Container(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Transform.translate(
                                              // e.g: vertical negative margin. https://stackoverflow.com/questions/48086486/does-flutter-support-negative-margin
                                              offset: const Offset(-26, 0),
                                              child: /*Text("CB")*/
                                              Checkbox(
                                                checkColor: Colors.white,
                                                fillColor: MaterialStateProperty.resolveWith(getColor),
                                                value: isChecked,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    isChecked = value!;
                                                  });
                                                },
                                              ),
                                            ),
                                            /*Padding(
                                  padding: EdgeInsets.only(left: 12),
                                  child: Text(option.name, style: const TextStyle(color: Colors.black)),
                                ),*/
                                            Transform.translate(
                                              offset: const Offset(-26, 0),
                                              child: Padding(
                                                padding: const EdgeInsets.only(right: 6.0),
                                                child: Image.network('https://picsum.photos/250?image=9', width: 18, height: 18),
                                              ),
                                            ),
                                            Transform.translate(
                                              offset: const Offset(-26, 0),
                                              child:
                                              Padding(
                                                  padding: EdgeInsets.only(left: 4),
                                                  child: Text(option.name, style: const TextStyle(color: Colors.black))
                                              ),
                                            ),
                                            Transform.translate(
                                              offset: const Offset(-26, 0),
                                              child: Padding(
                                                padding: EdgeInsets.only(left: 8),
                                                child:
                                                /*_inboxController.currentQueueTotal.value*/ 3 >= 2
                                                    ? Container(
                                                    child: Text(
                                                      "SMART",
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.w500,
                                                          color: AliceColors.ALICE_GREEN_800,
                                                          fontSize: 12),
                                                    ),
                                                    padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
                                                    decoration: BoxDecoration(
                                                        color: AliceColors.ALICE_GREEN_100,
                                                        borderRadius: BorderRadius.circular(4)))
                                                    : Container(),
                                              ),
                                            ),
                                          ],
                                        )
                                    ),
                                  ),
                                );
                              },
                            ),
                            /*child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView.builder(
                          padding: EdgeInsets.all(10.0),
                          itemCount: options.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Country option = options.elementAt(index);

                            return GestureDetector(
                              onTap: () {
                                onSelected(option);
                              },
                              child: ListTile(
                                title: Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Transform.translate(
                                          // e.g: vertical negative margin. https://stackoverflow.com/questions/48086486/does-flutter-support-negative-margin
                                          offset: const Offset(-26, 0),
                                          child: *//*Text("CB")*//*
                                          Checkbox(
                                            checkColor: Colors.white,
                                            fillColor: MaterialStateProperty.resolveWith(getColor),
                                            value: isChecked,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isChecked = value!;
                                              });
                                            },
                                          ),
                                        ),
                                        *//*Padding(
                                  padding: EdgeInsets.only(left: 12),
                                  child: Text(option.name, style: const TextStyle(color: Colors.black)),
                                ),*//*
                                        Transform.translate(
                                          offset: const Offset(-26, 0),
                                          child: Padding(
                                            padding: const EdgeInsets.only(right: 6.0),
                                            child: Image.network('https://picsum.photos/250?image=9', width: 18, height: 18),
                                          ),
                                        ),
                                        Transform.translate(
                                          offset: const Offset(-26, 0),
                                          child:
                                          Padding(
                                              padding: EdgeInsets.only(left: 4),
                                              child: Text(option.name, style: const TextStyle(color: Colors.black))
                                          ),
                                        ),
                                        Transform.translate(
                                          offset: const Offset(-26, 0),
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 8),
                                            child:
                                            *//*_inboxController.currentQueueTotal.value*//* 3 >= 2
                                                ? Container(
                                                child: Text(
                                                  "SMART",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w500,
                                                      color: AliceColors.ALICE_GREEN_800,
                                                      fontSize: 12),
                                                ),
                                                padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
                                                decoration: BoxDecoration(
                                                    color: AliceColors.ALICE_GREEN_100,
                                                    borderRadius: BorderRadius.circular(4)))
                                                : Container(),
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                              ),
                            );
                          },
                        ),
                        Text("Button"),
                      ],
                    ),
                  ),*/
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 32,
                            height: 0.5,
                            color: AliceColors.ALICE_GREY_200,
                            // child: Divider(color: Colors.grey),
                          ),
                          Container(
                              width: /*300*/ MediaQuery.of(context).size.width - 32,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    child: Container(
                                      margin: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: Colors.grey)),
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 9, right: 13, bottom: 9, left: 9),
                                        child: Text('Cancel',
                                          style: TextStyle(
                                              color: AliceColors.ALICE_GREY_700
                                          ),
                                        ),
                                      ),
                                    ),
                                    onTap: (() {
                                      print("[---ok---] Cancel button");
                                    }),
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      margin: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: Colors.grey),
                                          color: AliceColors.ALICE_GREEN_400
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 9, right: 13, bottom: 9, left: 9),
                                        child: Text('Select',
                                          style: TextStyle(
                                              color: Colors.white
                                          ),
                                        ),
                                      ),
                                    ),
                                    onTap: (() {
                                      print("[---ok---] Select button");
                                    }),
                                  ),
                                ],
                              )
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
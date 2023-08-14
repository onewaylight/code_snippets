https://www.fluttercampus.com/guide/333/add-expandable-menu-drawer-flutter/

```dart
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {  

  final scaffoldKey = GlobalKey<ScaffoldState>();
  //key for scaffold, required to manually open/close drawer

  @override
  Widget build(BuildContext context) { 
    return  Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title: Text("Expansion Menu in Flutter"),
          ),
          drawer: Drawer(
              child: SafeArea( 
                child:Column(
                    children: [
                       ExpansionTile(
                        title: Text("Parent Category 1"),
                        leading: Icon(Icons.person), //add icon
                        childrenPadding: EdgeInsets.only(left:60), //children padding
                        children: [
                             ListTile( 
                                 title: Text("Child Category 1"),
                                 onTap: (){ 
                                    //action on press
                                 },
                             ),

                             ListTile( 
                                 title: Text("Child Category 2"),
                                 onTap: (){ 
                                    //action on press
                                 },
                             ),

                             //more child menu
                        ],
                       ),


                       ExpansionTile(
                        title: Text("Parent Category 2"),
                        leading: Icon(Icons.person), //add icon
                        childrenPadding: EdgeInsets.only(left:60), //children padding
                        children: [
                             ListTile( 
                                 title: Text("Child Category 1"),
                                 onTap: (){ 
                                    //action on press
                                 },
                             ),

                             ListTile( 
                                 title: Text("Child Category 2"),
                                 onTap: (){ 
                                    //action on press
                                 },
                             ),

                             //more child menu
                        ],
                       )
                  ],
                )
              ),
          ),
          
          body: Container()
       );
  }
}
```
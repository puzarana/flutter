import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        primarySwatch: Colors.orange[700],
      ),
  
      home: MySelectionPage(),
      
    );
  }
}
 

 class MySelectionPage extends StatefulWidget {
   @override
   _MySelectionPageState createState() => _MySelectionPageState();
 }
 
 class _MySelectionPageState extends State<MySelectionPage> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
      body: Column(
       children: <Widget>[
         Container(
            child: ListTile(
                     leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/woman.jpg"),
                      radius: 25.0,
                     ),
                  title: Text("Butwal"),
                  subtitle: Text("Gaurav"),
                ),
               
          ),
         Container(
            child: ListTile(
                     leading: CircleAvatar(
                      backgroundImage: AssetImage("assets/woman.jpg"),
                      radius: 25.0,
                     ),
                  title: Text("Kathmandu"),
                  subtitle: Text("Prakriti"),
                ),
         ),
       ],
      ), 
     );
   }
 }
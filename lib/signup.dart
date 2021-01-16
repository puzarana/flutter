import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new SignupPage(),
    );
  }
}

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding:false,
     body: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  child: Padding(
                    padding:  EdgeInsets.fromLTRB(10.0,65.0,0,20.0),
                    child: Text(
                      "SignUp", style: TextStyle(
                        fontSize:50.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              Container(
                  child: Padding(
                    padding:  EdgeInsets.fromLTRB(170.0,32.0,0,20.0),
                    child: Text(
                      ".", style: TextStyle(
                        fontSize:85.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange[700],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
         Container(
           padding: EdgeInsets.only(left:10.0,right:10.0),
           child: Column(
             children: <Widget>[
               TextField(
                 keyboardType: TextInputType.emailAddress,
                 decoration: InputDecoration(
                   labelText: 'Email',
                   labelStyle: TextStyle(
                     fontFamily: "Montserrat",
                     fontWeight: FontWeight.bold,
                     color: Colors.grey,
                   ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange[700]),
                ),
                 ),
               ),
             SizedBox(height:20.0),
             TextField(
                 keyboardType: TextInputType.visiblePassword,
                 decoration: InputDecoration(
                   labelText: 'Password',
                   labelStyle: TextStyle(
                     fontFamily: "Montserrat",
                     fontWeight: FontWeight.bold,
                     color: Colors.grey,
                   ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange[700]),
                ),
                 ),
               obscureText: true,
               ),
               SizedBox(height:20.0),
               TextField(
                 decoration: InputDecoration(
                   labelText: 'Confirm Password',
                   labelStyle: TextStyle(
                     fontFamily: "Montserrat",
                     fontWeight: FontWeight.bold,
                     color: Colors.grey,
               ),
             focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange[700]),
                ),
                 ),
               ),
             SizedBox(height:5.0),
             Container(
               alignment: Alignment(1.0, 0),
               child: Padding(
                 padding: EdgeInsets.only(top:20.0, left:20.0,bottom:20.0),
                 child: InkWell(
                   child: Text('Forget Password?', 
                   style: TextStyle(
                     fontSize:17.0,
                     color: Colors.orange[700],
                     fontWeight: FontWeight.bold,
                     fontFamily: "Montserrat",
                     decoration: TextDecoration.underline,
                   ),),
                 ),
               ),
             ),
            SizedBox(height:15.0),
            Container(
              height:40.0,
              child: Material(
                borderRadius: BorderRadius.circular(20.0),
                shadowColor:  Colors.orangeAccent,
                color: Colors.orange[700],
                elevation: 7.0,
                child: GestureDetector(
                  onTap:  () {},
                  child: Center(
                    child: Text("SIGNUP",
                    style: TextStyle(
                      fontSize:18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat",
                    ),
                    ),
                    ),
                ),
              ),
            ),
            SizedBox(height:20.0),
            Container(
              height: 40.0,
              color: Colors.transparent,
             child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width:1.0,
                    ),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20.0),
                  ),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Center(
                    child: Text('Go Back',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                    ),
                  )
                ),
                ),
            ),
             ],
             ),
         ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:ninja_trips/services/auth.dart';
//import 'package:ninja_trips/shared/screenTitle.dart';
import 'package:ninja_trips/shared/plantList.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  double _opacity = 1;
  bool _flag = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(backgroundColor: Colors.transparent, actions: <Widget>[
      //   FlatButton.icon(
      //     icon: Icon(Icons.person),
      //     label: Text('logout'),
      //     color: Colors.white,
      //     onPressed: () async {
      //       await _auth.signOut();
      //     },
      //   ),
      // ]),
      body: AnimatedContainer(
          duration: Duration(seconds: 1),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/myimage.jpg"), fit: BoxFit.fitWidth, alignment: Alignment.topLeft),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 50),
              SizedBox(
                  height: 160,
                  child: Text(
                    'Plants By Gizem',
                    style: TextStyle(color: Colors.white, fontSize: 40.0, fontWeight: FontWeight.bold, shadows: [
                      Shadow(
                        color: Colors.black,
                        //offset: Offset(15, 15),
                        blurRadius: 18,
                      ),
                      // You can add as many Shadow as you want
                      Shadow(/*...*/),
                    ]),
                  )),
              SizedBox(height: 50),
              //for the authentication logout
              /*
              SizedBox(
                child: FlatButton.icon(
                  icon: Icon(Icons.logout_outlined),
                  label: Text('logout'),
                  color: Colors.white,
                  onPressed: () async {
                    await _auth.signOut();
                  },
                ),
              ),
              */
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      child: Text('hide the text'),
                      onPressed: () => setState(() {
                        _opacity = 0;
                        _flag = false;
                      }),
                      style: ElevatedButton.styleFrom(
                        //backgroundColor:
                        // MaterialStateProperty.all(Colors.black),
                        primary: _flag ? Colors.black : Colors.grey,
                      ),
                    ),
                    AnimatedOpacity(
                      duration: Duration(seconds: 2),
                      opacity: _opacity,
                      child: Text('secret message', style: TextStyle(color: Colors.black, fontSize: 14.0)),
                    ),
                  ],
                ),
              ),

              Flexible(
                child: PlantList(),
              ),
            ],
          )),

      // bottomNavigationBar: NavigationBarTheme(
      //   data: NavigationBarThemeData(
      //     indicatorColor: Colors.grey,
      //     labelTextStyle: MaterialStateProperty.all(
      //       TextStyle(
      //         fontSize: 12.0,
      //       ),
      //     ),
      //   ),
      //   child: NavigationBar(
      //     height: 50.0,
      //     destinations: [
      //       NavigationDestination(icon: Icon(Icons.email_outlined), label: 'Mail'),
      //       NavigationDestination(icon: Icon(Icons.email_outlined), label: 'Mail'),
      //       NavigationDestination(icon: Icon(Icons.email_outlined), label: 'Mail'),
      //     ],
      //   ),
      // ),
    );
  }
}

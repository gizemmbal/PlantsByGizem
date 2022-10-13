import 'package:flutter/material.dart';
import 'package:ninja_trips/services/auth.dart';
import 'package:ninja_trips/shared/loading.dart';

class SignIn extends StatefulWidget {
  //const SignIn({Key key}) : super(key: key);

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 50, 109, 52),
              elevation: 0.0,
              title: Text('Sign in to Plants By Gizem'),
              actions: <Widget>[
                TextButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('Register'),
                  onPressed: () => widget.toggleView(),
                ),
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              color: Color.fromARGB(255, 141, 166, 130),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          fillColor: Colors.white,
                          filled: true,
                          //enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.pink, width: 1.5)),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red[800], width: 1.5)),
                        ),
                        obscureText: true,
                        validator: (val) => val.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        }),
                    SizedBox(height: 20.0),
                    TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Password',
                          fillColor: Colors.white,
                          filled: true,
                          //enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.pink, width: 1.5)),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red[800], width: 1.5)),
                        ),
                        obscureText: true,
                        validator: (val) => val.length < 6 ? 'Enter 6+ chars password' : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        }),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                        style:
                            ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 50, 109, 52))),
                        child: Text(
                          'SignIn',
                          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                            print(result);
                            if (result == null) {
                              setState(() {
                                loading = false;
                                error = 'Could not sign in with those credentials';
                              });
                            }
                          }
                        }),
                    SizedBox(height: 12.0),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),

              // ElevatedButton(
              //     child: Text('Sign in anon'),
              //     onPressed: () async {
              //       dynamic result = await _auth.signInAnon();
              //       if (result == null) {
              //         print('error signing in');
              //       } else {
              //         print('signed in');
              //         print(result.uid);
              //       }
              //     }),
            ),
          );
  }
}

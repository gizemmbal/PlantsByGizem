import 'package:flutter/material.dart';
import 'package:ninja_trips/models/MyUser.dart';
import 'package:provider/provider.dart';
import 'package:ninja_trips/screens/home.dart';

import 'authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);

    //return home or aouthenticate (dynamic widget)(open the comments if you wish to have authentication property)
    // if (user == null) {
    //   return Authenticate();
    // } else {
    //   return Home();
    // }
    return Home();
  }
}

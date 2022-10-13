import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 141, 166, 130),
      child: Center(
        child: SpinKitFadingCircle(
          color: Color.fromARGB(255, 50, 109, 52),
          size: 50.0,
        ),
      ),
    );
  }
}

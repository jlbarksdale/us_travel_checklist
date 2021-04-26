import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SpinKitRing(
          color: Color(0xFF669BBC),
          size: 50.0,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.indigoAccent,
      child: Center(child: Text('Profile Page',style: TextStyle(color: Colors.white),)),
    );
  }
}

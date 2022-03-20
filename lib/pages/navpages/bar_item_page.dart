import 'package:flutter/material.dart';

class BarItemPage extends StatelessWidget {
  const BarItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.indigoAccent,
      child: Center(child: Text('Bar Page',style: TextStyle(color: Colors.white),)),
    );
  }
}

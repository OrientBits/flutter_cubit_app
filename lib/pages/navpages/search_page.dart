import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.indigoAccent,
      child: Center(child: Text('Search Page',style: TextStyle(color: Colors.white),)),
    );
  }
}

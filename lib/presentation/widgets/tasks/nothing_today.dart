import 'package:flutter/material.dart';

class NothingTodayWidget extends StatelessWidget {
  const NothingTodayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Text('Nothing today!', style: TextStyle(fontSize: 40)),
        ],
      ),
    );
  }
}
/*
This is a stateless widget that displays a centered message "Nothing today!" with a font size of 40.

 */
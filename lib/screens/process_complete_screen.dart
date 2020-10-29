import 'package:flutter/material.dart';

class ProcessCompleteScreen extends StatelessWidget {
  static const routeName = '/complete';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Siparişiniz Alındı'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.check), Text('Siparişiniz Alındı.')],
        ),
      ),
    );
  }
}

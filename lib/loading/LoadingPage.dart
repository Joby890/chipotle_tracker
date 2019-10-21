import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chipotle Traker Tittle"),
      ),
      body: Center(
        child: new CircularProgressIndicator(),
      ),
    );
  }
}

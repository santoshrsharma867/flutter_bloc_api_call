import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final String title;
   const SecondPage({Key? key, required this.title} ) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(widget.title)),
    );
  }
}

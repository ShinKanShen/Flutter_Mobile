import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlideBarMenu extends StatefulWidget {
  const SlideBarMenu({super.key});

  @override
  State<SlideBarMenu> createState() => _SlideBarMenuState();
}

class _SlideBarMenuState extends State<SlideBarMenu> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  void _closeEndDrawer() {
    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(backgroundColor: Color.fromARGB(255, 149, 235, 235) ),
    );
  }
}
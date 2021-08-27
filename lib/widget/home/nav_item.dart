import 'package:flutter/material.dart';

class NavItem extends StatefulWidget {
  final IconButton navIcon;
  final page = "home";

  NavItem({Key? key, required this.navIcon}) : super(key: key);

  @override
  _NavItemState createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      SizedBox(
        height: 70, 
        child: InkWell(child: widget.navIcon)),
    ]);
  }
}

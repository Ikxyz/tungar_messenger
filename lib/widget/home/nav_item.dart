import 'package:flutter/material.dart';

class NavItem extends StatefulWidget {
 late IconButton navIcon;
  String page = "home";

  NavItem({
    Key? key,required this.navIcon}) : super(key: key);


  @override
  _NavItemState createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AnimatedPositioned(
          top: 0,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        child: InkWell(
          child: widget.navIcon
          
         ),
      ),]
    );
  }
}

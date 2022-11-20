

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({Key? key , this.onTab , required this.bText}) : super(key: key);
String bText  ;
VoidCallback? onTab;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child:  Text( bText , style:  TextStyle(
            fontFamily: 'Pacifico',
            fontSize: 25,

          ),))),
    );
  }
}

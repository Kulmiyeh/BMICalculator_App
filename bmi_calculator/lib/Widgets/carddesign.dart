import 'package:flutter/material.dart';
import '../Constraints.dart';

class Carddesign extends StatelessWidget {
 
  final Widget? child;
  final bool selected ;
  final  Function()? onPressed;
   const Carddesign({super.key, this.child, this.selected = false , this.onPressed});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  onPressed,
      child: Container(
        margin:  const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: selected == true ? kBottomContainerColor : kInactiveCardColor,
        borderRadius: BorderRadius.circular(10)
        ),
        child: child,
      ),
    );
  }
}

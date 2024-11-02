import 'package:flutter/material.dart';



class ArrowBackIcon extends StatelessWidget {
  final void Function()? onPressed;
  final icon;
  const ArrowBackIcon({super.key, this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration:
        BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Center(
            child: IconButton(
                onPressed: onPressed,
                icon: icon)),
      ),
    );
  }
}
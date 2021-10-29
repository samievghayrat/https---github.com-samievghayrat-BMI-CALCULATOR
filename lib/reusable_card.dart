import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const ReusableCard(
      {required this.colour, required this.cardChild, required this.onPress});

  final Color colour;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    var edgeInsets = const EdgeInsets.all(15.0);
    return GestureDetector(
      onTap: onPress(),
      child: Container(
        child: cardChild,
        margin: edgeInsets,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.1),
              spreadRadius: 0.5,
              blurRadius: 1,
              offset: const Offset(0, 0.5), // changes position of shadow
            ),
          ],
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class RoundIconButton extends StatefulWidget {
  const RoundIconButton({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final IconData icon;

  @override
  State<RoundIconButton> createState() => _RoundIconButtonState();
}

class _RoundIconButtonState extends State<RoundIconButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
      child: Icon(
        widget.icon,
      ),
    );
  }
}
 /*RawMaterialButton(
      elevation: 0.0,
      child: Icon(widget.icon),
      onPressed: widget.onPressed(),
      constraints: const BoxConstraints.tightFor(
        width: 40.0,
        height: 40.0,
      ),
      shape: const CircleBorder(),
      //   fillColor: Color(0xFF4C4F5E),
      highlightColor: kButton_click,
    ); */
import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  const MyButton({super.key, required this.text, required this.icon, required this.press});

  final String text;
  final IconData icon;
  final void Function() press;

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          icon: Icon(widget.icon),
          label: Text(widget.text),
          onPressed: widget.press,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LoginLabels extends StatefulWidget {
  const LoginLabels(
      {super.key, required this.page, required this.text, required this.btn});

  final String page;
  final String text;
  final String btn;

  @override
  State<LoginLabels> createState() => _LoginLabelsState();
}

class _LoginLabelsState extends State<LoginLabels> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            widget.text,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, widget.page);
              },
              child: Text(
                widget.btn,
                style: TextStyle(
                    color: Colors.pink.shade100,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              )),
        ],
      ),
    );
  }
}

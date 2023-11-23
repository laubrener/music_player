import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Row(
          children: [
            FaIcon(FontAwesomeIcons.chevronLeft),
            Spacer(),
            FaIcon(FontAwesomeIcons.message),
            SizedBox(width: 20),
            FaIcon(FontAwesomeIcons.headphonesSimple),
            SizedBox(width: 20),
            FaIcon(FontAwesomeIcons.upRightFromSquare)
          ],
        ),
      ),
    );
  }
}

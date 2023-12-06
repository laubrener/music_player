import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:music_player/theme/theme.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        toolbarHeight: 80,
        forceMaterialTransparency: true,
        foregroundColor: Colors.white.withOpacity(0.3),
        actionsIconTheme: myTheme.iconTheme,
        actions: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.message),
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Message')));
            },
          ),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.headphonesSimple),
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Headphones')));
            },
          ),
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.upRightFromSquare),
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Download')));
            },
          )
        ],
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return SafeArea(
  //     child: Container(
  //       margin: const EdgeInsets.only(top: 30),
  //       padding: const EdgeInsets.symmetric(horizontal: 20),
  //       child: const Row(
  //         children: [
  //           FaIcon(FontAwesomeIcons.chevronLeft),
  //           Spacer(),
  //           FaIcon(FontAwesomeIcons.message),
  //           SizedBox(width: 20),
  //           FaIcon(FontAwesomeIcons.headphonesSimple),
  //           SizedBox(width: 20),
  //           FaIcon(FontAwesomeIcons.upRightFromSquare)
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

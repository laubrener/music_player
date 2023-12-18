// import 'package:chat_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.text, required this.onPressed});

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      elevation: 2,
      highlightElevation: 5,
      onPressed: () => onPressed(),
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.centerLeft,
                colors: [
                  Color(0xff33333E),
                  Color(0xff201E28),
                ])),
        child: Center(
          child: authService.authenticating
              ? SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(
                    color: Colors.white.withOpacity(0.4),
                  ),
                )
              : Text(
                  text,
                  style: TextStyle(
                      color: Colors.pink.shade100,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
        ),
      ),
    );
  }
}

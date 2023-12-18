import 'package:flutter/material.dart';
import 'package:music_player/pages/music_player_page.dart';
import 'package:music_player/pages/songs_page.dart';
import 'package:music_player/widgets/custom_input.dart';
import 'package:music_player/widgets/custom_labels.dart';
import 'package:music_player/widgets/login_button.dart';
import 'package:provider/provider.dart';

import '../helpers/show_alert.dart';
import '../services/auth_service.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          const Background(),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Logo(),
                    const _Form(),
                    const LoginLabels(
                      page: "register",
                      text: "Don't have an account",
                      btn: "Create account",
                    ),
                    const Text("Terms and conditions")
                  ]),
            ),
          )
        ],
      ),
    ));
  }
}

class _Form extends StatefulWidget {
  const _Form({super.key});

  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    // final socketService = Provider.of<SocketService>(context);
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: "Email",
            keyboardType: TextInputType.emailAddress,
            textController: emailController,
          ),
          CustomInput(
            icon: Icons.lock,
            placeholder: "Password",
            keyboardType: TextInputType.visiblePassword,
            textController: passwordController,
          ),
          LoginButton(
            text: "Login",
            onPressed: authService.authenticating
                ? () {}
                : () async {
                    FocusScope.of(context).unfocus();
                    final loginOk = await authService.login(
                        emailController.text.trim(),
                        passwordController.text.trim());

                    if (loginOk == true) {
                      // socketService.connect();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => SongsPage()));
                    } else {
                      showAlert(
                          context, 'Login incorrect', 'Check your credentials');
                    }
                  },
          )
        ],
      ),
    );
  }
}

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Container(
            height: 125,
            width: 125,
            decoration: BoxDecoration(
              border: Border.all(
                width: 8,
                color: Colors.pink.shade300,
              ),
              borderRadius: BorderRadius.circular(25),
              color: Colors.transparent,
            ),
            child: Icon(
              Icons.music_note,
              color: Colors.pink.shade300,
              size: 70,
            ),
          ),
          const SizedBox(height: 30),
          const Text("Music Player", style: TextStyle(fontSize: 30)),
        ],
      ),
    );
  }
}

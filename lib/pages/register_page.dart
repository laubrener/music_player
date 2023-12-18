import 'package:music_player/pages/login.dart';
import 'package:music_player/pages/music_player_page.dart';
import 'package:music_player/services/auth_service.dart';
import 'package:music_player/widgets/custom_input.dart';
import 'package:music_player/widgets/custom_labels.dart';
import 'package:music_player/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/show_alert.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Background(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Logo(title: "Sign Up"),
                        _Form(),
                      ],
                    ),
                  ),
                ),
                LoginLabels(
                    page: "login",
                    text: "Already have an account",
                    btn: "Login"),
                Text("Terms and conditions")
              ]),
        ),
      ),
    );
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
  final nameController = TextEditingController();
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
            icon: Icons.perm_identity,
            placeholder: "Name",
            keyboardType: TextInputType.text,
            textController: nameController,
          ),
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
            text: "Create account",
            onPressed: authService.authenticating
                ? () {}
                : () async {
                    FocusScope.of(context).unfocus();
                    final registerOk = await authService.register(
                        nameController.text.trim(),
                        emailController.text.trim(),
                        passwordController.text.trim());

                    if (registerOk == true) {
                      // socketService.connect();
                      Navigator.pushReplacementNamed(context, 'songs');
                    } else {
                      showAlert(context, 'Registro incorrecto', registerOk);
                    }
                  },
          ),
          const SizedBox(height: 50)
        ],
      ),
    );
  }
}

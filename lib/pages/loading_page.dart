import 'package:flutter/material.dart';
import 'package:music_player/pages/songs_page.dart';
import 'package:music_player/services/auth_service.dart';
import 'package:provider/provider.dart';

import 'login.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (context, snapshot) {
          return Center(
              child: CircularProgressIndicator(
            color: Colors.pink.shade100,
          ));
        },
      ),
    );
  }

  Future checkLoginState(BuildContext context) async {
    final authService = Provider.of<AuthService>(context, listen: false);
    // final socketService = Provider.of<SocketService>(context, listen: false);

    final authenticating = await authService.isLoggedIn();

    if (authenticating == true) {
      // socketService.connect();
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (_, __, ___) => SongsPage(),
              transitionDuration: Duration(milliseconds: 0)));
    } else {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (_, __, ___) => LoginPage(),
              transitionDuration: Duration(milliseconds: 0)));
    }
  }
}

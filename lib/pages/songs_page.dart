import 'package:flutter/material.dart';
import 'package:music_player/pages/music_player_page.dart';
import 'package:music_player/services/auth_service.dart';
import 'package:music_player/theme/theme.dart';
import 'package:provider/provider.dart';

class SongsPage extends StatelessWidget {
  const SongsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            authService.usuario.nombre,
            style: TextStyle(color: Colors.white.withOpacity(0.3)),
          ),
          centerTitle: true,
          backgroundColor: myTheme.scaffoldBackgroundColor,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'login');
                  AuthService.deleteToken();
                },
                icon: Icon(
                  Icons.exit_to_app,
                  color: Colors.white.withOpacity(0.3),
                ))
          ],
        ),
        body: const SongsList());
  }
}

class SongsList extends StatelessWidget {
  const SongsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        itemBuilder: (context, i) => ListTile(
          leading: Icon(
            Icons.music_note,
            color: Colors.pink.shade100,
          ),
          title: Text('Taylor Swift - Cruel Summer'),
          trailing: Icon(
            Icons.chevron_right,
            color: Colors.pink.shade100,
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const MusicPlayerPage()));
          },
        ),
        separatorBuilder: ((context, index) => const Divider()),
        itemCount: 10,
      ),
    );
  }
}

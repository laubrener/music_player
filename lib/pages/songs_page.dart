import 'package:flutter/material.dart';
import 'package:music_player/pages/music_player_page.dart';

class SongsPage extends StatelessWidget {
  const SongsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
    ));
  }
}

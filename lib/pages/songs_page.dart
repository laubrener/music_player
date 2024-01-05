import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/bloc/songs_bloc.dart';
import 'package:music_player/pages/music_player_page.dart';
import 'package:music_player/services/auth_service.dart';
import 'package:music_player/theme/theme.dart';
import 'package:provider/provider.dart';

import '../models/song_model.dart';

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
        body:
            BlocProvider(create: (context) => SongsBloc(), child: SongsList()));
  }
}

class SongsList extends StatefulWidget {
  SongsList({
    super.key,
  });

  @override
  State<SongsList> createState() => _SongsListState();
}

class _SongsListState extends State<SongsList> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    onRefresh();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SongsBloc, SongsState>(
      listener: ((_, __) {}),
      builder: builder,
    );
  }

  Future<void> onRefresh() async {
    BlocProvider.of<SongsBloc>(context).add(OnRefreshSongs());
  }

  Widget builder(BuildContext context, SongsState state) {
    SongsModel songsModel = state.getSongsModel();

    return Container(
      child: ListView.builder(
        itemCount: songsModel.response?.length,
        itemBuilder: ((context, index) => ListTile(
              leading: Icon(
                Icons.music_note,
                color: Colors.pink.shade100,
              ),
              title: Text(
                  "${songsModel.response?[index].title} - ${songsModel.response?[index].artist}"),
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
            )),
      ),
    );
  }
}

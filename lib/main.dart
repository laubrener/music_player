import 'package:flutter/material.dart';
import 'package:music_player/models/audio_player_model.dart';
import 'package:music_player/routes/routes.dart';
import 'package:music_player/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:music_player/theme/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthService()),
          ChangeNotifierProvider(create: (_) => AudioPlayerModel()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Music Player',
          theme: myTheme,
          initialRoute: "loading",
          routes: appRoutes,
        ));
  }
}

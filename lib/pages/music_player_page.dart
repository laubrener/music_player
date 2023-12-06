import 'package:animate_do/animate_do.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/helpers/helpers.dart';
import 'package:music_player/models/audio_player_model.dart';
import 'package:music_player/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

class MusicPlayerPage extends StatelessWidget {
  const MusicPlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Stack(
      children: [
        Background(),
        Column(
          children: [
            CustomAppbar(),
            DiscDuration(),
            PlayTitle(),
            Expanded(child: Lyrics()),
          ],
        ),
      ],
    ));
  }
}

class Background extends StatelessWidget {
  const Background({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 0.7,
      width: double.infinity,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60)),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.center,
              colors: [
                Color(0xff33333E),
                Color(0xff201E28),
              ])),
    );
  }
}

class Lyrics extends StatelessWidget {
  const Lyrics({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final lyrics = getLyrics();
    return Container(
      child: ListWheelScrollView(
        itemExtent: 42,
        diameterRatio: 1.5,
        physics: const BouncingScrollPhysics(),
        children: lyrics
            .map((e) => Text(
                  e,
                  style: TextStyle(
                      fontSize: 18, color: Colors.white.withOpacity(0.6)),
                ))
            .toList(),
      ),
    );
  }
}

class DiscDuration extends StatelessWidget {
  const DiscDuration({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 60),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: const Row(
        children: [
          DiscImage(),
          SizedBox(width: 20),
          ProgressBar(),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}

class PlayTitle extends StatefulWidget {
  const PlayTitle({
    super.key,
  });

  @override
  State<PlayTitle> createState() => _PlayTitleState();
}

class _PlayTitleState extends State<PlayTitle>
    with SingleTickerProviderStateMixin {
  bool isPlaying = false;
  bool firstTime = true;
  late AnimationController playAnimation;
  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    songDuration();
    playAnimation = AnimationController(
        vsync: this,
        duration: const Duration(
          milliseconds: 500,
        ));

    super.initState();
  }

  @override
  void dispose() {
    playAnimation.dispose();
    super.dispose();
  }

  void songDuration() {
    assetsAudioPlayer.open(
        Audio('assets/audios/Taylor Swift - Cruel Summer.mp3'),
        autoStart: false,
        showNotification: true);
    final audioPlayerModel =
        Provider.of<AudioPlayerModel>(context, listen: false);
    assetsAudioPlayer.currentPosition.listen((duration) {
      audioPlayerModel.current = duration;
    });
    assetsAudioPlayer.current.listen((playingAudio) {
      audioPlayerModel.songDuration =
          playingAudio?.audio.duration ?? const Duration(seconds: 0);
    });
    setState(() {});
  }

  void open() {
    assetsAudioPlayer.open(
        Audio('assets/audios/Taylor Swift - Cruel Summer.mp3'),
        autoStart: true,
        showNotification: true);

    isPlaying = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      margin: const EdgeInsets.only(top: 40),
      child: Row(children: [
        Column(
          children: [
            Text(
              'Cruel Summer',
              style:
                  TextStyle(fontSize: 30, color: Colors.white.withOpacity(0.8)),
            ),
            Text(
              'Taylor Swift',
              style:
                  TextStyle(fontSize: 15, color: Colors.white.withOpacity(0.5)),
            ),
          ],
        ),
        const Spacer(),
        FloatingActionButton(
            onPressed: () {
              final audioPlayerModel =
                  Provider.of<AudioPlayerModel>(context, listen: false);

              if (isPlaying) {
                playAnimation.reverse();
                isPlaying = false;
                audioPlayerModel.controller.stop();
              } else {
                playAnimation.forward();
                isPlaying = true;
                audioPlayerModel.controller.repeat();
              }

              if (firstTime) {
                open();
                firstTime = false;
              } else {
                assetsAudioPlayer.playOrPause();
              }
            },
            backgroundColor: Colors.pink.shade100,
            elevation: 0,
            highlightElevation: 0,
            child: AnimatedIcon(
                icon: AnimatedIcons.play_pause, progress: playAnimation))
      ]),
    );
  }
}

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(color: Colors.white.withOpacity(0.4));
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context);
    final percentage = audioPlayerModel.percentage;
    return Container(
      child: Column(
        children: [
          Text(
            audioPlayerModel.songTotalDuration,
            style: style,
          ),
          const SizedBox(height: 10),
          Stack(
            children: [
              Container(
                width: 3,
                height: 230,
                color: Colors.white.withOpacity(0.1),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: 3,
                  height: 230 * percentage,
                  color: Colors.white.withOpacity(0.8),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Text(
            audioPlayerModel.currentSecond,
            style: style,
          ),
        ],
      ),
    );
  }
}

class DiscImage extends StatelessWidget {
  const DiscImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final audioPlayerModel = Provider.of<AudioPlayerModel>(context);
    return Container(
      padding: const EdgeInsets.all(15),
      width: 250,
      height: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              Color(0xff484750),
              Color(0xff1E1C24),
            ],
          )),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SpinPerfect(
                animate: audioPlayerModel.playing,
                duration: const Duration(seconds: 10),
                infinite: true,
                manualTrigger: true,
                controller: (animationController) =>
                    audioPlayerModel.controller = animationController,
                child: const Image(image: AssetImage('assets/lover.webp'))),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                color: const Color(0xff1C1C25),
                borderRadius: BorderRadius.circular(100),
              ),
            )
          ],
        ),
      ),
    );
  }
}

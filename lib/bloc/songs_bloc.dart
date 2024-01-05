import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:music_player/models/song_model.dart';
import 'package:music_player/services/songs_service.dart';

part 'songs_event.dart';
part 'songs_state.dart';

class SongsBloc extends Bloc<SongsEvent, SongsState> {
  SongsModel? songsModel = SongsModel();

  SongsBloc() : super(SongsInitial()) {
    on<OnRefreshSongs>(_onRefreshSongs);
  }

  _onRefreshSongs(OnRefreshSongs event, Emitter<SongsState> emitter) async {
    await _onSongs(emitter);
  }

  _onSongs(Emitter<SongsState> emitter) async {
    emitter(SongsLoading());

    try {
      songsModel = await SongsService().getSongsList();

      emitter(SongsSuccess(
        songsModel: songsModel ?? SongsModel(),
      ));
    } catch (e) {
      emitter(SongsConnectionError(e.toString()));
    }
  }
}

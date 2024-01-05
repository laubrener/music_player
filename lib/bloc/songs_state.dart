part of 'songs_bloc.dart';

@immutable
sealed class SongsState {
  bool isLoading() {
    return false;
  }

  SongsModel getSongsModel() {
    return SongsModel();
  }

  String? error;
}

class SongsInitial extends SongsState {}

class SongsLoading extends SongsState {
  bool isLoading() {
    return true;
  }
}

class SongsSuccess extends SongsState {
  final SongsModel songsModel;

  SongsSuccess({
    required this.songsModel,
  });
  @override
  SongsModel getSongsModel() {
    return songsModel;
  }
}

class SongsConnectionError extends SongsState {
  String? error;

  SongsConnectionError(this.error);
}

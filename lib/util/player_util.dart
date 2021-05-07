import 'package:audioplayers/audioplayers.dart';

AudioPlayer _audioPlayer;

/// 单例方法-永远返回同一个实例
AudioPlayer getPlayer() {
  if (_audioPlayer == null) {
    _audioPlayer = AudioPlayer();
  }

  return _audioPlayer;
}

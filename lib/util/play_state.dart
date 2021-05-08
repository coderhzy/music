import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

AudioPlayer _audioPlayer;
//单例方法——永远返回同一个实例
AudioPlayer getPlayer() {
  if (_audioPlayer == null) {
    _audioPlayer = AudioPlayer();
  }

  return _audioPlayer;
}

class PlayState extends InheritedWidget {
  final bool playing;
  final int current;
  final int total;
  final AudioPlayer player;

  PlayState({
    Key key,
    Widget child,
    this.playing,
    this.current,
    this.total,
    this.player,
  }) : super(key: key, child: child);

  static PlayState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PlayState>();
  }

  @override
  bool updateShouldNotify(PlayState oldWidget) {
    //true -> 应该更新 -> 不一样
    return oldWidget.playing != playing ||
        oldWidget.current != current ||
        oldWidget.total != total;
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return '''
playing: $playing
current: $current
total: $total
''';
  }
}

//
class _PlayStateProviderState extends State {
  final Widget child;
  AudioPlayer player;

  bool playing = false;
  int current;
  int total;

  _PlayStateProviderState({this.child}) : super() {
    player = getPlayer();

    player.onPlayerStateChanged.listen((event) {
      print(event);

      setState(() {
        playing = event == AudioPlayerState.PLAYING;
      });
    });

    player.onAudioPositionChanged.listen((event) {
      setState(() {
        print('current: ${event.inSeconds}');
        current = event.inSeconds;
      });
    });
    player.onDurationChanged.listen((event) {
      setState(() {
        print('total: ${event.inSeconds}');
        total = event.inSeconds;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PlayState(
      playing: playing,
      current: current,
      total: total,
      player: player,
      child: child,
    );
  }
}

class PlayStateProvider extends StatefulWidget {
  final Widget child;

  PlayStateProvider({Key key, this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PlayStateProviderState(child: child);
}

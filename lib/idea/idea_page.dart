import 'package:flutter/material.dart';
import 'package:firstflutter/global_config.dart';
import 'package:flutter/services.dart';
import 'package:firstflutter/Model/zhihuModel.dart';
import 'package:http/http.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:intl/date_symbol_data_local.dart';

import 'dart:io';
import 'dart:async';

class IdeaPage extends StatefulWidget {
  @override
  _FollowPageState createState() => _FollowPageState();
}

class _FollowPageState extends State<IdeaPage> {
  // 创建一个geinative的channel（类似iOS的通知）
  static const methodChannel = MethodChannel('com.page.your/native_get');

  Stories topnewsModel;

  /// 测试数据

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    flutterSound.setSubscriptionDuration(0.01);
    flutterSound.setDbPeakLevelUpdate(0.8);
    flutterSound.setDbLevelEnabled(true);
    initializeDateFormatting();
  }

  FlutterSound flutterSound = FlutterSound();
  bool _isRecording = false;
  bool _isPlaying = false;
  StreamSubscription _recorderSubscription;
  StreamSubscription _dbPeakSubscription;
  StreamSubscription _playerSubscription;
  String _recorderTxt = '00:00:00';
  String _playerTxt = '00:00:00';
  double _dbLevel;
  double slider_current_position = 0.0;
  double max_duration = 1.0;

  /// 开始录音
  void startRecorder() async {
    try {
      String path = await flutterSound.startRecorder(null);

      _recorderSubscription = flutterSound.onRecorderStateChanged.listen((e) {
        DateTime date = DateTime.fromMillisecondsSinceEpoch(
            e.currentPosition.toInt(),
            isUtc: true);
        String txt = DateFormat('mm:ss:SS', 'en_GB').format(date);
        this.setState(() {
          this._recorderTxt = txt.substring(0, 8);
        });
      });
      _dbPeakSubscription =
          flutterSound.onRecorderDbPeakChanged.listen((value) {
        print('got update -> $value');
        setState(() {
          this._dbLevel = value;
        });
      });
      this.setState(() {
        this._isRecording = true;
      });
    } catch (err) {
      print('startRecorder error : $err');
    }
  }

  /// 停止录音
  void stopRecorder() async {
    try {
      String result = await flutterSound.stopRecorder();
      print('stopRecorder: $result');

      if (_recorderSubscription != null) {
        _recorderSubscription.cancel();
        _recorderSubscription = null;
      }
      if (_dbPeakSubscription != null) {
        _dbPeakSubscription.cancel();
        _dbPeakSubscription = null;
      }
      this.setState(() {
        this._isRecording = false;
      });
    } catch (e) {
      print('stopRecorder error :$e');
    }
  }

  /// 开始播放
  void startPlayer() async {
    String path = await flutterSound.startPlayer(null);
    await flutterSound.setVolume(1.0);
    print('startPlayer path = $path');

    try {
      _playerSubscription = flutterSound.onPlayerStateChanged.listen((e) {
        if (e != null) {
          slider_current_position = e.currentPosition;
          max_duration = e.duration;
//        print('当前播放进度====${e.currentPosition},总进度=${e.duration}');
          DateTime date = DateTime.fromMillisecondsSinceEpoch(
              e.currentPosition.toInt(),
              isUtc: true);
          String txt = DateFormat('mm:ss:SS', 'en_GB').format(date);
          this.setState(() {
            this._isPlaying = true;
            this._playerTxt = txt.substring(0, 8);
          });
        }
      });
    } catch (e) {
      print('startPlayer error = $e');
    }
  }

  /// 停止播放
  void stopPlayer() async {
    try {
      String result = await flutterSound.stopPlayer();
      print('stopPlayer result = $result');
      if (_playerSubscription != null) {
        _playerSubscription.cancel();
        _playerSubscription = null;
      }
      this.setState(() {
        this._isPlaying = false;
      });
    } catch (e) {
      print('stopPlayer error :$e');
    }
  }

  /// 暂停播放
  void pausePlayer() async {
    String result = await flutterSound.pausePlayer();
    setState(() {
      this._isPlaying = false;
    });
    print('pausePlayer reuslt = $result');
  }

  /// 继续播放
  void resumePlayer() async {
    String result = await flutterSound.resumePlayer();
    print('resumePlayer reuslt = $result');
  }

  /// 跳转到指定位置播放
  void seekToPlayer(int milliSecs) async {
    int secs = Platform.isIOS ? milliSecs / 1000 : milliSecs;
    String result = await flutterSound.seekToPlayer(secs);
    print('seekToPlayer reuslt = $result');
  }

  _iOSPushToVC() async {
    // 检查是否开启了录音权限
    String path = await flutterSound.startRecorder(null);
    print('录音存储的位置==$path');
//    print('是否开启了录音权限== $hasPermissions');
  }

  /// 跳转到
  _iOSPushToVC1() async {
    String title = topnewsModel.title;
    print('读取到的title = $title');
  }

  _iOSPushToVC2() async {
    List images = topnewsModel.images;
    print('读取到的图片数组 = $images');
  }

  _method3() async {
    // 开始请求网络数据
  }

  Widget soudTestView() {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  this._recorderTxt,
                  style: TextStyle(fontSize: 50.0, color: Colors.black),
                ),
              ),
              _isRecording
                  ? LinearProgressIndicator(
                      value: 100.0 / 160.0 * (this._dbLevel ?? 1) / 100,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                      backgroundColor: Colors.deepOrange,
                    )
                  : Container()
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 60.0,
                height: 60.0,
                child: FlatButton(
                  onPressed: () {
                    if (!this._isRecording) {
                      this.startRecorder();
                    } else {
                      this.stopRecorder();
                    }
                  },
                  child: Text(this._isRecording ? '停止录音' : '开始录音'),
                  color: Colors.grey,
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 50, bottom: 20),
                child: Text(
                  this._playerTxt,
                  style: TextStyle(fontSize: 50.0, color: Colors.red),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                color: Colors.grey,
                child: FlatButton(
                    onPressed: () {
                      if (!this._isPlaying) {
                        this.startPlayer();
                      } else {
                        this.pausePlayer();
                      }
                    },
                    child: Text(this._isPlaying ? '暂停播放' : '开始播放')),
              ),
              Container(
                width: 60,
                height: 60,
                color: Colors.grey,
                child: FlatButton(
                    onPressed: () {
                      this.resumePlayer();
                    },
                    child: Text('继续播放')),
              ),
              Container(
                width: 60,
                height: 60,
                color: Colors.orange,
                child: FlatButton(
                    onPressed: () {
                      this.stopPlayer();
                    },
                    child: Text('停止')),
              ),
            ],
          ),
          Container(
            height: 60.0,
            child: Slider(
              min: 0.0,
              max: max_duration,
              value: slider_current_position,
              onChanged: (double value) async {
//                await flutterSound.seekToPlayer(value.toInt());
              print('进度条当前的位置===$value');
              },

//              divisions: max_duration.toInt(),
            ),
          )
        ],
      ),
    );
  }

  Widget barSearch() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: () {
                _iOSPushToVC();
              },
              child: Text('查看存储路径'),
            ),
            FlatButton(
              onPressed: () {
                _iOSPushToVC1();
              },
              child: Text('方法2'),
            ),
            FlatButton(
              onPressed: () {
                _iOSPushToVC2();
              },
              child: Text('方法3'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
          appBar: new AppBar(
            title: new Text('想法'),
          ),
//          body: barSearch(),
          body: soudTestView(),
        ),
        theme: GlobalConfig.themeData);
  }
}

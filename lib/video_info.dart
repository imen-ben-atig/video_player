import 'package:flutter/services.dart' show rootBundle;
// ignore_for_file: prefer_const_constructors, unused_field, avoid_single_cascade_in_expression_statements, prefer_is_empty, prefer_typing_uninitialized_variables, prefer_conditional_assignment, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'colors.dart' as color;
import 'package:video_player/video_player.dart';

class VideoInfo extends StatefulWidget {
  const VideoInfo({super.key});

  @override
  State<VideoInfo> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List videoInfo = [];
  bool _playArea = false;

  // ignore: prefer_final_fields
  bool _isPlaying = false;
  bool _disposed = false;
  int _isPlayingIndex = -1;
  VideoPlayerController? _controller;
  bool _fullScreen = false;

  //late VideoPlayerController _controller;
  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/video_info.json")
        .then((value) {
      setState(() {
        // so we can update the screen every time we have a new info
        videoInfo = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  /*void _toggleFullScreen() {
    if (_fullScreen) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
          overlays: SystemUiOverlay.values);
      SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    } else {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    }
    setState(() {
      _fullScreen = !_fullScreen;
    });
  }*/

  @override
  void dispose() {
    _disposed = true;
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    super.dispose();
    _initData();
  }

//////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: _playArea == false
          ? BoxDecoration(
              gradient: LinearGradient(
              colors: [
                color.AppColor.gradientFirst.withOpacity(0.9),
                color.AppColor.gradientSecond.withOpacity(0.5),
              ],
              begin: const FractionalOffset(0.0, 0.4),
              end: Alignment.topRight,
            ))
          : BoxDecoration(
              color: color.AppColor.gradientSecond,
            ),
      child: Column(
        children: [
          _playArea == false
              ? Container(
                  padding: const EdgeInsets.only(top: 50, left: 25, right: 25),
                  width: MediaQuery.of(context).size.width,
                  height: 160,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 20,
                              color: color.AppColor.secondPageIconColor,
                            ),
                          ),
                          Expanded(
                              child:
                                  Container()), // to move the info icon to the right
                          Icon(
                            Icons.info_outline,
                            size: 20,
                            color: color.AppColor.secondPageIconColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      /*Text(
                        "For you",
                        style: TextStyle(
                            fontSize: 10,
                            color: color.AppColor.secondPageTitleColor),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Recommended videos",
                        style: TextStyle(
                            fontSize: 15,
                            color: color.AppColor.secondPageTitleColor),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 100,
                            height: 25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [
                                    color.AppColor
                                        .secondPageContainerGradient1stColor,
                                    color.AppColor
                                        .secondPageContainerGradient2ndColor,
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.timer,
                                  size: 12,
                                  color: color.AppColor.secondPageIconColor,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(videoInfo[0]["time"],
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: color.AppColor.secondPageIconColor,
                                    )),

                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 120),
                          Container(
                            width: 100,
                            height: 25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [
                                    color.AppColor
                                        .secondPageContainerGradient2ndColor,
                                    color.AppColor
                                        .secondPageContainerGradient2ndColor,
                                  ],
                                )),
                           /* child: Row(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.category_rounded,
                                  size: 14,
                                  color: color.AppColor.secondPageIconColor,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Category",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: color.AppColor.secondPageIconColor,
                                    )),
                              ],
                            ),*/
                          ),
                        ],
                      ),*/
                    ],
                  ),
                )
              : Container(
                  /*width:320,
              height: 300,
            color: Colors.red,*/

                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          top: 30,
                          left: 20,
                          right: 20,
                        ),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                                debugPrint("OKKKKKK");
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                                color: color.AppColor.secondPageIconColor,
                              ),
                            ),
                            Expanded(child: Container()),
                            // to  create the maximum distance between the two icons
                            Icon(
                              Icons.info_outline,
                              size: 20,
                              color: color.AppColor.secondPageIconColor,
                            ),
                          ],
                        ),
                      ),
                      //_playView(context),
                    ],
                  ),
                ),
          //_playView(context),
          _controlView(context),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(70),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(5, 5),
                    blurRadius: 30,
                    color: color.AppColor.gradientSecond.withOpacity(0.5),
                  )
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                        height: 40,
                      ),
                      Text(
                        "list of videos",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: color.AppColor.circuitsColor),
                      ),
                      /*Row(
                      children: [
                        Icon(Icons.loop,size: 12,
                          color: color.AppColor.loopColor,
                        ),
                        SizedBox(width: 5,),
                        Text("40 min",
                            style: TextStyle(
                              fontSize: 12,
                              color: color.AppColor.loopColor,
                            )
                        ),
                        SizedBox(width: 10,),

                      ],
                    )*/
                    ],
                  ),
                  Expanded(child: _listView()),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  ////////////////////////////////////////////////////////////////////

  String convertTwo(int value) {
    return value < 10 ? "0$value" : "$value";
  }

  Widget _controlView(BuildContext context) {
    final duration = _duration?.inSeconds ?? 0;
    final head = _position?.inSeconds ?? 0;
    final remained = max(0, duration - head);
    final mins = convertTwo(remained ~/ 60.0);
    final secs = convertTwo(remained % 60);

    return Column(mainAxisSize: MainAxisSize.min, children: [
      Container(
          child: Column(children: [
        Row(
          children: [
            SizedBox(
              width: 95,
            ),
            TextButton(
              onPressed: () async {
                final index = _isPlayingIndex - 1;
                if (index >= 0 && videoInfo.length >= 0) {
                  _initializedVideo(index);
                } else {
                  Get.snackbar(
                    "Video list",
                    "",
                    snackPosition: SnackPosition.BOTTOM,
                    icon: Icon(
                      Icons.face,
                      size: 20,
                      color: Colors.white60,
                    ),
                    backgroundColor: color.AppColor.gradientSecond,
                    colorText: Colors.white60,
                    messageText: Text(
                      "that's the first video! ",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white60,
                      ),
                    ),
                  );
                }
              },
              child: Icon(
                Icons.fast_rewind,
                size: 30,
                color: Colors.white60,
              ),
            ),
            TextButton(
              onPressed: () async {
                if (_isPlaying) {
                  setState(() {
                    _isPlaying = false;
                  });
                  _controller?.pause();
                } else {
                  setState(() {
                    _isPlaying = true;
                  });
                  _controller?.play();
                }
              },
              child: Icon(
                _isPlaying ? Icons.pause : Icons.play_arrow,
                size: 30,
                color: Colors.white60,
              ),
            ),
            TextButton(
              onPressed: () async {
                final index = _isPlayingIndex + 1;
                if (index <= videoInfo.length - 1) {
                  _initializedVideo(index);
                } else {
                  Get.snackbar(
                    "Video list",
                    "",
                    snackPosition: SnackPosition.BOTTOM,
                    icon: Icon(
                      Icons.face,
                      size: 20,
                      color: Colors.white60,
                    ),
                    backgroundColor: color.AppColor.gradientSecond,
                    colorText: Colors.white60,
                    messageText: Text(
                      "no more videos to play ",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white60,
                      ),
                    ),
                  );
                }
              },
              child: Icon(
                Icons.fast_forward,
                size: 30,
                color: Colors.white60,
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Text("$mins:$secs",
                style: TextStyle(color: Colors.white, shadows: <Shadow>[
                  Shadow(
                    offset: Offset(0.0, 0.1),
                    blurRadius: 4.0,
                    color: Color.fromARGB(150, 0, 0, 0),
                  )
                ])),
          ],
        ),
      ]))
    ]);
  }

  _onTapVideo(int index) {
    _initializedVideo(index);
  }

  var _onUpdateControllerTime;
  Duration? _duration;
  Duration? _position;
  var _progress = 0.0;

  void _oncontrollerUpdate() async {
    if (_disposed) {
      return;
    }
    _onUpdateControllerTime = 0;
    final now = DateTime.now().millisecondsSinceEpoch;
    if (_onUpdateControllerTime > now) {
      return;
    }
    _onUpdateControllerTime = now + 500;

    final controller = _controller;
    if (controller == null) {
      debugPrint("controller is null");
      return;
    }
    if (!controller.value.isInitialized) {
      debugPrint("cont cannot be init");
      return;
    }

    if (_duration == null) {
      _duration = _controller?.value.duration;
    }
    var duration = _duration;
    if (duration == null) return;
    var position = await controller.position;
    _position = position;
    final playing = controller.value.isPlaying;
    if (playing) {
      if (_disposed) return;
      setState(() {
        _progress = position!.inMilliseconds.ceilToDouble() /
            duration.inMilliseconds.ceilToDouble();
      });
    }
    _isPlaying = playing;
  }

  _initializedVideo(int index) async {
    final controller =
        //VideoPlayerController.networkUrl(videoInfo[index]["videoUrl"]); we gotta use uri.prase in here
        VideoPlayerController.network(videoInfo[index]["videoUrl"]);
    final old = _controller;
    _controller = controller;
    if (old != null) {
      old.removeListener(_oncontrollerUpdate);
      old.pause();
    }

    setState(() {});
    controller
      ..initialize().then((_) {
        old?.dispose();
        _isPlayingIndex = index;
        controller.addListener(_oncontrollerUpdate);
        controller.play();
        setState(() {});
      });
  }

  _listView() {
    return ListView.builder(
        itemCount: videoInfo.length,
        itemBuilder: (_, int index) {
          return GestureDetector(
            // so we can return a clickable item
            onTap: () {
              _onTapVideo(index);
              //   videoUrl: videoInfo[index]["videoUrl"];
              debugPrint(index.toString());
              setState(() {
                if (_playArea == false) {
                  _playArea = true;
                }
              });
            },

            child: _buildCard(index),
          );
        });
  }

  _buildCard(int index) {
    return Container(
      height: 150,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 160,
                height: 80,
                decoration: BoxDecoration(
                    //color: Colors.white,
                    borderRadius: BorderRadius.circular(90),
                    image: DecorationImage(
                      //box decoration
                      image: AssetImage(//constructeur
                          videoInfo[index]["thumbnail"]),
                      //fit:BoxFit.cover
                    )),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoInfo[index]["title"],
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 3),
                      child: Text(videoInfo[index]["time"],
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 10,
                              fontWeight: FontWeight.bold)))
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 80,
              ),
              /*Container(
                width: 40,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.indigoAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  /*child: Text(
                    "15 sec rest",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),*/
                ),
              ),*/
              Row(
                children: [
                  for (int i = 0; i < 75; i++)
                    i.isEven
                        ? Container(
                            width: 3,
                            height: 1,
                            decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          )
                        : Container(
                            width: 3,
                            height: 1,
                            color: Colors.white,
                          )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  /* _TimeCal(int index) {
    return Timevalue(
        videoInfo[index]["time"]),

  }*/

  void _showCustomDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        double sliderValue = 50.0; // Initial value for the Slider

        return AlertDialog(
          title: Text('Adjust Slider'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Slider Value: ${sliderValue.toStringAsFixed(1)}'),
              Slider(
                value: max(0, min(_progress * 100, 100)),
                min: 0,
                max: 100,
                divisions: 100,
                label: _position?.toString().split(".")[0],
                onChanged: (value) {
                  setState(() {
                    _progress = value * 0.01;
                  });
                },
                onChangeStart: (value) {
                  _controller?.pause();
                },
                onChangeEnd: (value) {
                  final duration = _controller?.value.duration;
                  if (duration != null) {
                    var newValue = max(0, min(value, 99)) * 0.01;
                    var millis = (duration.inMilliseconds * newValue).toInt();
                    _controller?.seekTo(Duration(milliseconds: millis));
                    _controller?.play();
                  }
                },
              )
            ],
          ),
        );
      },
    );
  }
}

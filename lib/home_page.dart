import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_test/video_info.dart';
import 'colors.dart' as color;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "video list",
                  style: TextStyle(
                      fontSize: 30,
                      color: color.AppColor.homePageTitle,
                      fontWeight: FontWeight.w700),
                ),
                Expanded(child: Container()),
                Icon(Icons.arrow_back_ios,
                    size: 20, color: color.AppColor.homePageIcons),
                const SizedBox(
                  width: 10,
                ),
                Icon(Icons.calendar_today_outlined,
                    size: 20, color: color.AppColor.homePageIcons),
                const SizedBox(
                  width: 15,
                ),
                Icon(Icons.arrow_forward_ios,
                    size: 20, color: color.AppColor.homePageIcons),
              ],
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text("Details",
                    style: TextStyle(
                        fontSize: 20,
                        color: color.AppColor.homePageSubtitle,
                        fontWeight: FontWeight.w700 //bold
                        )),
                Expanded(child: Container()),
                /*Text("show more",
                    style: TextStyle(
                      fontSize: 20,
                      color: color.AppColor.homePageDetail,
                    )),
                const SizedBox(
                  width: 20,
                ),
                Icon(Icons.arrow_forward,
                    size: 20, color: color.AppColor.homePageIcons)*/
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 180,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        color.AppColor.gradientFirst,
                        color.AppColor.gradientSecond,
                      ]),
                  //color: Colors.lightBlue,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(80),
                    topRight: Radius.circular(80),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(5, 5),
                      blurRadius: 30,
                      color: color.AppColor.gradientSecond.withOpacity(0.5),
                    )
                  ]),
              // ignore: prefer_const_constructors
              child: Container(
                padding: const EdgeInsets.only(
                    left: 20, top: 15, bottom: 10, right: 30),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, //move the text to the left
                  children: [
                    Text(
                      "For you",
                      style: TextStyle(
                          fontSize: 16,
                          color: color.AppColor.homePageContainerTextSmall),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Recommended videos",
                      style: TextStyle(
                          fontSize: 25,
                          color: color.AppColor.homePageContainerTextSmall),
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      height: 15,
                    ), //to push the last row to the bottom
                    Row(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.timer,
                                size: 15,
                                color:
                                    color.AppColor.homePageContainerTextSmall),

                            // ignore: prefer_const_constructors
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "5 min",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: color
                                      .AppColor.homePageContainerTextSmall),
                            ),
                          ],
                        ),
                        //const SizedBox(width: 150,),// or we add to the padding right:25

                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              boxShadow: [
                                BoxShadow(
                                    color: color.AppColor.gradientFirst,
                                    blurRadius: 10,
                                    // ignore: prefer_const_constructors
                                    offset: Offset(4, 4))
                              ]),
                          // ignore: prefer_const_constructors
                          child: InkWell(
                            onTap: () {
                              // ignore: prefer_const_constructors
                              Get.to(() => VideoInfo());
                            },
                            child: const Icon(
                              Icons.play_circle_fill,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

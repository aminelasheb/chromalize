import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'components/animated_btn.dart';
import 'components/sign_in_dialog.dart';

class OnbodingScreen extends StatefulWidget {
  const OnbodingScreen({super.key});

  @override
  State<OnbodingScreen> createState() => _OnbodingScreenState();
}

class _OnbodingScreenState extends State<OnbodingScreen> {
  late RiveAnimationController _btnAnimationController;
  bool filter = true ;
  bool isShowSignInDialog = false;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Positioned(
          //   width: MediaQuery.of(context).size.width * 1.7,
          //   left: 100,
          //   bottom: 100,
          //   child: Image.asset(
          //     "assets/Backgrounds/Spline.png",
          //   ),
          // ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: const SizedBox(),
            ),
          ),
          filter?  ColorFiltered(
            colorFilter:  ColorFilter.matrix(<double>[
              0.2126, 0.7152, 0.0722, 0, 0,
              0.2126, 0.7152, 0.0722, 0, 0,
              0.2126, 0.7152, 0.0722, 0, 0,
              0,      0,      0,      1, 0,
            ]) ,
            child:  RiveAnimation.asset(
              "assets/RiveAssets/shapes.riv",
            ),
          ) :   RiveAnimation.asset(
            "assets/RiveAssets/shapes.riv",
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child:  SizedBox(),
            ),
          ),
          AnimatedPositioned(
            top: isShowSignInDialog ? -50 : 0,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            duration: const Duration(milliseconds: 200),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text(
                            "Chromal",
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Poppins",
                              height: 1.2,
                            ),
                          ),
                          Row(
                            children: [
                              Container(width: 70, height: 70, decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/logo.png"))),) ,
                              Text(
                                " ize",
                                style: TextStyle(
                                  fontSize: 70,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins",
                                  height: 1.2,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 25),
                          Text(
                            "Revive old memories with vibrant color. Advanced technology and a user-friendly interface make colorizing vintage photos easy and authentic",
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 2),
                    AnimatedBtn(
                      text: "Start now",
                      btnAnimationController: _btnAnimationController,
                      press: () {
                        setState(() {
                          filter=false;
                        });
                        _btnAnimationController.isActive = true;

                        Future.delayed(
                          const Duration(milliseconds: 800),
                          () {
                            setState(() {
                              isShowSignInDialog = true;
                            });
                            showCustomDialog(
                              context,
                              onValue: (_) {
                                setState(() {
                                  isShowSignInDialog = false;
                                });
                              },
                            );
                          },
                        );
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                          "Chromalize, Revolutionary AI model and intuitive UI for optimal user experience."),
                    ) ,

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

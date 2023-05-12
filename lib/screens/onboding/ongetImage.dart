import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rive/rive.dart';
import '../../providers/sendAndreceive.dart';
import 'components/animated_btn.dart';
import 'components/sign_in_dialog.dart';
import 'package:provider/provider.dart';

class ongetImage extends StatefulWidget {
  final String image;
  ongetImage({required this.image, super.key});

  @override
  State<ongetImage> createState() => _ongetImageState();
}

class _ongetImageState extends State<ongetImage> {
  late RiveAnimationController _btnAnimationController;
  bool filter = true;

  bool isShowSignInDialog = false;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: const SizedBox(),
            ),
          ),
          RiveAnimation.asset(
            "assets/RiveAssets/shapes.riv",
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: SizedBox(),
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
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 25),
                          Text(
                            "Old picture",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Poppins",
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(

    // backgroundImage: FileImage(imageFile!),

                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.28,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image:FileImage(Provider.of<sendAndreceive>(context, listen: false).imageFile!) ),
                                color: Colors.grey[300],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                          ),
                          SizedBox(height: 25),
                          Text(
                            "Newest one",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins",
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.28,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                image: DecorationImage(
                                    fit: BoxFit.fill,

                                    image: NetworkImage(widget.image)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                          ),
                          SizedBox(height: 55),
                        ],
                      ),
                    ),
                    Center(
                      child: AnimatedBtn(
                        text: "Download it, now",
                        btnAnimationController: _btnAnimationController,
                        press: () {
                          Fluttertoast.showToast(
                            msg: "Download is not avaible now",
                          );
                          setState(() {});
                          _btnAnimationController.isActive = true;
                          Future.delayed(
                            const Duration(milliseconds: 800),
                            () {},
                          );
                        },
                      ),
                    ),
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

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rive/rive.dart';
import 'package:provider/provider.dart';

import '../../../providers/sendAndreceive.dart';
import '../onboding_screen2.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool light = false;

  Future<void> sendIt() async {

    try {
      await Provider.of<sendAndreceive>(context, listen: false).sendIt();
    } catch (e) {
      print(e);
    }

  }

  Future<void> getImage(ImageSource source) async {
    var pickedImage = await ImagePicker().getImage(source: source);

    setState(() {
      Provider.of<sendAndreceive>(context, listen: false).imageFile =  File(pickedImage!.path!);
      Provider.of<sendAndreceive>(context, listen: false).selectedImage =
          pickedImage!.path;
    });
  }


  Future<void> lightMethod(BuildContext context) async {
    setState(() {
      light = true;
    });
    Future.delayed(Duration(seconds: 6), () async{
      // Code to be executed after 10 seconds
      await sendIt() ;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const OnbodingScreen2(),
        ),
      );
    });



  }

  @override
  Widget build(BuildContext context) {
    return light
        ? Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.9,
              child: RiveAnimation.asset(
                "assets/RiveAssets/light.riv",
                fit: BoxFit.cover,
              ),
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  InkWell(
                    onTap: () async {
                      Provider.of<sendAndreceive>(context, listen: false)
                          .pic_is_changing = true;
                   await   getImage(ImageSource.gallery);
                      lightMethod(context);
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Stack(
                        children: [
                          RiveAnimation.asset(
                            fit: BoxFit.fill,
                            "assets/RiveAssets/235-441-new-notification-here.riv",
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.118,
                                  ),
                                  Icon(
                                    Icons.photo_album_outlined,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.17,
                                  ),
                                  Text(
                                    "Album",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Provider.of<sendAndreceive>(context, listen: false)
                          .pic_is_changing = true;
                      getImage(ImageSource.camera);
                      lightMethod(context);
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Stack(
                        children: [
                          RiveAnimation.asset(
                            fit: BoxFit.fill,
                            "assets/RiveAssets/waiting.riv",
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.118,
                                  ),
                                  Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.17,
                                  ),
                                  Text(
                                    "Camera",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
  }
}

class CustomPositioned extends StatelessWidget {
  const CustomPositioned({super.key, this.scale = 1, required this.child});

  final double scale;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        children: [
          const Spacer(),
          SizedBox(
            height: 100,
            width: 100,
            child: Transform.scale(
              scale: scale,
              child: child,
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}

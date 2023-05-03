import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class AnimatedBtn extends StatelessWidget {
  const AnimatedBtn({
    Key? key,
    required RiveAnimationController btnAnimationController,
    required this.press,
    required this.text,
  })  : _btnAnimationController = btnAnimationController,
        super(key: key);

  final RiveAnimationController _btnAnimationController;
  final VoidCallback press;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        height: 64,
        width: 236,
        child: Stack(
          children: [

            RiveAnimation.asset(
              "assets/RiveAssets/button.riv",
              controllers: [_btnAnimationController],
            ),

            Positioned.fill(
              top: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   Icon(text== "Download it, now" ?  CupertinoIcons.cloud_download:  CupertinoIcons.arrow_right),
                  const SizedBox(width: 30),
                  Text(
                    text,
                    style: Theme.of(context).textTheme.button,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

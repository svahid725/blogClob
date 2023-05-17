import 'package:blog_club/Home.dart';
import 'package:blog_club/gen/assets.gen.dart';
import 'package:blog_club/onboarding.dart';
import 'package:flutter/material.dart';


class SpalshScreen extends StatefulWidget {
  const SpalshScreen({Key? key}) : super(key: key);

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  void initState(){
    Future.delayed(const Duration(seconds: 2 )).then((value) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
        return const OnboardingScreen();
      }));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Assets.img.background.splash.image(fit: BoxFit.cover)),
          Center(
            child: Assets.img.icons.logo.svg(
              width: 161,height: 82
            ),
          )
        ],
      ),
    );
  }
}

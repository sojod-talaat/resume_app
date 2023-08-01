import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/view/pages/home.dart';
import 'package:task_management/view/pages/splash.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  //value from 0 to 1
  late AnimationController _animationController;
  late Animation<Offset> _slidAnimation;
  @override
  void initState() {
    super.initState();
    animateFunction();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          return SplashView();
        },
      ));
      Get.to(() => SplashPage());
    });
  }

  void animateFunction() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _slidAnimation = Tween(begin: const Offset(0, 4), end: Offset.zero)
        .animate(_animationController);
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/pik.png',
            width: 50,
            height: 30,
          ),
          SizedBox(
            height: 12,
          ),
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) => SlideTransition(
                position: _slidAnimation, child: const Text('Reed Free Books')),
          )
        ],
      )),
    );
  }
}

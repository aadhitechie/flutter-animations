import 'dart:async';

import 'package:flutter/material.dart';

class SplashAnimation extends StatefulWidget {
  const SplashAnimation({super.key});

  @override
  State<SplashAnimation> createState() => _SplashAnimationState();
}

class _SplashAnimationState extends State<SplashAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    animation = Tween<double>(begin: 1, end: 10).animate(controller);
    controller.addListener(() {
      if (controller.isCompleted) {
        Navigator.of(context)
            .push(MyCustomRoute(route: Destination()));




           Timer(const Duration(milliseconds: 500), () {
        controller.reset();
      });
      }
   
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: animation,
          child: GestureDetector(
            onTap: () {
              controller.forward();
            },
            child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Destination extends StatelessWidget {
  const Destination({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Go Back'),
      ),
    );
  }
}
class MyCustomRoute extends  PageRouteBuilder{
  MyCustomRoute({required route}):super(pageBuilder: (context, animation, secondaryAnimation) {
              return Destination();
              
            },
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              final Animation<Offset> tween  = Tween(begin: Offset(0,- 1),end: Offset.zero).animate(CurvedAnimation(parent: animation, curve: Curves.bounceIn));
              return SlideTransition(position: tween,child: child,);
            },
            );
  
}
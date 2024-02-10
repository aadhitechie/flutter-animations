import 'package:flutter/material.dart';

class LoginScreenAnimation extends StatefulWidget {
  const LoginScreenAnimation({super.key, required this.width});
  final double width;

  @override
  State<LoginScreenAnimation> createState() => _LoginScreenAnimationState();
}

class _LoginScreenAnimationState extends State<LoginScreenAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> logoAnimation;
  late Animation<Offset> slideTransition;
  late Animation<double> scaleAnimation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3500));
    logoAnimation = Tween<double>(begin: 0, end: 1).animate(controller);
    slideTransition = Tween(begin: Offset(-1, -1), end: Offset.zero)
        .animate(CurvedAnimation(
      parent: controller,
      curve: Curves.ease,
    ));
    scaleAnimation = Tween<double>(begin: 0,end: 1).animate(CurvedAnimation(parent: controller, curve: Curves.ease,));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: logoAnimation,
              child: const FlutterLogo(
                size: 100.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ScaleTransition(
                scale: scaleAnimation,
                child: SlideTransition(
                  position: slideTransition,
                  
                  child: Column(
                    children: [
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Username',
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

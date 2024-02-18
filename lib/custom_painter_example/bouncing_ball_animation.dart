import 'package:flutter/material.dart';

class BouncingBallAnimation extends StatefulWidget {
  const BouncingBallAnimation({super.key});

  @override
  State<BouncingBallAnimation> createState() => _BouncingBallAnimationState();
}

class _BouncingBallAnimationState extends State<BouncingBallAnimation>  with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this,duration: Duration(seconds: 1));
    animation = Tween<double>(begin: 0,end: 1).animate(controller);
    controller.forward();
    controller.addStatusListener((status) {
      if (controller.isCompleted) {
        controller.reverse();
      }
      else if(controller.isDismissed){
        controller.forward();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AnimatedBuilder(
              animation: animation,
              builder: (context,child)=> CustomPaint(
                size: Size(200, 200),
                painter: BouncingBallPaint(
                  animation.value
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BouncingBallPaint extends CustomPainter {
  final double animationVal;
  BouncingBallPaint(this.animationVal);
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    canvas.drawCircle(
      Offset(size.width / 2, size.height - (size.height * animationVal)),
      20,
      Paint()..color = Colors.blue,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

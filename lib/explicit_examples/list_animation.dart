import 'package:flutter/material.dart';

class ListAnimation extends StatefulWidget {
   ListAnimation({super.key});

  @override
  State<ListAnimation> createState() => _ListAnimationState();
}

class _ListAnimationState extends State<ListAnimation> with SingleTickerProviderStateMixin{
  late AnimationController controller;
late List<Animation<Offset>> animation;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this,duration: Duration(seconds: 5));
    animation = List.generate(5, (index) => 
    Tween(begin: Offset(-1, 0),end: Offset.zero).animate(CurvedAnimation(parent: controller, curve: Interval(index * 0.2, 1) ))
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Animation'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return SlideTransition(
            position: animation[index],
            child: ListTile(
              title: Text('Hello World, Rivaan. ${index.toString()}'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (controller.isCompleted) {
            controller.reverse();
          }else{
controller.forward();
          }
          
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}

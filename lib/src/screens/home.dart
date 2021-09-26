import 'package:animation_app/src/widgets/cat.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late Animation<double> catAnimation;
  late AnimationController catAnimationController;

  @override
  void initState() {
    super.initState();
    catAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    catAnimation = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: catAnimationController, curve: Curves.easeIn),
    );

    catAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation'),
      ),
      body: buildAniation(),
    );
  }

  Widget buildAniation() {
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (context, child) {
        return Container(
          child: child,
          margin: EdgeInsets.only(top: catAnimation.value.toDouble()),
        );
      },
      child: const Cat(),
    );
  }
}

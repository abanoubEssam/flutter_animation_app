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
  }

  onTap() {
    if (catAnimationController.status == AnimationStatus.completed) {
      catAnimationController.reverse(from: 100.0);
    } else if (catAnimationController.status == AnimationStatus.dismissed) {
      catAnimationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Animation'),
        ),
        body: GestureDetector(
          child: Center(
            child: Stack(
              children: <Widget>[
                buildCatAnimation(),
                buildBox(),
              ],
            ),
          ),
          onTap: onTap,
        ));
  }

  Widget buildCatAnimation() {
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

  Widget buildBox() {
    return Container(
      height: 200,
      width: 200,
      color: Colors.brown,
    );
  }
}

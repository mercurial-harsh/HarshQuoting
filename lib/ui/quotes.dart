import 'package:flutter/material.dart';

import 'package:glassmorphism/glassmorphism.dart';

class Quotes extends StatefulWidget {
  @override
  _QuotesState createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  int _index = 0;

  List items = [
    "harsh is good ",
    "harsh is bad",
    "harsh is cute",
    "harsh is nice"
  ];

  @override
  void initState() {
    // TODO: implement initState
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));
    animationController.repeat(reverse: true);
    animation = Tween(begin: 0.0, end: 1.0).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('Harsh Quoting'),
        centerTitle: true,
        elevation: 0.6,
        backgroundColor: Colors.black.withOpacity(0.2),
      ),
      body: Center(
        child: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
                    gradient: RadialGradient(
                        center: Alignment(animation.value, animation.value),
                        focal: Alignment(0.3, -animation.value + 0.6),
                        focalRadius: 1.5,
                        colors: [
                  Colors.purple,
                  Colors.deepPurple,
                  Colors.purple
                ]))),
            Center(
              child: SingleChildScrollView(
                child: Column(children: <Widget>[
                  GlassmorphicContainer(
                    height: 300,
                    width: 300,
                    borderRadius: 20,
                    blur: 15,
                    alignment: Alignment.center,
                    border: 2,
                    linearGradient: LinearGradient(colors: [
                      Colors.white.withOpacity(0.2),
                      Colors.white38.withOpacity(0.2)
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                    borderGradient: LinearGradient(colors: [
                      Colors.white24.withOpacity(0.2),
                      Colors.white70.withOpacity(0.2)
                    ]),
                    child: Center(
                      child: Text(items[_index],
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20)),
                    ),
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        focusColor: Colors.blue,
        hoverColor: Colors.amber,
        onPressed: _getItems,
        child: Icon(Icons.chevron_right_rounded),
      ),
    );
  }

  void _getItems() {
    if (_index < items.length - 1)
      _index += 1;
    else
      _index = 0;
  }
}

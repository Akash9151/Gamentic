import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class PreLoadingAnimation extends StatefulWidget {
  @override
  _PreLoadingAnimationState createState() => _PreLoadingAnimationState();
}

class _PreLoadingAnimationState extends State<PreLoadingAnimation> with SingleTickerProviderStateMixin {

  Animation<double> _angleAnimation;
  bool _loadingprogress;
 
  Animation<double> _scaleAnimation;
 
  AnimationController _controller;

  @override
  void initState(){
    super.initState();
    _controller = new AnimationController(
      duration: Duration(microseconds: 2000), vsync: this
    );

    _angleAnimation = new Tween(begin: 0.0, end: 360.0).animate(_controller)..addListener(
      (){
        setState(() {
          
        });
      }
    );

    _scaleAnimation = new Tween(begin: 1.0, end: 6.0).animate(_controller)..addListener(
      (){
        setState(() {
          
        });
      }
    );

    _angleAnimation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        if(_loadingprogress){
          _controller.reverse();
        }
      }else if(status == AnimationStatus.dismissed){
        if(_loadingprogress){
          _controller.forward();
        }
      }
    });

    _controller.forward();


  }

  @override
  Widget build(BuildContext context) {
    return _buildAnimation();
  }

    Widget _buildAnimation() {
    double circleWidth = 10.0 * _scaleAnimation.value;
    Widget circles = new Container(
      width: circleWidth * 2.0,
      height: circleWidth * 2.0,
      child: new Column(
        children: <Widget>[
          new Row (
              children: <Widget>[
                _buildCircle(circleWidth,Colors.blue),
                _buildCircle(circleWidth,Colors.red),
              ],
          ),
          new Row (
            children: <Widget>[
              _buildCircle(circleWidth,Colors.yellow),
              _buildCircle(circleWidth,Colors.green),
            ],
          ),
        ],
      ),
    );
 
    double angleInDegrees = _angleAnimation.value;
    return new Transform.rotate(
      angle: angleInDegrees / 360 * 2 * math.pi,
      child: new Container(
        child: circles,
      ),
    );
  }
 
  Widget _buildCircle(double circleWidth, Color color) {
    return new Container(
      width: circleWidth,
      height: circleWidth,
      decoration: new BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
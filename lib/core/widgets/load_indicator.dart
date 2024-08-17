import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoadIndicator extends StatelessWidget {
  const LoadIndicator({super.key, this.height = 70, this.width = 70});
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: const LoadingIndicator(
        indicatorType: Indicator.lineSpinFadeLoader,
        colors: [
          Colors.red,
          Colors.blue,
          Colors.green,
          Colors.orange,
          Colors.deepPurple,
          Colors.yellow,
          Colors.teal,
          Colors.blueGrey,
        ],
      ),
    );
  }
}

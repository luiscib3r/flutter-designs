import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgresPage extends StatefulWidget {
  const CircularProgresPage({Key? key}) : super(key: key);

  @override
  State<CircularProgresPage> createState() => _CircularProgresPageState();
}

class _CircularProgresPageState extends State<CircularProgresPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  double percent = 0.0;
  double newPercent = 0.10;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    controller.addListener(
      () {
        percent = lerpDouble(percent, newPercent, controller.value)!;
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: CustomPaint(
            painter: _RadialProgressPainter(
              percent: percent,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: const Icon(Icons.refresh),
        onPressed: () {
          newPercent += 0.1;

          if (newPercent > 1) {
            newPercent = 0;
          }

          controller.forward(from: 0.0);

          setState(() {});
        },
      ),
    );
  }
}

class _RadialProgressPainter extends CustomPainter {
  final double percent;

  _RadialProgressPainter({
    required this.percent,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Circle
    final paint = Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width * 0.5, size.height * 0.5);
    final radius = math.min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paint);

    final paintArc = Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;

    final arcAngle = 2 * math.pi * percent;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      arcAngle,
      false,
      paintArc,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

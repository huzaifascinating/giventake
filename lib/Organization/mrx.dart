import 'package:flutter/material.dart';
import 'dart:math';

class MRxPieData {
  final String title; // The name of the pie slice
  final int value; // The value of the slice
  final Color color; // The color of the slice
  final String
      label; // The label, such as percentage, to be displayed inside the slice

  MRxPieData({
    required this.title,
    required this.value,
    required this.color,
    required this.label, // Added the label to be used for the pie slice
  });
}

class MRxLegendPosition {
  final double offsetX;
  final double offsetY;
  final LegendPosition position;

  const MRxLegendPosition({
    required this.position,
    this.offsetX = 0.0,
    this.offsetY = 0.0,
  });
}

class MRxPieChart extends StatelessWidget {
  final List<MRxPieData> data;
  final bool showLegend;
  final TextStyle legendTextStyle;
  final MRxLegendPosition legendPosition;

  const MRxPieChart({
    Key? key,
    required this.data,
    required this.showLegend,
    required this.legendPosition,
    required this.legendTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Total value for pie chart slices
    final totalValue = data.fold(0, (sum, item) => sum + item.value);

    return Column(
      children: [
        // Pie chart rendering logic
        CustomPaint(
          size: Size(250, 250), // Adjusted size of the pie chart
          painter: PieChartPainter(data: data, totalValue: totalValue),
        ),
        const SizedBox(height: 16),
        // Optional legend display
        if (showLegend)
          Padding(
            padding: EdgeInsets.only(
              left: legendPosition.offsetX,
              top: legendPosition.offsetY,
            ),
            child: Row(
              mainAxisAlignment:
                  legendPosition.position == LegendPosition.bottom
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.start,
              children: data.map((pieData) {
                return Row(
                  children: [
                    Icon(Icons.circle, color: pieData.color),
                    const SizedBox(width: 4),
                    Text(
                      pieData.title, // Display title from MRxPieData
                      style: legendTextStyle,
                    ),
                    const SizedBox(width: 8),
                  ],
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}

class PieChartPainter extends CustomPainter {
  final List<MRxPieData> data;
  final int totalValue;

  PieChartPainter({required this.data, required this.totalValue});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    double startAngle = -pi / 2; // Start at the top of the circle

    for (var pieData in data) {
      final sweepAngle = (pieData.value / totalValue) * 2 * pi;
      paint.color = pieData.color;

      // Draw each slice
      canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2),
            radius: size.width / 2),
        startAngle,
        sweepAngle,
        true,
        paint,
      );

      // Draw the custom label inside the pie slice
      _drawCustomLabel(canvas, pieData, startAngle, sweepAngle, size);

      // Update the start angle for the next slice
      startAngle += sweepAngle;
    }
  }

  void _drawCustomLabel(Canvas canvas, MRxPieData pieData, double startAngle,
      double sweepAngle, Size size) {
    final label = pieData.label; // This is the percentage or custom label

    // Calculate the angle where the text should be placed (center of the slice)
    double labelAngle = startAngle + sweepAngle / 2;

    // Position for the label inside the pie slice
    final radius =
        size.width / 3; // Slightly smaller radius for better placement
    final x = size.width / 2 + radius * cos(labelAngle);
    final y = size.height / 2 + radius * sin(labelAngle);

    // TextPainter for rendering the label
    final textPainter = TextPainter(
      text: TextSpan(
        text: label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    // Center the text on the calculated position
    textPainter.paint(
        canvas, Offset(x - textPainter.width / 2, y - textPainter.height / 2));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

enum LegendPosition { top, bottom }

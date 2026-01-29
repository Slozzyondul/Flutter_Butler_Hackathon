import 'package:flutter/material.dart';

class TankVisualizer extends StatelessWidget {
  final double fillPercent;
  final bool isWarning;
  final bool hasError;

  const TankVisualizer({
    super.key,
    required this.fillPercent,
    required this.isWarning,
    required this.hasError,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final totalHeight = constraints.maxHeight;

        return Container(
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // The "liquid"
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOutSine,
                height: totalHeight * fillPercent,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: hasError
                        ? [Colors.grey, Colors.blueGrey]
                        : isWarning
                        ? [Colors.redAccent, Colors.red.shade900]
                        : [Colors.cyanAccent, Colors.blue.shade900],
                  ),
                ),
              ),
              // Reflection highlight
              Positioned(
                top: 20,
                left: 20,
                right: 20,
                bottom: 20,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withValues(alpha: 0.1),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              // Percentage overlay
              Positioned(
                top: totalHeight > 200 ? 40 : 20,
                child: Text(
                  '${(fillPercent * 100).toInt()}%',
                  style: TextStyle(
                    fontSize: totalHeight > 300 ? 48 : 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: const [
                      Shadow(blurRadius: 10, color: Colors.black45),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

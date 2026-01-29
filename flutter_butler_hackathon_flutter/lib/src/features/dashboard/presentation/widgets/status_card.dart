import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  final bool isFull;
  final bool hasError;

  const StatusCard({
    super.key,
    required this.isFull,
    required this.hasError,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor = Colors.greenAccent;
    String statusText = 'SYSTEM OK';
    IconData statusIcon = Icons.check_circle_outline;

    if (hasError) {
      statusColor = Colors.orangeAccent;
      statusText = 'SENSOR ERROR';
      statusIcon = Icons.warning_amber_rounded;
    } else if (isFull) {
      statusColor = Colors.redAccent;
      statusText = 'TANK FULL';
      statusIcon = Icons.error_outline;
    }

    return Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: statusColor.withValues(alpha: 0.3)),
        ),
        child: Row(
          children: [
            Icon(statusIcon, color: statusColor, size: 32),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                statusText,
                style: TextStyle(
                  color: statusColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

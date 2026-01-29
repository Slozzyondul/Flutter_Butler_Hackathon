import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_butler_hackathon_client/flutter_butler_hackathon_client.dart';
import 'package:flutter_butler_hackathon_flutter/src/services/serverpod_client.dart';
import 'package:flutter_butler_hackathon_flutter/src/features/settings/presentation/pages/settings_page.dart';
import '../widgets/info_card.dart';
import '../widgets/status_card.dart';
import '../widgets/tank_visualizer.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  TankReading? _latestReading;
  TankConfiguration? _config;
  bool _isLoading = true;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _fetchData();
    _timer = Timer.periodic(const Duration(seconds: 5), (_) => _fetchData());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<void> _fetchData() async {
    try {
      final reading = await client.tank.getLatestReading();
      final config = await client.tank.getConfiguration();
      if (mounted) {
        setState(() {
          _latestReading = reading;
          _config = config;
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint('Error fetching data: $e');
    }
  }

  Future<void> _simulateReading() async {
    final curReading = _latestReading?.reading ?? 0;
    final nextReading = (curReading + 20) % 220;
    final reading = TankReading(
      reading: nextReading,
      timestamp: DateTime.now(),
      sensorError: nextReading > 210,
    );
    try {
      await client.tank.addReading(reading);
      _fetchData();
    } catch (e) {
      debugPrint('Error simulation: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final readingValue = _latestReading?.reading ?? 0;
    final maxHeight = _config?.maxHeight ?? 200.0;
    final threshold = _config?.alarmThreshold ?? 180.0;
    final fillPercent = (readingValue / maxHeight).clamp(0.0, 1.0);
    final isFull = readingValue >= threshold;
    final hasError = _latestReading?.sensorError ?? false;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.surface,
              Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
            ],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 800;

              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    const SizedBox(height: 32),
                    Expanded(
                      child: isWide
                          ? Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: TankVisualizer(
                                    fillPercent: fillPercent,
                                    isWarning: isFull,
                                    hasError: hasError,
                                  ),
                                ),
                                const SizedBox(width: 32),
                                Expanded(
                                  flex: 3,
                                  child: Center(
                                    child: SingleChildScrollView(
                                      child: _buildRightPanel(
                                        isFull,
                                        hasError,
                                        readingValue,
                                        threshold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 400,
                                    width: double.infinity,
                                    child: TankVisualizer(
                                      fillPercent: fillPercent,
                                      isWarning: isFull,
                                      hasError: hasError,
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  _buildRightPanel(
                                    isFull,
                                    hasError,
                                    readingValue,
                                    threshold,
                                  ),
                                ],
                              ),
                            ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tank Monitor',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          'Smart Septic System AI',
          style: TextStyle(color: Colors.white.withValues(alpha: 0.6)),
        ),
      ],
    );
  }

  Widget _buildRightPanel(
    bool isFull,
    bool hasError,
    double readingValue,
    double threshold,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        StatusCard(isFull: isFull, hasError: hasError),
        const SizedBox(height: 16),
        InfoCard(
          label: 'Current Level',
          value: '${readingValue.toStringAsFixed(1)} cm',
        ),
        const SizedBox(height: 16),
        InfoCard(
          label: 'Threshold',
          value: '${threshold.toStringAsFixed(1)} cm',
        ),
        const SizedBox(height: 32),
        _buildActionButtons(),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              ).then((_) => _fetchData());
            },
            icon: const Icon(Icons.settings),
            label: const Text('Settings'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ),
        const SizedBox(width: 16),
        IconButton.filledTonal(
          onPressed: _simulateReading,
          icon: const Icon(Icons.refresh),
          tooltip: 'Simulate Reading',
          padding: const EdgeInsets.all(16),
        ),
      ],
    );
  }
}

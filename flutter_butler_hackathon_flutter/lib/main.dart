import 'package:flutter_butler_hackathon_client/flutter_butler_hackathon_client.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import 'dart:async';

late final Client client;

Future<String> getServerUrl() async {
  // Try to load from assets if present, otherwise default to local
  return 'http://localhost:8080/';
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final serverUrl = await getServerUrl();

  client = Client(serverUrl)
    ..connectivityMonitor = FlutterConnectivityMonitor()
    ..authSessionManager = FlutterAuthSessionManager();

  client.auth.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tank Monitor AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
          primary: Colors.deepPurpleAccent,
          secondary: Colors.cyanAccent,
        ),
        useMaterial3: true,
        cardTheme: CardThemeData(
          color: Colors.white.withValues(alpha: 0.05),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
      home: const DashboardPage(),
    );
  }
}

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
    final nextReading = (curReading + 20) % 220; // Loops around
    final reading = TankReading(
      reading: nextReading,
      timestamp: DateTime.now(),
      sensorError: nextReading > 210, // Simulate sensor error at high values
    );
    await client.tank.addReading(reading);
    _fetchData();
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
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 32),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TankVisualizer(
                          fillPercent: fillPercent,
                          isWarning: isFull,
                          hasError: hasError,
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            _buildStatusCard(isFull, hasError),
                            const SizedBox(height: 16),
                            _buildInfoCard(
                              'Current Level',
                              '${readingValue.toStringAsFixed(1)} cm',
                            ),
                            const SizedBox(height: 16),
                            _buildInfoCard(
                              'Threshold',
                              '${threshold.toStringAsFixed(1)} cm',
                            ),
                            const Spacer(),
                            _buildActionButtons(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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

  Widget _buildStatusCard(bool isFull, bool hasError) {
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
            Text(
              statusText,
              style: TextStyle(
                color: statusColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(String label, String value) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(color: Colors.white.withValues(alpha: 0.6)),
            ),
            Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
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
        ),
      ],
    );
  }
}

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
            height: (MediaQuery.of(context).size.height * 0.5) * fillPercent,
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
            top: 40,
            child: Text(
              '${(fillPercent * 100).toInt()}%',
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [Shadow(blurRadius: 10, color: Colors.black45)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _maxHeightController = TextEditingController();
  final _thresholdController = TextEditingController();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadConfig();
  }

  Future<void> _loadConfig() async {
    final config = await client.tank.getConfiguration();
    setState(() {
      _maxHeightController.text = config.maxHeight.toString();
      _thresholdController.text = config.alarmThreshold.toString();
      _isLoading = false;
    });
  }

  Future<void> _saveConfig() async {
    final config = TankConfiguration(
      maxHeight: double.tryParse(_maxHeightController.text) ?? 200,
      alarmThreshold: double.tryParse(_thresholdController.text) ?? 180,
    );
    await client.tank.updateConfiguration(config);
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  TextField(
                    controller: _maxHeightController,
                    decoration: const InputDecoration(
                      labelText: 'Max Tank Height (cm)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _thresholdController,
                    decoration: const InputDecoration(
                      labelText: 'Alarm Threshold (cm)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _saveConfig,
                      child: const Text('Save Configuration'),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

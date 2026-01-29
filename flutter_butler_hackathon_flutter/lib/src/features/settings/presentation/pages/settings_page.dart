import 'package:flutter/material.dart';
import 'package:flutter_butler_hackathon_client/flutter_butler_hackathon_client.dart';
import 'package:flutter_butler_hackathon_flutter/src/services/serverpod_client.dart';

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

  @override
  void dispose() {
    _maxHeightController.dispose();
    _thresholdController.dispose();
    super.dispose();
  }

  Future<void> _loadConfig() async {
    try {
      final config = await client.tank.getConfiguration();
      if (mounted) {
        setState(() {
          _maxHeightController.text = config.maxHeight.toString();
          _thresholdController.text = config.alarmThreshold.toString();
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint('Error loading config: $e');
    }
  }

  Future<void> _saveConfig() async {
    final config = TankConfiguration(
      maxHeight: double.tryParse(_maxHeightController.text) ?? 200,
      alarmThreshold: double.tryParse(_thresholdController.text) ?? 180,
    );
    try {
      await client.tank.updateConfiguration(config);
      if (mounted) Navigator.pop(context);
    } catch (e) {
      debugPrint('Error saving config: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to save settings')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Column(
                    children: [
                      TextField(
                        controller: _maxHeightController,
                        decoration: const InputDecoration(
                          labelText: 'Max Tank Height (cm)',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.height),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _thresholdController,
                        decoration: const InputDecoration(
                          labelText: 'Alarm Threshold (cm)',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.warning_amber_rounded),
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
              ),
            ),
    );
  }
}

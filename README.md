# Tank Monitor AI - Hackathon Project

Combining the power of Flutter’s front end with Serverpod’s Dart-based backend to craft a Flutter Butler that serves, automates, and delights.

## Features
- **Real-time Monitoring**: Visual tank level indicator with animated transitions.
- **Smart Alerts**: Automatic detection of "Tank Full" and "Sensor Error" states based on the provided flowchart.
- **Configurable Thresholds**: Set your own Max Height and Alarm levels.
- **Simulated Readings**: Quick-refresh button for demoing different states.

## Getting Started

### 1. Start the Serverpod Backend
```bash
cd flutter_butler_hackathon_server
docker-compose up -d
dart bin/main.dart --apply-migrations
```

### 2. Run the Flutter App
```bash
cd flutter_butler_hackathon_flutter
flutter run
```

## Flowchart Implementation
This app strictly follows the logic defined in `update_flowchart.jpeg`:
- Data storage and threshold logic on Serverpod.
- Conditional alerts for "Tank Full" and "Maintenance required" states.
- Error logging for sensor malfunctions.

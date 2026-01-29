# 🛢️ Tank Monitor AI
### *The Smart Septic Assistant for the Flutter Butler Hackathon*

Combining the power of **Flutter’s** vibrant front-end with **Serverpod’s** high-performance Dart-based backend to craft an automated monitor that serves, alerts, and simplifies maintenance.

---

## 🚀 Key Features

- **💎 Glassmorphic Dashboard**: A modern, premium UI featuring semi-transparent cards, smooth gradients, and a sleek dark mode theme.
- **🌊 Live Tank Visualizer**: An interactive, animated liquid visualizer that provides an at-a-glance status of the tank level.
- **🤖 Intelligent Alerting System**: 
  - **Tank Full**: Immediate visual and server-side log alerts when the threshold is reached.
  - **Sensor Error**: Automatic detection and reporting of sensor malfunctions (mapped to values exceeding physical limits).
- **⚙️ Dynamic Configuration**: Fully adjustable settings for `Max Tank Height` and `Alarm Threshold` stored securely on the Serverpod backend.
- **🩺 Diagnostic Simulator**: Built-in "Simulate Reading" action to demonstrate various states (Normal, Warning, Error) instantly.

---

## 🛠️ Technology Stack

- **Frontend**: Flutter (Material 3, Glassmorphism, Animations)
- **Backend**: [Serverpod](https://serverpod.dev/) (The ultra-fast Dart backend for Flutter)
- **Database**: PostgreSQL with `pgvector` Support
- **Infrastructure**: Docker & Docker Compose
- **Orchestration**: Dart-native migrations and task management

---

## 🚦 Getting Started

### 1. Prerequisites
- Flutter SDK (latest stable)
- Dart SDK
- Docker Desktop / Docker Engine

### 2. Setup the Serverpod Backend
Navigate to the server directory and spin up the services:
```bash
cd flutter_butler_hackathon_server
docker-compose up -d
```

Ensure your `config/passwords.yaml` is configured with the correct credentials, then apply migrations:
```bash
# Apply database schema
dart bin/main.dart --apply-migrations

# Start the server
dart bin/main.dart

# or 
./start_server.sh
```

### 3. Launch the Flutter Client
Open a new terminal and run:
```bash
cd flutter_butler_hackathon_flutter
flutter run
```

---

## 📋 Logic & Flowchart Implementation
This application is the digital realization of the `update_flowchart.jpeg` logic:
1. **Fetch Data**: The app polls the Serverpod backend every 5 seconds.
2. **Evaluate State**: 
   - `Reading >= Threshold` ➡️ **TANK FULL** alert.
   - `Sensor Error == true` ➡️ **MAINTENANCE REQUIRED** alert.
3. **Log Actions**: Every critical event is logged on the server for audit trails.

---

## 🤝 Project Members
- **Solomon Ondula** (Lead Developer)

*Developed for the 2026 Flutter Butler Hackathon.*

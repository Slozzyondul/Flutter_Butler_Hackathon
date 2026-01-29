import 'package:flutter_butler_hackathon_client/flutter_butler_hackathon_client.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

late final Client client;

Future<void> initializeServerpodClient() async {
  final serverUrl = await getServerUrl();

  client = Client(serverUrl)
    ..connectivityMonitor = FlutterConnectivityMonitor()
    ..authSessionManager = FlutterAuthSessionManager();

  client.auth.initialize();
}

Future<String> getServerUrl() async {
  // Try to load from assets if present, otherwise default to local
  return 'http://localhost:8080/';
}

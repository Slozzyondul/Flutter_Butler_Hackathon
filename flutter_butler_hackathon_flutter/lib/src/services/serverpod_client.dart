import 'package:flutter/foundation.dart';
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
  if (kIsWeb) {
    // If hosted on GitHub Pages or similar, we should use a public URL.
    // Replace with your actual production URL when deployed.
    const productionUrl = 'https://butler.api.serverpod.space/';

    // For local development on web
    if (Uri.base.host == 'localhost' || Uri.base.host == '127.0.0.1') {
      return 'http://localhost:8080/';
    }

    return productionUrl;
  }

  // For Mobile/Desktop, localhost works if the server is running on the same machine
  // or use the server's LAN IP.
  return 'http://localhost:8080/';
}

import 'package:flutter_butler_hackathon_client/flutter_butler_hackathon_client.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';

// Sets up a global client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code
// and is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
late final Client client;

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
      title: 'Digital Assistant',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const AssistantPage(),
    );
  }
}

class AssistantPage extends StatefulWidget {
  const AssistantPage({super.key});

  @override
  State<AssistantPage> createState() => _AssistantPageState();
}

class _AssistantPageState extends State<AssistantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Digital Assistant'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.assistant,
              size: 120,
              color: Colors.deepPurpleAccent,
            ),
            const SizedBox(height: 32),
            Text(
              'Assistant Ready',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Start building your automation tool here.',
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 48),
            ElevatedButton.icon(
              onPressed: () {
                // Future implementation
              },
              icon: const Icon(Icons.flash_on),
              label: const Text('Quick Action'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

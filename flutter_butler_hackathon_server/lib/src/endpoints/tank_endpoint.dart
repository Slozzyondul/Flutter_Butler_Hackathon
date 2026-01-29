import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class TankEndpoint extends Endpoint {
  Future<void> addReading(Session session, TankReading reading) async {
    await TankReading.db.insertRow(session, reading);

    // Check if reading exceeds threshold
    var config = await getConfiguration(session);
    if (reading.reading >= config.alarmThreshold) {
      session.log('ALARM: Tank is full! Reading: ${reading.reading}');
    }

    if (reading.sensorError) {
      session.log('ERROR: Sensor error reported!');
    }
  }

  Future<TankReading?> getLatestReading(Session session) async {
    return await TankReading.db.findFirstRow(
      session,
      orderBy: (t) => t.timestamp,
      orderDescending: true,
    );
  }

  Future<TankConfiguration> getConfiguration(Session session) async {
    var config = await TankConfiguration.db.findFirstRow(session);
    if (config == null) {
      // Default config
      config = TankConfiguration(maxHeight: 200, alarmThreshold: 180);
      await TankConfiguration.db.insertRow(session, config);
    }
    return config;
  }

  Future<void> updateConfiguration(
    Session session,
    TankConfiguration config,
  ) async {
    var existing = await TankConfiguration.db.findFirstRow(session);
    if (existing != null) {
      config.id = existing.id;
      await TankConfiguration.db.updateRow(session, config);
    } else {
      await TankConfiguration.db.insertRow(session, config);
    }
  }
}

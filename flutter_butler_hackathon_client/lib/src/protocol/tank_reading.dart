/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class TankReading implements _i1.SerializableModel {
  TankReading._({
    this.id,
    required this.reading,
    required this.timestamp,
    required this.sensorError,
  });

  factory TankReading({
    int? id,
    required double reading,
    required DateTime timestamp,
    required bool sensorError,
  }) = _TankReadingImpl;

  factory TankReading.fromJson(Map<String, dynamic> jsonSerialization) {
    return TankReading(
      id: jsonSerialization['id'] as int?,
      reading: (jsonSerialization['reading'] as num).toDouble(),
      timestamp: _i1.DateTimeJsonExtension.fromJson(
        jsonSerialization['timestamp'],
      ),
      sensorError: jsonSerialization['sensorError'] as bool,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  double reading;

  DateTime timestamp;

  bool sensorError;

  /// Returns a shallow copy of this [TankReading]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TankReading copyWith({
    int? id,
    double? reading,
    DateTime? timestamp,
    bool? sensorError,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TankReading',
      if (id != null) 'id': id,
      'reading': reading,
      'timestamp': timestamp.toJson(),
      'sensorError': sensorError,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TankReadingImpl extends TankReading {
  _TankReadingImpl({
    int? id,
    required double reading,
    required DateTime timestamp,
    required bool sensorError,
  }) : super._(
         id: id,
         reading: reading,
         timestamp: timestamp,
         sensorError: sensorError,
       );

  /// Returns a shallow copy of this [TankReading]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TankReading copyWith({
    Object? id = _Undefined,
    double? reading,
    DateTime? timestamp,
    bool? sensorError,
  }) {
    return TankReading(
      id: id is int? ? id : this.id,
      reading: reading ?? this.reading,
      timestamp: timestamp ?? this.timestamp,
      sensorError: sensorError ?? this.sensorError,
    );
  }
}

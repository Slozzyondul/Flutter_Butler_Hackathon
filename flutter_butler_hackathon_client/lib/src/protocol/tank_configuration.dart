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

abstract class TankConfiguration implements _i1.SerializableModel {
  TankConfiguration._({
    this.id,
    required this.maxHeight,
    required this.alarmThreshold,
  });

  factory TankConfiguration({
    int? id,
    required double maxHeight,
    required double alarmThreshold,
  }) = _TankConfigurationImpl;

  factory TankConfiguration.fromJson(Map<String, dynamic> jsonSerialization) {
    return TankConfiguration(
      id: jsonSerialization['id'] as int?,
      maxHeight: (jsonSerialization['maxHeight'] as num).toDouble(),
      alarmThreshold: (jsonSerialization['alarmThreshold'] as num).toDouble(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  double maxHeight;

  double alarmThreshold;

  /// Returns a shallow copy of this [TankConfiguration]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TankConfiguration copyWith({
    int? id,
    double? maxHeight,
    double? alarmThreshold,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'TankConfiguration',
      if (id != null) 'id': id,
      'maxHeight': maxHeight,
      'alarmThreshold': alarmThreshold,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TankConfigurationImpl extends TankConfiguration {
  _TankConfigurationImpl({
    int? id,
    required double maxHeight,
    required double alarmThreshold,
  }) : super._(
         id: id,
         maxHeight: maxHeight,
         alarmThreshold: alarmThreshold,
       );

  /// Returns a shallow copy of this [TankConfiguration]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TankConfiguration copyWith({
    Object? id = _Undefined,
    double? maxHeight,
    double? alarmThreshold,
  }) {
    return TankConfiguration(
      id: id is int? ? id : this.id,
      maxHeight: maxHeight ?? this.maxHeight,
      alarmThreshold: alarmThreshold ?? this.alarmThreshold,
    );
  }
}

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
import 'package:serverpod/serverpod.dart' as _i1;

abstract class TankReading
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = TankReadingTable();

  static const db = TankReadingRepository._();

  @override
  int? id;

  double reading;

  DateTime timestamp;

  bool sensorError;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TankReading',
      if (id != null) 'id': id,
      'reading': reading,
      'timestamp': timestamp.toJson(),
      'sensorError': sensorError,
    };
  }

  static TankReadingInclude include() {
    return TankReadingInclude._();
  }

  static TankReadingIncludeList includeList({
    _i1.WhereExpressionBuilder<TankReadingTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TankReadingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TankReadingTable>? orderByList,
    TankReadingInclude? include,
  }) {
    return TankReadingIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TankReading.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(TankReading.t),
      include: include,
    );
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

class TankReadingUpdateTable extends _i1.UpdateTable<TankReadingTable> {
  TankReadingUpdateTable(super.table);

  _i1.ColumnValue<double, double> reading(double value) => _i1.ColumnValue(
    table.reading,
    value,
  );

  _i1.ColumnValue<DateTime, DateTime> timestamp(DateTime value) =>
      _i1.ColumnValue(
        table.timestamp,
        value,
      );

  _i1.ColumnValue<bool, bool> sensorError(bool value) => _i1.ColumnValue(
    table.sensorError,
    value,
  );
}

class TankReadingTable extends _i1.Table<int?> {
  TankReadingTable({super.tableRelation}) : super(tableName: 'tank_reading') {
    updateTable = TankReadingUpdateTable(this);
    reading = _i1.ColumnDouble(
      'reading',
      this,
    );
    timestamp = _i1.ColumnDateTime(
      'timestamp',
      this,
    );
    sensorError = _i1.ColumnBool(
      'sensorError',
      this,
    );
  }

  late final TankReadingUpdateTable updateTable;

  late final _i1.ColumnDouble reading;

  late final _i1.ColumnDateTime timestamp;

  late final _i1.ColumnBool sensorError;

  @override
  List<_i1.Column> get columns => [
    id,
    reading,
    timestamp,
    sensorError,
  ];
}

class TankReadingInclude extends _i1.IncludeObject {
  TankReadingInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => TankReading.t;
}

class TankReadingIncludeList extends _i1.IncludeList {
  TankReadingIncludeList._({
    _i1.WhereExpressionBuilder<TankReadingTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(TankReading.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => TankReading.t;
}

class TankReadingRepository {
  const TankReadingRepository._();

  /// Returns a list of [TankReading]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<TankReading>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TankReadingTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TankReadingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TankReadingTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<TankReading>(
      where: where?.call(TankReading.t),
      orderBy: orderBy?.call(TankReading.t),
      orderByList: orderByList?.call(TankReading.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [TankReading] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<TankReading?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TankReadingTable>? where,
    int? offset,
    _i1.OrderByBuilder<TankReadingTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TankReadingTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<TankReading>(
      where: where?.call(TankReading.t),
      orderBy: orderBy?.call(TankReading.t),
      orderByList: orderByList?.call(TankReading.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [TankReading] by its [id] or null if no such row exists.
  Future<TankReading?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<TankReading>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [TankReading]s in the list and returns the inserted rows.
  ///
  /// The returned [TankReading]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<TankReading>> insert(
    _i1.Session session,
    List<TankReading> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<TankReading>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [TankReading] and returns the inserted row.
  ///
  /// The returned [TankReading] will have its `id` field set.
  Future<TankReading> insertRow(
    _i1.Session session,
    TankReading row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<TankReading>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [TankReading]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<TankReading>> update(
    _i1.Session session,
    List<TankReading> rows, {
    _i1.ColumnSelections<TankReadingTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<TankReading>(
      rows,
      columns: columns?.call(TankReading.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TankReading]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<TankReading> updateRow(
    _i1.Session session,
    TankReading row, {
    _i1.ColumnSelections<TankReadingTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<TankReading>(
      row,
      columns: columns?.call(TankReading.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TankReading] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<TankReading?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<TankReadingUpdateTable> columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<TankReading>(
      id,
      columnValues: columnValues(TankReading.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [TankReading]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<TankReading>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<TankReadingUpdateTable> columnValues,
    required _i1.WhereExpressionBuilder<TankReadingTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TankReadingTable>? orderBy,
    _i1.OrderByListBuilder<TankReadingTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<TankReading>(
      columnValues: columnValues(TankReading.t.updateTable),
      where: where(TankReading.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TankReading.t),
      orderByList: orderByList?.call(TankReading.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [TankReading]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<TankReading>> delete(
    _i1.Session session,
    List<TankReading> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<TankReading>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [TankReading].
  Future<TankReading> deleteRow(
    _i1.Session session,
    TankReading row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<TankReading>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<TankReading>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TankReadingTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<TankReading>(
      where: where(TankReading.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TankReadingTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<TankReading>(
      where: where?.call(TankReading.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

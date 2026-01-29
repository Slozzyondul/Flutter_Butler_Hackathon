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

abstract class TankConfiguration
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = TankConfigurationTable();

  static const db = TankConfigurationRepository._();

  @override
  int? id;

  double maxHeight;

  double alarmThreshold;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'TankConfiguration',
      if (id != null) 'id': id,
      'maxHeight': maxHeight,
      'alarmThreshold': alarmThreshold,
    };
  }

  static TankConfigurationInclude include() {
    return TankConfigurationInclude._();
  }

  static TankConfigurationIncludeList includeList({
    _i1.WhereExpressionBuilder<TankConfigurationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TankConfigurationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TankConfigurationTable>? orderByList,
    TankConfigurationInclude? include,
  }) {
    return TankConfigurationIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TankConfiguration.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(TankConfiguration.t),
      include: include,
    );
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

class TankConfigurationUpdateTable
    extends _i1.UpdateTable<TankConfigurationTable> {
  TankConfigurationUpdateTable(super.table);

  _i1.ColumnValue<double, double> maxHeight(double value) => _i1.ColumnValue(
    table.maxHeight,
    value,
  );

  _i1.ColumnValue<double, double> alarmThreshold(double value) =>
      _i1.ColumnValue(
        table.alarmThreshold,
        value,
      );
}

class TankConfigurationTable extends _i1.Table<int?> {
  TankConfigurationTable({super.tableRelation})
    : super(tableName: 'tank_configuration') {
    updateTable = TankConfigurationUpdateTable(this);
    maxHeight = _i1.ColumnDouble(
      'maxHeight',
      this,
    );
    alarmThreshold = _i1.ColumnDouble(
      'alarmThreshold',
      this,
    );
  }

  late final TankConfigurationUpdateTable updateTable;

  late final _i1.ColumnDouble maxHeight;

  late final _i1.ColumnDouble alarmThreshold;

  @override
  List<_i1.Column> get columns => [
    id,
    maxHeight,
    alarmThreshold,
  ];
}

class TankConfigurationInclude extends _i1.IncludeObject {
  TankConfigurationInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => TankConfiguration.t;
}

class TankConfigurationIncludeList extends _i1.IncludeList {
  TankConfigurationIncludeList._({
    _i1.WhereExpressionBuilder<TankConfigurationTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(TankConfiguration.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => TankConfiguration.t;
}

class TankConfigurationRepository {
  const TankConfigurationRepository._();

  /// Returns a list of [TankConfiguration]s matching the given query parameters.
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
  Future<List<TankConfiguration>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TankConfigurationTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TankConfigurationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TankConfigurationTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<TankConfiguration>(
      where: where?.call(TankConfiguration.t),
      orderBy: orderBy?.call(TankConfiguration.t),
      orderByList: orderByList?.call(TankConfiguration.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [TankConfiguration] matching the given query parameters.
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
  Future<TankConfiguration?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TankConfigurationTable>? where,
    int? offset,
    _i1.OrderByBuilder<TankConfigurationTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TankConfigurationTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<TankConfiguration>(
      where: where?.call(TankConfiguration.t),
      orderBy: orderBy?.call(TankConfiguration.t),
      orderByList: orderByList?.call(TankConfiguration.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [TankConfiguration] by its [id] or null if no such row exists.
  Future<TankConfiguration?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<TankConfiguration>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [TankConfiguration]s in the list and returns the inserted rows.
  ///
  /// The returned [TankConfiguration]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<TankConfiguration>> insert(
    _i1.Session session,
    List<TankConfiguration> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<TankConfiguration>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [TankConfiguration] and returns the inserted row.
  ///
  /// The returned [TankConfiguration] will have its `id` field set.
  Future<TankConfiguration> insertRow(
    _i1.Session session,
    TankConfiguration row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<TankConfiguration>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [TankConfiguration]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<TankConfiguration>> update(
    _i1.Session session,
    List<TankConfiguration> rows, {
    _i1.ColumnSelections<TankConfigurationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<TankConfiguration>(
      rows,
      columns: columns?.call(TankConfiguration.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TankConfiguration]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<TankConfiguration> updateRow(
    _i1.Session session,
    TankConfiguration row, {
    _i1.ColumnSelections<TankConfigurationTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<TankConfiguration>(
      row,
      columns: columns?.call(TankConfiguration.t),
      transaction: transaction,
    );
  }

  /// Updates a single [TankConfiguration] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<TankConfiguration?> updateById(
    _i1.Session session,
    int id, {
    required _i1.ColumnValueListBuilder<TankConfigurationUpdateTable>
    columnValues,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateById<TankConfiguration>(
      id,
      columnValues: columnValues(TankConfiguration.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [TankConfiguration]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  Future<List<TankConfiguration>> updateWhere(
    _i1.Session session, {
    required _i1.ColumnValueListBuilder<TankConfigurationUpdateTable>
    columnValues,
    required _i1.WhereExpressionBuilder<TankConfigurationTable> where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TankConfigurationTable>? orderBy,
    _i1.OrderByListBuilder<TankConfigurationTable>? orderByList,
    bool orderDescending = false,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateWhere<TankConfiguration>(
      columnValues: columnValues(TankConfiguration.t.updateTable),
      where: where(TankConfiguration.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TankConfiguration.t),
      orderByList: orderByList?.call(TankConfiguration.t),
      orderDescending: orderDescending,
      transaction: transaction,
    );
  }

  /// Deletes all [TankConfiguration]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<TankConfiguration>> delete(
    _i1.Session session,
    List<TankConfiguration> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<TankConfiguration>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [TankConfiguration].
  Future<TankConfiguration> deleteRow(
    _i1.Session session,
    TankConfiguration row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<TankConfiguration>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<TankConfiguration>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TankConfigurationTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<TankConfiguration>(
      where: where(TankConfiguration.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TankConfigurationTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<TankConfiguration>(
      where: where?.call(TankConfiguration.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complemento.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetcomplementoCollection on Isar {
  IsarCollection<complemento> get complementos => this.collection();
}

const ComplementoSchema = CollectionSchema(
  name: r'complemento',
  id: -2922492838154464899,
  properties: {
    r'id_grupo': PropertySchema(
      id: 0,
      name: r'id_grupo',
      type: IsarType.long,
    ),
    r'item': PropertySchema(
      id: 1,
      name: r'item',
      type: IsarType.long,
    ),
    r'nome_complemento': PropertySchema(
      id: 2,
      name: r'nome_complemento',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 3,
      name: r'status',
      type: IsarType.long,
    ),
    r'valor': PropertySchema(
      id: 4,
      name: r'valor',
      type: IsarType.double,
    )
  },
  estimateSize: _complementoEstimateSize,
  serialize: _complementoSerialize,
  deserialize: _complementoDeserialize,
  deserializeProp: _complementoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _complementoGetId,
  getLinks: _complementoGetLinks,
  attach: _complementoAttach,
  version: '3.1.0+1',
);

int _complementoEstimateSize(
  complemento object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.nome_complemento.length * 3;
  return bytesCount;
}

void _complementoSerialize(
  complemento object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.id_grupo);
  writer.writeLong(offsets[1], object.item);
  writer.writeString(offsets[2], object.nome_complemento);
  writer.writeLong(offsets[3], object.status);
  writer.writeDouble(offsets[4], object.valor);
}

complemento _complementoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = complemento(
    reader.readLong(offsets[0]),
    reader.readLong(offsets[1]),
    reader.readString(offsets[2]),
    reader.readDouble(offsets[4]),
    reader.readLong(offsets[3]),
  );
  object.id = id;
  return object;
}

P _complementoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _complementoGetId(complemento object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _complementoGetLinks(complemento object) {
  return [];
}

void _complementoAttach(
    IsarCollection<dynamic> col, Id id, complemento object) {
  object.id = id;
}

extension complementoQueryWhereSort
    on QueryBuilder<complemento, complemento, QWhere> {
  QueryBuilder<complemento, complemento, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension complementoQueryWhere
    on QueryBuilder<complemento, complemento, QWhereClause> {
  QueryBuilder<complemento, complemento, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<complemento, complemento, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<complemento, complemento, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<complemento, complemento, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<complemento, complemento, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension complementoQueryFilter
    on QueryBuilder<complemento, complemento, QFilterCondition> {
  QueryBuilder<complemento, complemento, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<complemento, complemento, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<complemento, complemento, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<complemento, complemento, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<complemento, complemento, QAfterFilterCondition> id_grupoEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_grupo',
        value: value,
      ));
    });
  }

  QueryBuilder<complemento, complemento, QAfterFilterCondition>
      id_grupoGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_grupo',
        value: value,
      ));
    });
  }

  QueryBuilder<complemento, complemento, QAfterFilterCondition>
      id_grupoLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_grupo',
        value: value,
      ));
    });
  }

  QueryBuilder<complemento, complemento, QAfterFilterCondition> id_grupoBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_grupo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<complemento, complemento, QAfterFilterCondition> itemEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'item',
        value: value,
      ));
    });
  }

  QueryBuilder<complemento, complemento, QAfterFilterCondition> itemGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'item',
        value: value,
      ));
    });
  }

  QueryBuilder<complemento, complemento, QAfterFilterCondition> itemLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'item',
        value: value,
      ));
    });
  }

  QueryBuilder<complemento, complemento, QAfterFilterCondition> itemBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'item',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<complemento, complemento, QAfterFilterCondition>
      nome_complementoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nome_complemento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<complemento, complemento, QAfterFilterCondition>
      nome_complementoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nome_complemento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<complemento, complemento, QAfterFilterCondition>
      nome_complementoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nome_complemento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<complemento, complemento, QAfterFilterCondition>
      nome_complementoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nome_complemento',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<complemento, complemento, QAfterFilterCondition>
      nome_complementoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nome_complemento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<complemento, complemento, QAfterFilterCondition>
      nome_complementoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nome_complemento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<complemento, complemento, QAfterFilterCondition>
      nome_complementoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nome_complemento',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<complemento, complemento, QAfterFilterCondition>
      nome_complementoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nome_complemento',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<complemento, complemento, QAfterFilterCondition>
      nome_complementoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nome_complemento',
        value: '',
      ));
    });
  }

  QueryBuilder<complemento, complemento, QAfterFilterCondition>
      nome_complementoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nome_complemento',
        value: '',
      ));
    });
  }

  QueryBuilder<complemento, complemento, QAfterFilterCondition> statusEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<complemento, complemento, QAfterFilterCondition>
      statusGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<complemento, complemento, QAfterFilterCondition> statusLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<complemento, complemento, QAfterFilterCondition> statusBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<complemento, complemento, QAfterFilterCondition> valorEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'valor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<complemento, complemento, QAfterFilterCondition>
      valorGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'valor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<complemento, complemento, QAfterFilterCondition> valorLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'valor',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<complemento, complemento, QAfterFilterCondition> valorBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'valor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension complementoQueryObject
    on QueryBuilder<complemento, complemento, QFilterCondition> {}

extension complementoQueryLinks
    on QueryBuilder<complemento, complemento, QFilterCondition> {}

extension complementoQuerySortBy
    on QueryBuilder<complemento, complemento, QSortBy> {
  QueryBuilder<complemento, complemento, QAfterSortBy> sortById_grupo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_grupo', Sort.asc);
    });
  }

  QueryBuilder<complemento, complemento, QAfterSortBy> sortById_grupoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_grupo', Sort.desc);
    });
  }

  QueryBuilder<complemento, complemento, QAfterSortBy> sortByItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'item', Sort.asc);
    });
  }

  QueryBuilder<complemento, complemento, QAfterSortBy> sortByItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'item', Sort.desc);
    });
  }

  QueryBuilder<complemento, complemento, QAfterSortBy>
      sortByNome_complemento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome_complemento', Sort.asc);
    });
  }

  QueryBuilder<complemento, complemento, QAfterSortBy>
      sortByNome_complementoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome_complemento', Sort.desc);
    });
  }

  QueryBuilder<complemento, complemento, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<complemento, complemento, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<complemento, complemento, QAfterSortBy> sortByValor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valor', Sort.asc);
    });
  }

  QueryBuilder<complemento, complemento, QAfterSortBy> sortByValorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valor', Sort.desc);
    });
  }
}

extension complementoQuerySortThenBy
    on QueryBuilder<complemento, complemento, QSortThenBy> {
  QueryBuilder<complemento, complemento, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<complemento, complemento, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<complemento, complemento, QAfterSortBy> thenById_grupo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_grupo', Sort.asc);
    });
  }

  QueryBuilder<complemento, complemento, QAfterSortBy> thenById_grupoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_grupo', Sort.desc);
    });
  }

  QueryBuilder<complemento, complemento, QAfterSortBy> thenByItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'item', Sort.asc);
    });
  }

  QueryBuilder<complemento, complemento, QAfterSortBy> thenByItemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'item', Sort.desc);
    });
  }

  QueryBuilder<complemento, complemento, QAfterSortBy>
      thenByNome_complemento() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome_complemento', Sort.asc);
    });
  }

  QueryBuilder<complemento, complemento, QAfterSortBy>
      thenByNome_complementoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nome_complemento', Sort.desc);
    });
  }

  QueryBuilder<complemento, complemento, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<complemento, complemento, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<complemento, complemento, QAfterSortBy> thenByValor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valor', Sort.asc);
    });
  }

  QueryBuilder<complemento, complemento, QAfterSortBy> thenByValorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'valor', Sort.desc);
    });
  }
}

extension complementoQueryWhereDistinct
    on QueryBuilder<complemento, complemento, QDistinct> {
  QueryBuilder<complemento, complemento, QDistinct> distinctById_grupo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_grupo');
    });
  }

  QueryBuilder<complemento, complemento, QDistinct> distinctByItem() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'item');
    });
  }

  QueryBuilder<complemento, complemento, QDistinct> distinctByNome_complemento(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nome_complemento',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<complemento, complemento, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<complemento, complemento, QDistinct> distinctByValor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'valor');
    });
  }
}

extension complementoQueryProperty
    on QueryBuilder<complemento, complemento, QQueryProperty> {
  QueryBuilder<complemento, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<complemento, int, QQueryOperations> id_grupoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_grupo');
    });
  }

  QueryBuilder<complemento, int, QQueryOperations> itemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'item');
    });
  }

  QueryBuilder<complemento, String, QQueryOperations>
      nome_complementoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nome_complemento');
    });
  }

  QueryBuilder<complemento, int, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<complemento, double, QQueryOperations> valorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'valor');
    });
  }
}

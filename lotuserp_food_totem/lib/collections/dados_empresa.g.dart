// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dados_empresa.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension Getdados_empresaCollection on Isar {
  IsarCollection<dados_empresa> get dados_empresas => this.collection();
}

const Dados_empresaSchema = CollectionSchema(
  name: r'dados_empresa',
  id: 4436334116467209932,
  properties: {
    r'cnpj_empresa': PropertySchema(
      id: 0,
      name: r'cnpj_empresa',
      type: IsarType.string,
    ),
    r'id_dispositivo': PropertySchema(
      id: 1,
      name: r'id_dispositivo',
      type: IsarType.long,
    ),
    r'id_empresa': PropertySchema(
      id: 2,
      name: r'id_empresa',
      type: IsarType.long,
    ),
    r'ip_servidor': PropertySchema(
      id: 3,
      name: r'ip_servidor',
      type: IsarType.string,
    )
  },
  estimateSize: _dados_empresaEstimateSize,
  serialize: _dados_empresaSerialize,
  deserialize: _dados_empresaDeserialize,
  deserializeProp: _dados_empresaDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dados_empresaGetId,
  getLinks: _dados_empresaGetLinks,
  attach: _dados_empresaAttach,
  version: '3.1.0+1',
);

int _dados_empresaEstimateSize(
  dados_empresa object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.cnpj_empresa.length * 3;
  bytesCount += 3 + object.ip_servidor.length * 3;
  return bytesCount;
}

void _dados_empresaSerialize(
  dados_empresa object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.cnpj_empresa);
  writer.writeLong(offsets[1], object.id_dispositivo);
  writer.writeLong(offsets[2], object.id_empresa);
  writer.writeString(offsets[3], object.ip_servidor);
}

dados_empresa _dados_empresaDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = dados_empresa(
    cnpj_empresa: reader.readString(offsets[0]),
    id_dispositivo: reader.readLong(offsets[1]),
    id_empresa: reader.readLong(offsets[2]),
    ip_servidor: reader.readString(offsets[3]),
  );
  object.id = id;
  return object;
}

P _dados_empresaDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dados_empresaGetId(dados_empresa object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dados_empresaGetLinks(dados_empresa object) {
  return [];
}

void _dados_empresaAttach(
    IsarCollection<dynamic> col, Id id, dados_empresa object) {
  object.id = id;
}

extension dados_empresaQueryWhereSort
    on QueryBuilder<dados_empresa, dados_empresa, QWhere> {
  QueryBuilder<dados_empresa, dados_empresa, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension dados_empresaQueryWhere
    on QueryBuilder<dados_empresa, dados_empresa, QWhereClause> {
  QueryBuilder<dados_empresa, dados_empresa, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<dados_empresa, dados_empresa, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterWhereClause> idBetween(
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

extension dados_empresaQueryFilter
    on QueryBuilder<dados_empresa, dados_empresa, QFilterCondition> {
  QueryBuilder<dados_empresa, dados_empresa, QAfterFilterCondition>
      cnpj_empresaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cnpj_empresa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterFilterCondition>
      cnpj_empresaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cnpj_empresa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterFilterCondition>
      cnpj_empresaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cnpj_empresa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterFilterCondition>
      cnpj_empresaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cnpj_empresa',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterFilterCondition>
      cnpj_empresaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cnpj_empresa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterFilterCondition>
      cnpj_empresaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cnpj_empresa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterFilterCondition>
      cnpj_empresaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cnpj_empresa',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterFilterCondition>
      cnpj_empresaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cnpj_empresa',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterFilterCondition>
      cnpj_empresaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cnpj_empresa',
        value: '',
      ));
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterFilterCondition>
      cnpj_empresaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cnpj_empresa',
        value: '',
      ));
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<dados_empresa, dados_empresa, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<dados_empresa, dados_empresa, QAfterFilterCondition> idBetween(
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

  QueryBuilder<dados_empresa, dados_empresa, QAfterFilterCondition>
      id_dispositivoEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_dispositivo',
        value: value,
      ));
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterFilterCondition>
      id_dispositivoGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_dispositivo',
        value: value,
      ));
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterFilterCondition>
      id_dispositivoLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_dispositivo',
        value: value,
      ));
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterFilterCondition>
      id_dispositivoBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_dispositivo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterFilterCondition>
      id_empresaEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_empresa',
        value: value,
      ));
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterFilterCondition>
      id_empresaGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_empresa',
        value: value,
      ));
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterFilterCondition>
      id_empresaLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_empresa',
        value: value,
      ));
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterFilterCondition>
      id_empresaBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_empresa',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterFilterCondition>
      ip_servidorEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ip_servidor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterFilterCondition>
      ip_servidorGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ip_servidor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterFilterCondition>
      ip_servidorLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ip_servidor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterFilterCondition>
      ip_servidorBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ip_servidor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterFilterCondition>
      ip_servidorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ip_servidor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterFilterCondition>
      ip_servidorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ip_servidor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterFilterCondition>
      ip_servidorContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ip_servidor',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterFilterCondition>
      ip_servidorMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ip_servidor',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterFilterCondition>
      ip_servidorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ip_servidor',
        value: '',
      ));
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterFilterCondition>
      ip_servidorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ip_servidor',
        value: '',
      ));
    });
  }
}

extension dados_empresaQueryObject
    on QueryBuilder<dados_empresa, dados_empresa, QFilterCondition> {}

extension dados_empresaQueryLinks
    on QueryBuilder<dados_empresa, dados_empresa, QFilterCondition> {}

extension dados_empresaQuerySortBy
    on QueryBuilder<dados_empresa, dados_empresa, QSortBy> {
  QueryBuilder<dados_empresa, dados_empresa, QAfterSortBy>
      sortByCnpj_empresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cnpj_empresa', Sort.asc);
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterSortBy>
      sortByCnpj_empresaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cnpj_empresa', Sort.desc);
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterSortBy>
      sortById_dispositivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_dispositivo', Sort.asc);
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterSortBy>
      sortById_dispositivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_dispositivo', Sort.desc);
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterSortBy> sortById_empresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_empresa', Sort.asc);
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterSortBy>
      sortById_empresaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_empresa', Sort.desc);
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterSortBy> sortByIp_servidor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ip_servidor', Sort.asc);
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterSortBy>
      sortByIp_servidorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ip_servidor', Sort.desc);
    });
  }
}

extension dados_empresaQuerySortThenBy
    on QueryBuilder<dados_empresa, dados_empresa, QSortThenBy> {
  QueryBuilder<dados_empresa, dados_empresa, QAfterSortBy>
      thenByCnpj_empresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cnpj_empresa', Sort.asc);
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterSortBy>
      thenByCnpj_empresaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cnpj_empresa', Sort.desc);
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterSortBy>
      thenById_dispositivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_dispositivo', Sort.asc);
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterSortBy>
      thenById_dispositivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_dispositivo', Sort.desc);
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterSortBy> thenById_empresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_empresa', Sort.asc);
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterSortBy>
      thenById_empresaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_empresa', Sort.desc);
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterSortBy> thenByIp_servidor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ip_servidor', Sort.asc);
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QAfterSortBy>
      thenByIp_servidorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ip_servidor', Sort.desc);
    });
  }
}

extension dados_empresaQueryWhereDistinct
    on QueryBuilder<dados_empresa, dados_empresa, QDistinct> {
  QueryBuilder<dados_empresa, dados_empresa, QDistinct> distinctByCnpj_empresa(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cnpj_empresa', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QDistinct>
      distinctById_dispositivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_dispositivo');
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QDistinct> distinctById_empresa() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_empresa');
    });
  }

  QueryBuilder<dados_empresa, dados_empresa, QDistinct> distinctByIp_servidor(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ip_servidor', caseSensitive: caseSensitive);
    });
  }
}

extension dados_empresaQueryProperty
    on QueryBuilder<dados_empresa, dados_empresa, QQueryProperty> {
  QueryBuilder<dados_empresa, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<dados_empresa, String, QQueryOperations> cnpj_empresaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cnpj_empresa');
    });
  }

  QueryBuilder<dados_empresa, int, QQueryOperations> id_dispositivoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_dispositivo');
    });
  }

  QueryBuilder<dados_empresa, int, QQueryOperations> id_empresaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_empresa');
    });
  }

  QueryBuilder<dados_empresa, String, QQueryOperations> ip_servidorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ip_servidor');
    });
  }
}

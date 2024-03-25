// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grupo.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetgrupoCollection on Isar {
  IsarCollection<grupo> get grupos => this.collection();
}

const GrupoSchema = CollectionSchema(
  name: r'grupo',
  id: -2515839146795051537,
  properties: {
    r'file_imagem': PropertySchema(
      id: 0,
      name: r'file_imagem',
      type: IsarType.string,
    ),
    r'grupo_descricao': PropertySchema(
      id: 1,
      name: r'grupo_descricao',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 2,
      name: r'status',
      type: IsarType.long,
    )
  },
  estimateSize: _grupoEstimateSize,
  serialize: _grupoSerialize,
  deserialize: _grupoDeserialize,
  deserializeProp: _grupoDeserializeProp,
  idName: r'id_grupo',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _grupoGetId,
  getLinks: _grupoGetLinks,
  attach: _grupoAttach,
  version: '3.1.0+1',
);

int _grupoEstimateSize(
  grupo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.file_imagem.length * 3;
  bytesCount += 3 + object.grupo_descricao.length * 3;
  return bytesCount;
}

void _grupoSerialize(
  grupo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.file_imagem);
  writer.writeString(offsets[1], object.grupo_descricao);
  writer.writeLong(offsets[2], object.status);
}

grupo _grupoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = grupo(
    id,
    reader.readString(offsets[1]),
    reader.readLong(offsets[2]),
    reader.readString(offsets[0]),
  );
  return object;
}

P _grupoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _grupoGetId(grupo object) {
  return object.id_grupo;
}

List<IsarLinkBase<dynamic>> _grupoGetLinks(grupo object) {
  return [];
}

void _grupoAttach(IsarCollection<dynamic> col, Id id, grupo object) {
  object.id_grupo = id;
}

extension grupoQueryWhereSort on QueryBuilder<grupo, grupo, QWhere> {
  QueryBuilder<grupo, grupo, QAfterWhere> anyId_grupo() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension grupoQueryWhere on QueryBuilder<grupo, grupo, QWhereClause> {
  QueryBuilder<grupo, grupo, QAfterWhereClause> id_grupoEqualTo(Id id_grupo) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id_grupo,
        upper: id_grupo,
      ));
    });
  }

  QueryBuilder<grupo, grupo, QAfterWhereClause> id_grupoNotEqualTo(
      Id id_grupo) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id_grupo, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id_grupo, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id_grupo, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id_grupo, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<grupo, grupo, QAfterWhereClause> id_grupoGreaterThan(Id id_grupo,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id_grupo, includeLower: include),
      );
    });
  }

  QueryBuilder<grupo, grupo, QAfterWhereClause> id_grupoLessThan(Id id_grupo,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id_grupo, includeUpper: include),
      );
    });
  }

  QueryBuilder<grupo, grupo, QAfterWhereClause> id_grupoBetween(
    Id lowerId_grupo,
    Id upperId_grupo, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId_grupo,
        includeLower: includeLower,
        upper: upperId_grupo,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension grupoQueryFilter on QueryBuilder<grupo, grupo, QFilterCondition> {
  QueryBuilder<grupo, grupo, QAfterFilterCondition> file_imagemEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'file_imagem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<grupo, grupo, QAfterFilterCondition> file_imagemGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'file_imagem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<grupo, grupo, QAfterFilterCondition> file_imagemLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'file_imagem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<grupo, grupo, QAfterFilterCondition> file_imagemBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'file_imagem',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<grupo, grupo, QAfterFilterCondition> file_imagemStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'file_imagem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<grupo, grupo, QAfterFilterCondition> file_imagemEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'file_imagem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<grupo, grupo, QAfterFilterCondition> file_imagemContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'file_imagem',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<grupo, grupo, QAfterFilterCondition> file_imagemMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'file_imagem',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<grupo, grupo, QAfterFilterCondition> file_imagemIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'file_imagem',
        value: '',
      ));
    });
  }

  QueryBuilder<grupo, grupo, QAfterFilterCondition> file_imagemIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'file_imagem',
        value: '',
      ));
    });
  }

  QueryBuilder<grupo, grupo, QAfterFilterCondition> grupo_descricaoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grupo_descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<grupo, grupo, QAfterFilterCondition> grupo_descricaoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'grupo_descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<grupo, grupo, QAfterFilterCondition> grupo_descricaoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'grupo_descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<grupo, grupo, QAfterFilterCondition> grupo_descricaoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'grupo_descricao',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<grupo, grupo, QAfterFilterCondition> grupo_descricaoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'grupo_descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<grupo, grupo, QAfterFilterCondition> grupo_descricaoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'grupo_descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<grupo, grupo, QAfterFilterCondition> grupo_descricaoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'grupo_descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<grupo, grupo, QAfterFilterCondition> grupo_descricaoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'grupo_descricao',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<grupo, grupo, QAfterFilterCondition> grupo_descricaoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grupo_descricao',
        value: '',
      ));
    });
  }

  QueryBuilder<grupo, grupo, QAfterFilterCondition>
      grupo_descricaoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'grupo_descricao',
        value: '',
      ));
    });
  }

  QueryBuilder<grupo, grupo, QAfterFilterCondition> id_grupoEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_grupo',
        value: value,
      ));
    });
  }

  QueryBuilder<grupo, grupo, QAfterFilterCondition> id_grupoGreaterThan(
    Id value, {
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

  QueryBuilder<grupo, grupo, QAfterFilterCondition> id_grupoLessThan(
    Id value, {
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

  QueryBuilder<grupo, grupo, QAfterFilterCondition> id_grupoBetween(
    Id lower,
    Id upper, {
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

  QueryBuilder<grupo, grupo, QAfterFilterCondition> statusEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<grupo, grupo, QAfterFilterCondition> statusGreaterThan(
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

  QueryBuilder<grupo, grupo, QAfterFilterCondition> statusLessThan(
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

  QueryBuilder<grupo, grupo, QAfterFilterCondition> statusBetween(
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
}

extension grupoQueryObject on QueryBuilder<grupo, grupo, QFilterCondition> {}

extension grupoQueryLinks on QueryBuilder<grupo, grupo, QFilterCondition> {}

extension grupoQuerySortBy on QueryBuilder<grupo, grupo, QSortBy> {
  QueryBuilder<grupo, grupo, QAfterSortBy> sortByFile_imagem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'file_imagem', Sort.asc);
    });
  }

  QueryBuilder<grupo, grupo, QAfterSortBy> sortByFile_imagemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'file_imagem', Sort.desc);
    });
  }

  QueryBuilder<grupo, grupo, QAfterSortBy> sortByGrupo_descricao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grupo_descricao', Sort.asc);
    });
  }

  QueryBuilder<grupo, grupo, QAfterSortBy> sortByGrupo_descricaoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grupo_descricao', Sort.desc);
    });
  }

  QueryBuilder<grupo, grupo, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<grupo, grupo, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension grupoQuerySortThenBy on QueryBuilder<grupo, grupo, QSortThenBy> {
  QueryBuilder<grupo, grupo, QAfterSortBy> thenByFile_imagem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'file_imagem', Sort.asc);
    });
  }

  QueryBuilder<grupo, grupo, QAfterSortBy> thenByFile_imagemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'file_imagem', Sort.desc);
    });
  }

  QueryBuilder<grupo, grupo, QAfterSortBy> thenByGrupo_descricao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grupo_descricao', Sort.asc);
    });
  }

  QueryBuilder<grupo, grupo, QAfterSortBy> thenByGrupo_descricaoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grupo_descricao', Sort.desc);
    });
  }

  QueryBuilder<grupo, grupo, QAfterSortBy> thenById_grupo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_grupo', Sort.asc);
    });
  }

  QueryBuilder<grupo, grupo, QAfterSortBy> thenById_grupoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_grupo', Sort.desc);
    });
  }

  QueryBuilder<grupo, grupo, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<grupo, grupo, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }
}

extension grupoQueryWhereDistinct on QueryBuilder<grupo, grupo, QDistinct> {
  QueryBuilder<grupo, grupo, QDistinct> distinctByFile_imagem(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'file_imagem', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<grupo, grupo, QDistinct> distinctByGrupo_descricao(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grupo_descricao',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<grupo, grupo, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }
}

extension grupoQueryProperty on QueryBuilder<grupo, grupo, QQueryProperty> {
  QueryBuilder<grupo, int, QQueryOperations> id_grupoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_grupo');
    });
  }

  QueryBuilder<grupo, String, QQueryOperations> file_imagemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'file_imagem');
    });
  }

  QueryBuilder<grupo, String, QQueryOperations> grupo_descricaoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grupo_descricao');
    });
  }

  QueryBuilder<grupo, int, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }
}

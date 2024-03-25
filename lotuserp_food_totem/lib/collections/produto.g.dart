// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetprodutoCollection on Isar {
  IsarCollection<produto> get produtos => this.collection();
}

const ProdutoSchema = CollectionSchema(
  name: r'produto',
  id: -7709859153173029853,
  properties: {
    r'aplicacao': PropertySchema(
      id: 0,
      name: r'aplicacao',
      type: IsarType.string,
    ),
    r'file_imagem': PropertySchema(
      id: 1,
      name: r'file_imagem',
      type: IsarType.string,
    ),
    r'gtin': PropertySchema(
      id: 2,
      name: r'gtin',
      type: IsarType.string,
    ),
    r'id_grupo': PropertySchema(
      id: 3,
      name: r'id_grupo',
      type: IsarType.long,
    ),
    r'produto_descricao': PropertySchema(
      id: 4,
      name: r'produto_descricao',
      type: IsarType.string,
    ),
    r'pvenda': PropertySchema(
      id: 5,
      name: r'pvenda',
      type: IsarType.double,
    ),
    r'unidade': PropertySchema(
      id: 6,
      name: r'unidade',
      type: IsarType.string,
    )
  },
  estimateSize: _produtoEstimateSize,
  serialize: _produtoSerialize,
  deserialize: _produtoDeserialize,
  deserializeProp: _produtoDeserializeProp,
  idName: r'id_produto',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _produtoGetId,
  getLinks: _produtoGetLinks,
  attach: _produtoAttach,
  version: '3.1.0+1',
);

int _produtoEstimateSize(
  produto object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.aplicacao;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.file_imagem.length * 3;
  bytesCount += 3 + object.gtin.length * 3;
  bytesCount += 3 + object.produto_descricao.length * 3;
  bytesCount += 3 + object.unidade.length * 3;
  return bytesCount;
}

void _produtoSerialize(
  produto object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.aplicacao);
  writer.writeString(offsets[1], object.file_imagem);
  writer.writeString(offsets[2], object.gtin);
  writer.writeLong(offsets[3], object.id_grupo);
  writer.writeString(offsets[4], object.produto_descricao);
  writer.writeDouble(offsets[5], object.pvenda);
  writer.writeString(offsets[6], object.unidade);
}

produto _produtoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = produto(
    id,
    reader.readLong(offsets[3]),
    reader.readString(offsets[4]),
    reader.readString(offsets[6]),
    reader.readString(offsets[2]),
    reader.readStringOrNull(offsets[0]),
    reader.readDouble(offsets[5]),
    reader.readString(offsets[1]),
  );
  return object;
}

P _produtoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _produtoGetId(produto object) {
  return object.id_produto;
}

List<IsarLinkBase<dynamic>> _produtoGetLinks(produto object) {
  return [];
}

void _produtoAttach(IsarCollection<dynamic> col, Id id, produto object) {
  object.id_produto = id;
}

extension produtoQueryWhereSort on QueryBuilder<produto, produto, QWhere> {
  QueryBuilder<produto, produto, QAfterWhere> anyId_produto() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension produtoQueryWhere on QueryBuilder<produto, produto, QWhereClause> {
  QueryBuilder<produto, produto, QAfterWhereClause> id_produtoEqualTo(
      Id id_produto) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id_produto,
        upper: id_produto,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterWhereClause> id_produtoNotEqualTo(
      Id id_produto) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id_produto, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id_produto, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id_produto, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id_produto, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<produto, produto, QAfterWhereClause> id_produtoGreaterThan(
      Id id_produto,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id_produto, includeLower: include),
      );
    });
  }

  QueryBuilder<produto, produto, QAfterWhereClause> id_produtoLessThan(
      Id id_produto,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id_produto, includeUpper: include),
      );
    });
  }

  QueryBuilder<produto, produto, QAfterWhereClause> id_produtoBetween(
    Id lowerId_produto,
    Id upperId_produto, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId_produto,
        includeLower: includeLower,
        upper: upperId_produto,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension produtoQueryFilter
    on QueryBuilder<produto, produto, QFilterCondition> {
  QueryBuilder<produto, produto, QAfterFilterCondition> aplicacaoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'aplicacao',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> aplicacaoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'aplicacao',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> aplicacaoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aplicacao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> aplicacaoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'aplicacao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> aplicacaoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'aplicacao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> aplicacaoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'aplicacao',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> aplicacaoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'aplicacao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> aplicacaoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'aplicacao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> aplicacaoContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'aplicacao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> aplicacaoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'aplicacao',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> aplicacaoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'aplicacao',
        value: '',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> aplicacaoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'aplicacao',
        value: '',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> file_imagemEqualTo(
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

  QueryBuilder<produto, produto, QAfterFilterCondition> file_imagemGreaterThan(
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

  QueryBuilder<produto, produto, QAfterFilterCondition> file_imagemLessThan(
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

  QueryBuilder<produto, produto, QAfterFilterCondition> file_imagemBetween(
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

  QueryBuilder<produto, produto, QAfterFilterCondition> file_imagemStartsWith(
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

  QueryBuilder<produto, produto, QAfterFilterCondition> file_imagemEndsWith(
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

  QueryBuilder<produto, produto, QAfterFilterCondition> file_imagemContains(
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

  QueryBuilder<produto, produto, QAfterFilterCondition> file_imagemMatches(
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

  QueryBuilder<produto, produto, QAfterFilterCondition> file_imagemIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'file_imagem',
        value: '',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      file_imagemIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'file_imagem',
        value: '',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gtinEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gtin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gtinGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gtin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gtinLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gtin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gtinBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gtin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gtinStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'gtin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gtinEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'gtin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gtinContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'gtin',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gtinMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'gtin',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gtinIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gtin',
        value: '',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> gtinIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'gtin',
        value: '',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> id_grupoEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_grupo',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> id_grupoGreaterThan(
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

  QueryBuilder<produto, produto, QAfterFilterCondition> id_grupoLessThan(
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

  QueryBuilder<produto, produto, QAfterFilterCondition> id_grupoBetween(
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

  QueryBuilder<produto, produto, QAfterFilterCondition> id_produtoEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id_produto',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> id_produtoGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id_produto',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> id_produtoLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id_produto',
        value: value,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> id_produtoBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id_produto',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      produto_descricaoEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'produto_descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      produto_descricaoGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'produto_descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      produto_descricaoLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'produto_descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      produto_descricaoBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'produto_descricao',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      produto_descricaoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'produto_descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      produto_descricaoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'produto_descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      produto_descricaoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'produto_descricao',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      produto_descricaoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'produto_descricao',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      produto_descricaoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'produto_descricao',
        value: '',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition>
      produto_descricaoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'produto_descricao',
        value: '',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> pvendaEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pvenda',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> pvendaGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pvenda',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> pvendaLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pvenda',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> pvendaBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pvenda',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> unidadeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unidade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> unidadeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unidade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> unidadeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unidade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> unidadeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unidade',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> unidadeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unidade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> unidadeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unidade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> unidadeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unidade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> unidadeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unidade',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> unidadeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unidade',
        value: '',
      ));
    });
  }

  QueryBuilder<produto, produto, QAfterFilterCondition> unidadeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unidade',
        value: '',
      ));
    });
  }
}

extension produtoQueryObject
    on QueryBuilder<produto, produto, QFilterCondition> {}

extension produtoQueryLinks
    on QueryBuilder<produto, produto, QFilterCondition> {}

extension produtoQuerySortBy on QueryBuilder<produto, produto, QSortBy> {
  QueryBuilder<produto, produto, QAfterSortBy> sortByAplicacao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aplicacao', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByAplicacaoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aplicacao', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByFile_imagem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'file_imagem', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByFile_imagemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'file_imagem', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByGtin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gtin', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByGtinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gtin', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortById_grupo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_grupo', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortById_grupoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_grupo', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByProduto_descricao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'produto_descricao', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByProduto_descricaoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'produto_descricao', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByPvenda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pvenda', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByPvendaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pvenda', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByUnidade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unidade', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> sortByUnidadeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unidade', Sort.desc);
    });
  }
}

extension produtoQuerySortThenBy
    on QueryBuilder<produto, produto, QSortThenBy> {
  QueryBuilder<produto, produto, QAfterSortBy> thenByAplicacao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aplicacao', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByAplicacaoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'aplicacao', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByFile_imagem() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'file_imagem', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByFile_imagemDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'file_imagem', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByGtin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gtin', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByGtinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gtin', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenById_grupo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_grupo', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenById_grupoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_grupo', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenById_produto() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_produto', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenById_produtoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id_produto', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByProduto_descricao() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'produto_descricao', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByProduto_descricaoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'produto_descricao', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByPvenda() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pvenda', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByPvendaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pvenda', Sort.desc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByUnidade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unidade', Sort.asc);
    });
  }

  QueryBuilder<produto, produto, QAfterSortBy> thenByUnidadeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unidade', Sort.desc);
    });
  }
}

extension produtoQueryWhereDistinct
    on QueryBuilder<produto, produto, QDistinct> {
  QueryBuilder<produto, produto, QDistinct> distinctByAplicacao(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'aplicacao', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<produto, produto, QDistinct> distinctByFile_imagem(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'file_imagem', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<produto, produto, QDistinct> distinctByGtin(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gtin', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<produto, produto, QDistinct> distinctById_grupo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id_grupo');
    });
  }

  QueryBuilder<produto, produto, QDistinct> distinctByProduto_descricao(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'produto_descricao',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<produto, produto, QDistinct> distinctByPvenda() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pvenda');
    });
  }

  QueryBuilder<produto, produto, QDistinct> distinctByUnidade(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unidade', caseSensitive: caseSensitive);
    });
  }
}

extension produtoQueryProperty
    on QueryBuilder<produto, produto, QQueryProperty> {
  QueryBuilder<produto, int, QQueryOperations> id_produtoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_produto');
    });
  }

  QueryBuilder<produto, String?, QQueryOperations> aplicacaoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'aplicacao');
    });
  }

  QueryBuilder<produto, String, QQueryOperations> file_imagemProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'file_imagem');
    });
  }

  QueryBuilder<produto, String, QQueryOperations> gtinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gtin');
    });
  }

  QueryBuilder<produto, int, QQueryOperations> id_grupoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id_grupo');
    });
  }

  QueryBuilder<produto, String, QQueryOperations> produto_descricaoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'produto_descricao');
    });
  }

  QueryBuilder<produto, double, QQueryOperations> pvendaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pvenda');
    });
  }

  QueryBuilder<produto, String, QQueryOperations> unidadeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unidade');
    });
  }
}

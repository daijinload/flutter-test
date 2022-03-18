// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'aaa.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Echo$Query$IdResult extends JsonSerializable with EquatableMixin {
  Echo$Query$IdResult();

  factory Echo$Query$IdResult.fromJson(Map<String, dynamic> json) =>
      _$Echo$Query$IdResultFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$Echo$Query$IdResultToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Echo$Query extends JsonSerializable with EquatableMixin {
  Echo$Query();

  factory Echo$Query.fromJson(Map<String, dynamic> json) =>
      _$Echo$QueryFromJson(json);

  Echo$Query$IdResult? echo;

  @override
  List<Object?> get props => [echo];
  @override
  Map<String, dynamic> toJson() => _$Echo$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Echom$Mutation$IdResult extends JsonSerializable with EquatableMixin {
  Echom$Mutation$IdResult();

  factory Echom$Mutation$IdResult.fromJson(Map<String, dynamic> json) =>
      _$Echom$Mutation$IdResultFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$Echom$Mutation$IdResultToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Echom$Mutation extends JsonSerializable with EquatableMixin {
  Echom$Mutation();

  factory Echom$Mutation.fromJson(Map<String, dynamic> json) =>
      _$Echom$MutationFromJson(json);

  Echom$Mutation$IdResult? echom;

  @override
  List<Object?> get props => [echom];
  @override
  Map<String, dynamic> toJson() => _$Echom$MutationToJson(this);
}

final ECHO_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'echo'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'echo'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class EchoQuery extends GraphQLQuery<Echo$Query, JsonSerializable> {
  EchoQuery();

  @override
  final DocumentNode document = ECHO_QUERY_DOCUMENT;

  @override
  final String operationName = 'echo';

  @override
  List<Object?> get props => [document, operationName];
  @override
  Echo$Query parse(Map<String, dynamic> json) => Echo$Query.fromJson(json);
}

final ECHOM_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'echom'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'echom'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class EchomMutation extends GraphQLQuery<Echom$Mutation, JsonSerializable> {
  EchomMutation();

  @override
  final DocumentNode document = ECHOM_MUTATION_DOCUMENT;

  @override
  final String operationName = 'echom';

  @override
  List<Object?> get props => [document, operationName];
  @override
  Echom$Mutation parse(Map<String, dynamic> json) =>
      Echom$Mutation.fromJson(json);
}

import 'package:pokedex/infra/base/json_field.dart';
import 'package:pokedex/infra/models/pokemon_model_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class PokemonModelEntity {
  late int id;
  late String name;
  late List<PokemonModelTypes> types;
  late List<PokemonModelAbilities> abilities;

  PokemonModelEntity();

  factory PokemonModelEntity.fromJson(Map<String, dynamic> json) =>
      $PokemonModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $PokemonModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PokemonModelTypes {
  late int slot;
  late PokemonModelTypesType type;

  PokemonModelTypes();

  factory PokemonModelTypes.fromJson(Map<String, dynamic> json) =>
      $PokemonModelTypesFromJson(json);

  Map<String, dynamic> toJson() => $PokemonModelTypesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PokemonModelTypesType {
  late String name;
  late String url;

  PokemonModelTypesType();

  factory PokemonModelTypesType.fromJson(Map<String, dynamic> json) =>
      $PokemonModelTypesTypeFromJson(json);

  Map<String, dynamic> toJson() => $PokemonModelTypesTypeToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PokemonModelAbilities {
  late int slot;
  late PokemonModelAbilitiesAbility ability;

  PokemonModelAbilities();

  factory PokemonModelAbilities.fromJson(Map<String, dynamic> json) =>
      $PokemonModelAbilitiesFromJson(json);

  Map<String, dynamic> toJson() => $PokemonModelAbilitiesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PokemonModelAbilitiesAbility {
  late String name;
  late String url;

  PokemonModelAbilitiesAbility();

  factory PokemonModelAbilitiesAbility.fromJson(Map<String, dynamic> json) =>
      $PokemonModelAbilitiesAbilityFromJson(json);

  Map<String, dynamic> toJson() => $PokemonModelAbilitiesAbilityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}


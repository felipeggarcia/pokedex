import 'package:pokedex/infra/base/json_convert_content.dart';
import 'package:pokedex/data/models/pokemon_model_entity.dart';

PokemonModelEntity $PokemonModelEntityFromJson(Map<String, dynamic> json) {
  final PokemonModelEntity pokemonModelEntity = PokemonModelEntity();

  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    pokemonModelEntity.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    pokemonModelEntity.name = name;
  }

  final List<PokemonModelTypes>? types =
      jsonConvert.convertListNotNull<PokemonModelTypes>(json['types']);
  if (types != null) {
    pokemonModelEntity.types = types;
  }
  final List<PokemonModelAbilities>? abilities =
      jsonConvert.convertListNotNull<PokemonModelAbilities>(json['abilities']);
  if (abilities != null) {
    pokemonModelEntity.abilities = abilities;
  }

  return pokemonModelEntity;
}

Map<String, dynamic> $PokemonModelEntityToJson(PokemonModelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['types'] = entity.types.map((v) => v.toJson()).toList();
  data['abilities'] = entity.abilities.map((v) => v.toJson()).toList();
  return data;
}

PokemonModelTypes $PokemonModelTypesFromJson(Map<String, dynamic> json) {
  final PokemonModelTypes pokemonModelTypes = PokemonModelTypes();
  final int? slot = jsonConvert.convert<int>(json['slot']);
  if (slot != null) {
    pokemonModelTypes.slot = slot;
  }
  final PokemonModelTypesType? type =
      jsonConvert.convert<PokemonModelTypesType>(json['type']);
  if (type != null) {
    pokemonModelTypes.type = type;
  }
  return pokemonModelTypes;
}

Map<String, dynamic> $PokemonModelTypesToJson(PokemonModelTypes entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['slot'] = entity.slot;
  data['type'] = entity.type.toJson();
  return data;
}

PokemonModelTypesType $PokemonModelTypesTypeFromJson(
    Map<String, dynamic> json) {
  final PokemonModelTypesType pokemonModelTypesType = PokemonModelTypesType();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    pokemonModelTypesType.name = name;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    pokemonModelTypesType.url = url;
  }
  return pokemonModelTypesType;
}

Map<String, dynamic> $PokemonModelTypesTypeToJson(
    PokemonModelTypesType entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['url'] = entity.url;
  return data;
}

PokemonModelAbilities $PokemonModelAbilitiesFromJson(
    Map<String, dynamic> json) {
  final PokemonModelAbilities pokemonModelAbilities = PokemonModelAbilities();
  final int? slot = jsonConvert.convert<int>(json['slot']);
  if (slot != null) {
    pokemonModelAbilities.slot = slot;
  }
  final PokemonModelAbilitiesAbility? ability =
      jsonConvert.convert<PokemonModelAbilitiesAbility>(json['ability']);
  if (ability != null) {
    pokemonModelAbilities.ability = ability;
  }
  return pokemonModelAbilities;
}

Map<String, dynamic> $PokemonModelAbilitiesToJson(
    PokemonModelAbilities entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['slot'] = entity.slot;
  data['ability'] = entity.ability.toJson();
  return data;
}

PokemonModelAbilitiesAbility $PokemonModelAbilitiesAbilityFromJson(
    Map<String, dynamic> json) {
  final PokemonModelAbilitiesAbility pokemonModelAbilitiesAbility =
      PokemonModelAbilitiesAbility();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    pokemonModelAbilitiesAbility.name = name;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    pokemonModelAbilitiesAbility.url = url;
  }
  return pokemonModelAbilitiesAbility;
}

Map<String, dynamic> $PokemonModelAbilitiesAbilityToJson(
    PokemonModelAbilitiesAbility entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['url'] = entity.url;
  return data;
}

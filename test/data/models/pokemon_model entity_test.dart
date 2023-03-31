import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/data/models/pokemon_model_entity.dart';

void main() {
  group('PokemonModelEntity', () {
    test('fromJson should parse JSON correctly', () {
      final json = {
        'id': 1,
        'name': 'bulbasaur',
        'types': [
          {
            'slot': 1,
            'type': {'name': 'grass', 'url': 'http://example.com'}
          }
        ],
        'abilities': [
          {
            'slot': 1,
            'ability': {'name': 'overgrow', 'url': 'http://example.com'}
          }
        ]
      };

      final pokemon = PokemonModelEntity.fromJson(json);

      expect(pokemon.id, 1);
      expect(pokemon.name, 'bulbasaur');
      expect(pokemon.types[0].slot, 1);
      expect(pokemon.types[0].type.name, 'grass');
      expect(pokemon.abilities[0].slot, 1);
      expect(pokemon.abilities[0].ability.name, 'overgrow');
    });

    test('toJson should return JSON object', () {
      final pokemon = PokemonModelEntity()
        ..id = 1
        ..name = 'bulbasaur'
        ..types = [
          PokemonModelTypes()
            ..slot = 1
            ..type = (PokemonModelTypesType()
              ..name = 'grass'
              ..url = 'http://example.com')
        ]
        ..abilities = [
          PokemonModelAbilities()
            ..slot = 1
            ..ability = (PokemonModelAbilitiesAbility()
              ..name = 'overgrow'
              ..url = 'http://example.com')
        ];

      final json = pokemon.toJson();

      expect(json['id'], 1);
      expect(json['name'], 'bulbasaur');
      expect(json['types'][0]['slot'], 1);
      expect(json['types'][0]['type']['name'], 'grass');
      expect(json['abilities'][0]['slot'], 1);
      expect(json['abilities'][0]['ability']['name'], 'overgrow');
    });
  });
}

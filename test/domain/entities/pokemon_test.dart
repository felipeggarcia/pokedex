import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/domain/entities/pokemon.dart';

void main() {
  group('Pokemon', () {
    late Pokemon pokemon;

    setUp(() {
      pokemon = const Pokemon(
        id: 1,
        name: 'Bulbasaur',
        types: ['Grass', 'Poison'],
        abilities: ['Overgrow', 'Chlorophyll'],
        imageUrl:
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png',
      );
    });

    test('should initialize Pokemon object correctly', () {
      expect(pokemon.id, 1);
      expect(pokemon.name, 'Bulbasaur');
      expect(pokemon.types, ['Grass', 'Poison']);
      expect(pokemon.abilities, ['Overgrow', 'Chlorophyll']);
      expect(pokemon.imageUrl,
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png');
    });

    test('should override props with correct values', () {
      const anotherPokemon = Pokemon(
        id: 1,
        name: 'Bulbasaur',
        types: ['Grass', 'Poison'],
        abilities: ['Overgrow', 'Chlorophyll'],
        imageUrl:
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png',
      );
      expect(pokemon.props, anotherPokemon.props);
    });

    test('should not override props with incorrect values', () {
      const anotherPokemon = Pokemon(
        id: 2,
        name: 'Charmander',
        types: ['Fire'],
        abilities: ['Blaze'],
        imageUrl:
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png',
      );
      expect(pokemon.props, isNot(anotherPokemon.props));
    });
  });
}

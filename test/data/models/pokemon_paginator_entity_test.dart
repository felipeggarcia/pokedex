import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/data/models/pokemon_paginator_entity.dart';

void main() {
  group('PokemonPaginatorEntity', () {
    test('fromJson() returns a valid instance', () {
      final json = {
        'count': 123,
        'next': 'https://pokeapi.co/api/v2/pokemon?offset=20&limit=20',
        'previous': '',
        'results': [
          {
            'name': 'bulbasaur',
            'url': 'https://pokeapi.co/api/v2/pokemon/1/',
          },
          {
            'name': 'ivysaur',
            'url': 'https://pokeapi.co/api/v2/pokemon/2/',
          },
          {
            'name': 'venusaur',
            'url': 'https://pokeapi.co/api/v2/pokemon/3/',
          },
        ],
      };

      final entity = PokemonPaginatorEntity.fromJson(json);

      expect(entity.count, 123);
      expect(
          entity.next, 'https://pokeapi.co/api/v2/pokemon?offset=20&limit=20');
      expect(entity.previous, '');
      expect(entity.results.length, 3);
      expect(entity.results[0].name, 'bulbasaur');
      expect(entity.results[0].url, 'https://pokeapi.co/api/v2/pokemon/1/');
      expect(entity.results[1].name, 'ivysaur');
      expect(entity.results[1].url, 'https://pokeapi.co/api/v2/pokemon/2/');
      expect(entity.results[2].name, 'venusaur');
      expect(entity.results[2].url, 'https://pokeapi.co/api/v2/pokemon/3/');
    });

    test('toJson() returns a valid json', () {
      final entity = PokemonPaginatorEntity()
        ..count = 123
        ..next = 'https://pokeapi.co/api/v2/pokemon?offset=20&limit=20'
        ..previous = ''
        ..results = [
          PokemonPaginatorResults()
            ..name = 'bulbasaur'
            ..url = 'https://pokeapi.co/api/v2/pokemon/1/',
          PokemonPaginatorResults()
            ..name = 'ivysaur'
            ..url = 'https://pokeapi.co/api/v2/pokemon/2/',
          PokemonPaginatorResults()
            ..name = 'venusaur'
            ..url = 'https://pokeapi.co/api/v2/pokemon/3/',
        ];

      final json = entity.toJson();

      expect(json['count'], 123);
      expect(
          json['next'], 'https://pokeapi.co/api/v2/pokemon?offset=20&limit=20');
      expect(json['previous'], '');
      expect(json['results'].length, 3);
      expect(json['results'][0]['name'], 'bulbasaur');
      expect(json['results'][0]['url'], 'https://pokeapi.co/api/v2/pokemon/1/');
      expect(json['results'][1]['name'], 'ivysaur');
      expect(json['results'][1]['url'], 'https://pokeapi.co/api/v2/pokemon/2/');
      expect(json['results'][2]['name'], 'venusaur');
      expect(json['results'][2]['url'], 'https://pokeapi.co/api/v2/pokemon/3/');
    });
  });
  group('PokemonPaginatorResults', () {
    test('fromJson() returns a valid instance', () {
      final json = {
        'name': 'pikachu',
        'url': 'https://pokeapi.co/api/v2/pokemon/25/'
      };

      final result = PokemonPaginatorResults.fromJson(json);

      expect(result.name, 'pikachu');
      expect(result.url, 'https://pokeapi.co/api/v2/pokemon/25/');
    });

    test('toJson() returns a valid JSON map', () {
      final result = PokemonPaginatorResults()
        ..name = 'charmander'
        ..url = 'https://pokeapi.co/api/v2/pokemon/4/';

      final json = result.toJson();

      expect(json['name'], 'charmander');
      expect(json['url'], 'https://pokeapi.co/api/v2/pokemon/4/');
    });

    test('toString() returns a valid string representation', () {
      final result = PokemonPaginatorResults()
        ..name = 'bulbasaur'
        ..url = 'https://pokeapi.co/api/v2/pokemon/1/';

      final string = result.toString();

      expect(string,
          '{"name":"bulbasaur","url":"https://pokeapi.co/api/v2/pokemon/1/"}');
    });
  });
}

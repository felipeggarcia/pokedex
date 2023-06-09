import 'package:dartz/dartz.dart';
import 'package:pokedex/domain/utils/errors/failures.dart';
import 'package:pokedex/data/data_sources/remote_data_source.dart';
import 'package:pokedex/data/models/pokemon_model_entity.dart';
import 'package:pokedex/data/models/pokemon_paginator_entity.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final RemoteDataSource remoteDataSource;

  HomeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Pokemon>>>? addPokemons(int offset) async {
    try {
      List<PokemonPaginatorResults>? pageResult =
          await remoteDataSource.getMorePokemons(offset);
      List<Pokemon> result = [];

      for (PokemonPaginatorResults e in pageResult!) {
        PokemonModelEntity? pme =
            await remoteDataSource.getPokemonByName(e.name);
        List<String> types = [];
        for (PokemonModelTypes f in pme!.types) {
          types.add(f.type.name);
        }
        List<String> abilities = [];
        for (PokemonModelAbilities? f in pme!.abilities) {
          abilities.add(f!.ability.name);
        }

        result.add(Pokemon(
            id: pme.id,
            name: pme.name,
            types: types,
            abilities: abilities,
            imageUrl:
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pme.id}.png'));
      }
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure());
    }
  }
}

import 'package:dartz/dartz.dart';
import 'package:pokedex/domain/utils/errors/failures.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/repositories/home_repository.dart';

class AddPokemons {
  final HomeRepository repository;

  AddPokemons(this.repository);

  Future<Either<Failure, List<Pokemon>>?> addPokemons(int offset) async {
    return await repository.addPokemons(offset);
  }
}

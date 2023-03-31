import 'package:dartz/dartz.dart';
import 'package:pokedex/domain/utils/errors/failures.dart';
import 'package:pokedex/domain/entities/pokemon.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<Pokemon>>>? addPokemons(int offset);
}

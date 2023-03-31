import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  final int id;
  final String name;

  final String imageUrl;
  final List<String> types;
  final List<String> abilities;

  const Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.abilities,
    required this.imageUrl,
  });

  @override
  List<Object> get props => [id, name, types, abilities, imageUrl];
}

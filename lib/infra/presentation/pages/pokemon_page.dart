import 'package:flutter/material.dart';
import 'package:pokedex/domain/entities/pokemon.dart';

import '../theme/pokedex_colors.dart';

import '../widgets/details/abilities_widget.dart';
import '../widgets/details/poke_header.dart';
import '../widgets/details/types_widget.dart';

class PokemonPage extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonPage(this.pokemon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: PokedexColors.getByName(pokemon.types[0]),
            title: Container(
              alignment: Alignment.centerLeft,
            )),
        body: ListView(
          children: [
            PokeHeader(pokemon),
            TypesWidget(pokemon),
            AbilitiesWidget(pokemon),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:pokedex/infra/presentation/theme/pokedex_colors.dart';

import '../../../../../domain/entities/pokemon.dart';

class AbilitiesWidget extends StatelessWidget {
  final Pokemon pokemon;

  const AbilitiesWidget(this.pokemon, {super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20, bottom: 10),
          padding: const EdgeInsets.only(left: 50),
          width: double.maxFinite,
          alignment: Alignment.topLeft,
          child: const Text(
            'Abilities',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: pokemon.abilities
                .map((e) => Container(
                      constraints: const BoxConstraints(maxWidth: 400),
                      width: screenSize.width - 100,
                      margin: const EdgeInsets.all(3),
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: PokedexColors.getByName(e)[900]!,
                              width: 1)),
                      child: Text(
                        e.replaceAll('-', ' '),
                        style:
                            const TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ))
                .toList()),
      ],
    );
  }
}

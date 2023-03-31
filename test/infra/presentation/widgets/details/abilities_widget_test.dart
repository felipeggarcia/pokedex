import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/infra/presentation/widgets/details/abilities_widget.dart';

void main() {
  group('AbilitiesWidget', () {
    const pokemon = Pokemon(
      id: 1,
      name: 'bulbasaur',
      types: ['grass', 'poison'],
      abilities: ['chlorophyll', 'overgrow'],
      imageUrl: 'https://example.com/bulbasaur.png',
    );

    testWidgets('displays abilities', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AbilitiesWidget(pokemon),
          ),
        ),
      );

      expect(find.text('Abilities'), findsOneWidget);

      for (final ability in pokemon.abilities) {
        expect(find.text(ability.replaceAll('-', ' ')), findsOneWidget);
      }
    });
  });
}

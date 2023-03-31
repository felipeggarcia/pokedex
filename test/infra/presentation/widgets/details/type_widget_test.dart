import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/infra/presentation/widgets/details/types_widget.dart';

void main() {
  group('TypeWidget', () {
    const pokemon = Pokemon(
      id: 1,
      name: 'bulbasaur',
      types: ['grass', 'poison'],
      abilities: ['chlorophyll', 'overgrow'],
      imageUrl: 'https://example.com/bulbasaur.png',
    );

    testWidgets('displays types', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TypesWidget(pokemon),
          ),
        ),
      );

      expect(find.text('Types'), findsOneWidget);

      for (final type in pokemon.types) {
        expect(find.text(type.replaceAll('-', ' ')), findsOneWidget);
      }
    });
  });
}

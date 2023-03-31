import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../bloc_manager/home_bloc.dart';
import 'pokemon_card.dart';
import 'pokemon_scroll_behavior.dart';

class HomePaginator extends StatefulWidget {
  const HomePaginator({super.key});

  @override
  State<HomePaginator> createState() => _PaginatorState();
}

class _PaginatorState extends State<HomePaginator> {
  late HomeBloc pokeBloc;
  bool scrollSwitch = true;
  int countPokemon = 0;
  Set<Pokemon> allPokemonList = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    allPokemonList = {};
    countPokemon = 0;
    pokeBloc.add(const ResetList());
  }

  @override
  Widget build(BuildContext context) {
    pokeBloc = BlocProvider.of<HomeBloc>(context);

    return BlocBuilder<HomeBloc, HomeState>(
      bloc: pokeBloc,
      builder: (context, state) {
        if (state is HomeInitial) {
          pokeBloc.add(AddMorePokemons(countPokemon));
          countPokemon += 10;
          return const Center(child: CircularProgressIndicator());
        }
        if (state is WithPokemonsState) {
          scrollSwitch = true;
          return pokemonsPage(state);
        }
        return const Center();
      },
    );
  }

  Widget pokemonsPage(WithPokemonsState state) {
    allPokemonList.addAll(state.pokemons);
    ScrollController scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 200 &&
          scrollSwitch) {
        scrollSwitch = false;
        pokeBloc.add(AddMorePokemons(countPokemon));
        countPokemon += 10;
      }
    });

    int crossAxisCount = 2;
    switch (getDeviceType(MediaQuery.of(context).size)) {
      case DeviceScreenType.mobile:
        crossAxisCount = 2;
        break;
      case DeviceScreenType.tablet:
        crossAxisCount = 3;
        break;
      case DeviceScreenType.desktop:
        crossAxisCount = 4;
        break;
      default:
        crossAxisCount = 2;
        break;
    }

    return ScrollConfiguration(
        behavior: PokemonScrollBehavior(),
        child: GridView.count(
          shrinkWrap: true,
          controller: scrollController,
          childAspectRatio: 1,
          physics: const ScrollPhysics(),
          padding: const EdgeInsets.only(top: 20, left: 5, right: 5),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: crossAxisCount,
          children: allPokemonList.map((entry) {
            return PokemonCard(entry);
          }).toList(),
          // ),
        ));
  }
}

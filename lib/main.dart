import 'package:flutter/material.dart';
import 'package:pokedex/infra/presentation/bloc_manager/simple_bloc_delegate.dart';
import 'package:pokedex/infra/presentation/common/poke_bottom_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/data/data_sources/remote_data_source.dart';
import 'package:pokedex/data/repositories/home_repository_impl.dart';
import 'package:pokedex/domain/use_cases/add_pokemons.dart';
import 'package:pokedex/infra/presentation/bloc_manager/home_bloc.dart';
import 'package:http/http.dart' as http;

void main() {
  Bloc.observer = SimpleBlocDelegate();
  final http.Client client = http.Client();
  RemoteDataSource rds = RemoteDataSource(client);
  HomeRepositoryImpl repo = HomeRepositoryImpl(remoteDataSource: rds);
  AddPokemons ap = AddPokemons(repo);
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<HomeBloc>(
        create: (BuildContext context) => HomeBloc(addPokemonsUseCase: ap),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const PokeBottomNavigationBar(),
    );
  }
}

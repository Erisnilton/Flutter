import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/commons/repositories/pokemon_repository.dart';
import 'package:pokedex/features/pokedex/route.dart';

import 'features/pokedex/screens/home/container/home_container.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex ',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: PokedexRoute(
        repository: PokemonRepository(
          dio: Dio(),
        ),
      ),
    );
  }
}

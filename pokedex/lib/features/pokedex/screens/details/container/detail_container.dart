import 'package:flutter/material.dart';
import 'package:pokedex/commons/erros/failure.dart';
import 'package:pokedex/commons/models/pokemon.dart';
import 'package:pokedex/commons/repositories/pokemon_repository.dart';
import 'package:pokedex/commons/widget/po_error.dart';
import 'package:pokedex/commons/widget/po_loading.dart';
import 'package:pokedex/features/pokedex/screens/details/pages/details_page.dart';
import 'package:pokedex/features/pokedex/screens/home/pages/home_error.dart';
import 'package:pokedex/features/pokedex/screens/home/pages/home_loading.dart';
import 'package:pokedex/features/pokedex/screens/home/pages/home_page.dart';

class DetailArguments {
  DetailArguments({required this.pokemon});

  final Pokemon pokemon;
}

class DetailContainer extends StatelessWidget {
  const DetailContainer(
      {Key? key, required this.repository, required this.arguments})
      : super(key: key);
  final IPokemonRepository repository;
  final DetailArguments arguments;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return POLoading();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return DetailsPage(
            pokemon: arguments.pokemon,
            pokemons: snapshot.data!,
          );
        }

        if (snapshot.hasError) {
          return PoError(error: (snapshot.error as Failure).message!);
        }

        return Container();
      },
    );
  }
}

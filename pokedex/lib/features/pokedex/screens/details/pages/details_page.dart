import 'package:flutter/material.dart';
import 'package:pokedex/commons/models/pokemon.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.pokemon, required this.pokemons})
      : super(key: key);

  final Pokemon pokemon;
  final List<Pokemon> pokemons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
        backgroundColor: pokemon.baseColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.only(top: 32),
                child: ListView(
                  children: pokemons
                      .map(
                        (pokemon) => Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(pokemon.name),
                        ),
                      )
                      .toList(),
                  scrollDirection: Axis.horizontal,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

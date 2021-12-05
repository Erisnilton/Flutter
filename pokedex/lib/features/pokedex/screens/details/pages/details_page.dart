import 'package:flutter/material.dart';
import 'package:pokedex/commons/models/pokemon.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.name, required this.pokemons})
      : super(key: key);

  final String name;
  final List<Pokemon> pokemons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
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

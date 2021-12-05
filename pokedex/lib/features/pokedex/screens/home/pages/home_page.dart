import 'package:flutter/material.dart';
import 'package:pokedex/commons/models/pokemon.dart';
import 'package:pokedex/features/pokedex/screens/details/container/detail_container.dart';
import 'package:pokedex/features/pokedex/screens/home/pages/widget/pokemon_item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.list, required this.onItemTap})
      : super(key: key);

  final List<Pokemon> list;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            'Pokedex',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: list
              .map((e) => PokemonItemWidget(
                    pokemon: e,
                    onTap: onItemTap,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

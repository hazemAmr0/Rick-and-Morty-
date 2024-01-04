
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/business_logic/cubit/characters_cubit.dart';
import 'package:rick_and_morty/data/models/characters.dart';
import 'package:rick_and_morty/presentation/widgets/character_item.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> allcharacters;
  @override
  void initState() {
    super.initState();
    allcharacters =
        BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 164, 176, 109),
        title: const Text(
          'Rick and Morty',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BuildBlocWidget(),
    );
  }

  Widget BuildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allcharacters = state.characters;
          return BuildLoadingListWidget();
        } else {
          return Container(
            child: const Center(
              child: Center(child: CircularProgressIndicator()),
            ),
          );
        }
      },
    );
  }

  Widget BuildLoadingListWidget() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey,
        child: Column(children: [
          BuildCharactersList(),
        ]),
      ),
    );
  }

  Widget BuildCharactersList() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.all(4),
        itemCount: allcharacters.length,
        itemBuilder: (context, index) {
          return CharacterItem(character: allcharacters[index]);
        });
  }
}

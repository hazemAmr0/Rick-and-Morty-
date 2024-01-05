import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import '../../business_logic/cubit/characters_cubit.dart';
import '../../data/models/characters.dart';
import '../widgets/character_item.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> SearchForCharacters;
  late List<Character> allcharacters;
  final _SearchTextController = TextEditingController();
  bool isSearching = false;
  @override
  void initState() {
    super.initState();

    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade900,
      appBar: AppBar(
        actions: AppbarActions(),
        backgroundColor: Colors.teal.shade800,
        title: isSearching ? SearchField() : BuildAppTitle(),
      ),
     body: OfflineBuilder(
        connectivityBuilder: (BuildContext context,
            ConnectivityResult connectivity, Widget child) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return BuildBlocWidget();
          } else {
            return BuildNoInternetWidget();
          }
        },
      
        child: Center(child: CircularProgressIndicator()) ,
      ),
    );
  }
  


Widget BuildNoInternetWidget(){
return Center(
child: Container(
color: Colors.teal.shade900,
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.center,

children: [
SizedBox(height: 20,),
Text('Can\'t connect .. check internet',style: TextStyle(color: Colors.white,fontSize: 20),),
Image.asset( 'assets/images/nowifi.png',height: 300,width: 300,),

],

),

),

);

}

  Widget BuildAppTitle() {
    return const Text(
      'Rick and Morty',
      style: TextStyle(color: Colors.black),
    );
  }

  Widget SearchField() {
    return TextField(
      controller: _SearchTextController,
      decoration: InputDecoration(
        hintText: 'Find Your Character',
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white60, fontSize: 18),
        
      ),
      style: const TextStyle(color: Colors.white, fontSize: 18),
      onChanged: (SearchedCharacter) {
        addSearchedForItemToSearchList(SearchedCharacter);
      },
    );
  }

  void addSearchedForItemToSearchList(String SearchedCharacter) {
    SearchForCharacters = allcharacters
        .where((character) =>
            character.name.toLowerCase().startsWith(SearchedCharacter))
        .toList();
        setState(() {
          
        });
  }

  List<Widget> AppbarActions() {
    if (isSearching) {
      return [
        IconButton(
          onPressed: () {
            _ClearSearch();
            Navigator.pop(context);
          },
          icon: Icon(Icons.clear, color: const Color.fromARGB(255, 24, 24, 24)),
        ),
      ];
    } else {
      return [
        IconButton(
            onPressed: _StartSearch,
            icon: Icon(Icons.search, color: const Color.fromARGB(255, 10, 10, 10))),
      ];
    }
  }

  void _StartSearch() {
    ModalRoute.of(context)!.addLocalHistoryEntry(
      LocalHistoryEntry(
        onRemove: _StopSearching,
      ),
    );
    setState(() {
      isSearching = true;
    });
  }

  void _StopSearching() {
    _ClearSearch;
    setState(() {
      isSearching = false;
    });
  }

  void _ClearSearch() {
    setState(() {
      _SearchTextController.clear();
    });
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
        color: Colors.teal.shade900,
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
        itemCount:_SearchTextController.text.isEmpty ? allcharacters.length : SearchForCharacters.length,
        itemBuilder: (context, index) {
          return CharacterItem(character:_SearchTextController.text.isEmpty ? allcharacters[index] : SearchForCharacters[index],);
        });
  }
}

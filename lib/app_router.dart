import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/business_logic/cubit/characters_cubit.dart';
import 'package:rick_and_morty/data/repository/charcaters_repository.dart';
import 'package:rick_and_morty/data/web_services/charcters_web_serviceses.dart';

import 'package:rick_and_morty/presentation/screens/characters_screen.dart';

import 'constants/strings.dart';
import 'presentation/screens/characters_details.dart';

class AppRouter {
late CharacterRepository characterRepository;
late CharactersCubit charactersCubit;
  AppRouter() {
    characterRepository = CharacterRepository(characterWebServices: CharacterWebServices());
    charactersCubit = CharactersCubit( characterRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CharacterScreen:
        return MaterialPageRoute(builder: (_) => BlocProvider(
          create: (BuildContext context) =>  charactersCubit,
           child: const CharactersScreen(),
           
           ),
           
           );

      case CharacterDetails:
        return MaterialPageRoute(builder: (_) => CharactersDetails());
    }
  }
}

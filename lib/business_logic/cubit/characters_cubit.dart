import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'characters_state.dart';
class CharactersCubit extends Cubit<List< CharactersState>> {
  CharactersCubit() : super( CharactersInitial());  

  // Add your business logic methods here
}

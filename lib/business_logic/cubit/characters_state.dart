import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part of'characters_cubit.dart';




@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}
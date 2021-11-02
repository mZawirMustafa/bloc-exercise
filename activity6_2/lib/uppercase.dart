import 'package:flutter_bloc/flutter_bloc.dart';

class Uppercase extends Cubit<String> {
  Uppercase() : super("");

  void capital(String words) {
    emit(words.toUpperCase());
  }
}

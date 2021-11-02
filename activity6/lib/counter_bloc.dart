import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';

enum CounterEvent { increment }

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield state + 1;
        break;
      default:
        null;
    }
  }
}

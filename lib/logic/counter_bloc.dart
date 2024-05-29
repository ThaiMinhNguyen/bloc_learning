import 'package:flutter_bloc/flutter_bloc.dart';
part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(counterValue: 0, isIncrement: true)) {
    on<CounterIncrement>((event, emit) {
      emit(CounterState(counterValue: state.counterValue+1, isIncrement: true));
    });
    on<CounterDecrement>((event, emit) {
      emit(CounterState(counterValue: state.counterValue-1, isIncrement: false));
    });
  }
}

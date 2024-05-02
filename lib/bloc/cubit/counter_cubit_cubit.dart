import 'package:bloc/bloc.dart';

part 'counter_cubit_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial(1));

  void reset() async {
      emit(CounterLoading(state.number));
    await Future.delayed(const Duration(seconds: 2));
    emit(CounterError(state.number, 'Please, Check Network Connection!'));
  }

  void increment() async {
    emit(CounterLoading(state.number));
    await Future.delayed(const Duration(seconds: 2));
    emit(CounterCounted(state.number + 1));
  
  }
}


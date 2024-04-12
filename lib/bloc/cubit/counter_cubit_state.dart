part of 'counter_cubit_cubit.dart';

abstract class CounterState {
  final int number;

  CounterState(this.number);
}

class CounterInitial extends CounterState {
  CounterInitial(super.number);
}

class CounterLoading extends CounterState {
  CounterLoading(super.number);
}

class CounterCounted extends CounterState {
  final int counter;

  CounterCounted(this.counter) : super(counter);
}

class CounterRestarted extends CounterState {
  CounterRestarted(super.number);
}

class CounterError extends CounterState {
  final String message;
  CounterError(super.number, this.message);
}

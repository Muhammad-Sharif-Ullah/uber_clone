import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<int> with HydratedMixin {
  CounterCubit() : super(0);

  increment() {
    if (state == 10) return;
    return emit(state + 1);
  }

  decrement() {
    if (state <= 0) return;
    return emit(state - 1);
  }

  makeZero() => emit(0);

  // Every time the app requires data from the application directory,
  // the fromJson method is invoked.
  @override
  int? fromJson(Map<String, dynamic> json) {
    try {
      final value = (json['value'] as int);

      return value;
    } catch (e) {
      return null;
    }
  }

  // Every state emitted by the [CounterCubit]
  // is converted to JSON using the toJson method
  // and then it will store it in local directory.
  @override
  Map<String, dynamic>? toJson(int state) {
    return {"value": state};
  }
}

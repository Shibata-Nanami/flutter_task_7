import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../infrastructure/model/sample/sample_model.dart';

part 'todo_state.freezed.dart';

@freezed
class TodoState with _$TodoState {
  const factory TodoState({
    // こちらの場合、state.futureTodoList.when~が使える
    @Default(AsyncValue.data([])) AsyncValue<List<SampleModel>> futureTodoList,
  }) = _TodoState;
}

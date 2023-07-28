import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layer_architecture_template/domain/todo/todo_service.dart';
import 'package:layer_architecture_template/domain/todo/todo_state.dart';

import '../../infrastructure/model/sample/sample_model.dart';

final todoNotifierProvider =
    StateNotifierProvider.autoDispose<TodoNotifier, TodoState>((ref) {
  return TodoNotifier(
    todoService: ref.read(todoService),
  );
});

class TodoNotifier extends StateNotifier<TodoState> {
  TodoNotifier({
    required this.todoService,
  }) : super(const TodoState());

  final TodoService todoService;

  Future<void> init() async {
    await fetchSampleModelList();
    // // 通常のFutureのサンプル
    // final todoList = await fetchSampleModelList();
    // state = state.copyWith(
    //   futureTodoList: AsyncValue.data(todoList),
    // );
  }

  Future<List<SampleModel>> fetchSampleModelList() async {
    state = state.copyWith(futureTodoList: const AsyncValue.loading());
    final todoList = await todoService.fetchSampleModelList();
    state = state.copyWith(
      futureTodoList: AsyncValue.data(todoList),
    );
    return todoList;
  }
}

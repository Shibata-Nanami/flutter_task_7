import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../infrastructure/model/sample/sample_model.dart';
import '../../infrastructure/repository/todo/todo_repository.dart';

final todoService = Provider.autoDispose(
  (ref) => TodoService(
    todoRepository: ref.read(todoRepository),
  ),
);

class TodoService {
  TodoService({
    required this.todoRepository,
  });

  final TodoRepository todoRepository;

  Future<List<SampleModel>> fetchSampleModelList() async {
    return todoRepository.fetchSampleModelList();
  }
}

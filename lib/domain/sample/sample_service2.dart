import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:layer_architecture_template/infrastructure/data_source/isar/todo/todo_collection.dart';
import 'package:layer_architecture_template/infrastructure/model/sample/sample_model.dart';
import 'package:layer_architecture_template/infrastructure/repository/sample/sample_repository2.dart';

final sampleService2 = Provider.autoDispose(
  (ref) => SampleService2(
    sampleRepository: ref.read(sampleRepository2),
  ),
);

class SampleService2 {
  SampleService2({required this.sampleRepository});
  final SampleRepository2 sampleRepository;

  Future<List<SampleModel>> fetchSampleModelList() async {
    return sampleRepository.fetchSampleModelList();
  }

  ///Isar: 一覧データ取得
  Future<List<Todo>> fetchTodoList() async {
    return sampleRepository.fetchTodoList();
  }

  ///Isar: 単体データ取得
  Future<Todo?> fetchTodoById(int id) async {
    return sampleRepository.fetchTodoById(id);
  }

  ///Isar: データ追加 / 更新
  Future<void> setTodoData({
    required Todo todoModel,
  }) async {
    return sampleRepository.setTodoData(todoModel: todoModel);
  }

  ///Isar: データ削除
  Future<void> deleteTodoData({
    required int id,
  }) async {
    return sampleRepository.deleteTodoData(id: id);
  }
}

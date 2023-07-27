import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:layer_architecture_template/domain/sample/sample_service.dart';
import 'package:layer_architecture_template/infrastructure/data_source/isar/todo/todo_collection.dart';

import '../../../domain/sample/sample_state.dart';

final sampleNotifierProvider2 =
    StateNotifierProvider.autoDispose<SampleNotifier2, SampleState>((ref) {
  return SampleNotifier2(
    sampleService: ref.read(sampleService),
  )..init();
});

class SampleNotifier2 extends StateNotifier<SampleState> {
  SampleNotifier2({
    required this.sampleService,
  }) : super(const SampleState());

  final SampleService sampleService;

  Future<void> init() async {
    //通常はFutureのサンプル
    final sampleList = await sampleService.fetchSampleModelList();
    //copyWith:変更された部分だけが更新される。freezedと一緒に使用。
    state = state.copyWith(
      sampleList: sampleList,
    );

    //AsyncValueのサンプル
    final futureSampleModelList = await sampleService.fetchSampleModelList();
    state = state.copyWith(
      futureSampleList: AsyncValue.data(futureSampleModelList),
    );
  }

  ///Isar: 一覧データ取得
  Future<List<Todo>> fetchTodoList() async {
    return sampleService.fetchTodoList();
  }

  ///Isar:単体データ取得
  Future<Todo?> fetchTodoById(int id) async {
    return sampleService.fetchTodoById(id);
  }

  ///Isar:データ追加 / 更新
  Future<void> setTodoData({
    required Todo todoModel,
  }) async {
    return sampleService.setTodoData(todoModel: todoModel);
  }

  ///Isar:データ削除
  Future<void> deleteTodoData({
    required int id,
  }) async {
    return sampleService.deleteTodoData(id: id);
  }
}

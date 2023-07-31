import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../data_source/sample/sample_remote_data_source.dart';
import '../../model/sample/sample_model.dart';

final todoRepository = Provider(
  (ref) => TodoRepository(
    sampleDataSource: SampleDataSource(),
  ),
);

class TodoRepository {
  TodoRepository({
    required this.sampleDataSource,
  });

  final SampleDataSource sampleDataSource;

//一覧データ取得
  Future<List<SampleModel>> fetchSampleModelList() async {
    return sampleDataSource.fetchSampleModelList();
  }
}

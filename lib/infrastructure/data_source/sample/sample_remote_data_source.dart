import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/sample/sample_model.dart';

class SampleDataSource {
  final List<SampleModel> _list = [];
  List<SampleModel> get list => _list;
  bool isLoading = false;

  Future<List<SampleModel>> fetchSampleModelList() async {
    // Firestoreのコレクション参照を取得
    final collectionRef = FirebaseFirestore.instance.collection('memo');

    // Firestoreのドキュメント一覧を取得
    final snapshot = await collectionRef.get();

    // Firestoreのドキュメント一覧からSampleModelリストを作成
    final memoList = snapshot.docs.map((doc) {
      //各ドキュメントのデータ（フィールドとその値）を取得し、dataに代入
      final data = doc.data();
      return SampleModel(id: doc.id, name: data['name'] ?? '');
    }).toList();
    return memoList;
  }
}

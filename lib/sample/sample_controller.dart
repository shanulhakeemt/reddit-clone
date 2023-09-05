import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample1/sample/sample_model.dart';
import 'package:riverpod_sample1/sample/sample_repository.dart';

final sampleControllerProvider = Provider(
    (ref) => SampleController(repository: ref.read(sampleRepositoryProvider)));

class SampleController {
  final SampleRepository _repository;
  SampleController({required SampleRepository repository})
      : _repository = repository;
  Future<void> addDocuments({required String name, required String age}) async {
    final res = await _repository.addDocuments(name: name, age: age);
    res.fold((l) => print(l.message), (r) => print("successfully added"));
  }

  Stream<List<SampleModel>> getDocuments() {
    return _repository.getDocuments();
  }

  Future<void> updateDocs(
      {required SampleModel obj, required String name, required age}) async {
    final res = await _repository.updateDocs(obj: obj, name: name, age: age);
    res.fold((l) => print(l.message), (r) => print("successfully updated"));
  }
  void deleteData({required String uid})async{
    final res=await _repository.deleteData(uid: uid);
    res.fold((l) => print(l.message), (r) => print("Successfully deleted"));
  }
}

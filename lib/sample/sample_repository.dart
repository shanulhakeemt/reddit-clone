import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_sample1/failure.dart';
import 'package:riverpod_sample1/sample/sample_model.dart';
import 'package:riverpod_sample1/type_defs.dart';

final firestoreProvider = Provider((ref) {
  return FirebaseFirestore.instance;
});
final sampleRepositoryProvider =
    Provider((ref) => SampleRepository(firestore: ref.read(firestoreProvider)));

class SampleRepository {
  final FirebaseFirestore _firestore;
  SampleRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  CollectionReference get _docs => _firestore.collection("docs");

  FutureVoid addDocuments({required String name, required String age}) async {
    try {
      SampleModel obj = SampleModel(age: age, name: name);
      return right(_docs.add(obj.toMap()).then((value) {
        obj = obj.copyWith(uid: value.id);
        value.update(obj.toMap());
      }));
    } on FirebaseException catch (ex) {
      throw ex.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Stream<List<SampleModel>> getDocuments() {
    return _docs.snapshots().map((event) => event.docs
        .map((e) => SampleModel.fromMap(e.data() as Map<String, dynamic>))
        .toList());
  }

  FutureVoid updateDocs(
      {required SampleModel obj,
      required String name,
      required String age}) async {
    try {
      obj = obj.copyWith(name: name, age: age);
      return right(_docs.doc(obj.uid).update(obj.toMap()));
    } on FirebaseException catch (ex) {
      throw ex.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  FutureVoid deleteData({required String uid}) async {
    try {
      return right(_docs.doc(uid).delete());
    } on FirebaseException catch (ex) {
      throw ex.message!;
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}

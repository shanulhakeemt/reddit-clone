import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample1/sample/edit_screen.dart';
import 'package:riverpod_sample1/sample/sample_controller.dart';
import 'package:riverpod_sample1/sample/sample_model.dart';
import 'package:riverpod_sample1/sample/sample_screen2.dart';

final streamProvider = StreamProvider((ref) {
  return ref.read(sampleControllerProvider).getDocuments();
});
class ScreenFirst extends ConsumerWidget {
  const ScreenFirst({super.key});

  void deleteData({required WidgetRef ref,required String uid}){
    ref.read(sampleControllerProvider).deleteData(uid: uid);
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allDocs = ref.watch(streamProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ScreenSecond(),
          ));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sample"),
      ),
      body: allDocs.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              SampleModel user = data.elementAt(index);
              return ListTile(
                title: Text(user.name!),
                subtitle: Text(user.age!),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ScreenEdit(userObj: user),
                    ));
                  },
                  icon: Icon(Icons.edit),
                ),
                onLongPress: () {
                  deleteData(ref: ref, uid: user.uid!);
                },
              );
            },
          );
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => CircularProgressIndicator(),
      ),
    );
  }
}

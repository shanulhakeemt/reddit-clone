import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample1/sample/sample_controller.dart';
import 'package:riverpod_sample1/sample/sample_model.dart';

class ScreenEdit extends ConsumerStatefulWidget {
  ScreenEdit({super.key, required this.userObj});
  SampleModel userObj;

  @override
  ConsumerState createState() => _ScreenEditState();
}

class _ScreenEditState extends ConsumerState<ScreenEdit> {
  void updateDocs(
      {required WidgetRef ref, required String name, required String age}) {
    ref.read(sampleControllerProvider).updateDocs(obj: widget.userObj, name: name, age: age);
  }

  TextEditingController? _nameController;
  TextEditingController? _ageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController(text: widget.userObj.name);
    _ageController = TextEditingController(text: widget.userObj.age);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          updateDocs(ref: ref, name: _nameController!.text, age: _ageController!.text);
        },
        child: Icon(Icons.edit),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Edit"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            style: const TextStyle(color: Colors.black),
            controller: _nameController,
            decoration: const InputDecoration(
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            style: const TextStyle(color: Colors.black),
            controller: _ageController,
            decoration: const InputDecoration(
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}

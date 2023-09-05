import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample1/sample/sample_controller.dart';

class ScreenSecond extends ConsumerWidget {
   ScreenSecond({super.key});

   void addDocuments({required String name,required String age,required WidgetRef ref}){
     ref.read(sampleControllerProvider).addDocuments(name: name, age: age);
   }

TextEditingController _nameController=TextEditingController();
TextEditingController _ageController=TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          addDocuments(name: _nameController.text, age: _ageController.text, ref: ref);
        },
        child: Icon(Icons.done),
      ),
      appBar: AppBar(centerTitle: true,
      title: Text("Add docs"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20,),
          TextFormField(
            style:const TextStyle(
              color: Colors.black
            ),
            controller: _nameController,
            decoration: const InputDecoration(
              fillColor: Colors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20,),
          TextFormField(
            style:const TextStyle(
                color: Colors.black
            ),
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

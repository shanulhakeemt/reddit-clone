import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_sample1/core/common/sign_in_button.dart';
import 'package:riverpod_sample1/core/constants/asset_constants.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          AssetConst.logoPath,
          height: 40,
        ),
        actions: [
          TextButton(
            onPressed: () {

            },
            child: const Text(
              'Skip',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      body: Column(
        children:  [
          SizedBox(
            height: 30,
          ),
        const  Text(
            "Dive into anything",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 0.5),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AssetConst.loginEmotePath,height: 400,),
          ),
          const SizedBox(
            height: 20,
          ),
          const SignInButton(),
        ],
      ),
    );
  }
}

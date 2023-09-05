import 'package:flutter/material.dart';

void showSnackbar(BuildContext context,String text){
  ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar( SnackBar(content:Text(text) ));
}
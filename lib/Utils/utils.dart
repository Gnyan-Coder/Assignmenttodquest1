 import 'package:flutter/material.dart';
 
 void fieldFocusChange(BuildContext context , FocusNode current , FocusNode  nextFocus ){
      current.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    }

bool isEmailValidated(String email) {
  return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
}

bool isValidName(String name){
    return RegExp(r"^[A-Za-z]").hasMatch(name);
  }
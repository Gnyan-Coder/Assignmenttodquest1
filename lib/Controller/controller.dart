

import 'package:assgintodo/view/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Controller{
createNewNoteFirestore(String name,String email,String from,BuildContext context) async{
  await FirebaseFirestore.instance.collection("Users").doc().set(
  {
    "Name" :name,
    "Email" :email,
    "From":from
  }).then((_){
    print("DATA ADDED SUCCESSFULLY");
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
  });
}



Future<List<Map<String, dynamic>>> fetchData(String query) async {
   List<Map<String, dynamic>> userDataList = [];
  userDataList.clear();

  QuerySnapshot querySnapshot;
    print(query);
  if (query.isEmpty) {
    // Fetch all users if the query is empty
    querySnapshot = await FirebaseFirestore.instance.collection("Users").get();
  } else if(query.contains(RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
   print("enter email block");
     querySnapshot = await FirebaseFirestore.instance.collection("Users")
        .where('Email',isEqualTo: query)
        .get();
       
    } else if(query=="organic" || query=='instagram' || query=='fecebook' || query=='friend' || query=='google'){
      print("enter dropdown block");
      querySnapshot = await FirebaseFirestore.instance.collection("Users")
        .where('From', isEqualTo: query)
        .where('From', isEqualTo: query + 'z')
        .get();
        print("data:::"+querySnapshot.docs.length.toString());
    }
    else{
      print("enter name block");
      querySnapshot = await FirebaseFirestore.instance.collection("Users")
        .where('Name', isEqualTo: query)
        .get();
    }
  
  querySnapshot.docs.forEach((doc) {
    Map<String, dynamic> userData = {
      "Name": doc['Name'],
      "Email": doc['Email'],
      "From": doc['From'],
    };
    userDataList.add(userData);
  });
 print("user List value :::"+userDataList.toString());

  return userDataList;
}
}
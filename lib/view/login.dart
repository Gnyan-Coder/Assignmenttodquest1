import 'package:assgintodo/Controller/controller.dart';
import 'package:assgintodo/Utils/utils.dart';
import 'package:assgintodo/Widget/common_buttons.dart';
import 'package:assgintodo/Widget/common_textfiled.dart';
import 'package:assgintodo/Widget/constant.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  final nameFocuseNode = FocusNode();
  final emailFocuseNode = FocusNode();

  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Text(
                    "Welcome To Todquest",
                    style: TextStyle(
                        color: Color(tealColor),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  CommonTextFieldWithBorder(
                    controller: nameController,
                    focusNode: nameFocuseNode,
                    textInputAction: TextInputAction.done,
                    obscure: false,
                    hint: "enter your name",
                    prefix: const Icon(Icons.person),
                    contentPadding: const EdgeInsets.all(10),
                    onFieldSubmitted: (value) {
                      fieldFocusChange(
                          context, nameFocuseNode, emailFocuseNode);
                    },
                    validator: (name) {
                      if (!isValidName(name)) {
                        return "Enter valid name !!";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  CommonTextFieldWithBorder(
                    controller: emailController,
                    focusNode: emailFocuseNode,
                    textInputAction: TextInputAction.done,
                    obscure: false,
                    hint: "Enter your email ",
                    prefix: const Icon(Icons.email),
                    contentPadding: const EdgeInsets.all(10),
                    validator: (email) {
                      if (!isEmailValidated(email)) {
                        return 'Enter valid email !!';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  Text("Where are you comming from ?",style: TextStyle(fontSize: 15),),

                   DropdownButtonFormField<String>(
                  
                    value: _selectedItem,
                    hint: Text('Select the name'),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue!;
                      });
                    },
                    validator: (value){
                      if(value==null){
                        return "select from";
                      }
                      return null;
                    },
                  
                    items: <String>[
                      "facebook",
                      'instagram',
                      'organic',
                      'friend',
                      'google',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    
                    }).toList(),
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                  CommonMaterialButton(
                    borderColor: Colors.black12,
                    color: Colors.teal,
                    radius: BorderRadius.circular(50.0),
                    title: "login",
                    style: const TextStyle(color: Colors.white),
                    horizontal: 20,
                    vertical: 20,
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        Controller().createNewNoteFirestore(nameController.text,
                            emailController.text, _selectedItem!, context);
                      }
                    },
                  ),
                  SizedBox(
                    height: height / 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

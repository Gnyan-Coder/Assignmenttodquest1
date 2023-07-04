import 'package:assgintodo/Controller/controller.dart';
import 'package:assgintodo/Widget/constant.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

 final controller=Controller();

 final searchController=TextEditingController();

   String? _selectedItem;


  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: SafeArea(
      child: Column(
        children: [
          Card(
        elevation: 4,
        shadowColor: Color(tealColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child:Row(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
              child: IconButton(
               icon: Icon(Icons.search), onPressed: () {  },
                ),
            ),
           Expanded(
                child: TextField(
                  controller: searchController,
                  onChanged: (value) {
                setState(() {
                  // searchController.text = value;
                  controller.fetchData(searchController.text);
                });
              },
              decoration:const InputDecoration(
                  hintText: "search by name and email", 
                  border: InputBorder.none
                  ),
            ))
          ],
        ),
      ),
      DropdownButton<String>(
                    value: _selectedItem,
                    hint: Text('Select the name'),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedItem = newValue!;
                        controller.fetchData(_selectedItem!);
                       
                      });
                     
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
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              key: UniqueKey(),
            future: controller.fetchData(searchController.text),
            builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const AspectRatio(
                  aspectRatio: 1,
                  child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                List<Map<String, dynamic>> userDataList = snapshot.data!;
                return ListView.builder(
                  itemCount: userDataList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      child: Card(
                        elevation: 5.0,
                        child: ListTile(
                          title: Text(userDataList[index]['Name'].toString().toUpperCase(),style: const TextStyle(fontWeight: FontWeight.bold),),
                          subtitle: Text(userDataList[index]['Email']),
                          trailing: Text(userDataList[index]["From"],style: const TextStyle(fontWeight: FontWeight.bold),),
                        ),
                      ),
                    );
                  },
                );
              }
            },
            ),
          ),
        ],
      ),
    ),
  );

  }
}
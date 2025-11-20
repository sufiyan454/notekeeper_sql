import 'package:flutter/material.dart';

class NoteDetails extends StatefulWidget {
  final String appBarTitle;
  const NoteDetails({super.key, required this.appBarTitle});

  @override
  State<NoteDetails> createState() => _NoteDetailsState();
}

class _NoteDetailsState extends State<NoteDetails> {

  static const priorities = ['High','Low'];
  String currentPriority = 'High';
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        moveToLastScreen();
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Edit Note',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.white),),
            backgroundColor: Colors.deepPurple,
          leading: IconButton(onPressed: (){
            moveToLastScreen();
          }, icon: Icon(Icons.arrow_back),),
        ),
        body: SafeArea(
          child: ListView(
            children: [
              ListTile(
                title: DropdownButton(
                  value: currentPriority,
                    items: priorities.map((String dropDownStringItem){
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                          child: Text(dropDownStringItem)
                      );
                    }).toList(),
                    onChanged: (valueSelectedByUser){
                      setState(() {
                        currentPriority = valueSelectedByUser!;
                        debugPrint('User selected $currentPriority');
                      });
                    }
                      ),

              ),

              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: TextField(
                  controller: titleController,
                  onChanged: (value) {
                    debugPrint('Something Changed in Description change field');
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:BorderRadius.circular(1),
                    ),
                    labelText: 'Title',
                    hintText: 'Title',

                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: TextField(
                  controller: descriptionController,
                  onChanged: (value){
                    debugPrint('Something Changed in Description change field');
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius:BorderRadius.circular(1),
                    ),
                    labelText: 'Description',
                    hintText: 'Description',

                  ),
                ),
              ),
              SizedBox(
                height: 10,

              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 40,width: 170,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius:BorderRadius.circular(4)
                            )
                        ),
                        onPressed: (){},
                        child: Text('Save')
                    ),
                  ),
                  SizedBox(width: 4,),
                  SizedBox(height: 40,width: 170,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius:BorderRadius.circular(4)
                            )
                        ),
                        onPressed: (){}, child: Text('Delete')
                    ),
                  )
                ],
              ),


            ],



          ),
        ),

      ),
    );

  }
  void moveToLastScreen(){
    Navigator.pop(context);
  }
}


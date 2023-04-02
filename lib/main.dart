import 'dart:math';

import 'package:alert/alert.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int intValue = Random().nextInt(10000)+ 1000;

  String display = "Nothing";
  int a = 0;
  // = Random().nextInt(100) + 50;
  final ed = TextEditingController();
  final key = GlobalKey<FormState>();

  void k (){
    setState(() {
      if(key.currentState!.validate()){
        if (ed.text == intValue.toString()){
          display = "true";
        }else{
          display ="false";
          intValue = Random().nextInt(10000)+ 1000;
        }
      }else{

    showAlertDialog(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Rand Number"),),
        body:Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Text(" Rand Num: $intValue",style: TextStyle
                  (fontWeight: FontWeight.bold, fontSize: 30),),
                Text("Result= $display"),
                SizedBox(height: 40,),
                Form(
                  key: key,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: ed,
                    decoration: InputDecoration(
                      labelText: "Enter Value",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                      )
                    ),

                    validator: (val){
                      if(val!.isEmpty){
                      //  showAlertDialog(context);

                        display ="Nothing";

                        return "Emply Error. Please Write Something";
                      }

                    },
                  ),
                ),
                SizedBox(height: 40,),
               ElevatedButton(
                      onPressed: k,
                   style: ElevatedButton.styleFrom(
                       padding: EdgeInsets.symmetric(
                           horizontal: 40.0, vertical: 20.0),
                       shape: BeveledRectangleBorder(
                           borderRadius: BorderRadius.circular(10.0)),
                       primary: Colors.deepPurple),
                      child: Text(
                        "Click ME"
                      )),
              ],
            ),
          ),
        )
      ),
    );

  }
}
showAlertDialog(BuildContext context) {

  // set up the buttons
  Widget remindButton = TextButton(
    child: Text("Remind me later"),
    onPressed:  () {},
  );
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed:  () {},
  );
  Widget launchButton = TextButton(
    child: Text("Launch missile"),
    onPressed:  () {},
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Notice"),
    content: Text("Launching this missile will destroy the entire universe. Is this what you intended to do?"),
    actions: [
      remindButton,
      cancelButton,
      launchButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

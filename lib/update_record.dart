import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class update_record extends StatefulWidget {
  String name;
  String email;
  String password;

  update_record(this.name,this.password,this.email);

  @override
  State<update_record> createState() => _update_recordState();
}

class _update_recordState extends State<update_record> {
  TextEditingController name=TextEditingController();

  TextEditingController email=TextEditingController();

  TextEditingController password=TextEditingController();

  Future<void> updaterecord() async{
    try{
      String uri="http://10.0.2.2/practice_api/update_record.php";

      var res = await http.post(Uri.parse(uri),body: {
        "name":name.text,
        "email":email.text,
        "password":password.text,
      }
      );
      var response =jsonDecode(res.body);
      if(response["success"]=="true"){
        print("Updated");
      }
      else{
        print("some issue");
      }
    }
    catch(e){
      print(e);
    }
  }
  @override
  void initState() {
    super.initState();
   name.text=widget.name;
   email.text=widget.email;
   password.text=widget.password;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Record'),
      ),
      body: Column(
        children: [
          Container(
          margin: EdgeInsets.all(10),
          child: TextFormField(
            controller:name,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Enter the name')
            ),

          ),
        ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: email,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Enter the Email')
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextFormField(
              controller: password,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Enter the Password')
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: ElevatedButton(onPressed: (){
              updaterecord();
            }, child:Text('Update')
            ),
          ),],
      ),
    );
  }
}

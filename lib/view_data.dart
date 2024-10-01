import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sql_crd_api/update_record.dart';

class ViewData extends StatefulWidget {
  const ViewData({super.key});

  @override
  State<ViewData> createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {
  List userdata = [];
  Future<void> delrecord(String id) async {
    try{
      String uri = "http://10.0.2.2/practice_api/del_record.php";

      var res = await http.post(Uri.parse(uri),body: {"id":id});
      var response =jsonDecode(res.body);
      if(response["success"]=="true"){
        print("Record deleted");
        await getRecord();
      }
      else{
        print("Record does not found");
      }
    }
    catch(e){
      print(e);
    }
  }
  Future<void> getRecord() async {
    String uri = "http://10.0.2.2/practice_api/view_record.php";

    try {
      var response = await http.get(Uri.parse(uri));
      if (response.statusCode == 200) {
        setState(() {
          userdata = jsonDecode(response.body);
        });
      } else {
        print("Failed to load data");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getRecord();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("View Data")),
      body: ListView.builder(
        itemCount: userdata.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>update_record(userdata[index]["username"],userdata[index]["email"],userdata[index]["password"])));
              },
              leading: Icon(CupertinoIcons.heart, color: Colors.red),
              title: Text(userdata[index]["username"]),
              subtitle: Text(userdata[index]["email"]),
              trailing: IconButton(
                icon:Icon(Icons.delete),onPressed: (){
                  delrecord(userdata[index]["uid"]);
              },
              ),
            ),
          );
        },
      ),
    );
  }
}

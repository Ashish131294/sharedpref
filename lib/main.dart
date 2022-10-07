import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(home:sharedpref(),));
}

class sharedpref extends StatefulWidget {
  const sharedpref({Key? key}) : super(key: key);

  @override
  State<sharedpref> createState() => _sharedprefState();
}

class _sharedprefState extends State<sharedpref> {
  int a = 0;
  int h=0;
  int l=0;
  int cnt=0;
  SharedPreferences? prefs;

  getpref() async {
    prefs = await SharedPreferences.getInstance();
  }


  @override
  void initState() {
    getpref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Shared Preferance Demo"),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: () {
              setState(() {
                a--;
              });
            }, child: Text("-")),
          ),
          Text("$a"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: () {
              setState(() {
                a++;
              });
            }, child: Text("+")),
          ),
          /*Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: () async {
              await prefs!.setInt('myval1', a);
             // await prefs!.setInt('myval2', a*10);
            }, child: Text("Set Value")),
          ),*/
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: () async {

              if(a>h || cnt==0)
                {
                  await prefs!.setInt('myval1', a);
                }
              if(a<l || cnt)
              final int a = prefs!.getInt('myval1') ?? 0;
              //final int b = prefs!.getInt('myval2') ?? 10;

              print(a);
            //  print(b);
            }, child: Text("Get Value")),
          ),
        ],),
    );
  }
}

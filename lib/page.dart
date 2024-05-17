import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_handler.dart';

import 'model.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  ApiHandler apiHandler = ApiHandler();
  late List<Employee> data = [];
  void getData() async {
    data = await apiHandler.getUserData();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mainpage'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Text("${data[index].Id}"),
                title: Text("${data[index].Empname}"),
              );
            },
          )
        ],
      ),
    );
  }
}

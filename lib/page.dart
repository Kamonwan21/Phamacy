import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_handler.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'model.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  final FlutterTts flutterTts = FlutterTts();

  textToSpeech(String text, String language) async {
    await flutterTts.setLanguage(language);
    await flutterTts.setPitch(1.0);
    await flutterTts.setVolume(0.5);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
  }

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
      bottomNavigationBar: MaterialButton(
        color: Colors.teal,
        textColor: Colors.white,
        padding: const EdgeInsets.all(30),
        onPressed: getData,
        child: const Text("Refresh"),
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.teal,
                        width: 2.0), // Border color and width
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  ),
                  child: ListTile(
                    leading: Text("${data[index].Id}"),
                    title: Text("${data[index].Empname}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("DOB : ${data[index].BirthDate}"),
                        Text("ชื่อยา : ${data[index].NamePhamacy}"),
                        Text("วิธีใช้ : ${data[index].Instruction}"),
                        Text("Diagnosis : ${data[index].Diagnosis}"),
                        Text("Allergy : ${data[index].Allergy}"),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.volume_up),
                      onPressed: () {
                        textToSpeech(data[index].Empname, "en-US");
                        textToSpeech(data[index].BirthDate, "en-US");
                        textToSpeech(data[index].NamePhamacy, "th-TH");
                        textToSpeech(data[index].Instruction, "th-TH");
                        textToSpeech(data[index].Diagnosis, "en-US");
                        textToSpeech(data[index].Allergy, "en-US");
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

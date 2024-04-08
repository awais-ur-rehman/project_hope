import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({super.key});

  @override
  _ComplaintScreenState createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {

  TextEditingController animal_type = TextEditingController();
  TextEditingController street_no = TextEditingController();
  TextEditingController region = TextEditingController();
  TextEditingController description = TextEditingController();

  Future<void> insertRecord() async {
    if (animal_type.text.isNotEmpty && street_no.text.isNotEmpty && region.text.isNotEmpty && description.text.isNotEmpty) {
      try {
        String url = "http://101.50.108.3/connectiondb/insert_complaint.php";  // Use your local IP address here
        var res = await http.post(Uri.parse(url), body: {
          "type_of_animal": animal_type.text,
          "region": region.text,
          "Street_num": street_no.text,
          "Description_the_problem": description.text,
        });
        print('Response status: ${res.statusCode}');
        print('Response body: ${res.body}');

        var response = jsonDecode(res.body);
        if (response["success"] == 'true') {
          print("Record Inserted");
        } else {
          print("Failed to insert record");
        }
      } catch (e) {
        print('Error: $e');
      }
    } else {
      print("Please fill all fields.");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File a Complaint'),
        elevation: 0,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: [
              GestureDetector(
                child: Container(
                  height: 150,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Text('UPLOAD IMAGE'),
                  ),
                ),
              ),
              const SizedBox(height: 5,),
              TextFormField(
                controller: animal_type,
                decoration: const InputDecoration(
                    labelText: 'Animal Type',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 5,),
              TextFormField(
                controller: street_no,
                decoration: const InputDecoration(labelText: 'Street No.', border: OutlineInputBorder(),),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 5,),
              TextFormField(
                controller: region,
                decoration: const InputDecoration(labelText: 'Region/City', border: OutlineInputBorder(),),

              ),
              const SizedBox(height: 5,),
              TextFormField(
                controller: description,
                decoration: const InputDecoration(labelText: 'Your Complaint', border: OutlineInputBorder(),),

                maxLines: 5,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: (){
                  insertRecord();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.pinkAccent, // Button text color
                  minimumSize: const Size(double.infinity, 50), // Button size
                  textStyle: const TextStyle(fontSize: 18), // Text style
                ),
                child: const Text('SEND COMPLAINT'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


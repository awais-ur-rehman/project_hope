import 'package:flutter/material.dart';
// If you have a separate file for the treatment request model and services, import them here

class TreatingAnimalScreen extends StatefulWidget {
  @override
  _TreatingAnimalScreenState createState() => _TreatingAnimalScreenState();
}

class _TreatingAnimalScreenState extends State<TreatingAnimalScreen> {
  final _formKey = GlobalKey<FormState>();
  String animalType = '';
  String condition = '';
  String location = '';
  String additionalDetails = '';

  void _submitTreatmentRequest() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      print('Animal Type: $animalType');
      print('Condition: $condition');
      print('Location: $location');
      print('Additional Details: $additionalDetails');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request Animal Treatment'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Animal Type',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) {
                  animalType = value ?? '';
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the animal type';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Condition',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) {
                  condition = value ?? '';
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please describe the condition';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Location',
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) {
                  location = value ?? '';
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the location';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Additional Details',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
                onSaved: (value) {
                  additionalDetails = value ?? '';
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _submitTreatmentRequest,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.pinkAccent, // Button text color
                  minimumSize: const Size(double.infinity, 50), // Button size
                  textStyle: const TextStyle(fontSize: 18), // Text style
                ),
                child: const Text('Submit Request'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

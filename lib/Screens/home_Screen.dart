import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to the ComplaintScreen when the button is pressed
                Navigator.of(context).pushNamed('/ComplaintScreen');
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.pinkAccent, minimumSize: const Size(300, 200), // Text color when button is in a pressed state
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
              ),
              child: const Text(
                "Register a Complaint",
                style: TextStyle(
                  color: Colors.white, // Text color
                  fontSize: 20, // Larger font size
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the ComplaintScreen when the button is pressed
                Navigator.of(context).pushNamed('/TreatmentScreen');
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.pinkAccent, minimumSize: const Size(300, 200), // Text color when button is in a pressed state
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
              ),
              child: const Text(
                "Treat an Animal",
                style: TextStyle(
                  color: Colors.white, // Text color
                  fontSize: 20, // Larger font size
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

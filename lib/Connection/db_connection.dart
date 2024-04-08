import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/complaint_model.dart';

class DatabaseService {
  final String apiUrl = "http://yourserver.com/insert_complaint.php";

  Future<void> insertComplaint(ComplaintModel complaint) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: complaint.toMap(),
      );

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        if (result['status'] == 'success') {
          // Complaint successfully saved to database
        } else {
          print("Failure 1");
        }
      } else {
        print("Server Error");
      }
    } catch (e) {
      print("Network Erro");
    }
  }
}

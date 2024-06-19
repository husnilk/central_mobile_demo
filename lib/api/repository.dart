import 'dart:convert';

import 'package:central_mobile/models/lecturer.dart';
import 'package:central_mobile/models/login.dart';
import 'package:http/http.dart' as http;

class Repository {
  final baseUrl = 'http://192.168.8.123:8000';
  var token = null;

  Future<Login> login(String email, String password) async {
    final response = await http.post(Uri.parse('$baseUrl/api/login'),
        body: {'email': email, 'password': password});
    // API call to login
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      var auth = Login.fromJson(data['data']['authorization']);
      return auth;
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<Map<String, dynamic>> getLecturers() async {
    final response = await http.get(Uri.parse('${baseUrl}api/lecturers'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<Lecturer> lecturers = data['data']
          .map<Lecturer>((lecturer) => Lecturer.fromJson(lecturer))
          .toList();
      return {
        'status': 'success',
        'data': lecturers,
      };
    } else {
      throw Exception('Failed to load lecturers');
    }
  }

  Future<bool> addLecturer(Lecturer lecturer) async {
    final response = await http.post(
      Uri.parse('${baseUrl}api/lecturers'),
      body: json.encode(lecturer.toJson()),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateLecturer(Lecturer lecturer) async {
    final response = await http.put(
      Uri.parse('${baseUrl}api/lecturers/${lecturer.id}'),
      body: json.encode(lecturer.toJson()),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteLecturer(String id) async {
    final response = await http.delete(
      Uri.parse('${baseUrl}api/lecturers/$id'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}

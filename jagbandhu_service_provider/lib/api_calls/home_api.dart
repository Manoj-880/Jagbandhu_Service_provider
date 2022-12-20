import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:jagbandhu_service_provider/Constants/api.dart';
import 'package:jagbandhu_service_provider/models/globalParams.dart';

// ignore: non_constant_identifier_names
Future<String> homeapi() async {
  // ignore: non_constant_identifier_names, unused_local_variable

  final response = await http.get(Uri.parse('http://localhost:3000/home'));
  print(response.body);

  return response.body;
}

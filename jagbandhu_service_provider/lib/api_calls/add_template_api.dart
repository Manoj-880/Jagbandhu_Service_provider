import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:jagbandhu_service_provider/Constants/api.dart';
import 'package:jagbandhu_service_provider/models/globalParams.dart';
import 'package:path/path.dart';
import 'package:http_parser/http_parser.dart';

// ignore: non_constant_identifier_names
Future addtemplateapi(
  pId,
  category,
  title,
  description,
  price,
  Image,
) async {
  try {
    // ignore: non_constant_identifier_names, unused_local_variable

    final response = http.MultipartRequest(
        'POST',
        Uri.parse(
            '${Apilink.ipAddress}/appaddtemplate?pId=$pId&category=$category&title=$title&price=$price&description=$description&count=1&image=$Image'));
    var multipartFile = (Image == '')
        ? null
        : await http.MultipartFile.fromPath('image', Image.path,
            contentType: MediaType('image', 'jpeg'),
            filename: basename(Image.path));
    (Image == '') ? null : response.files.add(multipartFile!);
    var res = await response.send();
    var output = await res.stream.bytesToString();
    print(output);
  } catch (e) {
    print(e);
  }
}

// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ShoppingController with ChangeNotifier {
  String selectedCategory = 'Category';

  var items = [
    'Category',
    'Lorem Ipsum',
    'Lorem Ipsum 2',
    'Lorem Ipsum 3',
    'Lorem Ipsum 4',
  ];

  late WebSocketChannel channel;

  ShoppingController() {
    channel = WebSocketChannel.connect(
      Uri.parse('wss://echo.websocket.events'),
    );

    channel.stream.listen((event) {
      log('Listening to Socket');
      log(event.toString());
    });
  }
  updateSelection(String? value) {
    selectedCategory = value!;
    notifyListeners();
  }

  List<XFile>? files = [];
  selectFiles() async {
    final ImagePicker picker = ImagePicker();

    files = await picker.pickMultiImage();

    log(files.toString());
  }

  sendRequest(String? title, String? description, String? tags) async {
    final tagList = tags!.split(',');
    log(tagList.toString());
    var postUri = Uri.parse("https://fluter-test-apis.herokuapp.com/api/posts");

    http.MultipartRequest request = http.MultipartRequest("POST", postUri);
    for (var i = 0; i < files!.length; i++) {
      final File file = File(files![i].path);
      http.MultipartFile multipartFile =
          await http.MultipartFile.fromPath('myfiles', file.path);

      request.files.add(multipartFile);
    }

    request.fields['title'] = title!;
    request.fields['description'] = description!;
    request.fields['tags'] = tagList.toString();
    http.StreamedResponse response = await request.send();

    print('Image Post Request: ${response.statusCode}');
    print('Image Post Request: ${response.stream.first}');
  }

  sendRequest2() async {
    log('Calling');
    // var url = Uri.parse('https://fluter-test-apis.herokuapp.com/api/logs');

    final response = await http.post(
      Uri.parse('https://fluter-test-apis.herokuapp.com/api/logs'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'screen_name': 'test',
        'time': DateFormat.jms().format(DateTime.now()),
        'os_desc': 'Flutter Test from Simulatore'
      }),
    );
    log('Response status: ${response.statusCode}');
    log('Response body: ${response.body}');
  }
}

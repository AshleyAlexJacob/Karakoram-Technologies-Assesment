import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k2x_assesment/post_request_task/post_request_task.dart';

import '../root/root.dart';

class TaskSelect extends StatelessWidget {
  const TaskSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
          child: ListView(
        children: [
          TextButton(
              onPressed: () {
                Get.to(() => const Root());
              },
              child: const Text('UI Task')),
          TextButton(
              onPressed: () {
                Get.to(() => const PostRequestTask());
              },
              child: const Text('Post Request Task')),
        ],
      )),
    );
  }
}

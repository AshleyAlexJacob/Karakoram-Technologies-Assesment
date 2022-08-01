import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k2x_assesment/shopping/shopping_controller.dart';
import 'package:k2x_assesment/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class PostRequestTask extends StatefulWidget {
  const PostRequestTask({Key? key}) : super(key: key);

  @override
  State<PostRequestTask> createState() => _PostRequestTaskState();
}

class _PostRequestTaskState extends State<PostRequestTask> {
  final TextEditingController title = TextEditingController();

  final TextEditingController description = TextEditingController();

  final TextEditingController tags = TextEditingController();

  startTimer() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      context.read<ShoppingController>().sendRequest2();
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.teal,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Consumer<ShoppingController>(builder: (context, controller, child) {
        return SafeArea(
            child: ListView(
          children: [
            const Text('Post Request Task'),
            CustomTextField(
              controller: title,
              text: 'Title',
            ),
            CustomTextField(
              controller: description,
              text: 'Description',
            ),
            CustomTextField(
              controller: tags,
              text: 'Tags seperated by comma',
            ),

            InkWell(
              onTap: () {
                controller.selectFiles();
              },
              child: Container(
                height: 30,
                // width: 50
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(12)),
                child: const Center(
                    child: Text(
                  'Select Files',
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),

            InkWell(
              onTap: () {
                controller.sendRequest(title.text, description.text, tags.text);
                // controller.sendRequest2();
              },
              child: Container(
                height: 30,
                // width: 50
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(12)),
                child: const Center(
                    child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
            // TextButton(
            //     onPressed: () {
            //       Get.to(() => const Root());
            //     },
            //     child: const Text('UI Task')),
            // TextButton(onPressed: () {}, child: const Text('Post Request Task')),
          ],
        ));
      }),
    );
  }
}

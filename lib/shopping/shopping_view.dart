// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:k2x_assesment/post_request_task/post_request_task.dart';
import 'package:k2x_assesment/shopping/products/products_view.dart';
import 'package:k2x_assesment/tasks/task_select.dart';
import 'package:k2x_assesment/widgets/custom_text_field.dart';

class ShoppingView extends StatelessWidget {
  ShoppingView({Key? key}) : super(key: key);
  final TextEditingController editingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => const PostRequestTask());
          },
          child: const Icon(
            FontAwesomeIcons.plus,
            size: 30,
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          elevation: 0.0,
          actions: [
            InkWell(
              child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: const CircleAvatar(
                    backgroundColor: Colors.teal,
                    child: Center(
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                  )),
            ),
          ],
          centerTitle: false,
          title: const Text(
            'Shopping',
            style: TextStyle(color: Colors.teal),
          ),
          leading: InkWell(
            onTap: () {
              Get.off(() => const TaskSelect());
            },
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.teal,
            ),
          ),
        ),
        body: SafeArea(
            child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                      child: CustomTextField(controller: editingController)),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 45,
                      width: 45,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(14)),
                      child: const Icon(
                        FontAwesomeIcons.tags,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const TabBar(
                labelColor: Colors.teal,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    text: 'Products',
                  ),
                  Tab(
                    text: 'Services',
                  ),
                ],
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    ProductsView(),
                    ProductsView(),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}

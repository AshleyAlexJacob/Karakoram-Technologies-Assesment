// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextField extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final TextEditingController controller;
  const CustomTextField(
      {Key? key, this.text, this.icon, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.grey.shade300, borderRadius: BorderRadius.circular(12)),
      child: Center(
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
              suffixIcon: Icon(
                icon ?? FontAwesomeIcons.search,
                size: 15,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              hintText: text ?? 'Search',
              hintStyle: TextStyle(color: Colors.grey.shade700),
              border: InputBorder.none,
              enabledBorder: InputBorder.none),
        ),
      ),
    );
  }
}

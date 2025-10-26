import 'package:flutter/material.dart';

class ReviewTextField extends StatelessWidget {
  const ReviewTextField({
    super.key,
    required TextEditingController firstNameController,
    required this.maxline,
    required this.hintText
  }) : _firstNameController = firstNameController;

  final TextEditingController _firstNameController;
  final int maxline;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxline,
      controller: _firstNameController,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontWeight: FontWeight.w400,color: Colors.grey),
          contentPadding: EdgeInsets.all(10),
          border: OutlineInputBorder(
          )
      ),
    );
  }
}

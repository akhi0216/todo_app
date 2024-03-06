// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class CustomNote extends StatefulWidget {
  const CustomNote({super.key, required this.title, required this.des});
  final String title;
  final String des;
  @override
  State<CustomNote> createState() => _CustomNoteState();
}

class _CustomNoteState extends State<CustomNote> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Text(
            widget.title,
            style: TextStyle(color: Colors.black),
          ),
          Text(widget.des, style: TextStyle(color: Colors.black))
        ],
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:todo_app/view/home_screen/widgets/custombottomsheet.dart';
import 'package:todo_app/view/home_screen/widgets/customnote.dart';

import '../../controller/.homepagecontroller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Homepagecontroller saveobj = Homepagecontroller();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: ListView.separated(
          shrinkWrap: true,
          reverse: true,
          itemBuilder: (context, index) {
            return CustomNote(
              title: saveobj.noteslist[index]["title"],
              des: saveobj.noteslist[index]["des"],
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: saveobj.noteslist.length),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return CustomBottom(
                onSavepressed: () {
                  saveobj.addData();

                  setState(() {});
                  // Homepagecontroller.clearData();
                  //
                  Navigator.pop(context);
                },
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        mini: true,
      ),
    );
  }
}

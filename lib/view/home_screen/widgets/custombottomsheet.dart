// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_app/controller/.homepagecontroller.dart';

class CustomBottom extends StatefulWidget {
  const CustomBottom({super.key, this.onSavepressed});

  final void Function()? onSavepressed;
  @override
  State<CustomBottom> createState() => _CustomBottomState();
}

class _CustomBottomState extends State<CustomBottom> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  Homepagecontroller valobj = Homepagecontroller();
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, bottomsetstate) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          padding: EdgeInsets.all(13),
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(11))),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 1st
                TextFormField(
                  controller: Homepagecontroller.titlecontroller,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    label: Text(
                      "Title",
                      style: TextStyle(color: Colors.black),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(7),
                      ),
                    ),
                  ),

                  //  validation for not saving without entering
                  validator: (value) {
                    if (Homepagecontroller.titlecontroller.text.isNotEmpty) {
                      return null;
                    } else {
                      return "enter a valid title";
                    }
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  validator: (value) {
                    // if (valobj.noteslist.isNotEmpty)
                    if (Homepagecontroller.descontroller.text.isNotEmpty) {
                      return null;
                    } else {
                      return "enter a valid des";
                    }
                  },
                  controller: Homepagecontroller.descontroller,
                  maxLines: 3,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    label: Text(
                      "Description",
                      style: TextStyle(color: Colors.black),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(7),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                // TextFormField(
                //   readOnly: true,
                //   validator: (value) {
                //     // if (valobj.noteslist.isNotEmpty)
                //     if (Homepagecontroller.datecontroller.text.isNotEmpty) {
                //       return null;
                //     } else {
                //       return "enter a valid date";
                //     }
                //   },
                //   controller: Homepagecontroller.datecontroller,
                //   decoration: InputDecoration(
                //     fillColor: Colors.white,
                //     filled: true,
                //     suffixIcon: InkWell(
                //         onTap: () async {
                //           final DateTime? pickedDate = await showDatePicker(
                //             context: context,
                //             firstDate: DateTime(2000),
                //             lastDate: DateTime(2025),
                //           );
                //           if (pickedDate != null) {
                //             String formateddate =
                //                 DateFormat("dd/MM/yy").format(pickedDate);
                //             Homepagecontroller.datecontroller.text =
                //                 formateddate;
                //           }
                //         },
                //         child: Icon(Icons.calendar_month_outlined)),
                //     label: Text(
                //       "Date",
                //       style: TextStyle(color: Colors.black),
                //     ),
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(
                //         Radius.circular(7),
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(height: 15),

                // SizedBox(
                //     height: 120,
                //     child: ListView.separated(
                //         shrinkWrap: true,
                //         scrollDirection: Axis.horizontal,
                //         itemBuilder: (context, index) {
                //           return InkWell(
                //             onTap: () {
                //               print(index);
                //               // selectedindex = index;
                //               Homepagecontroller obj = Homepagecontroller();
                //               obj.onColorselction(colorslist[index]);
                //               bottomsetstate(() {
                //                 // selectedindex = index;
                //               });
                //             },
                //             child: Center(
                //               child: Container(
                //                 height: index == selectedindex ? 90 : 50,
                //                 width: index == selectedindex ? 90 : 50,
                //                 decoration: BoxDecoration(
                //                     border: selectedindex == index
                //                         ? Border.all(
                //                             width: 2, color: Colors.red)
                //                         : null,
                //                     color: colorslist[index]),
                //               ),
                //             ),
                //           );
                //         },
                //         separatorBuilder: (context, index) =>
                //             SizedBox(width: 5),
                //         itemCount: 4)),

                SizedBox(height: 10),

                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          if (_formkey.currentState!.validate()) {
                            widget.onSavepressed!();
                          }

                          // widget.onSavepressed!();
                          // to cleardata
                          // Homepagecontroller.clearData();
                          // Navigator.pop(context);
                          //
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              border:
                                  Border.all(color: Colors.black, width: 2)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Center(
                            child: Text(
                              "save",

                              // widget.isedit ? "update" : "save",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          // Homepagecontroller.clearData();
                          //
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              border:
                                  Border.all(color: Colors.black, width: 2)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Center(
                            child: Text(
                              "cancel",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

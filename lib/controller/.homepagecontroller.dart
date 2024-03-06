class Homepagecontroller {
  static TextEditingController titlecontroller = TextEditingController();
  static TextEditingController descontroller = TextEditingController();
  List noteslist = [];
  void addData() {
    noteslist.add({
      "title": titlecontroller.text,
      "des": descontroller.text,
    });
  }
}

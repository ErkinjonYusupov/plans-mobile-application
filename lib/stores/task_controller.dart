import 'package:todo_app/config/imports.dart';

class TaskController extends GetxController {
  List<String> catigories = [
    "Musiqa",
    "Kino",
    "Sport",
    "Xarid",
    "Coding",
    "Mehmon",
    "Kitob"
  ];

  List<String> hours = [];
  List<String> minutes = [];

  autoSet(int count, List list) {
    for (var i = 0; i < count; i++) {
      if (i < 10) {
        list.add("0$i");
      } else {
        list.add(i.toString());
      }
    }
  }

  @override
  void onInit() {
    autoSet(24, hours);
    autoSet(60, minutes);
    super.onInit();
  }
}

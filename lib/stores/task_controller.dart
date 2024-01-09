import 'package:todo_app/config/imports.dart';

class TaskController extends GetxController {
  List<String> catigories = [
    "Musiqa",
    "Kino",
    "Sport",
    "Xarid",
    "Coding",
    "Mehmon",
    "Kitoblar"
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

  String startTime = "00:00";
  String endTime = "00:00";
  String selectedCategory = '';

  saveTime(bool start, time) {
    if (start) {
      startTime = time;
    } else {
      endTime = time;
    }
    update();
    Get.back();
  }

  setCategory(String category){
    selectedCategory=category;
    update();
  }
}

import 'package:todo_app/config/imports.dart';

class TaskController extends GetxController {
  bool loading = false;
  MyDb myDb = MyDb();

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

  String startTime = "06:00";
  String endTime = "18:00";
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

  setCategory(String category) {
    selectedCategory = category;
    update();
  }

  List<CategoryModel> categories = [];

  Future getCategories() async {
    loading = true;
    update();
    await myDb.open();
    Future.delayed(const Duration(seconds: 1), () async {
      var res =
          await myDb.db!.rawQuery('SELECT * FROM category ORDER BY id DESC');
      categories = categoryFromJson(res.toList());
      loading = false;
      update();
    });
  }
}

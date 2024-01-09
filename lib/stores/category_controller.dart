import 'package:todo_app/config/db.dart';
import 'package:todo_app/config/imports.dart';

class CategoryController extends GetxController {
  TextEditingController title = TextEditingController();

  Future add() async {
    try {
      if (title.text.trim().isEmpty) {
        Get.snackbar("Error", "Kategoriya nomi kiritilmagan");
        return;
      }
      await MyDb().open();
      await MyDb()
          .db
          ?.rawInsert("INSERT INTO category (title) VALUES (?);", [title.text]);
      title.text = '';
      Get.back();
      Get.snackbar("Sucsess", "Yangi kategoriya yaratildi");
    } catch (err) {
      print(err);
    }
  }
}

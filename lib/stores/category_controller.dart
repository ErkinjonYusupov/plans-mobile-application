import 'package:todo_app/config/imports.dart';

class CategoryController extends GetxController {
  TextEditingController title = TextEditingController();
  bool loading = false;
  MyDb myDb = MyDb();

  Future add() async {
    try {
      if (title.text.trim().isEmpty) {
        Get.snackbar("Error", "Kategoriya nomi kiritilmagan");
        return;
      }
      await myDb.open();
      await myDb.db
          ?.rawInsert("INSERT INTO category(title) VALUES (?);", [title.text]);
      title.text = '';
      Get.back();
      Get.snackbar("Sucsess", "Yangi kategoriya yaratildi",
          duration: const Duration(seconds: 1));
      getCategories();
    } catch (err) {
      print(err);
    }
  }

  Future edit(int id) async {
    try {
      if (title.text.trim().isEmpty) {
        Get.snackbar("Error", "Kategoriya nomi kiritilmagan");
        return;
      }
      await myDb.open();
      await myDb.db?.rawUpdate(
          "UPDATE category SET title = ? WHERE id = ?", [title.text, id]);
      Get.back();
      Get.snackbar("Sucsess", "Yangi kategoriya tahrirlandi",
          duration: const Duration(seconds: 1));
      getCategories();
    } catch (err) {
      print(err);
    }
  }

  Future delete(int id) async {
    try {
      await myDb.open();
      Get.back();
      await myDb.db?.rawDelete("delete from category where id = ?", [id]);
      Get.back();
      Get.snackbar("Sucsess", "Kategoriya o'chirildi", duration: const Duration(seconds: 1));
      getCategories();
    } catch (err) {
      print(err);
    }
  }

  List categories = [];

  Future getCategories() async {
    loading = true;
    update();
    await myDb.open();
    Future.delayed(const Duration(seconds: 1), () async {
      var res =
          await myDb.db!.rawQuery('SELECT * FROM category ORDER BY id DESC');
      categories = res.toList();
      loading = false;
      update();
    });
  }
}

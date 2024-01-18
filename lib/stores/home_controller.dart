import 'package:todo_app/config/imports.dart';

class HomeController extends GetxController {
  bool loading = false;
  MyDb myDb = MyDb();
  List tasks = [];
  Future<void> fetchTasks() async {
    try {
      loading=true;
      update();
      await myDb.open();
      Future.delayed(const Duration(seconds: 1), () async {
        var res =
            await myDb.db!.rawQuery('SELECT * FROM task ORDER BY id DESC');
        tasks = res.toList();
        loading = false;
        update();
      });
    } catch (err) {
      print(err);
    }
  }


}

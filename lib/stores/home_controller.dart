import 'package:todo_app/config/imports.dart';

class HomeController extends GetxController {
  bool loading = false;
  MyDb myDb = MyDb();

  List<TaskModel> tasks = [];

  Future<void> fetchTasks() async {
    try {
      loading = true;
      update();
      await myDb.open();
      await Future.delayed(const Duration(seconds: 1), () async {
        var res =
            await myDb.db!.rawQuery('SELECT * FROM task ORDER BY id DESC');
        tasks = taskListFromJson(res.toList());
      });
    } catch (err) {
      print(err);
    } finally {
      loading = false;
      update();
    }
  }

  List<int> selectedTask = [];

  bool isHaveTaskId(int id) {
    return selectedTask.indexWhere((element) => element == id) > -1;
  }

  void addOrRemoweTaskId(int id) {
    var index = selectedTask.indexWhere((element) => element == id);
    if (index > -1) {
      selectedTask.removeAt(index);
    } else {
      selectedTask.add(id);
    }
    update();
  }

  Future<void> changeStatus(String value) async {
    if (loading) return;
    Get.back();
    try {
      loading = true;
      update();
      await myDb.open();
      await Future.delayed(const Duration(seconds: 1), () async {
        await myDb.db!.update('task', {'status': value},
            where: 'id', whereArgs: selectedTask);
      });
      selectedTask = [];
      await fetchTasks();
    } catch (err) {
      print(err);
    }
  }
}

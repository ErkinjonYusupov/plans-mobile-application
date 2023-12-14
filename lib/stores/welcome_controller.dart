import 'package:todo_app/config/imports.dart';

class WelcomeController extends GetxController {
  PageController pageController = PageController(initialPage: 0);

  int currentPage = 0;

  List<Map> users = [
    {"id": 1, 'name': "Erkinjon", "age": 33}, //0. //user
    {"id": 2, 'name': "Azizbek", "age": 33}, //1
    {"id": 3, 'name': "Boburjon", "age": 33}, //2
    {"id": 4, 'name': "Alixon", "age": 33}, //3
  ];

  Map newUser = {"id": 5, "name": "Polonchi", "age": 22};

  List<Map> newUsers = [
    {"id": 5, "name": "Polonchi", "age": 22},
    {"id": 6, "name": "Polonchi Pistonchi", "age": 22},
  ];

  replaceUser(int id) {
    int index = users.indexWhere((user) => user['id'] == id);
    if (index > -1) {
      users.removeAt(index);
      users.insert(index, newUser);
    }
  }

  editUser(int id) {
    int index = users.indexWhere((user) => user['id'] == id);
    if (index > -1) {
      users[index]['name'] = "Dasturchi";
    }
  }

  addUsers() {
    users.addAll(newUsers);
  }

  addUser() {
    users.add(newUser);
  }

  removeUserFromId(int id) {
    int index = users.indexWhere((user) =>
        user['id'] == id); //topa olmasa -1, topsa 0 yoki undan katta son
    if (index > -1) {
      users.removeAt(index); // list ichidan uchirib yuboradi
    }
  }

  List<Widget> pages = [
    const StepOne(),
    const StepTwo(),
    const StepThree(),
  ];

  setPageIndex(int value) {
    currentPage = value;
    update();
  }

  back() {
    if (currentPage == 0) return;
    pageController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  next() {
    if (currentPage == 2) {
      Get.off(() => const Home());
      return;
    }
    pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }
}

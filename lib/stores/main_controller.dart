import 'package:todo_app/config/imports.dart';

class MainController extends GetxController {
  int currentPageId = 1;

  List menus = [
    {"id": 1, "icon": AppIcons.home, "page": const Home()},
    {"id": 2, "icon": AppIcons.calendar, "page": const CalendarPage()},
    {"id": 3, "icon": AppIcons.add, "page": const AddTask()},
    {"id": 4, "icon": AppIcons.bal, "page": const NotificationPage()},
    {"id": 5, "icon": AppIcons.profile, "page": const ProfilePage()},
  ];

  setWidget(int id) {
    currentPageId = id;
    update();
  }

  currentWidget() {
    var index = menus.indexWhere((element) => element['id']==currentPageId);
    if(index > -1){
      return menus[index]['page'];
    }
  }
}

import 'package:todo_app/config/imports.dart';
import 'package:todo_app/stores/home_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeController controller = Get.put(HomeController());
  @override
  void initState() {
    controller.fetchTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: 
              controller.loading ? Center(child: const CircularProgressIndicator()):
              Column(children: [])),
        );
      },
    );
  }
}

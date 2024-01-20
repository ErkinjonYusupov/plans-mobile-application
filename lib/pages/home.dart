import 'package:todo_app/components/default/confirm_dilaog.dart';
import 'package:todo_app/config/imports.dart';

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
              constraints: const BoxConstraints(maxWidth: 500),
              child: controller.loading
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Text("Vazifalar ro'yhati",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.blue9)),
                            const Spacer(),
                            controller.selectedTask.isEmpty
                                ? Container()
                                : Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Get.dialog(ConfirmDialog(
                                                text:
                                                    "Siz rostan ushbu vzifalarni bajarganingizni tasdiqlaysimi?",
                                                title: "Diqqat",
                                                onTap: () {
                                                  controller.changeStatus("Bajarilgan");
                                                }));
                                          },
                                          icon:
                                              const Icon(Icons.check_rounded)),
                                      IconButton(
                                          onPressed: () {
                                            Get.dialog(ConfirmDialog(
                                                text:
                                                    "Siz rostan ushbu vzifalarni o'chirishni tasdiqlaysimi?",
                                                title: "Diqqat",
                                                onTap: () {
                                                  controller.changeStatus("O'chirilgan");
                                                }));
                                          },
                                          icon: const Icon(Icons.delete)),
                                    ],
                                  )
                          ],
                        ),
                        const SizedBox(height: 16),
                        Column(
                            children:
                                List.generate(controller.tasks.length, (index) {
                          var item = controller.tasks[index];
                          return GestureDetector(
                              onLongPress: () {
                                if (controller.selectedTask.isEmpty) {
                                  controller.addOrRemoweTaskId(item.id);
                                }
                              },
                              onTap: () {
                                if (controller.selectedTask.isNotEmpty) {
                                  controller.addOrRemoweTaskId(item.id);
                                }
                              },
                              child: TaskCard(
                                item: item,
                                isSelect: controller.isHaveTaskId(item.id),
                              ));
                        })),
                      ],
                    )),
        );
      },
    );
  }
}

import 'package:todo_app/config/imports.dart';
import 'package:todo_app/stores/task_controller.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TaskController controller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(
      builder: (controller) {
        return Stack(
          children: [
            const Positioned(top: -100, child: CiricleContainer()),
            const Positioned(top: -30, left: -60, child: CiricleContainer()),
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(children: [
                    const Spacer(),
                    Text("Create a Task",
                        style: TextStyle(
                            color: AppColors.blue5,
                            fontWeight: FontWeight.w600,
                            fontSize: 18)),
                    const Spacer(),
                    SvgPicture.asset(AppIcons.search)
                  ]),
                  //task title
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 30),
                    child: TextField(
                      cursorColor: AppColors.blue5,
                      style: TextStyle(
                          color: AppColors.blue7,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                      decoration: InputDecoration(
                        label: Text('Task title',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.blue5)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.blue, width: 1.0)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.blue, width: 2.0)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  //task description
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [AppColors.blue, AppColors.blue5])),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          maxLines: 3,
                          cursorColor: AppColors.white,
                          style: TextStyle(
                              color: AppColors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w800),
                          decoration: InputDecoration(
                            label: Text(
                              'Description',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.white, width: 1.0),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.white, width: 2.0),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text("Category",
                            style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w600)),
                        const SizedBox(height: 15),
                        Wrap(
                          spacing: 20,
                          runSpacing: 16,
                          children: List.generate(controller.catigories.length,
                              (index) {
                            var item = controller.catigories[index];
                            return InkWell(
                                onTap: () {
                                  print('object');
                                },
                                child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 23, vertical: 10),
                                    decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.blue7),
                                    )));
                          }),
                        ),
                        const SizedBox(height: 15),
                        Button(onTap: () {})
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class CiricleContainer extends StatelessWidget {
  const CiricleContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
          color: AppColors.blue3, borderRadius: BorderRadius.circular(100)),
    );
  }
}

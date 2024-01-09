import 'package:todo_app/config/imports.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  CategoryController controller = Get.put(CategoryController());


  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                const Spacer(),
                Text("Kategoriyalar",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blue5)),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Get.dialog(AddCategoryDialog(
                        textController: controller.title,
                        onTap: () {
                          controller.add();
                        }));
                  },
                  child: Icon(Icons.add_circle_outline_outlined,
                      color: AppColors.blue5, size: 30),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.gray6),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                const Text("Musiqa", style: TextStyle(fontSize: 18)),
                const Spacer(),
                PopupMenuButton(
                  icon: const Icon(Icons.more_vert_outlined),
                  color: Colors.white,
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 1,
                      child: Row(
                        children: [
                          Icon(Icons.edit, size: 20, color: Colors.green),
                          SizedBox(width: 10),
                          Text(
                            "Tahrirlash",
                            style: TextStyle(color: Colors.green),
                          )
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 1,
                      child: Row(
                        children: [
                          Icon(Icons.delete, size: 20, color: Colors.red),
                          SizedBox(width: 10),
                          Text(
                            "O'chirish",
                            style: TextStyle(color: Colors.red),
                          )
                        ],
                      ),
                    ),
                  ],
                  elevation: 2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AddCategoryDialog extends StatelessWidget {
  const AddCategoryDialog(
      {super.key, required this.textController, required this.onTap});

  final TextEditingController textController;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Kategoriya qo'shish",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          const SizedBox(height: 15),
          Input(
            hintText: "Kategoriya nomi",
            controller: textController,
          ),
          const SizedBox(height: 15),
          Button(
            onTap: () {
              onTap();
            },
            text: "Qo'shish",
          )
        ],
      ),
    );
  }
}

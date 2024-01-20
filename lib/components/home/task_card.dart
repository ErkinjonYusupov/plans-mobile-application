import 'package:todo_app/config/imports.dart';

class TaskCard extends StatelessWidget {
  TaskCard({
    super.key,
    required this.item,
    this.isSelect = false,
  });

  final TaskModel item;
  final bool isSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 10),
      width: 500,
      decoration: BoxDecoration(
          color: isSelect ? AppColors.blue3 : null,
          border: Border.all(color: AppColors.blue),
          borderRadius: BorderRadius.circular(14)),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
            margin: const EdgeInsets.only(top: 8),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
                color: AppColors.blue5,
                borderRadius: BorderRadius.circular(100))),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.title,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blue5)),
              Text(
                item.description,
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: AppColors.gray6),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Row(children: [
                    Text(
                      "Vaqti: ",
                      style: TextStyle(
                          fontSize: 12,
                          color: AppColors.blue7,
                          fontWeight: FontWeight.w600),
                    ),
                    Text("${item.startTime} - ${item.endTime}",
                        style: TextStyle(
                            fontSize: 12,
                            color: AppColors.blue7,
                            fontWeight: FontWeight.w600)),
                  ]),
                  const Spacer(),
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 1),
                      decoration: BoxDecoration(
                          color: AppColors.blue5,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        item.status,
                        style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ))
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

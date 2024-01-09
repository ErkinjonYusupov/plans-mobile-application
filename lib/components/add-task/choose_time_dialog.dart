import 'package:todo_app/config/imports.dart';

class ChooseTimeDilaog extends StatefulWidget {
  ChooseTimeDilaog({super.key, required this.controller, required this.start});

  TaskController controller;
  bool start;

  @override
  State<ChooseTimeDilaog> createState() => _ChooseTimeDilaogState();
}

class _ChooseTimeDilaogState extends State<ChooseTimeDilaog> {
  String hour = "00";
  String minut = "00";

  setHour(item) {
    setState(() {
      hour = item;
    });
  }

  setMinut(item) {
    setState(() {
      minut = item;
    });
  }

  save() {
    widget.controller.saveTime(widget.start, "$hour:$minut");
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      actions: [
        Button(
            onTap: () {
              save();
            },
            dense: true,
            text: "Saqlash")
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TimeSection(
            section: hour,
            label: "Soatni tanlang",
            list: widget.controller.hours,
            onTap: (item) {
              setHour(item);
            },
          ),
          const SizedBox(height: 24),
          TimeSection(
            section: minut,
            label: "Minutni tanlang",
            list: widget.controller.minutes,
            onTap: (item) {
              setMinut(item);
            },
          ),
        ],
      ),
    );
  }
}

class TimeSection extends StatelessWidget {
  const TimeSection({
    super.key,
    required this.section,
    required this.label,
    required this.list,
    required this.onTap,
  });

  final String section;
  final String label;
  final List list;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(list.length, (index) {
              var item = list[index];
              return InkWell(
                onTap: () {
                  onTap(item);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                  margin: const EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                      color: item == section ? AppColors.blue7 : null,
                      border: Border.all(color: AppColors.blue7),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    item,
                    style: TextStyle(
                        color: item == section
                            ? AppColors.white
                            : AppColors.blue7),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

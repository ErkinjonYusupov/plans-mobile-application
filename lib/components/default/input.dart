import 'package:todo_app/config/imports.dart';

class Input extends StatelessWidget {
  String? hintText;
  String? label;
  bool? danger;
  String? dangerText;
  TextEditingController? controller;
  Function? changed;

  Input({
    super.key,
    this.hintText,
    this.controller,
    this.changed,
    this.label,
    this.danger = false,
    this.dangerText = "Error text",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label == null
            ? const SizedBox()
            : Column(children: [
                Text(label!,
                    style: TextStyle(color: AppColors.blue9, fontSize: 12)),
                const SizedBox(height: 4)
              ]),
        TextFormField(
          cursorColor: AppColors.blue,
          controller: controller,
          onChanged: (value) {
            if (changed != null) {
              changed!(value);
            }
          },
          decoration: InputDecoration(
              hintText: hintText,
              errorStyle: const TextStyle(fontSize: 10),
              errorText: danger! ? dangerText : null,
              hintStyle: TextStyle(color: AppColors.blue),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.blue, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.blue, width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(20)))),
        ),
      ],
    );
  }
}

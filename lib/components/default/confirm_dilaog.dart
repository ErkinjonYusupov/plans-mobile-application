


import 'package:todo_app/config/imports.dart';

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({
    Key? key,
    required this.text,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.theme.cardColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      title: Text(title),
      content: SingleChildScrollView(
          child: ListBody(children: <Widget>[Text(text)])),
      actions: <Widget>[
        TextButton(
          child: Text(
            'Tasdiqlash'.tr,
            style: const TextStyle(color: Colors.green, fontSize: 16),
          ),
          onPressed: () async {
            onTap();
          },
        ),
        TextButton(
          child: Text(
            'Bekor qilish'.tr,
            style: const TextStyle(color: Colors.red, fontSize: 16),
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ],
    );
  }
}

import 'package:todo_app/config/imports.dart';

class Button extends StatelessWidget {
  String text;
  Function onTap;
  Button({
    super.key,
    required this.onTap,
    this.text = "Text",
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        decoration: BoxDecoration(
            color: AppColors.blue7, borderRadius: BorderRadius.circular(20)),
        child: Text(
          text,
          style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w700,
              fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

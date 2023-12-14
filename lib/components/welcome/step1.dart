import 'package:todo_app/config/imports.dart';

class StepOne extends StatefulWidget {
  const StepOne({super.key});

  @override
  State<StepOne> createState() => _StepOneState();
}

class _StepOneState extends State<StepOne> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          constraints: const BoxConstraints(maxWidth: 500),
          child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
          Text(
            "Hush kelibsiz!",
            style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 28,
                color: AppColors.blue7),
          ),
          Image.asset(AppImages.step1),
          Text(
            "Ba'zi muhim narsalarni hech qachon unutganmisiz? Oilangiz uchun muhim daqiqalarni yoki yubileylarni unutdingizmi? ",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.blue9,
                fontWeight: FontWeight.w600,
                height: 1.5,
                fontSize: 16),
          ),
                ],
              ),
        ));
  }
}

import 'package:todo_app/config/imports.dart';

class StepTwo extends StatefulWidget {
  const StepTwo({super.key});

  @override
  State<StepTwo> createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwo> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          constraints: BoxConstraints(maxWidth: 500),
          child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
          
          Image.asset(AppImages.step2),
          Text(
            "Xavotir olmang, vaqtni boshqarish va oson hayot kechirishda yordam berish uchun ushbu samarali va bepul topshiriq kuzatuvchisidan foydalaning va vazifalar menejeri roʻyxatini bepul bajaring.",
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

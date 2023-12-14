import 'package:todo_app/config/imports.dart';

class StepThree extends StatefulWidget {
  const StepThree({super.key});

  @override
  State<StepThree> createState() => _StepThreeState();
}

class _StepThreeState extends State<StepThree> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          constraints: const BoxConstraints(maxWidth: 500),
          child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
          
          Image.asset(AppImages.step3),
          Text(
            "Taqvim ko‘rinishi “Vazifalar ro‘yxati - Jadvalni rejalashtiruvchi va bajariladigan ishlar ro‘yxati eslatmalari” vazifalar ro‘yxati taqvim istiqbolini taqdim etadi.",
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

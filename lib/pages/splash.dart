import 'dart:async';

import 'package:todo_app/config/imports.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () { 
      Get.off(() => const Welcome());
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.logo, width: 100),
            const SizedBox(height: 24),
            Text('Todo App',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: AppColors.blue7)),
            const SizedBox(height: 24),
            SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                    color: AppColors.blue, strokeWidth: 2))
          ],
        ),
      ),
    );
  }
}

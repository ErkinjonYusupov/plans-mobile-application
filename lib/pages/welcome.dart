import 'package:todo_app/config/imports.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

WelcomeController controller = Get.put(WelcomeController());

 @override
  void dispose() {
    controller.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      builder: (controller) {
        return Scaffold(
        body: Center(
          child: Stack(
            children: [
              PageView.builder(
                controller: controller.pageController,
                itemCount: controller.pages.length,
                onPageChanged: (value) {
                  FocusScope.of(context).requestFocus(FocusNode());
                  controller.setPageIndex(value);
                },
                itemBuilder: (context, index){
                return controller.pages[index];
              }),
              Container(
                  alignment: const Alignment(0, 0.8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 70,
                        child: InkWell(
                          onTap: () {
                            controller.back();
                          },
                          child: Text(
                            'Orqaga',
                            style: TextStyle(
                              color: controller.currentPage == 0
                                  ? AppColors.gray6
                                  : AppColors.blue7,
                            ),
                          ),
                        ),
                      ),
                      SmoothPageIndicator(
                          controller: controller.pageController,
                          count: controller.pages.length),
                      SizedBox(
                        width: 70,
                        child: InkWell(
                          onTap: () {
                            controller.next();
                          },
                          child: Text(
                            controller.currentPage == 2 ? "Boshlash" :
                            'Oldinga',
                            style: TextStyle(
                              color: AppColors.blue7,
                            ),
                          ),
                        ),
                      ),
                      
                    ],
                  ))
            ],
          ),
        ),
      );
      },
      
    );
  }
}

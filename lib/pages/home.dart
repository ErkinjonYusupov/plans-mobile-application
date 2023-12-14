import 'package:todo_app/config/imports.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController name = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(children: [
            Text(name.text),
            Input(
              label: "Ismingzini kiriting",
              controller: name,
              changed: (value) {
                setState(() {});
              },
            ),
            const SizedBox(height: 24),
            Input(),
          ])),
    );
  }
}

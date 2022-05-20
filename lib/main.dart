import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final gradeController = TextEditingController();

  String result = "";

  String gradeResult(double grade) {
    if (grade >= 90) {
      return 'A';
    } else if (grade < 90 && grade >= 80) {
      return 'B';
    } else if (grade < 80 && grade >= 70) {
      return 'C';
    } else if (grade < 70 && grade >= 60) {
      return 'D';
    } else {
      return 'F';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text("Grade calculator"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
              child: TextField(
                controller: gradeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Type your score',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  prefixIcon: const Icon(
                    Icons.percent,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.pinkAccent,
              ),
              onPressed: () {
                double grade = double.parse(gradeController.text);
                setState(() {
                  result = gradeResult(grade);
                });
              },
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("Calculate"),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              result,
              style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.pinkAccent),
            )
          ],
        ),
      ),
    );
  }
}

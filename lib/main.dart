import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: const Courses(title: '193156'),
    );
  }
}

class Courses extends StatefulWidget {
  const Courses({super.key, required this.title});

  final String title;

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  List<String> _courses = [
    'Мобилни информациски системи',
    'Тимски проект',
    'Веб програмирање'
  ];

  void addCourses() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          String newCourse = "";
          return AlertDialog(
            title: const Text("Add new course"),
            content: TextField(
              onChanged: (value) {
                newCourse = value;
              },
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (newCourse.isNotEmpty) {
                        _courses.add(newCourse);
                      }
                      Navigator.pop(context);
                    });
                  },
                  child: const Text("Add"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("193156"),
      ),
      body: ListView.builder(
          itemCount: _courses.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(
                  _courses[index],
                  style: TextStyle(fontSize: 18),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_rounded),
                  onPressed: () {
                    setState(() {
                      _courses.removeAt(index);
                    });
                  },
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: addCourses,
        backgroundColor: Colors.lightBlue,
        child: Icon(Icons.add),
      ),
    );
  }
}

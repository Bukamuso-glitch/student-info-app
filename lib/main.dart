import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Student Info App',

      theme: ThemeData(
        primarySwatch: Colors.green,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white, // Text/icon color
          centerTitle: true,
          elevation: 4, // Shadow depth
        ),
        // BUTTON THEME - styles all elevated buttons
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(15),
            minimumSize: const Size(100, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        // TEXT THEME - styles all text
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 16),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ),

      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String studentName = "Mpho";
  String favoriteSubject = "TPG316C";
  int subjectIndex = 0;
  List<String> subjects = [
    "TPG316C", // Index 0
    "SOD316C", // Index 1
    "CMN316C", // Index 2
    "ITS316C", // Index 3
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Student Card"),
        
        
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              print("Settings pressed");
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                StudentInfoCard(
                  studentName: studentName,
                  favoriteSubject: favoriteSubject,
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        subjectIndex = (subjectIndex + 1) % subjects.length;
                        favoriteSubject = subjects[subjectIndex];
                      });
                    },
                    child: const Text("Change subject"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("FAB pressed");
        },
        child: const Icon(Icons.add),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

class StudentInfoCard extends StatelessWidget {
  const StudentInfoCard({
    super.key,
    required this.studentName,
    required this.favoriteSubject,
  });

  final String studentName;
  final String favoriteSubject;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding = Space INSIDE the container
      padding: const EdgeInsets.all(20),
      // decoration = Visual styling
      decoration: BoxDecoration(
        // color = Background color
        color: Colors.white, // Light blue
        // borderRadius = Rounded corners
        borderRadius: BorderRadius.circular(15),
        // border = Outline around the container
        border: Border.all(
          color: Colors.blue,
          width: 2, // 2 pixels thick
        ),
      ),
      // child = What's inside the container
      child: Column(
        children: [
          // Student Name Text (using state variable)
          Text(
            "Student Name: $studentName",
            style: const TextStyle(fontSize: 24),
          ),
          // SizedBox = Empty space for spacing
          const SizedBox(height: 10),
          // Favorite Subject Text (using state variable)
          Text(
            "Favorite Subject: $favoriteSubject",
            style: const TextStyle(fontSize: 20, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

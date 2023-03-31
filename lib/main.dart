import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final MaterialColor customColor = const MaterialColor(
    0xFFA2091A, // Primary color
    <int, Color>{
      50: Color(0xFFFFE6E8),
      100: Color(0xFFFFB3BA),
      200: Color(0xFFFF8083),
      300: Color(0xFFFF4D4D),
      400: Color(0xFFFF2626),
      500: Color(0xFFA2091A),
      600: Color(0xFF8F0818),
      700: Color(0xFF7A0716),
      800: Color(0xFF660614),
      900: Color(0xFF510512),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: customColor,
      ),
      home: const MyHomePage(title: 'GymBuddy'),
    );
  }
}

class CustomBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()

      ..color = Colors.black.withOpacity(0.05)
      ..strokeWidth = 5.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final double spacing = 20.0;

    double start = -size.height;
    double end = size.width;

    while (start < size.width) {
      final path = Path()
        ..moveTo(start, 0)
        ..lineTo(end, start + size.height)
        ..moveTo(start + size.height, 0)
        ..lineTo(end + size.height, start + size.height);

      canvas.drawPath(path, paint);
      start += spacing;
      end += spacing;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.85),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          CustomPaint(
            painter: CustomBackgroundPainter(),
            size: MediaQuery.of(context).size,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        tooltip: 'More',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black.withOpacity(0.10),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white70),
              label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Colors.white70),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.white70),
            label: "Profile",
          ),
        ],
        selectedItemColor: Colors.red, // sets the color of the selected item
        unselectedItemColor: Colors.grey, // sets the color of the unselected items
        showUnselectedLabels: true, // makes sure the unselected labels are visible
        selectedLabelStyle: TextStyle(color: Colors.red), // sets the color of the selected label
        unselectedLabelStyle: TextStyle(color: Colors.grey), // sets the color of the unselected labels
      ),
    );
  }
}

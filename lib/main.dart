import 'package:first_app/screens/contracts.dart';
import 'package:first_app/screens/create.dart';
import 'package:first_app/screens/join.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
// #region MaterialApp() attributes
      title: 'Smart Swap App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
// #endregion
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  PageController _pageController = PageController(initialPage: 0);

  final _bottomNavigationBarItems = const [
    BottomNavigationBarItem(
        icon: Icon(Icons.list, color: Colors.blue), label: 'My Contracts'),
    BottomNavigationBarItem(
        icon: Icon(Icons.create, color: Colors.blue), label: 'Create Contract'),
    BottomNavigationBarItem(
        icon: Icon(Icons.join_full, color: Colors.blue), label: 'Join Contract')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
// #region AppBar()
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 57, 27, 191),
          foregroundColor: const Color.fromARGB(255, 151, 140, 201),
          title: const Text('Smart Swap')),
// #endregion
      body: PageView(
        controller: _pageController,
        onPageChanged: (newIndex) {
          //setState() {
          _currentIndex = newIndex;
          //}
        },
        children: const [ContractsScreen(), CreateScreen(), JoinScreen()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _bottomNavigationBarItems,
        onTap: (index) {
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 100), curve: Curves.ease);
        },
        //type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

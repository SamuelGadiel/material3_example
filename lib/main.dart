import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    // Text(
    //   'Index 2: School',
    //   style: optionStyle,
    // ),
    Text(
      'Index 3: Log-out',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar'),
        actions: const [
          Icon(Icons.sync, color: Color(0xff1a3f28)),
          SizedBox(width: 16),
        ],
      ),
      drawer: const Drawer(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: const Color(0xFF044026).withAlpha(50),
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xff1a3f28)),
          ),
        ),
        child: NavigationBar(
          height: 64,
          backgroundColor: Colors.white,
          selectedIndex: _selectedIndex,
          destinations: const <NavigationDestination>[
            NavigationDestination(
              icon: Icon(Icons.notifications_none, color: Color(0xff1a3f28)),
              label: 'Atividades',
            ),
            NavigationDestination(
              icon: Icon(Icons.schedule, color: Color(0xff1a3f28)),
              label: 'Apontamento',
            ),
            // NavigationDestination(
            //   icon: Icon(Icons.sync, color: Color(0xff1a3f28)),
            //   label: 'Sincronizar',
            // ),
            NavigationDestination(
              icon: Icon(Icons.logout, color: Color(0xff1a3f28)),
              label: 'Log-out',
            ),
          ],
          onDestinationSelected: _onItemTapped,
        ),
      ),
    );
  }a
}

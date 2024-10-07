import 'package:nedaj/export.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPage = 0;

  final List<Widget> pages = [
    HomeScreen(),
    TransactionsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentPage,
        children: pages,
      ),
      bottomNavigationBar: SizedBox(
        height: 65,
        child: BottomNavigationBar(
          currentIndex: _currentPage,
          onTap: (value) {
            setState(() {
              _currentPage = value;
            });
          },
          backgroundColor: Colors.white,
          selectedItemColor: Colors.green,
          unselectedLabelStyle: TextStyle(
            fontSize: 15,
          ),
          selectedLabelStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.local_gas_station_outlined), label: 'home'.tr),
            BottomNavigationBarItem(
                icon: Icon(Icons.history), label: 'history'.tr),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: 'profile'.tr),
          ],
        ),
      ),
    );
  }
}

import 'package:nedaj/controllers/home_controller.dart';
import 'package:nedaj/export.dart';

class Home extends StatelessWidget {
  Home({
    super.key,
  });

  final HomeController homeController = Get.find<HomeController>();

  final List<Widget> pages = [
    HomeScreen(),
    TransactionsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return IndexedStack(
          index: homeController.currentPage.value,
          children: pages,
        );
      }),
      bottomNavigationBar: SizedBox(
          height: 65,
          child: Obx(() {
            return BottomNavigationBar(
              currentIndex: homeController.currentPage.value,
              onTap: (value) {
                homeController.changePage(value);
              },
              backgroundColor: Colors.white,
              selectedItemColor:
                  Colors.green, // This changes the selected icon color
              unselectedItemColor: Colors.grey, // Color for unselected items
              selectedLabelStyle: TextStyle(
                fontWeight: FontWeight.bold, // Keep this for bold labels
                fontSize: 16,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 15,
              ),
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.local_gas_station_outlined),
                    label: 'home'.tr),
                BottomNavigationBarItem(
                    icon: Icon(Icons.history), label: 'history'.tr),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'profile'.tr),
              ],
            );
          })),
    );
  }
}

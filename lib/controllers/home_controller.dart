import 'package:nedaj/export.dart';

class HomeController extends GetxController {
  var currentPage = 0.obs;

  void changePage(int index) {
    currentPage.value = index;
  }
}

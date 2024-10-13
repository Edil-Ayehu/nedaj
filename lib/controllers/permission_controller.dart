import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';

class PermissionController extends GetxController {
  Future<bool> requestCameraPermission() async {
    PermissionStatus status = await Permission.camera.status;

    if (status.isGranted) {
      return true;
    } else if (status.isDenied || status.isRestricted || status.isPermanentlyDenied) {
      // Request permission if it hasn't been granted yet
      PermissionStatus newStatus = await Permission.camera.request();
      return newStatus.isGranted;
    }

    return false;
  }

  Future<bool> requestGalleryPermission() async {
    PermissionStatus status = await Permission.photos.status;

    if (status.isGranted) {
      return true;
    } else if (status.isDenied ||
        status.isRestricted ||
        status.isPermanentlyDenied) {
      // Request permission if it hasn't been granted yet
      PermissionStatus newStatus = await Permission.photos.request();
      return newStatus.isGranted;
    }

    return false;
  }
}

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:nedaj/controllers/permission_controller.dart';
import 'package:nedaj/export.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final LanguageController languageController = Get.find<LanguageController>();
  final PermissionController permissionController =
      Get.put(PermissionController());

  final ImagePicker _picker = ImagePicker(); // Initialize ImagePicker
  XFile? _selectedImage; // Store the selected image

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: 'profile'.tr, height: 100),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                ),
                child: Column(
                  children: [
                    Gap(10),
                    // Profile pic and details
                    buildProfileDetails(context),
                    Gap(10),
                    // Profile Info
                    buildProfileInfo(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProfileDetails(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2, color: Colors.green),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: _selectedImage != null
                      ? Image.file(
                          File(_selectedImage!.path),
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        )
                      : FancyShimmerImage(
                          imageUrl:
                              'https://plus.unsplash.com/premium_photo-1689977968861-9c91dbb16049?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZSUyMHBpY3R1cmV8ZW58MHx8MHx8fDA%3D',
                          boxFit: BoxFit.cover,
                          errorWidget: Icon(Icons.error, color: Colors.red),
                          shimmerDuration: Duration(seconds: 2),
                          shimmerBaseColor: Colors.grey[300]!,
                          shimmerHighlightColor: Colors.white,
                          width: 100,
                          height: 100,
                        ),
                ),
              ),
              Positioned(
                right: 0,
                top: 4,
                child: GestureDetector(
                  onTap: () => _showImagePicker(context),
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: Colors.green),
                    ),
                    child: Icon(Icons.photo_camera, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Text('Aschalew G Tesfa',
              textScaler: TextScaler.linear(1),
              style: Theme.of(context).textTheme.titleMedium),
          Text('+251 - 912345676',
              textScaler: TextScaler.linear(1),
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.black54,
                    fontSize: 18,
                  )),
        ],
      ),
    );
  }

  Widget buildProfileInfo(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          ProfileInfoContainer(
            text: 'my_cars'.tr,
            icon: CupertinoIcons.car_detailed,
            onTap: () {
              Get.to(() => MyCarsPage());
            },
          ),
          ProfileInfoContainer(
            text: 'notifications'.tr,
            icon: Icons.notification_add,
            onTap: () {
              Get.to(() => NotificationsScreen());
            },
          ),
          ProfileInfoContainer(
            text: 'change_pin'.tr,
            icon: Icons.password,
            onTap: () {
              Get.to(() => ChangePinScreen());
            },
          ),
          ProfileInfoContainer(
            text: 'terms_conditions'.tr,
            icon: Icons.password,
            onTap: () {
              Get.to(() => TermsAndConditionsScreen());
            },
          ),
          ProfileInfoContainer(
            text: 'language'.tr,
            icon: Icons.language,
            onTap: () {
              showLanguageSelectionBottomSheet(context);
            },
          ),
          ProfileInfoContainer(
            text: 'unlink_phone'.tr,
            icon: Icons.password,
            onTap: () {},
          ),
          ProfileInfoContainer(
            text: 'logout'.tr,
            icon: Icons.logout,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  void showLanguageSelectionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return Obx(() {
          return Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('select_language'.tr,
                    textScaler: TextScaler.linear(1),
                    style: Theme.of(context).textTheme.bodyLarge),
                ListTile(
                  title: Text(
                    'English',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.black54,
                        ),
                    textScaler: TextScaler.linear(1),
                  ),
                  trailing: languageController.selectedLanguage.value == 'en'
                      ? Icon(Icons.check, color: Colors.green)
                      : null,
                  onTap: () {
                    languageController.changeLanguage('en', 'US');
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text(
                    'Amharic',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.black54,
                        ),
                    textScaler: TextScaler.linear(1),
                  ),
                  trailing: languageController.selectedLanguage.value == 'am'
                      ? Icon(Icons.check, color: Colors.green)
                      : null,
                  onTap: () {
                    languageController.changeLanguage('am', 'ET');
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text(
                    'Afaan Oromoo',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.black54,
                        ),
                    textScaler: TextScaler.linear(1),
                  ),
                  trailing: languageController.selectedLanguage.value == 'or'
                      ? Icon(Icons.check, color: Colors.green)
                      : null,
                  onTap: () {
                    languageController.changeLanguage('or', 'ET');
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text(
                    'Tigrigna',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.black54,
                        ),
                    textScaler: TextScaler.linear(1),
                  ),
                  trailing: languageController.selectedLanguage.value == 'ti'
                      ? Icon(Icons.check, color: Colors.green)
                      : null,
                  onTap: () {
                    languageController.changeLanguage('ti', 'ET');
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text(
                    'Soomaali',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.black54,
                        ),
                    textScaler: TextScaler.linear(1.1),
                  ),
                  trailing: languageController.selectedLanguage.value == 'so'
                      ? Icon(Icons.check, color: Colors.green)
                      : null,
                  onTap: () {
                    languageController.changeLanguage('so', 'SO');
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
      },
    );
  }

  // Function to show the bottom sheet
  void _showImagePicker(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select a Photo',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Take a photo'),
                onTap: () {
                  _takePhoto();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text('Choose from gallery'),
                onTap: () {
                  _selectFromGallery();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Function to pick an image
  Future<void> _takePhoto() async {
    bool isGranted = await permissionController
        .requestCameraPermission(); // Request permission
    if (isGranted) {
      XFile? selectedImage =
          await _picker.pickImage(source: ImageSource.camera);
      if (selectedImage != null) {
        setState(() {
          _selectedImage = selectedImage;
        });
      }
    } else {
      _showPermissionDeniedDialog();
    }
  }

  void _showPermissionDeniedDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Permission Required'),
        content: Text(
            'Camera permission is permanently denied. Please enable it in the app settings.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              openAppSettings();
              Navigator.pop(context);
            },
            child: Text('Open Settings'),
          ),
        ],
      ),
    );
  }

  Future<void> _selectFromGallery() async {
    bool isGranted = await permissionController.requestGalleryPermission();

    if (isGranted) {
      // Open the gallery to pick a single image
      final pickedFile = await _picker.pickImage(
        source: ImageSource.gallery, // Opens the gallery
      );

      // Set the picked image to the state
      if (pickedFile != null) {
        setState(() {
          _selectedImage = pickedFile;
        });
      } else {
        // Handle case where no image was selected
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("No image selected"),
          ),
        );
      }
    } else {
      // Handle case where permission is denied
      _showPermissionDeniedDialog();
    }
  }
}

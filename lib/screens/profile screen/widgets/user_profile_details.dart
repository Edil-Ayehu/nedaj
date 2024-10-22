import 'dart:io';
import 'package:nedaj/export.dart';

class UserProfileDetails extends StatefulWidget {
  const UserProfileDetails({super.key});

  @override
  State<UserProfileDetails> createState() => _UserProfileDetailsState();
}

class _UserProfileDetailsState extends State<UserProfileDetails> {
  final PermissionController permissionController =
      Get.put(PermissionController());

  final ImagePicker _picker = ImagePicker(); // Initialize ImagePicker
  XFile? _selectedImage; // Store the selected image
  @override
  Widget build(BuildContext context) {
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
                    child:
                        Icon(FluentIcons.camera_16_filled, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(
            'Aschalew G Tesfa',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontSize: 22,
                  color: Colors.black,
                ),
          ),
          Text(
            '+251 - 912345676',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black,
                  fontSize: 17,
                ),
          ),
        ],
      ),
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
                  _takePhoto(context);
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
  Future<void> _takePhoto(BuildContext context) async {
    bool isGranted = await permissionController
        .requestCameraPermission(); // Request permission
    if (isGranted) {
      XFile? selectedImage =
          await _picker.pickImage(source: ImageSource.camera);
      if (selectedImage != null) {
        setState(() {
          _selectedImage = selectedImage;
        });
      } else {
        // Handle case where no image was taken
        Get.snackbar(
          "",
          "",
          titleText: Text(
            'Error!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          messageText: Text(
            'No Image Taken',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
        );
      }
    } else {
      _showPermissionDeniedDialog(
          message:
              'Camera permission is permanently denied. Please enable it in the app settings.');
    }
  }

  void _showPermissionDeniedDialog({required String message}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Permission Required'),
        content: Text(
          message,
        ),
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
        Get.snackbar(
          "",
          "",
          titleText: Text(
            'Error!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          messageText: Text(
            'No image selected',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
        );
      }
    } else {
      // Handle case where permission is denied
      _showPermissionDeniedDialog(
          message:
              'Gallery permission is permanently denied. Please enable it in the app settings.');
    }
  }
}

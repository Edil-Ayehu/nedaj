import 'package:nedaj/export.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
        ),
        child: Column(
          children: [
            // profile pic , full name & phone no
            Gap(10),
            Container(
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
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                              'https://plus.unsplash.com/premium_photo-1689977968861-9c91dbb16049?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZSUyMHBpY3R1cmV8ZW58MHx8MHx8fDA%3D'),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 4,
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
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Full Name',
                    style: Theme.of(context).textTheme.bodyLarge
                  ),
                  Text('+251 - 912345676'),
                ],
              ),
            ),
            Gap(10),

            // profile details
            Container(
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
                    text: 'My Cars',
                    icon: Icons.notification_add,
                    onTap: () {},
                  ),
                  ProfileInfoContainer(
                    text: 'Notifications',
                    icon: Icons.notification_add,
                    onTap: () {},
                  ),
                  ProfileInfoContainer(
                    text: 'Change PIN',
                    icon: Icons.notification_add,
                    onTap: () {},
                  ),
                  ProfileInfoContainer(
                    text: 'Language',
                    icon: Icons.language,
                    onTap: () {},
                  ),
                  ProfileInfoContainer(
                    text: 'Logout',
                    icon: Icons.logout,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            // logo
          ],
        ),
      ),
    );
  }
}

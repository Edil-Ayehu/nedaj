import 'package:nedaj/auth/screens/login_screen.dart';
import 'package:nedaj/auth/utils/validators.dart';
import 'package:nedaj/utils/constants.dart';
import 'package:nedaj/widgets/custom_textfield_without_prefixicon.dart';

import '../../export.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String? selectedCity;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Create Account',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(15),
                Text(
                  'Create Account',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: 30,
                      ),
                ),
                Gap(6),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    'Fill in the details below to quickly create your Nedaj account.',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                        ),
                  ),
                ),
                Gap(15),
                Text(
                  'First Name*',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontSize: 20,
                      ),
                ),
                Gap(4),
                CustomTextfieldWithoutPrefixIcon(
                  hintText: 'Abebe',
                  fillColor: Colors.grey.shade50,
                ),
                Gap(12),
                Text(
                  'Middle Name*',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontSize: 20,
                      ),
                ),
                Gap(4),
                CustomTextfieldWithoutPrefixIcon(
                  hintText: 'Kebede',
                  fillColor: Colors.grey.shade50,
                ),
                Gap(12),
                Text(
                  'Last Name*',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontSize: 20,
                      ),
                ),
                Gap(4),
                CustomTextfieldWithoutPrefixIcon(
                  hintText: 'Abebe',
                  fillColor: Colors.grey.shade50,
                ),
                Gap(12),
                Text(
                  'Phone Number*',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontSize: 20,
                      ),
                ),
                Gap(4),
                TextFormField(
                  validator: Validators.validatePhoneNumber,
                  keyboardType: TextInputType.number,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  maxLength: 9,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade50,
                    hintText: '912345678',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 18,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade100),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade100),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/images/country_flag.png',
                            fit: BoxFit.cover,
                            width: 30,
                            height: 28,
                          ),
                          Text(
                            '+251',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Text(
                  'City*',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontSize: 20,
                      ),
                ),
                Gap(4),
                TextFormField(
                  readOnly: true,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  controller: TextEditingController(text: selectedCity),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade50,
                    hintText: 'City',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 18,
                    ),
                    suffixIcon: Icon(Icons.keyboard_arrow_down),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade100),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade100),
                    ),
                  ),
                  onTap: () => _showCitySelectionBottomSheet(context),
                ),
                Gap(12),
                Text(
                  'Address',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontSize: 20,
                      ),
                ),
                Gap(4),
                CustomTextfieldWithoutPrefixIcon(
                  hintText: 'Address',
                  fillColor: Colors.grey.shade50,
                ),
                Gap(20),
                SizedBox(
                  width: double.infinity,
                  height: 58,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Constants.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      Get.off(() => Home());
                    },
                    child: Text('Register'),
                  ),
                ),
                Gap(24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Gap(4),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => LoginScreen());
                      },
                      child: Text(
                        'Sign in',
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: Constants.primaryColor,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w900,
                                ),
                      ),
                    ),
                  ],
                ),
                Gap(30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showCitySelectionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Select City',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    'Addis Ababa',
                    'Dire Dawa',
                    'Mekelle',
                    'Gondar',
                    'Adama',
                    'Hawassa',
                    'Bahir Dar',
                    'Jimma',
                  ].map((String city) {
                    return ListTile(
                      title: Text(city),
                      onTap: () {
                        Navigator.pop(context, city);
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      },
    ).then((selectedCity) {
      if (selectedCity != null) {
        setState(() {
          this.selectedCity = selectedCity;
        });
      }
    });
  }
}

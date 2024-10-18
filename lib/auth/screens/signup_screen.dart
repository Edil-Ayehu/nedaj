import 'package:flutter/material.dart';
import 'package:nedaj/widgets/custom_textfield.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Create Account'),
          Text('You can create your nedaj account here'),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text('First Name'),
                    CustomTextfield(hintText: 'first name'),
                  ],
                ),
              ),
              RichText(text: TextSpan(text: 'Email',children: [
                TextSpan(text: '(optional)', style: TextStyle(color: Colors.grey,),),
              ])),
              Expanded(
                child: Column(
                  children: [
                    Text('Last Name'),
                    CustomTextfield(hintText: 'last name'),
                  ],
                ),
              ),
            ],
          ),
          CustomTextfield(hintText: 'example@gmail.com'),
          Text('Phone Number'),
          CustomTextfield(hintText: ''),
          Text('City'),
          CustomTextfield(hintText: 'example@gmail.com'),
          Text('Address'),
          CustomTextfield(hintText: 'example@gmail.com'),
          Text('New PIN'),
          CustomTextfield(hintText: 'example@gmail.com'),
          Text('ConfirmNew PIN'),
          CustomTextfield(hintText: 'example@gmail.com'),

          
        ],
      ),
    );
  }
}

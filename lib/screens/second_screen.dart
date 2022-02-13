import 'package:flutter/material.dart';
import 'package:mygarageadmin/screens/location.dart';
import 'package:mygarageadmin/screens/third_screen.dart';

import '../widgets/custom_text_field.dart';
import '../widgets/size_config.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final TextEditingController _userownernamecontroller =
      TextEditingController();
  final TextEditingController locationcontroller = TextEditingController();
  final TextEditingController _usergaragenamecontroller =
      TextEditingController();
  bool isHiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 34),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/logo.png',
                  height: 64,
                ),
                SizedBox(
                  height: SizeConfig.deviceHeight * 0.052,
                ),
                CustomTextField(
                  textEditingController: _userownernamecontroller,
                  textInputType: TextInputType.emailAddress,
                  hintText: 'Enter Your Name',
                  icon: Icon(Icons.email),
                ),
                SizedBox(
                  height: SizeConfig.deviceHeight * 0.032,
                ),
                CustomTextField(
                  textEditingController: _usergaragenamecontroller,
                  textInputType: TextInputType.name,
                  hintText: 'Enter Your Garage Name',
                  icon: Icon(Icons.settings),
                ),
                SizedBox(
                  height: SizeConfig.deviceHeight * 0.032,
                ),
                CustomTextField(
                  textEditingController: locationcontroller,
                  textInputType: TextInputType.streetAddress,
                  hintText: 'Location',
                  icon: Icon(Icons.location_on),
                ),
                SizedBox(
                  height: SizeConfig.deviceHeight * 0.032,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ThirdScreen();
                    }));
                  },
                  child: Container(
                    child: const Text(
                      'Continue',
                      style: TextStyle(color: Colors.white),
                    ),
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    alignment: Alignment.center,
                    decoration: const ShapeDecoration(
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(14),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.deviceHeight * 0.032,
                ),
                // LocationTracker(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

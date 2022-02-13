import 'package:flutter/material.dart';
import 'package:mygarageadmin/screens/fourth_screen.dart';

import '../widgets/custom_text_field.dart';
import '../widgets/size_config.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final TextEditingController _emailcontroller = TextEditingController();

  final TextEditingController aadharcontroller = TextEditingController();
  final TextEditingController _mobilenumbercontroler = TextEditingController();
  final TextEditingController _ownernamecontroller = TextEditingController();
  final TextEditingController _mechanicscontroller = TextEditingController();
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
                  textEditingController: _ownernamecontroller,
                  textInputType: TextInputType.name,
                  hintText: 'Enter Your Full Name',
                  icon: Icon(Icons.verified_user),
                ),
                SizedBox(
                  height: SizeConfig.deviceHeight * 0.032,
                ),
                // textfield input email
                CustomTextField(
                  textEditingController: _emailcontroller,
                  textInputType: TextInputType.emailAddress,
                  hintText: 'Enter Your E-mail',
                  icon: Icon(Icons.email),
                ),
                SizedBox(
                  height: SizeConfig.deviceHeight * 0.032,
                ),

                CustomTextField(
                  textEditingController: aadharcontroller,
                  textInputType: TextInputType.visiblePassword,
                  hintText: 'Enter Your Aadhar Number',
                  isPass: isHiddenPassword,
                  icon: Icon(Icons.card_membership),
                  suffixicon: InkWell(
                    onTap: () {
                      setState(() {
                        isHiddenPassword = !isHiddenPassword;
                      });
                    },
                    child: Icon(isHiddenPassword
                        ? Icons.visibility_off
                        : Icons.visibility),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.deviceHeight * 0.032,
                ),

                CustomTextField(
                  textEditingController: _mobilenumbercontroler,
                  textInputType: TextInputType.number,
                  hintText: 'Enter Your Mobile Number',
                  icon: Icon(Icons.phone),
                ),
                SizedBox(
                  height: SizeConfig.deviceHeight * 0.032,
                ),
                CustomTextField(
                  textEditingController: _mechanicscontroller,
                  textInputType: TextInputType.number,
                  hintText: 'No of Mechanics',
                  icon: Icon(Icons.settings),
                ),
                SizedBox(
                  height: SizeConfig.deviceHeight * 0.032,
                ),

                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return FourthScreen();
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
                  height: SizeConfig.deviceHeight * 0.019,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

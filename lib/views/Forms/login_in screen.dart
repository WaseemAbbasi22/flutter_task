
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rns_flutter_task/configurations/size_config.dart';


class LogInScreen extends StatefulWidget {
  static const routeName = 'personalDataForm';
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailNumberController = TextEditingController();
  Color containerColor = const Color(0xff427DAA);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 100, top: 100),
              child: Row(
                children: [
                  SvgPicture.asset("assets/App-icon.svg"),
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.03,
                  ),
                  SvgPicture.asset("assets/EduGIGS.svg"),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.04,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              height: SizeConfig.screenHeight! * 0.6,
              width: SizeConfig.screenWidth! * 0.84,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.04,
                    ),
                    const Text(
                      "Sign in  to EduGIGs",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.01,
                    ),
                    customsTextField(
                        'Email Address',
                        'Enter your Email Address',
                        null,
                        Icons.mail,
                        emailNumberController),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.01,
                    ),
                    customsTextField('Password', 'Enter your password', null,
                        Icons.visibility, emailNumberController),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.03,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 150),
                      child: Text("Forget password?",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight! * 0.03,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: containerColor,
                          borderRadius: BorderRadius.circular(5)),
                      height: SizeConfig.screenHeight! * 0.07,
                      width: SizeConfig.screenWidth! * 0.7,
                      child: const Center(
                        child: Text(
                          "Sign In ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60, top: 20),
              child: Row(
                children: [
                  const Text("Do you have account?",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  SizedBox(
                    width: SizeConfig.screenWidth! * 0.02,
                  ),
                  Text(
                    "Sign up",
                    style: TextStyle(color: containerColor, fontSize: 18),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  static Widget customsTextField(String label, String hintText, var onTap,
      IconData icon, TextEditingController _controller) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(
              left: SizeConfig.screenHeight! * 0.03,
              top: SizeConfig.screenHeight! * 0.03),
          child: Text(
            label,
            style: TextStyle(
                color: Colors.grey,
                fontSize: SizeConfig.screenHeight! * 0.023,
                fontWeight: FontWeight.normal),
          )),
      Padding(
        padding: EdgeInsets.only(
            top: SizeConfig.screenHeight! * 0.02,
            left: SizeConfig.screenHeight! * 0.03,
            right: SizeConfig.screenWidth! * 0.042),
        child: SingleChildScrollView(
          child: TextField(
            controller: _controller,
            onTap: onTap,
            decoration: InputDecoration(
              suffixIcon: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Icon(
                    icon,
                  )),
              hintText: hintText,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ),
      )
    ]);
  }
}

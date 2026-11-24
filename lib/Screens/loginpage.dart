import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterprojecttest/CustomWedgets/textfieldCustom.dart';
import 'package:flutterprojecttest/Providers/authprovider.dart';
import 'package:flutterprojecttest/Screens/countryscreen.dart';
import 'package:provider/provider.dart';

class Loginpage extends StatelessWidget {
  Loginpage({super.key});
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final providerobject = context.read<Authprovide>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 177, 86, 58),
        title: Text(
          "Login page",
          style: TextStyle(fontSize: 30, fontWeight: .bold),
        ),
      ),
      body: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Textfieldcustom(
              lable: "Email",
              prfixIcon: Icon(Icons.email),
              controller: emailcontroller,
              validator: (value) {
                if (value == null || value.isEmpty || !value.contains('@')) {
                  return "enter valid email";
                }
                return null;
              },
            ),
            SizedBox(height: 30),
            Textfieldcustom(
              lable: "password",
              prfixIcon: Icon(Icons.lock),
              controller: passwordcontroller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "enter valid password";
                }
                return null;
              },
            ),
            SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
                backgroundColor: Colors.orange,
                minimumSize: Size(200, 60),
              ),
              onPressed: () async {
                if (formkey.currentState!.validate()) {
                  final success = await providerobject.userlogin(
                    password: passwordcontroller.text,
                    email: emailcontroller.text,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        providerobject.auth?.message ?? "please try again",
                      ),
                      backgroundColor: success ? Colors.green : Colors.red,
                    ),
                  );
                  if (success) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Countryscreen()),
                    );
                  }
                }
              },
              child: Text(
                "login",
                style: TextStyle(fontSize: 30, fontWeight: .bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

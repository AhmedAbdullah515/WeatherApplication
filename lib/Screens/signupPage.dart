import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterprojecttest/CustomWedgets/textfieldCustom.dart';
import 'package:flutterprojecttest/Providers/authprovider.dart';
import 'package:flutterprojecttest/Screens/loginpage.dart';
import 'package:provider/provider.dart';

class Signuppage extends StatelessWidget {
  Signuppage({super.key});
  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final providerobject = context.read<Authprovide>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(20),
        ),
        title: Text(
          "Signup Page",
          style: TextStyle(fontSize: 30, fontWeight: .bold),
        ),
      ),
      body: Form(
        key: formkey,
        child: Center(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Textfieldcustom(
                lable: "username",
                prfixIcon: Icon(Icons.person),
                controller: namecontroller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "enter valid name";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Textfieldcustom(
                lable: "email",
                prfixIcon: Icon(Icons.email),
                controller: emailcontroller,
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return "enter valid name";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Textfieldcustom(
                lable: "password",
                prfixIcon: Icon(Icons.lock),
                controller: passwordcontroller,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 6) {
                    return "enter valid password";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Textfieldcustom(
                lable: "Phone",
                prfixIcon: Icon(Icons.phone),
                controller: phonecontroller,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 11) {
                    return "enter valid phone";
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(12)),
                  minimumSize: Size(200, 60)
                ),
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    final success = await providerobject.userregister(
                      name: namecontroller.text,
                      email: emailcontroller.text,
                      password: passwordcontroller.text,
                      phone: phonecontroller.text,
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
                        MaterialPageRoute(builder: (context) => Loginpage()),
                      );
                    }
                  }
                },
                child: Text("Signup",style: TextStyle(fontSize: 30,fontWeight: .bold),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

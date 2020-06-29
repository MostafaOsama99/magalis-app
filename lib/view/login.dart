import 'package:flutter/material.dart';
import 'package:maglis_app/controllers/auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png',width: 220,),
            SizedBox(
              height: 50,
            ),

            // Username Login Field
            Container(
              width: MediaQuery.of(context).size.width/1.5,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blueGrey[600].withOpacity(0.9),
                  width: 2.5
                ),
                borderRadius: BorderRadius.circular(10)
              ),
              child: TextFormField(
                
                controller: username,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15),
                  hintText: 'Username',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w600
                  ),
                  border: InputBorder.none
                ),
              ),
            ),
            // Password Login Field
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: MediaQuery.of(context).size.width/1.5,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blueGrey[600].withOpacity(0.9),
                    width: 2.5
                  ),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextFormField(
                obscureText: true,
                  controller: password,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(15),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w600
                    ),
                    border: InputBorder.none
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  Auth().login(username.text, password.text);
                },
                              child: Container(
                  width: MediaQuery.of(context).size.width/1.8,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 20,
                        fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                  color: Colors.blueGrey[600].withOpacity(0.9),
                  
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

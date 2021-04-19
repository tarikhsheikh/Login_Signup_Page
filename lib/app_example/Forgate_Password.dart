import 'package:flutter/material.dart';
import 'SIgnup.dart';
  TextEditingController emailController = TextEditingController();
  TextEditingController oldpasswordController = TextEditingController();
    TextEditingController newpasswordController = TextEditingController();

class ForgatePasswordPage  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return   Container(
       decoration: BoxDecoration(

                color: Colors.blueAccent,
              ),
      child: Scaffold(
        backgroundColor: Colors.black,
          appBar: AppBar(

            title: Text('Password Recovery Screen'),
          ),
          body: Center(
            child: Container(
              decoration: BoxDecoration(

                color: Colors.white,
              ),
              width: 600,
              height: 350,
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: ListView(
                    children: <Widget>[
                      Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Password Recovery Page',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                                fontSize: 30),
                          )),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter Email',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          obscureText: true,
                          controller: oldpasswordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter Old Password',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          obscureText: true,
                          controller: newpasswordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter New Password',
                          ),
                        ),
                      ),
                      
                      Container(
                          height: 50,
                          padding: EdgeInsets.all(10),
                          child: RaisedButton(
                            textColor: Colors.white,
                            color: Colors.blue,
                            child: Text('Confirm'),
                            onPressed: () {
                              print(emailController.text);
                              print(oldpasswordController.text);
                              print(newpasswordController.text);
                             // Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
                              Navigator.pushNamed(context, '/third');
                              // Navigator.pop(context);

                            },
                          )),
                     
                    ],
                  )),
            ),
          )
              
              
              ),
    );
  }
}
import 'dart:html';

import 'package:cache_x/cache_x.dart';
import 'package:flutter/material.dart';
import 'Login_Screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SignUp Page',
      home: SignupPage(),
    );
  }
}

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController firstnameController;
  TextEditingController passwordController;
  TextEditingController emailController;
  TextEditingController lastnameController;
  TextEditingController usernameController;
  TextEditingController _ispassword;
  bool passwordShow;
 
  static const routeName = '/';
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    firstnameController = TextEditingController();

    passwordController = TextEditingController();
    emailController = TextEditingController();
    lastnameController = TextEditingController();
    usernameController = TextEditingController();
    _ispassword = TextEditingController();
    passwordShow = true;

  }

  @override
  void dispose() {
    firstnameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    lastnameController.dispose();
    usernameController.dispose();
    _ispassword.dispose();
    super.dispose();
  }
  //bool _isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        width: MediaQuery.of(context).size.width * 0.9,
        child: Scaffold(
            appBar: AppBar(
              title: Text('Signup Screen'),
            ),
            body: Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                ),
                height: 600,
                width: 600,
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'SignUp Page',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 30),
                                )),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: TextField(
                                controller: firstnameController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'First Name',
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: TextField(
                                controller: lastnameController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Last Name',
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: TextField(
                                controller: usernameController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'User Name',
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Email',
                                ),
                                validator: (value) {
                                  if (value.isEmpty ||
                                      !value.contains('@gmail.com')) {
                                    return 'invalid email';
                                  }
                                  return null;
                                },
                              ),
                            ),
                           
                            Container(
                              padding: EdgeInsets.all(10),
                              child: TextFormField(
                                obscureText: passwordShow,
                                controller: passwordController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Password',
                                  suffixIcon: IconButton(
                                      icon: Icon(passwordShow
                                          ? Icons.remove_red_eye
                                          : Icons.visibility_off),
                                      onPressed: () {
                                        setState(() {
                                          passwordShow = !passwordShow;
                                        });
                                      }),
                                ),
                                validator: (value) {
                                  if (value.isEmpty || value.length <= 5) {
                                    return 'invalid password';
                                  }
                                  return null;
                                },
                                 ),
                            ),
                                /* validator: (value) {
                  if (value.isEmpty){
                    return 'Please enter valid Password';
                  }
                  return null;
                },
*/
                             
                            Container(
                                height: 50,
                                padding: EdgeInsets.all(10),
                                child: RaisedButton(
                                    textColor: Colors.white,
                                    color: Colors.blue,
                                    child: Text('SignUp'),
                                    onPressed: () async {

                                      print(firstnameController.text);
                                      print(lastnameController.text);
                                      print(usernameController.text);
                                      print(emailController.text);
                                      print(passwordController.text);
                                      await CacheXCore.instance.saveString(
                                          key: 'ft1',
                                          value: firstnameController.text);
                                      await CacheXCore.instance.saveString(
                                          key: 'ft2',
                                          value: lastnameController.text);
                                      await CacheXCore.instance.saveString(
                                          key: 'ft3',
                                          value: usernameController.text);
                                      await CacheXCore.instance.saveString(
                                          key: 'ft4',
                                          value: emailController.text);
                                      await CacheXCore.instance.saveString(
                                          key: 'ft5',
                                          value: passwordController.text);
                                      
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text("SignUp"),
                                              content: Text(
                                                  "Are You Sure to SignUp ?"),
                                              actions: [
                                                FlatButton(
                                                  child: Text('OK'),
                                                  onPressed: () {
                                                    
                                                    Navigator.of(context)
                                                        .pop('OK');
                                                  },
                                                ),
                                              ],
                                            );
                                          });
                                    })),
                            Container(
                                child: Row(
                              children: <Widget>[
                                Text(' Have an account?'),
                                FlatButton(
                                  textColor: Colors.blue,
                                  child: Text(
                                    'Log In',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () {
                                    // Navigator.pop(context);
                                    //login screen

                                    Navigator.pushNamed(context, '/second');
                                  },
                                )
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ))
                          ],
                        ),
                      ),
                    )),
              ),
            )),
      ),
    );
  }
}

/*
TextEditingController firstnameController = TextEditingController();
//TextEditingController enterpasswordController = TextEditingController();
TextEditingController passwordController = TextEditingController();
//TextEditingController confirmpasswordController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController lastnameController = TextEditingController();
TextEditingController usernameController = TextEditingController();

class SignupPage extends StatelessWidget {
  static const routeName = '/';
  final _formKey = GlobalKey<FormState>();
  bool _isPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Signup Screen'),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            height: 600,
            width: 600,
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'SignUp Page',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 30),
                            )),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            controller: firstnameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'First Name',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            controller: lastnameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Last Name',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            controller: usernameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'User Name',
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                            ),
                            validator: (value) {
                              if (value.isEmpty ||
                                  !value.contains('@gmail.com')) {
                                return 'invalid email';
                              }
                              return null;
                            },
                          ),
                        ),
                        /*     validator: (value) {
              if (!value.contains('@gmail.com')) {
                return 'Please enter valid email';
              }
              return null;
            },*/

                        /*   Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          obscureText: true,
                          controller: enterpasswordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter Password',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          obscureText: true,
                          controller: confirmpasswordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Confirm Password',
                          ),
                        ),
                      ),*/
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            obscureText: _isPassword,
                            controller: passwordController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              suffixIcon: IconButton(
                    icon: Icon(
                        _isPassword ? Icons.visibility : Icons.visibility_off),
                            ),
                            ),
                            validator: (value) {
                              if (value.isEmpty || value.length <= 5) {
                                return 'invalid password';
                              }
                              return null;
                            },
                            /* validator: (value) {
              if (value.isEmpty){
                return 'Please enter valid Password';
              }
              return null;
            },
*/
                          ),
                        ),
                        Container(
                            height: 50,
                            padding: EdgeInsets.all(10),
                            child: RaisedButton(
                                textColor: Colors.white,
                                color: Colors.blue,
                                child: Text('SignUp'),
                                onPressed: () async {
                                  print(firstnameController.text);
                                  print(lastnameController.text);
                                  print(usernameController.text);
                                  print(emailController.text);
                                  print(passwordController.text);
                                  await CacheXCore.instance.saveString(
                                      key: 'ft1',
                                      value: firstnameController.text);
                                  await CacheXCore.instance.saveString(
                                      key: 'ft2',
                                      value: lastnameController.text);
                                  await CacheXCore.instance.saveString(
                                      key: 'ft3',
                                      value: usernameController.text);
                                  await CacheXCore.instance.saveString(
                                      key: 'ft4', value: emailController.text);
                                  await CacheXCore.instance.saveString(
                                      key: 'ft5',
                                      value: passwordController.text);
                                  //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LoginPage()));
                                  //
                                  /*  if (_formKey.currentState.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text('Signup Success!')));*/
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text("SignUp"),
                                          content:
                                              Text("Are You Sure to SignUp ?"),
                                          actions: [
                                            FlatButton(
                                              child: Text('OK'),
                                              onPressed: () {
                                                Navigator.of(context).pop('OK');
                                              },
                                            ),
                                          ],
                                        );
                                      });
                                })),
                        Container(
                            child: Row(
                          children: <Widget>[
                            Text(' Have an account?'),
                            FlatButton(
                              textColor: Colors.blue,
                              child: Text(
                                'Log In',
                                style: TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                // Navigator.pop(context);
                                //login screen

                                Navigator.pushNamed(context, '/second');
                              },
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ))
                      ],
                    ),
                  ),
                )),
          ),
        ));
  }
}
*/

import 'package:cache_x/cache_x.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'Forgate_Password.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      home: LoginPage(),
    );
  }
}

//TextEditingController usernameController = TextEditingController();
//TextEditingController passwordController = TextEditingController();
//TextEditingController emailController = TextEditingController();
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

TextEditingController usernameController;
TextEditingController passwordController;
TextEditingController emailController;
TextEditingController _ispassword;
bool passwordShow;

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final cacheX = CacheXCore.instance;

  @override
  void initState() {
    super.initState();

//TextEditingController enterpasswordController = TextEditingController();
//TextEditingController confirmpasswordController = TextEditingController();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _ispassword = TextEditingController();
    passwordShow = true;

    // _isPassword = TextEditingController();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    _ispassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Screen App'),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            width: 600,
            height: 600,
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
                              'Login Page',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 30),
                            )),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            controller: usernameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'User Name',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'must enter username';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter Email',
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
                        /*validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter valid Password';
                                          }
                                          return null;
                                        },       */

                      
                        Container(
                            height: 50,
                            padding: EdgeInsets.all(10),
                            child: RaisedButton(
                              textColor: Colors.white,
                              color: Colors.blue,
                              child: Text('Login'),
                              onPressed: () async {
                                String name = await CacheXCore.instance
                                    .getString(key: 'ft3');
                                String email = await CacheXCore.instance
                                    .getString(key: 'ft4');
                                String passwordd = await CacheXCore.instance
                                    .getString(key: 'ft5');
                               
                                print(name);
                                print(email);
                                print(passwordd);

                                  if(usernameController.text==name  && emailController.text==email){

                                    showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text("Login"),
                                        content:
                                            Text("Are you sure to login  ?"),
                                        actions: [
                                          TextButton(
                                            child: Text('OK'),
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, '/four');
                                            },
                                          ),
                                          TextButton(
                                            child: Text('Cancel'),
                                            onPressed: () {
                                              Navigator.of(context).pop(true);
                                            },
                                          ),
                                        ],
                                      );
                                    });
                                  }
                                  else{
                                    showDialog(
                                     context: context,
                                     builder: (context) {
                                       return AlertDialog(
                                        title: Text("Error"),
                                          content:
                                              Text(" login Error ?"),
                                         actions: [
                                           TextButton(
                                             child: Text('OK'),
                                      
                                              onPressed: () {
                                                Navigator.of(context).pop(true);
                                              },
                                           ),
                                          ],
                                       );
                                   });


                                  }
                                 


                                // print(cacheX.getKeys());

                                /*  if (_formKey.currentState.validate()) {

                                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Success!')));
                                        }  */

                               
                              },
                            )),
                              FlatButton(
                          onPressed: () {
                            // Navigator.pop(context);
                            Navigator.of(context).pushNamed('/third');
                          },
                          textColor: Colors.blue,
                          child: Text('Forgot Password'),
                        ),
                        Container(
                            child: Row(
                          children: <Widget>[
                            Text('Does not have account?'),
                            FlatButton(
                              textColor: Colors.blue,
                              child: Text(
                                'Sign Up',
                                style: TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                Navigator.pop(context);

                                Navigator.pushNamed(context, '/');

                                //signup screen
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

class ItemCount {}

/*

import 'package:cache_x/cache_x.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'Forgate_Password.dart';

TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController emailController = TextEditingController();
//final _formKey = GlobalKey<FormState>();

class LoginPage extends StatelessWidget {
  // get cacheX => null;
 final _formKey = GlobalKey<FormState>();
 
  final cacheX = CacheXCore.instance;
  //GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Screen App'),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            width: 600,
            height: 600,
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Form(
                    key:_formKey,
                    child: Column (
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Login Page',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 30),
                            )),
                         Container(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            controller: usernameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'User Name',
                            ),
                            validator: (value) {
                                if (value.isEmpty){
                                    return 'must enter username';
                                       }
                                     return null;
                                      },

                          ),
                         ),
                         Container(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Enter Email',
                            ),
                            validator: (value)
                          {
                            if(value.isEmpty || !value.contains('@gmail.com'))
                              {
                                return 'invalid email';
                              }
                            return null;
                          },
                          ),
                         ),
                         Container(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            obscureText: true,

                            controller: passwordController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                            ),

                             validator: (value)
                          {
                            if(value.isEmpty || value.length<=5)
                              {
                                return 'invalid password';
                              }
                           return null;
                          },

                                                    /*validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter valid Password';
                                          }
                                          return null;
                                        },       */                      
                                          
                          ),
                            
                        ),
                        FlatButton(
                          onPressed: () {
                            // Navigator.pop(context);
                            Navigator.of(context).pushNamed('/third');
                          },
                          textColor: Colors.blue,
                          child: Text('Forgot Password'),
                        ),
                        Container(
                            height: 50,
                            padding: EdgeInsets.all(10),
                            child: RaisedButton(
                              textColor: Colors.white,
                              color: Colors.blue,
                              child: Text('Login'),
                              onPressed: () async {
                                String name = await CacheXCore.instance.getString(key: 'ft3');
                                String email = await CacheXCore.instance .getString(key: 'ft4');
                                String password = await CacheXCore.instance .getString(key: 'ft5 ');
                                //  String name=cacheX.getString(key: 'ft3');
                                //  String email =cacheX.getString(key: 'ft4');
                                //  String password= cacheX.getString(key: 'ft5');

                                print(name);
                                print(email);
                                print(password);
                                // print(cacheX.getKeys());
                               
                             /*  if (_formKey.currentState.validate()) {

                                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Success!')));
                                        }  */

                                
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text("Login"),
                                          content:
                                              Text("Are you sure to login  ?"),
                                          actions: [
                                            TextButton(
                                              child: Text('OK'),
                                              onPressed: () {
                                               
                                                    Navigator.pushNamed(context, '/four');
                                              },
                                            ),

                                             TextButton(
                                              child: Text('Cancel'),
                                              onPressed: () {
                                                Navigator.of(context)
                                                    .pop(true);
                                              },
                                            ),
                                            
                                          ],
                                        );
                                      });
                              },
                            )),
                        Container(
                            child: Row(
                          children: <Widget>[
                            Text('Does not have account?'),
                            FlatButton(
                              textColor: Colors.blue,
                              child: Text(
                                'Sign Up',
                                style: TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                         
                       Navigator.pushNamed(context, '/');
                           

                                //signup screen
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

class ItemCount {
}
*/

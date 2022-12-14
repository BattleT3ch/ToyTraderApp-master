import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:toy_trader/screens/authentication/QuestionnaireScreen.dart';
import 'package:toy_trader/screens/authentication/SignInScreen.dart';
import 'package:toy_trader/screens/authentication/PhotoAndNameScreen.dart';
import '../HomeScreen.dart';
import 'AuthService.dart';


class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegistrationScreen();
}

class _RegistrationScreen extends State<RegistrationScreen>{
  AuthService authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  String userName = ' ';
  String email = ' ';
  String password = ' ';
  String error = ' ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toy Trader',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
        ),
      ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(25,0,25,130),
            child: Form(
                child: Column(children: <Widget>[
                  Image.asset(
                      'assets/images/logo.png',
                      width: 350,
                      height: 175
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(hintText: 'Enter Name',),
                          validator: (val) => val!.isEmpty ? 'No Name Entered' : null,
                          onChanged: (val) {
                            setState(() => userName = val);
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration: InputDecoration(hintText: 'Enter a Email',
                          ),
                          validator: (val) => val!.isEmpty ? 'Invalid Email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration: InputDecoration(hintText: 'Make a Password',
                          ),
                          validator: (val) => val!.length < 2? 'Password must be at least 2 chars' : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                          obscureText: true,
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          decoration: InputDecoration(hintText: ' Comfirm Password',
                          ),
                          validator: (val) => val!.length == password? 'Does not match Password' : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                          obscureText: true,
                        ),
                        const Text('Password must be at least 8 characters long',
                        style: TextStyle(fontSize: 12),
                        ),
                        const Text('Password must have at least 1 number',
                        style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: 20.0),
                        RaisedButton(
                            child: Text('Register Now'),
                            onPressed: () async {
                              if(_formKey.currentState!.validate()){
                                dynamic result = await authService.register(email, password);
                                if(result == null){
                                  setState(() => error = 'Unable to make account');
                                }
                              }
                            }
                        ),
                      ],
                    ),
                  ),
                ]
                )
            )
        )
    );
  }
}

/*
class RegistrationScreen extends StatelessWidget{
  const RegistrationScreen({Key? key}) : super(key: key);

  //@override
  //_RegisterScreenState createState() => _RegisterScreenState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xffC4DFCB),
      appBar: AppBar(
        title: const Text(
          "Toy Trader",
          style: TextStyle(
            // color: Theme.of(context).primaryColor,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        // centerTitle: true,
        // backgroundColor: Colors.white,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          // color: const Color(0xffC4DFCB),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0,10,0,5),
                child: Image.asset(
                    'assets/images/logo.png',
                    width: 150,
                    height: 150
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(5),
                child: SizedBox(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Username',
                    ),
                  ),
                  height: 50,
                  width: 350,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(5),
                child: SizedBox(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Email',
                    ),
                  ),
                  height: 50,
                  width: 350,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(5),
                child: SizedBox(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Choose Password',
                    ),
                  ),
                  height: 50,
                  width: 350,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(5),
                child: SizedBox(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Confirm Password',
                    ),
                  ),
                  height: 50,
                  width: 350,
                ),
              ),
              const Text(
                "*Has at least 8 characters",
                style: TextStyle(
                    fontSize: 12
                ),
              ),
              const Text(
                "*Has at least 1 number",
                style: TextStyle(
                    fontSize: 12
                ),
              ),
              const SizedBox(height: 20.0),
              RaisedButton(
                  child: const Text('Sign Up'),
                  onPressed: ()  {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PhotoAndNameScreen()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
 */
import 'package:flutter/material.dart';
import 'package:hello/auth/auth_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthProvider authProvider = AuthProvider();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _saveForm() {
    if (_formKey.currentState.validate()) {
      print(_emailController.text);
      print(_passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register a User'),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/login.jpeg'), fit: BoxFit.cover)),
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.topCenter,
                      colors: [
                    Colors.black45,
                    Colors.black26,
                  ])),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      TextFormField(
                        controller: _emailController,
                        validator: (value) => !value.contains('@')
                            ? 'Please enter a valid email'
                            : null,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'Email',
                            hintText: 'Email is required'),
                      ),
                      SizedBox(height: 15.0),
                      TextFormField(
                        controller: _passwordController,
                        validator: (value) => value.trim().length < 6
                            ? 'Password is too weak'
                            : null,
                        obscureText: true,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.https),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            labelText: 'Password',
                            hintText: 'Password is required'),
                      ),
                      ButtonBar(
                        children: <Widget>[
                          FlatButton(
                              onPressed: () {}, child: Text('Forgot Password?'))
                        ],
                      ),
                      SizedBox(height: 10.0),
                      RaisedButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          _emailController.clear();
                          _passwordController.clear();
                          _saveForm();
                          authProvider.signInWithEmailAndPassword(
                              _emailController.text, _passwordController.text);

                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('Signing in...'),
                          ));
                        },
                        child: Text('Sign In'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

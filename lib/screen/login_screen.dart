import 'package:flutter/material.dart';
import 'package:hello/auth/auth_service.dart';
import 'package:hello/widgets/custom_icon.dart';
import 'package:hello/widgets/social_login.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthProvider authProvider = AuthProvider();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  Widget _horizontalLine() => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Container(
          width: 90.0,
          height: 1.0,
          color: Colors.black26.withOpacity(.2),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Image.asset('assets/login.jpeg'),
              ),
              // Expanded(child: Container()),
              // Image.asset('assets/bg.jpeg')
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 28, right: 28, top: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            gradient: LinearGradient(
                                colors: [Colors.black38, Colors.black54])),
                        child: Text(
                          'Renegades Africa',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: double.infinity,
                    height: 430.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 15,
                            color: Colors.black12,
                            offset: Offset(0.0, 15.0),
                          ),
                          BoxShadow(
                            blurRadius: 10,
                            color: Colors.black12,
                            offset: Offset(0.0, -10.0),
                          ),
                        ]),
                    child: Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Account',
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 15.0),
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10.0),
                                suffixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(
                                    gapPadding: 50.0,
                                    borderRadius: BorderRadius.circular(40.0)),
                                hintText: '* Email is required',
                                labelText: 'Email'),
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10.0),
                                suffixIcon: Icon(Icons.https),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40.0)),
                                hintText: '* Password is required',
                                labelText: 'Password'),
                          ),
                          ButtonBar(
                            children: <Widget>[
                              FlatButton(
                                  onPressed: () async {
                                    await authProvider
                                        .signInWithEmailAndPassword(
                                            _emailController.text,
                                            _passwordController.text);
                                  },
                                  child: Text('Forgot Password?'))
                            ],
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 40.0,
                              child: MaterialButton(
                                splashColor: Color(0xFF6078EA),
                                color: Color(0xFF17EAD9),
                                onPressed: () async {
                                  await authProvider
                                      .createUserWithEmailAndPassword(
                                    _emailController.text,
                                    _passwordController.text,
                                  );

                                  // Scaffold.of(context).showSnackBar(SnackBar(
                                  //   backgroundColor: Colors.green,
                                  //   content:
                                  //       Text('Account successfully created'),
                                  // ));
                                },
                                child: Center(
                                    child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                )),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              _horizontalLine(),
                              Text('Social Login'),
                              _horizontalLine(),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SocialLogin(
                                colors: [
                                  Color(0xFF102397),
                                  Color(0xFF187adf),
                                  Color(0xFF00eaf8),
                                ],
                                icon: CustomSocialIcon.facebook,
                                onPressed: () {},
                              ),
                              SocialLogin(
                                colors: [
                                  Color(0xFF102397),
                                  Color(0xFF187adf),
                                  Color(0xFF00eaf8),
                                ],
                                icon: CustomSocialIcon.twitter,
                                onPressed: () {},
                              ),
                              SocialLogin(
                                colors: [
                                  Color(0xFF102397),
                                  Color(0xFF187adf),
                                  Color(0xFF00eaf8),
                                ],
                                icon: CustomSocialIcon.facebook,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

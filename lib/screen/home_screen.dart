import 'package:flutter/material.dart';
import 'package:hello/constants/styles.dart';
import 'package:hello/screen/login_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/bg.jpeg'), fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
            Colors.teal.withOpacity(.9),
            Colors.green.withOpacity(.3),
          ])),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text('Welcome to VOIKA Services,',
                    style: Styles.kWelcomeFirstText),
                SizedBox(height: 30.0),
                Text(
                    'A free service to make free phone calls which is sponsored by Renegades Africa',
                    style: Styles.kWelcomeSecondText),
                SizedBox(height: 30.0),
                Container(
                  height: 45.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: FlatButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => LoginScreen()));
                          },
                          child: Text('Create An Account!'))),
                ),
                SizedBox(height: 20.0),
                Container(
                    height: 45.0,
                    decoration: BoxDecoration(
                        // color: Colors.white,
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(20)),
                    child: FlatButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => LoginScreen()));
                        },
                        child: Text('Sign In')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

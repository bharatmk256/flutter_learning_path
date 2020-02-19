import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = AnimationController(
      vsync: this,
      duration: Duration(microseconds: 500),
    );
    _iconAnimation = CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.easeInOut,
    );
    _iconAnimation.addListener(() {
      this.setState(() {});
      _iconAnimationController.reset();
      _iconAnimationController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage('assets/boy.jpg'),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
              Form(
                child: Container(
                  padding: const EdgeInsets.all(40.0),
                  child: Theme(
                    data: ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.teal,
                      inputDecorationTheme: InputDecorationTheme(
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Enter email',
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Enter password',
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        MaterialButton(
                          onPressed: () {},
                          textColor: Colors.white,
                          child: Text('Login'),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

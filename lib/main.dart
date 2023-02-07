// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'themes.dart';
import 'gettheme.dart';

Future main() async {
  await dotenv.load(fileName: "assets/client.env");

  runApp(Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = getTheme();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: theme.primaryColor,
          scaffoldBackgroundColor: theme.scaffoldBackgroundColor,
          fontFamily: theme.fontFamily,
          brightness: Brightness.dark),
      title: 'Development',
      home: Scaffold(
        appBar: theme.kShowAppBar
            ? AppBar(title: Text(theme.kStatusBarHeader))
            : null,
        body: Center(
          child: Container(
            decoration: theme.kGradientStyle,
            // child: Text(AppConfig.of(context).buildFlavor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  theme.kMainHeader,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
                Image.asset(
                  'assets/hero.png',
                  width: 180.0,
                  height: 180.0,
                ),
                Text(
                  theme.kSubHeader,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

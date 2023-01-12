import 'package:flutter/material.dart';
import 'package:flutter_todo/Ui/home_page.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final currentHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(currentHeight * 0.05),
                // padding: EdgeInsets.only(top: currentHeight * 0.1),
                child: Lottie.network(
                    'https://assets10.lottiefiles.com/packages/lf20_mf5j5kua.json'),
              ),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50.0,
                child: Image(
                  image: AssetImage('images/logos.png'),
                ),
              ),
              SizedBox(
                height: currentHeight * 0.02,
              ),
              Text(
                'Do-Todo',
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900]),
              ),
              SizedBox(
                height: currentHeight * 0.02,
              ),
              SizedBox(
                height: currentHeight * 0.05,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 5,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    )),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomePage();
                  }));
                },
                child: Padding(
                  padding: EdgeInsets.all(currentHeight * 0.02),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.blue[900],
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

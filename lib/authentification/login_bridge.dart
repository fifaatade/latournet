import 'package:fintrackai/authentification/login.dart';
import 'package:flutter/material.dart';

class LoginBridge extends StatefulWidget {
  const LoginBridge({super.key});

  @override
  State<LoginBridge> createState() => _LoginBridgeState();
}

class _LoginBridgeState extends State<LoginBridge> {
  @override
    Widget customSizedBox() => SizedBox(
        height: MediaQuery.of(context).size.height * .015,
      );
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .425,
            child: Center(
              child: Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "Connectez-vous maintenant",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Lexend",
                  color: Color(0XFF1F1F1F)),
              textAlign: TextAlign.center,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Rejoignez CashFlow Manager et prenez le contôle de vos finances dès aujourd'hui.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Lexend",
                  color: Color(0XFF1F1F1F),
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .05,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    backgroundColor: const Color(0XFF001752),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.mail, color: Colors.white),
                    SizedBox(width: 10.0),
                    Text(
                      "Se connecter avec Gmail",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Lexend"),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ),
                      (route) => false);
                }),
          ),
          customSizedBox(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    backgroundColor: const Color(0XFF001752),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/google.png",
                      fit: BoxFit.cover,
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(width: 10.0),
                    const Text(
                      "Se connecter avec Google",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Lexend"),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ),
                      (route) => false);
                }),
          ),
          customSizedBox(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.apple, color: Colors.white),
                    SizedBox(width: 10.0),
                    Text(
                      "Se connecter avec Apple",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Lexend"),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ),
                      (route) => false);
                }),
          ),
        ],
      ),
    ));
  }
}


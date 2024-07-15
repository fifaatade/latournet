import 'package:fintrackai/user_page/devise.dart';
import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.jpg"),
          fit: BoxFit.cover,
          ),
        ),
        child:Column(
          children: [
            Padding(
            padding: const EdgeInsets.only(top: 100,bottom: 80),
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
              "Bonjour Gildo !",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Lexend",
                  color: Color(0XFF001752)),
              textAlign: TextAlign.center,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "Bienvenue à CashFlow, c'est un ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Lexend",
                      color: Color(0XFF1F1F1F),
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "plaisir de vous voir ici.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Lexend",
                      color: Color(0XFF1F1F1F),
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    backgroundColor: const Color(0XFF001752),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 5.0), 
                    Text(
                      "Lancer vous maintenant",
                      style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500,fontFamily: "Lexend"),
                    ),
                  ],
                ),
                onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Devise(),
                  ),
                );
              },),
          ),
          ]) ,
      ),
    );
  }
}

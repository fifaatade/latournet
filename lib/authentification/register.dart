import 'package:fintrackai/authentification/login.dart';
import 'package:fintrackai/authentification/login_bridge.dart';
import 'package:fintrackai/authentification/register_bridge.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget customSizedBox() => SizedBox(
        height: MediaQuery.of(context).size.height * .015,
      );
  TextEditingController _mailController = TextEditingController();
  @override
  void dispose() {
    _mailController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
        child: Column(children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .325,
            child: Center(
              child: Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left:30,right:30,top:30),
            child: Text(
              "Votre adresse e-mail",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Lexend",
                  color: Color(0XFF1F1F1F)),
              textAlign: TextAlign.center,
            ),
          ),
            Padding(
              padding: const EdgeInsets.only(
              right: 30,
              left: 30,
              bottom: 25,
            ),
            child: TextField(
                controller: _mailController,
                decoration: const InputDecoration(
                  fillColor: Color(0XFF1F1F1F),
                  suffixIconColor: Color.fromARGB(137, 62, 67, 109),
                  labelText: "Adresse mail",
                  hintText: "hellogildo@gmail.com",
                  suffixIcon: Icon(Icons.cancel),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 30.0,
                  right: 30,
                  left: 30,
                ),
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
                    SizedBox(
                        width: 5.0), 
                    Text(
                      "S'inscrire avec Gmail",
                      style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500,fontFamily: "Lexend"),
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginBridge(),
                      ),
                      (route) => false);
                }),
          ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Expanded( 
              child: Padding(
                padding: EdgeInsets.only(left:30.0),
                child: Divider(
                  color: Color(0XFF9FB2F2),
                  thickness: 2,
                  height: 3, 
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Ou continuer avec ",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center, 
              ),
            ),
            Expanded( 
              child: Padding(
                padding: EdgeInsets.only(right:30.0),
                child: Divider(
                  color: Color(0XFF9FB2F2),
                  thickness: 2,
                  height: 3,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 30),
          child: Row(
          
            mainAxisAlignment: MainAxisAlignment.spaceBetween, 
            children: [
            Expanded(child:
            ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      backgroundColor: const Color(0XFFF1F4FF),
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
                    ],
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginBridge(),
                        ),
                        (route) => false);
                  })
            
            ,),
             const SizedBox(width: 20.0), 
        
             Expanded(child:
            ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40))),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.apple, color: Colors.white),
                    ],
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterBridge(),
                        ),
                        (route) => false);
                  })
            
            ,),
           
            ]
          ),
        ),
        const SizedBox(height: 20,),
        Row(
         
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Container(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
                child: const Text.rich(TextSpan(
                    text: "Vous avez déjà un compte ?",
                    style: TextStyle(
                      color: Color(0XFF1F1F1F),
                      fontFamily: "Poppins",
                      fontSize: 12,
                      fontWeight: FontWeight.w500
                    ),
                    children: [
                      TextSpan(
                        text: " Se connecter",
                        style: TextStyle(
                        color: Color(0XFFEDCC19),
                        fontFamily: "Poppins",
                       fontSize: 12,
                       fontWeight: FontWeight.w600                          ),
                      )
                    ])),
              ),
            ),
           ]
        )
        
        ]),
      ),
    );
  }
}

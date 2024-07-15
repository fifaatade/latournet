import 'package:fintrackai/authentification/register_bridge.dart';
import 'package:fintrackai/models/ob_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController controller = PageController(initialPage: 0);
  int page = 0;

  List<ObModel> slides = [
    ObModel(
      title: "Maîtrisez vos finances",
      image: "assets/images/ob1.png",
      description:
          "Prenez le contrôle total de vos finances dès aujourd'hui avec CashFlow Manager ",
    ),
    ObModel(
      title: "Liberté financière maintenant",
      image: "assets/images/ob2.png",
      description:
          "Optimisez votre santé financière dès maintenant avec CashFlow Manager",
    )
  ];

  myButtons() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: slides
                    .map(
                      (e) => Container(
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: page == slides.indexOf(e)
                              ?  const Color(0XFF001752)
                              : Colors.grey,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      backgroundColor: const Color(0XFF001752),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40))),
                  child: const Text(
                    "Suivant",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    if (page == slides.length -1) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterBridge(),
                          ),
                          (route) => false);
                    } else {
                      controller.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.fastOutSlowIn,
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget obTile(ObModel ob) => Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top:30.0,bottom: 20,left:10,right:10),
              child: Image.asset(ob.image, fit: BoxFit.contain,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:20,left:20,right:20,bottom:10),
            child: Text(
              ob.title,
              style: const TextStyle(
                  fontSize: 35,
                  fontFamily: "Lexend",
                  fontWeight: FontWeight.w700,
                  color: Color(0XFF1F1F1F)),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:20,right:20,bottom:40),
            child: Text(
              ob.description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 14,
                  fontFamily: "Lexend",
                  color: Color(0XFF1F1F1F),
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                children: slides.map((e) => obTile(e)).toList(),
                onPageChanged: (value) {
                  setState(() => page = value);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: myButtons(),
            ),
            const SizedBox(height: 40,)
        
          ],
        ),
      ),
    );
  }
}

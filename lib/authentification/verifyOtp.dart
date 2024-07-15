import 'package:flutter/material.dart';

class VerifyOtp extends StatefulWidget {
  @override
  _VerifyOtpState createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  List<String> code = ['', '', '', ''];

  void _onKeyPressed(String value) {
    setState(() {
      for (int i = 0; i < code.length; i++) {
        if (code[i] == '') {
          code[i] = value;
          break;
        }
      }
    });
  }

  void _onDeletePressed() {
    setState(() {
      for (int i = code.length - 1; i >= 0; i--) {
        if (code[i] != '') {
          code[i] = '';
          break;
        }
      }
    });
  }

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 90,),
              const Text(
                'Verification code',
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Lexend",
                  color: Color(0XFF1F1F1F)),
              textAlign: TextAlign.center,            ),
              const SizedBox(height: 10),
              const Text(
                'Nous avons envoyé le code de vérification sur le : he******do@gmail.com',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Lexend",
                    color: Color(0XFF1F1F1F),
                    fontWeight: FontWeight.w400),            ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        code[index],
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // Handle resend code
                },
                child: const Text('Renvoyer le code',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Lexend",
                    color: Color(0XFF1F1F1F),
                    backgroundColor: Colors.transparent,
                    fontWeight: FontWeight.w400),),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: 12,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    if (index < 9) {
                      return _buildKey((index + 1).toString());
                    } else if (index == 9) {
                      return _buildKey('*');
                    } else if (index == 10) {
                      return _buildKey('0');
                    } else {
                      return _buildKey('x');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildKey(String value) {
    return GestureDetector(
      onTap: () {
        if (value == 'x') {
          _onDeletePressed();
        } else {
          _onKeyPressed(value);
        }
      },
      child: Container(
        //width: 10,
        //height: 10,
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black),
        ),
        child: Center(
          child: Text(
            value,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}

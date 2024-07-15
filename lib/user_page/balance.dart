import 'package:fintrackai/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

class Balance extends StatefulWidget {
  const Balance({super.key});

  @override
  State<Balance> createState() => _BalanceState();
}

class _BalanceState extends State<Balance> {
  final TextEditingController _amountController =
      TextEditingController(text: "10.000");

  Widget customBody() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/Illustration.png',
            height: MediaQuery.of(context).size.height * 0.20,
            width: 185,
          ),
          const SizedBox(height: 20),
          const Text(
            'Établir solde espèces',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              fontFamily: "Lexend",
              height: 1.2,
              color: Color(0XFF001752),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          const Text(
            'Combien d’argent liquide avez-vous dans votre portefeuille?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontFamily: "Lexend",
              color: Color(0XFF1F1F1F),
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 3),
            width: MediaQuery.of(context).size.width * 0.90,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: const Color(0xFFCFD8F9), width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 50),
                Expanded(
                  child: Center(
                    child: TextField(
                      readOnly: true,
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: '10.000',
                      ),
                      style: const TextStyle(
                        fontSize: 26,
                        fontFamily: "Lexend",
                        fontWeight: FontWeight.w600,
                        color: Color(0XFF23262F),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(13),
                  decoration: const BoxDecoration(
                    color: Color(0xFFEDCC19),
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    'XOF',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
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
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Terminer",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Lexend",
                    ),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Dashboard(),
                  ),
                );
              },
            ),
          ),
          Container(
            child: CustomKeyboard(
              onKeyTap: (value) {
                setState(() {
                  _amountController.text += value;
                });
              },
              onBackspace: () {
                setState(() {
                  if (_amountController.text.isNotEmpty) {
                    _amountController.text = _amountController.text
                        .substring(0, _amountController.text.length - 1);
                  }
                });
              },
              onSpecialKey: (value) {
                setState(() {
                  _amountController.text += value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Dashboard(),
                    ),
                  );
                },
                child: const Text(
                  'Passer',
                  style: TextStyle(
                    color: Color(0XFF001752),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    fontFamily: 'Lexend',
                  ),
                ),
              )
            ],
          ),
        ),
        customBody(),
      ],
    ));
  }
}

class CustomKeyboard extends StatefulWidget {
  final Function(String) onKeyTap;
  final Function onBackspace;
  final Function(String) onSpecialKey;

  CustomKeyboard({
    required this.onKeyTap,
    required this.onBackspace,
    required this.onSpecialKey,
  });

  @override
  _CustomKeyboardState createState() => _CustomKeyboardState();
}

class _CustomKeyboardState extends State<CustomKeyboard> {
  List<String> specialKeys = ['+*#', '+*#', '+*#'];
  int specialKeyIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF1F4FF),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              buildNumberButton('1', ''),
              buildNumberButton('2', 'ABC'),
              buildNumberButton('3', 'DEF'),
            ],
          ),
          Row(
            children: [
              buildNumberButton('4', 'GHI'),
              buildNumberButton('5', 'JKL'),
              buildNumberButton('6', 'MNO'),
            ],
          ),
          Row(
            children: [
              buildNumberButton('7', 'PQRS'),
              buildNumberButton('8', 'TUV'),
              buildNumberButton('9', 'WXYZ'),
            ],
          ),
          Row(
            children: [
              buildSpecialButton('+*#'),
              buildNumberButton('0', ''),
              buildBackspaceButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildNumberButton(String number, String? letter) {
    return Expanded(
      child: InkWell(
        onTap: () => widget.onKeyTap(number),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: 55,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Text(
                  number,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF00113E),
                  ),
                ),
                Text(
                  letter!,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF00113E),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBackspaceButton() {
    return Expanded(
      child: InkWell(
        onTap: () => widget.onBackspace(),
        child: Container(
          height: 80,
          alignment: Alignment.center,
          child: const Icon(
            Icons.backspace,
            color: Color(0xFF00113E),
          ),
        ),
      ),
    );
  }

  Widget buildSpecialButton(
    String number,
  ) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            specialKeyIndex = (specialKeyIndex + 1) % specialKeys.length;
          });
        },
        onLongPress: () => widget.onSpecialKey(specialKeys[specialKeyIndex]),
        child: Container(
          height: 80,
          alignment: Alignment.center,
          child: Text(
            specialKeys[specialKeyIndex],
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00113E),
            ),
          ),
        ),
      ),
    );
  }
}

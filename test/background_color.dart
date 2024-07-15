import 'package:flutter/material.dart';

class EtablirSoldePage extends StatefulWidget {
  @override
  _EtablirSoldePageState createState() => _EtablirSoldePageState();
}

class _EtablirSoldePageState extends State<EtablirSoldePage> {
  final TextEditingController _amountController = TextEditingController(text: "10.000");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  // Action for 'Passer'
                },
                child: Text(
                  'Passer',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            SizedBox(height: 10),
            Image.asset(
              'assets/images/illustration.png',
              height: 150,
            ),
            SizedBox(height: 20),
            Text(
              'Établir solde espèces',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF001752),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Combien d’argent liquide avez-vous dans votre portefeuille?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _amountController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '0.00',
                      ),
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Color(0xFFF8C300),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'XOF',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 22),
                backgroundColor: Color(0xFF001752),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              onPressed: () {
                // Action for 'Terminer'
              },
              child: Text(
                'Terminer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Lexend",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: EtablirSoldePage(),
  ));
}

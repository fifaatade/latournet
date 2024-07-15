import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/currency_model.dart';
import '../services/currency_service.dart';
import 'balance.dart';

class Devise extends StatelessWidget {
  const Devise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DeviseScreen()
    );
  }
}

class DeviseScreen extends StatelessWidget {
  const DeviseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currencyService = Provider.of<CurrencyService>(context);

    String? _selectedCurrency = 'XOF - franc CFA (BCEAO)';
    TextEditingController searchController = TextEditingController();

    Future<Currency?> showCurrencyPicker(BuildContext context) async {
      return await showModalBottomSheet<Currency>(
        context: context,
        builder: (context) {
          double screenHeight = MediaQuery.of(context).size.height;
          return SizedBox(
            height: screenHeight * 0.9,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    "Sélectionnez la devise de référence",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Lexend",
                      height: 1.2,
                      color: Color(0XFF001752),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: searchController,
                    onChanged: (query) => currencyService.filterCurrencies(query),
                    decoration: InputDecoration(
                      labelText: 'Nom de la devise',
                      hintText: 'Nom de la devise',
                      prefixIcon: const Icon(Icons.search, size: 20),
                      prefixIconColor: const Color(0XFFA2A2A7),
                      filled: true,
                      fillColor: const Color(0xFFEFF3FE),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(
                          color: const Color(0xFF8C98A8).withOpacity(0.2),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(
                          color: const Color(0xFF8C98A8).withOpacity(0.2),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide(
                          color: const Color(0xFF8C98A8).withOpacity(0.2),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: currencyService.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ListView.builder(
                            itemCount: currencyService.filteredCurrencies.length,
                            itemBuilder: (context, index) {
                              if (index < currencyService.filteredCurrencies.length) {
                                return ListTile(
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        currencyService.filteredCurrencies[index].name,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontFamily: "Lexend",
                                        ),
                                      ),
                                      Text(
                                        currencyService.filteredCurrencies[index].code,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontFamily: "Lexend",
                                        ),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    currencyService.filterCurrencies("");
                                    Navigator.pop(context, currencyService.filteredCurrencies[index]);
                                  },
                                );
                              } else {
                                return const SizedBox(); // Placeholder for safety
                              }
                            },
                          ),
                        ),
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 50),
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "Sélectionnez la devise de référence",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Lexend",
                  height: 1.2,
                  color: Color(0XFF001752),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Commencez par sélectionner votre devise de base. Toutes les transactions vers d'autres devises seront calculées à partir de celle-ci.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Lexend",
                  color: Color(0XFF1F1F1F),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  backgroundColor: const Color(0XFFEFF3FE),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                onPressed: () async {
                  final selectedCurrency = await showCurrencyPicker(context);
                  if (selectedCurrency != null) {
                    _selectedCurrency =
                        '${selectedCurrency.code} - ${selectedCurrency.name}';
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedCurrency ?? 'Sélectionnez une devise',
                      style: const TextStyle(
                        color: Color(0XFF001752),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Lexend",
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0XFF001752),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
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
                      "Suivant",
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
                      builder: (context) => const Balance(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

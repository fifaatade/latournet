import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/currency_model.dart';

class CurrencyService extends ChangeNotifier {
  List<Currency> currencies = [];
  List<Currency> filteredCurrencies = [];
  bool isLoading = true;

  CurrencyService() {
    fetchCurrencies();
  }

  Future<void> fetchCurrencies() async {
    final response = await http.get(Uri.parse('https://countriesnow.space/api/v0.1/countries/currency'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['data'];
      currencies = data.map((json) => Currency.fromJson(json)).toList();
      currencies.sort((a, b) => a.name.compareTo(b.name)); // Tri par nom de devise
      filteredCurrencies = List.from(currencies); // Initialisation des devises filtrées
      isLoading = false;
      notifyListeners();
    } else {
      throw Exception('Failed to load currencies');
    }
  }

  void filterCurrencies(String query) {
    if (query.isEmpty) {
      filteredCurrencies = List.from(currencies);
    } else {
      filteredCurrencies = currencies.where((currency) =>
          currency.name.toLowerCase().contains(query.toLowerCase()) ||
              currency.code.toLowerCase().contains(query.toLowerCase())).toList();
    }
    notifyListeners();
  }
}

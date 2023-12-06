import 'dart:convert';
import 'package:api_cat/models/cat.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class CatProvider extends ChangeNotifier {
  final String _baseUrl = 'api.thecatapi.com';

  List<CatResponse>? catList; // Almacena la lista de gatos obtenida

  CatProvider();

  Future<void> getCats() async {
    try {
      var url = Uri.http(_baseUrl, '/v1/images/search', {'limit': '10'});

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> decodedData = json.decode(response.body);

        catList = decodedData.map((json) => CatResponse.fromJson(json)).toList();

        notifyListeners();
      } else {
        throw Exception('Failed to load cat images');
      }
    } catch (error) {
      // Maneja el error según tus necesidades
      print('Error: $error');
    }
  }
}

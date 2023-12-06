import 'dart:convert';
import 'package:api_cat/models/cat.dart';
import 'package:http/http.dart' as http;


class CatApiService {
  final String _baseUrl = 'api.thecatapi.com';

  Future<List<CatResponse>> getCats({int limit = 10}) async {
    try {
      var url = Uri.http(_baseUrl, '/v1/images/search', {'limit': '$limit'});

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> decodedData = json.decode(response.body);
        return decodedData.map((json) => CatResponse.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load cat images');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}

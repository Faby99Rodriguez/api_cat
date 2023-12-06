import 'package:api_cat/models/cat.dart';
import 'package:api_cat/providers/cat_services.dart';
import 'package:flutter/material.dart';

class MyScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  final CatApiService catApiService = CatApiService();
  List<CatResponse> catList = [];

  @override
  void initState() {
    super.initState();
    _loadCats();
  }

  Future<void> _loadCats() async {
    try {
      final cats = await catApiService.getCats();
      setState(() {
        catList = cats;
      });
    } catch (error) {
      print('Error loading cats: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cat Screen'),
      ),
      body: Center(
        child: catList.isEmpty
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: catList.length,
                itemBuilder: (context, index) {
                  final cat = catList[index];
                  return ListTile(
                    title: Text('Cat ${index + 1}'),
                    subtitle: Image.network(cat.url),
                  );
                },
              ),
      ),
    );
  }
  }
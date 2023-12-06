import 'dart:convert';

class CatResponse {
  String id;
  String url;
  int width;
  int height;

  CatResponse({
    required this.id,
    required this.url,
    required this.width,
    required this.height,
  });

  factory CatResponse.fromRawJson(String str) =>
      CatResponse.fromJson(json.decode(str));

  // Descomentar si es necesario
  // String toRawJson() => json.encode(toJson());

  factory CatResponse.fromJson(Map<String, dynamic> json) => CatResponse(
        id: json["id"],
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  // Descomentar si es necesario
  // Map<String, dynamic> toJson() => {
  //     "id": id,
  //     "url": url,
  //     "width": width,
  //     "height": height,
  // };
}

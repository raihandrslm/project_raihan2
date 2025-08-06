import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_raihan2/models/post_model.dart';

class PostService {
  static const String postsUrl = 'https://jsonplaceholder.typicode.com/photos';

  static Future<List<PostModel>> listPost() async {
    final response = await http.get(Uri.parse(postsUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      // Ambil 20 data teratas supaya lebih ringan
      final limitedData = jsonData.take(20).toList();
      return limitedData.map((item) => PostModel.fromJson(item)).toList();
    } else {
      throw Exception('Gagal memuat data Post');
    }
  }
}

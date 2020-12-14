import 'package:http/http.dart' as http;

class ApiTmpbForPopularList {

  Future<String> getFilms(String request) async {
    var response = await http.get(request);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }
}
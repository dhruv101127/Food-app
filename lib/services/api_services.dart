import 'package:food_delivery/model/api_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<Model>?> getModel() async {
    try {
      Uri url = Uri.parse("https://jsonplaceholder.typicode.com/users");
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        List<Model> model = modelFromJson(response.body);

        // print(model.name);
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}

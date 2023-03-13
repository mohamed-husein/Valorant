import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../core/errors/error_handler.dart';
import '../../../core/utils/api_constants.dart';
import '../model/agents_model.dart';

class WebServices {
  Future<List<Agents>> getAgentsInfo() async {
    http.Response response = await http.get(
      Uri.parse(ApiConstants.agentsApiPath),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      List jsonData =
          (jsonDecode(response.body) as Map<String, dynamic>)['data'];
      return List.from(
        jsonData.map(
          (e) => Agents.fromJson(e),
        ),
      );
    } else {
      throw ServerException();
    }
  }
}

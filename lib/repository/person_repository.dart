import 'dart:convert';

import 'package:http/http.dart';
import 'package:unity_test_study/models/person.dart';

class PersonRepository {
  final Client client;

  PersonRepository(this.client);

  Future<List<Person>> getPerson() async {
    final response = await client.get(
      Uri.parse(
          'https://eb292c5d-cfbb-4095-8dc2-cfd8ffd920b0.mock.pstmn.io/persona'),
    );

    if (response.statusCode == 200) {
      final jsonList = jsonDecode(response.body) as List;
      return jsonList.map((e) => Person.fromMap(e)).toList();
    } else {
      throw Exception('Error na internet');
    }
  }
}

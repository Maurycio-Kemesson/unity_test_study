import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:unity_test_study/repository/person_repository.dart';
import 'package:flutter_test/flutter_test.dart';

class ClientMock extends Mock implements http.Client {}

void main() {
  final client = ClientMock();
  final repository = PersonRepository(client);
  registerFallbackValue(Uri.parse(''));
  test("A api deve pegar uma lista de person", () async {
    when(
      () => client.get(any()),
    ).thenAnswer((_) async => http.Response(jsonReturn, 200));

    final list = await repository.getPerson();

    expect(list.isNotEmpty, equals(true));
    expect(list.first.name, equals('Maria'));
  });

  test('retornar um exception se não for statuscode 200', () async {
    when(
      () => client.get(any()),
    ).thenAnswer((_) async => http.Response(jsonReturn, 404));

    expect(() async => await repository.getPerson(), throwsException);
  });
}

const jsonReturn =
    '[{ "id": "1", "name": "Maria", "age": 343343, "height": 33334, "weight": 43434 }, { "id": "2", "name": "Pedro", "age": 23323, "height": 34333, "weight": 34232 }, { "id": "3", "name": "Lucas", "age": 33333, "height": 34256, "weight": 12121 }, { "id": "4", "name": "Camila", "age": 34344, "height": 65456, "weight": 67890 }, { "id": "5", "name": "Murilo", "age": 22222, "height": 454554, "weight": 76543 }, { "id": "6", "name": "Valdeli", "age": 11111, "height": 55456, "weight": 34632 }, { "id": "7", "name": "Junior", "age": 34234, "height": 34345, "weight": 14523 }, { "id": "8", "name": "Gustava", "age": 23456, "height": 44898, "weight": 16789 }, { "id": "9", "name": "Jorge", "age": 23454, "height": 11111, "weight": 34343 }, { "id": "10", "name": "Mateus", "age": 45643, "height": 21212, "weight": 12345 }, { "id": "11", "name": "Vitor", "age": 34545, "height": 13454, "weight": 54322 }]';

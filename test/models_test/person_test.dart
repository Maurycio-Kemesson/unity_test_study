import 'package:unity_test_study/models/person.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final person = Person(
      id: "1", name: "Maurycio Kemesson", age: 21, height: 1.66, weight: 83);

  test('Imc deve vir 30.12', () {
    expect(person.imc, 30.12);
  });
  group("isOlder | ", () {
    test('Se a idade for maior ou igual a 18, então isOlder deve ser true', () {
      expect(person.isOlder, true);
    });

    test('Se a idade for menor que 18, então isOlder deve ser false', () {
      final person = Person(
          id: "2",
          name: "Maurycio Kemesson",
          age: 17,
          height: 1.66,
          weight: 83);
      expect(person.isOlder, false);
    });
  });
}

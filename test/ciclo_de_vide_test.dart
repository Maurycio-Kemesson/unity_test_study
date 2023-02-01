//@Timeout(Duration(seconds: 60)) usado para alterar o time padrão da execução do teste todo
//@Skip('Skip de teste ainda incompleto');
//@Tags(['web']); Executando só os testes com a tag citada;
import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';

// Ciclo de vida dos testes no dart/flutter
void main() {
  setUpAll(() {
    log('iniciando a swit');
  });
  setUp(() {
    print('inicio do teste (parecido com o initState)');
  });

  tearDown(() {
    print('destroi o teste)');
  });
  test('isWorked', () {
    print('Executando os testes');
  });

  test('isWorked 2', () {
    print('Executando os testes 2');
  });
  tearDownAll(() {
    print('finalizando a swit');
  });

  test('description', () {
    const name = 'Maurycio';
    expect(name, equals('Maurycio'));
    expect(name, isNotNull);
    expect(name, contains('Ma'));
    expect(name, isA<String>());

    expect(name,
        allOf([equals('Maurycio'), isNotNull, contains('Ma'), isA<String>()]));
  });

  test('throw error', () {
    expect(() => int.parse('x'), throwsException);
  }, timeout: const Timeout(Duration(seconds: 60)));

  test('Desconsiderar o teste', () {
    expect(() => int.parse('x'), throwsException);
  }, skip: 'Falta termina esse caso de teste');

  test('Tags para usar nos testes, o mesmo se comporta como um filtro', () {
    expect(() => int.parse('x'), throwsException);
  }, tags: 'web');
}

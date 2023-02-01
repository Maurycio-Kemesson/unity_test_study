# Estudos de testes flutter

Esse projeto foi criado com o objetivo de estudos de testes unitários, a estrutura está simples, pois o foco é do estudo foi somente uma introdução a testes unitários.


## Assustos estudados e aplicados aqui
- Testes unitários dart;
- Testes de bloc;
- Testes na camada repository;
- Testes de widgets;
- Ciclo de vida dos testes flutter/dart;

## Como rodar os testes desse projeto?

```dart dart test ```

<p>ou

```flutter flutter test ```

**Observação:** Para verificar a cobertura de teste execute o seguinte comando:
```flutter flutter test --coverage```

## Mudando a plataforma de testes e executando somente os testes na mesma usando as tags
```dart -p chome -t web```

## Mudando a plataforma de teste e executando todos os testes exceto alguma tag
```dart -p chome -x web``

### Extensão para gerar métodos json
- [Dart Data Class Generator (VSCode);](https://marketplace.visualstudio.com/items?itemName=hzgood.dart-data-class-generator)

### Extensão para verificar a cobertura de testes
- [Coverage Gutters;](https://marketplace.visualstudio.com/items?itemName=ryanluker.vscode-coverage-gutters)

### Mocks de dados com as seguintes labs:
Os mocks é pra não depender de outras classes principalmente quando se quer testar a unidade que tem dependencia de outra, no caso é usado os mocks que é uma forma de criar class fakes que retorna o que quisermos.

- [Mockito](https://pub.dev/packages/mockito)
- [Mocktail](https://pub.dev/packages/mocktail)

### Link úteis
- [Exemplo de testes](https://github.com/felangel/bloc/tree/master/examples)
Esse repositório contem exemplos de testes como um todo, contendo também projetos que usem bloc/cubit;
- [Introdução a testes unitários flutter](https://youtube.com/playlist?list=PLlBnICoI-g-etEtbvgDnO40SYKOSktCj4)
Uma playlist da semana de testes unitários no flutter, feito pela comunidade flutterando.
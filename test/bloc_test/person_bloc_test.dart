import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unity_test_study/bloc/person_bloc.dart';
import 'package:unity_test_study/models/person.dart';
import 'package:unity_test_study/repository/person_repository.dart';
import 'package:unity_test_study/bloc/person_event.dart';
import 'package:unity_test_study/bloc/person_state.dart';

class PersonRepositoryMock extends Mock implements PersonRepository {}

final person = Person(
    id: "1", name: "Maurycio Kemesson", age: 21, height: 1.66, weight: 83);
void main() {
  final repository = PersonRepositoryMock();
  final personBloc = PersonBloc(repository);
  test(
    'Deve retornar uma lista de person',
    () async {
      when(
        () => repository.getPerson(),
      ).thenAnswer((_) async => <Person>[person, person]);
      personBloc.add(FetchEvent());

      await expectLater(
        personBloc.stream,
        emitsInOrder(
          [
            isA<PersonLoadingState>(),
            isA<PersonListState>(),
          ],
        ),
      );
    },
  );

  test(
    'Deve disparar um erro',
    () async {
      when(
        () => repository.getPerson(),
      ).thenThrow(Exception('Deu error'));
      personBloc.add(FetchEvent());
      await expectLater(
        personBloc.stream,
        emitsInOrder(
          [
            isA<PersonLoadingState>(),
            isA<PersonErrorState>(),
          ],
        ),
      );
    },
  );
}

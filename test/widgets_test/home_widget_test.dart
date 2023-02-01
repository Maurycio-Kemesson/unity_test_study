import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unity_test_study/bloc/person_bloc.dart';
import 'package:unity_test_study/bloc/person_state.dart';
import 'package:unity_test_study/bloc/person_event.dart';
import 'package:unity_test_study/models/person.dart';
import 'package:unity_test_study/pages/home_page.dart';
import 'package:unity_test_study/repository/person_repository.dart';
import 'package:unity_test_study/utils/bloc_provider.dart';

class PersonRepositoryMock extends Mock implements PersonRepository {}

class PersonBlocMock extends MockBloc<PersonEvent, PersonState>
    implements PersonBloc {}

class PersonMock extends Mock implements Person {}

void main() {
  final repository = PersonRepositoryMock();
  final personBloc = PersonBlocMock();
  final person = Person(
      id: "1", name: "Maurycio Kemesson", age: 21, height: 1.66, weight: 83);

  // testWidgets("Deve mostrar todos os estatos na tela",
  //     (WidgetTester tester) async {
  //   when(
  //     () => repository.getPerson(),
  //   ).thenAnswer((_) async => <Person>[person, person]);

  //   await tester.pumpWidget(MaterialApp(
  //     home: BlocProvicer(
  //       personBloc: personBloc,
  //       child: HomePage(),
  //     ),
  //   ));

  //   final testButton = find.byType(TextButton);
  //   expect(testButton, findsOneWidget);

  //final loading = find.byType(CircularProgressIndicator);
  //expect(loading, findsNothing);

  //final listPersons = find.byType(ListView);
  //expect(listPersons, findsNothing);

  //await tester.tap(testButton);
  //await tester.runAsync(
  //() => personBloc.stream.first,
  //);
  //await tester.pump();
  //expect(loading, findsOneWidget);
  //});

  testWidgets("description", (WidgetTester tester) async {
    when(() => personBloc.state).thenReturn(PersonLoadingState());
    await tester.pumpWidget(MaterialApp(
      home: BlocProvicer(
        personBloc: personBloc,
        child: HomePage(),
      ),
    ));
    final loading = find.byType(CircularProgressIndicator);
    expect(loading, findsOneWidget);
  });

  testWidgets("description", (WidgetTester tester) async {
    when(() => personBloc.state).thenReturn(PersonListState([person, person]));
    await tester.pumpWidget(MaterialApp(
      home: BlocProvicer(
        personBloc: personBloc,
        child: HomePage(),
      ),
    ));
    final loading = find.byType(ListView);
    expect(loading, findsOneWidget);
  });

  testWidgets("description", (WidgetTester tester) async {
    when(() => personBloc.state).thenReturn(PersonListState([]));
    await tester.pumpWidget(MaterialApp(
      home: BlocProvicer(
        personBloc: personBloc,
        child: HomePage(),
      ),
    ));
    final loading = find.byType(TextButton);
    expect(loading, findsOneWidget);
  });

  testWidgets("description", (WidgetTester tester) async {
    when(() => personBloc.state).thenReturn(PersonErrorState());
    await tester.pumpWidget(MaterialApp(
      home: BlocProvicer(
        personBloc: personBloc,
        child: HomePage(),
      ),
    ));
    final loading = find.text('Unknow error');
    expect(loading, findsOneWidget);
  });
}

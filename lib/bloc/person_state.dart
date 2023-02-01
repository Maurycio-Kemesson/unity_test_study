import 'package:unity_test_study/models/person.dart';

abstract class PersonState {}

class PersonInitial extends PersonState {}

class PersonListState extends PersonState {
  final List<Person> data;
  PersonListState(this.data);
}

class PersonLoadingState extends PersonState {
  PersonLoadingState();
}

class PersonErrorState extends PersonState {
  final dynamic error;

  PersonErrorState([this.error]);
}

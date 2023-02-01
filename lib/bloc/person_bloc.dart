import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unity_test_study/bloc/person_event.dart';
import 'package:unity_test_study/bloc/person_state.dart';
import 'package:unity_test_study/repository/person_repository.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  final PersonRepository _personRepository;
  PersonBloc(this._personRepository) : super(PersonListState([])) {
    on<ClearEvent>(
      (event, emit) async => await _getClearList(event, emit),
    );
    on<FetchEvent>(
      (event, emit) async => await _getAllPerson(event, emit),
    );
  }

  Future<void> _getClearList(ClearEvent event, Emitter emit) async {
    emit(PersonListState([]));
  }

  Future<void> _getAllPerson(FetchEvent event, Emitter emit) async {
    emit(PersonLoadingState());
    try {
      final list = await _personRepository.getPerson();
      emit(PersonListState(list));
    } catch (e) {
      emit(PersonErrorState(e));
    }
  }
}

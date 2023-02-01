import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unity_test_study/bloc/person_bloc.dart';
import 'package:unity_test_study/bloc/person_state.dart';
import 'package:unity_test_study/bloc/person_event.dart';
import 'package:unity_test_study/utils/bloc_provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final personBloc = BlocProvicer.get(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Person'),
        centerTitle: true,
        actions: [
          BlocBuilder(
            bloc: personBloc,
            builder: ((context, PersonState state) {
              final isEnable = personBloc.state is PersonListState &&
                  (personBloc.state as PersonListState).data.isNotEmpty;

              return IconButton(
                  onPressed:
                      isEnable ? () => personBloc.add(ClearEvent()) : null,
                  icon: const Icon(Icons.refresh_outlined));
            }),
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder(
          bloc: personBloc,
          builder: ((context, PersonState state) {
            if (state is PersonErrorState) {
              return _errorCustom(personBloc);
            } else if (state is PersonLoadingState) {
              return const CircularProgressIndicator();
            }
            return _listPerson(personBloc);
          }),
        ),
      ),
    );
  }

  Widget _errorCustom(PersonBloc personBloc) {
    final _errorMessage =
        (personBloc.state as PersonErrorState).error ?? 'Unknow error';
    return Text(_errorMessage);
  }

  Widget _listPerson(PersonBloc personBloc) {
    final _listPerson = (personBloc.state as PersonListState).data;
    if (_listPerson.isEmpty) {
      return TextButton(
        onPressed: () {
          personBloc.add(FetchEvent());
        },
        child: const Text('Fetch persons'),
      );
    }
    return ListView.builder(
      itemCount: _listPerson.length,
      itemBuilder: (context, index) {
        final item = _listPerson[index];
        return ListTile(
          title: Text(item.name),
          subtitle: Text(item.isOlder ? 'Maior' : 'Menor' ' de Idade'),
        );
      },
    );
  }
}

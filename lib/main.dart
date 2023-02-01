import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:unity_test_study/bloc/person_bloc.dart';
import 'package:unity_test_study/utils/bloc_provider.dart';
import 'package:unity_test_study/pages/home_page.dart';
import 'package:unity_test_study/repository/person_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BlocProvicer(
        personBloc: PersonBloc(PersonRepository(Client())),
        child: HomePage(),
      ),
    );
  }
}

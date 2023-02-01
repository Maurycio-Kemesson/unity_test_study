import 'package:flutter/material.dart';
import 'package:unity_test_study/bloc/person_bloc.dart';

class BlocProvicer extends InheritedWidget {
  final PersonBloc personBloc;

  const BlocProvicer(
      {super.key, required this.personBloc, required Widget child})
      : super(child: child);

  static PersonBloc get(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<BlocProvicer>();
    if (provider != null) {
      return provider.personBloc;
    } else {
      return throw Exception('Not found bloc');
    }
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return (oldWidget as BlocProvicer).personBloc.state != personBloc.state;
  }
}

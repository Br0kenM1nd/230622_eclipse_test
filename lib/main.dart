import 'package:eds_test/presentation/pages/main/bloc/user_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/dependencies/injector.dart';
import 'presentation/pages/main/main_page.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserListBloc()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Test Task Application',
        home: MainPage(),
      ),
    );
  }
}

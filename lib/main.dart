import 'package:countries/features/feature-login/presention/screens/login-screen.dart';
import 'package:countries/features/feature_countries/presention/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/feature-login/presention/bloc/users_bloc.dart';
import 'locator.dart';

void main() async {
  //init locator
  // await setUp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MultiBlocProvider(providers: [
      BlocProvider(create: (_) => locator<HomeBloc>()),
      BlocProvider(create: (_) => locator<UsersBloc>()),
    ], child: const LoginPage()),
  ));
}

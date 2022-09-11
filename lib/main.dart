import 'package:flutter/material.dart';
import 'package:to_do/ui/screens/splash_screen.dart';
import '/ui/screens/home_screen.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:bloc/bloc.dart';
import 'package:to_do/bloc/block_obs.dart';



void main() {
  Bloc.observer = MyBlocObserver();
  return runApp(ModularApp(module: AppModule(), child: AppWidget()));
}



class AppWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'To Do App',
      theme: ThemeData(primarySwatch: Colors.blue),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    ); //added by extension
  }
}

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => SplashScreen()),
    ChildRoute('/home', child: (context, args) => HomeScreen()),

  ];
}
import 'package:flutter/material.dart';
import 'package:my_first_app/app.dart';
import 'package:provider/provider.dart';
import 'package:my_first_app/notifier.dart';
import 'package:my_first_app/Backend/Config/container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencies();

  final result = await initializeRepositories();

  if (!result) {
    throw Exception('Erro ao inicializar banco e repositórios');
  }

  runApp(
    ChangeNotifierProvider(
      create: (context) => PageNotifier(),
      child: App(),
  ));
}
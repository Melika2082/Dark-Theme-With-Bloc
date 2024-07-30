import 'package:darktheme/features/darkmode/presentation/widgets/darkmode_widget.dart';
import 'package:darktheme/features/darkmode/presentation/cubit/darkmode_cubit.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, isDarkMode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
            darkTheme: ThemeData.dark(),
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.amber,
              ),
              useMaterial3: true,
            ),
            home: const MyHomePage(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const ThemeSwitchWidget(),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

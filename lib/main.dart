import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:your_notes/config/route/go_router_provider.dart';
import 'package:your_notes/config/theme/theme.dart';
import 'package:your_notes/features/model/note_model.dart';
import 'core/utility/service_locator.dart';
import 'features/model/boxNote.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  boxNotes = await Hive.openBox<NoteModel>('notesBox');

  final route = sl.get<GoRouterProvider>();
  runApp(MyApp(router: route.getRouter()));
}

class MyApp extends StatelessWidget {
  final GoRouter router;

  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = const TextTheme();
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'YourNotes',
      routerConfig: router,
      theme: theme.light(),
      darkTheme: theme.dark(),
      themeMode: ThemeMode.system,
    );
  }
}

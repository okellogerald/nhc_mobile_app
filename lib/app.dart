import 'package:nhc/Styles/scroll_grow_remover.dart';
import 'package:nhc/Styles/source.dart';
import 'package:nhc/pages/home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: ScrollGlowRemovingBehaviour(),
            child: child!,
          );
        },
        home: HomePage());
  }
}

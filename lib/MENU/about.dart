import 'package:nhc/Styles/source.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.scaffoldColor,
      appBar: sharedWidget.appBar2(title: 'About NHC', withIndicator: true),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        children: [
        sharedWidget.text(
              '''NHC is under the Ministry of Lands, Housing and Settlements Development. Its mission is to provide and facilitate the provision of quality housing and other buildings for use by the general public use''',
              padding: EdgeInsets.only(bottom: 40, top: 10),
              withPadding: yes,
              family: 'medium-2',
              size: 18),
           sharedWidget.text('Version\n1.0.0', family: 'medium-2', size: 18)
        ],
      ),
    );
  }
}

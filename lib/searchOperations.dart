import 'package:nhc/Styles/source.dart';



class SearchOperations extends StatefulWidget {
  SearchOperations({Key? key}) : super(key: key);

  @override
  _SearchOperationsState createState() => _SearchOperationsState();
}

class _SearchOperationsState extends State<SearchOperations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.scaffoldColor,
       body: ListView(
         padding:EdgeInsets.only(top:35, left:10),
         children: [
           sharedWidget.searchLocation(context),
         ],
       ),
    );
  }
}
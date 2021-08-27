import 'package:nhc/Styles/source.dart';

class HousingUnits extends StatelessWidget {
  final String acquiringType;
  const HousingUnits({Key? key, required this.acquiringType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.scaffoldColor,
      appBar: sharedWidget.appBar3(context,
          title: 'Housing Units ($acquiringType)'),
      body: ListView(
        padding: EdgeInsets.only(bottom: 15),
        children: [sharedWidget.searchedLocation(), _buildUnitsList(context)],
      ),
    );
  }

  _buildUnitsList(BuildContext context) {
    return Column(
      children: [0, 1, 2, 3, 4]
          .map((index) => sharedWidget.property2(
              projectImage: images[index],
              projectName: names[index],
              projectLocation: locations[index],
              screen: Screens.housing_units,
              width: double.maxFinite.toInt(),
              acquiringType: '',
              margin: EdgeInsets.only(left: 15, right: 15, top: 15),
              context: context))
          .toList(),
    );
  }
}

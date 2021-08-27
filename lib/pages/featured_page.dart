import 'package:nhc/Styles/source.dart';

class FeaturedPage extends StatelessWidget {
  static void navigateTo(BuildContext context,
      {required List<String> images,
      required String title,
      required List<String> names,
      required List<String> locations}) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => FeaturedPage(
              imagesList: images,
              title: title,
              namesList: names,
              locationsList: locations,
            )));
  }

  final List<String> imagesList, locationsList, namesList;
  final String title;
  const FeaturedPage(
      {Key? key,
      required this.title,
      required this.imagesList,
      required this.locationsList,
      required this.namesList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.scaffoldColor,
      appBar: sharedWidget.appBar3(context, title: title),
      body: _buildUnitsList(context),
    );
  }

  _buildUnitsList(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(bottom: 20),
      children: [0, 1, 2, 3, 4]
          .map((index) => sharedWidget.property2(
              projectImage: imagesList[index],
              projectName: namesList[index],
              projectLocation: locationsList[index],
              screen: Screens.housing_units,
              width: double.maxFinite.toInt(),
              acquiringType: '',
              margin: EdgeInsets.only(
                  left: 15, right: 15, top: index == 0 ? 15 : 15),
              context: context))
          .toList(),
    );
  }
}

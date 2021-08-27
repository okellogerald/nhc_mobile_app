import 'dart:math';
import 'package:nhc/form/applicationFormDetails.dart';
import 'package:nhc/Styles/source.dart';

class PlotDetails extends StatelessWidget {
  final String projectName, projectImage, projectSize, projectLocation;
  final List<String> spaces;
  const PlotDetails(
      {Key? key,
      required this.projectImage,
      required this.projectLocation,
      required this.projectName,
      required this.projectSize,
      required this.spaces})
      : super(key: key);

  static ValueNotifier<bool> _showAbout = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.network(projectImage),
          sharedWidget.projectAboutDetails(
              location: projectLocation,
              size: projectSize,
              videoLink: 'https://youtu.be/BKZPc3F1dnY',
              about:
                  '''SafariCity is a beautifully planned satellite city located in Mateves, Arusha City. The size of the city is 559.4 acres big and it is located 3 km from Arusha Airport, 15 kilometers from Arusha City Centre and 50 km from Kilimanjaro International Airport. The perfectly landscaped surroundings will make this city one of the greatest metropolitan lifestyle destinations in the area. As part of the first phase of implementing this satellite city. National Housing Corporation the owner of this land is selling 300 fully serviced plots of high density (measuring approximately 300 square meters and above).
''',
              showAbout: _showAbout),
          _buildPlotPrices(),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ApplicationFormDetails()));
              },
              child: sharedWidget.customizedContainer(
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                  containerColor: colors.brandColor2,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  radius: 30,
                  withIcon: "Right",
                  placeholder: 'Apply Now'),
            ),
          ),
          sharedWidget.callCenter(projectName),
        ],
      ),
    );
  }

  _buildPlotPrices() {
    List<String> usageList = [
      'Affordable Housing Zone',
      'Townhouse Zone',
      'Duplex Villas Zone',
      'Commercial & Light Industry Zone',
      'Cultural Center',
      'Education',
      'Public Plaza / Play Ground'
    ];
    // int price = ;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           sharedWidget.text('Usage-based Prices', size: 22),
          Text(
            '* prices per sq.mt',
            style: TextStyle(
              color: colors.textColor,
              fontSize: 18,
              fontFamily: 'regular',
            ),
          ),
          Column(
            children: [0, 1, 2, 3, 4, 5, 6]
                .map((index) => Row(
                      children: [
                         sharedWidget.text(usageList[index],
                            family: 'medium-2',
                            size: 18,
                            color: colors.textColor),
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                             sharedWidget.text(Random().nextInt(20).toString() + ',000',
                                family: 'medium-2', size: 18),
                          ],
                        ))
                      ],
                    ))
                .toList(),
          ),
          SizedBox(height: 20),
           sharedWidget.text('Additional Information', size: 22),
          //  SizedBox(height: 10),
          Column(
            children: [0, 1, 2]
                .map((index) => ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 0),
                    title:  sharedWidget.text(
                        index == 0
                            ? 'Commercial plots'
                            : index == 1
                                ? 'Residential plots'
                                : 'Light Industry plots',
                        family: 'medium-2',
                        size: 18,
                        color: colors.textColor),
                    subtitle:  sharedWidget.text(
                        'Initial Payment is 25% of the selling price, the remaining amount is to be paid incrementally over the next ${index + 3} years',
                        family: 'medium-2',
                        size: 16,
                        color: colors.greyColor)))
                .toList(),
          )
        ],
      ),
    );
  }
}

import 'package:nhc/PROJECTS/floor_plans.dart';
import 'package:nhc/Styles/source.dart';

class ProjectResidentialUnits extends StatelessWidget {
  final String unitImage, unitName, unitSize, units;
  const ProjectResidentialUnits(
      {Key? key,
      required this.unitImage,
      required this.unitName,
      required this.units,
      required this.unitSize})
      : super(key: key);

  static List<String> unitDescriptions = [
    'These 2 bedroom apartments provide comfort and style without compromising functionality of space, creating an exclusive, distinguished home for your small family.',
    'The 3-bedroom apartment comprises a spacious living area complemented by a master bedroom with a en suite bathroom with two other room sharing a common bathroom.',
    'This 3-bedroom duplex apartment is family living with a difference. All the 3 rooms are ensuite with the master bedroom fitted with a walk in closer and a master balcony where you can unwind under the night sky.',
    'The 4-bedroom duplex apartment is built to standards with all rooms ensuite while the master bedroom a spacious walk in closet and a kitchen all geared towards giving you a fulfilling living experience.'
  ];

  static List<String> unitNames = [
    '2 bedroom apartments',
    '3 bedroom apartments',
    '3 bedroom duplex',
    '4 bedroom duplex'
  ];

  static List<String> unitFloorPlan = [
    'http://www.nhc.co.tz/victoriaplace/images/projects/2bedroom.svg',
    'http://www.nhc.co.tz/victoriaplace/images/projects/3bedroom.svg',
    'http://www.nhc.co.tz/victoriaplace/images/projects/3bedroom_duplex.svg',
    'http://www.nhc.co.tz/victoriaplace/images/projects/4bedroom_duplex.svg'
  ];

  @override
  Widget build(BuildContext context) {
    int index = unitNames.indexOf(unitName);
    return Scaffold(
      body: ListView(
        children: [
          _buildUnitDetails(context, index),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        FloorPlansViewer(image: unitFloorPlan[index])));
              },
              child: sharedWidget.customizedContainer(
                  containerColor: colors.inActiveColor,
                  borderColor: colors.borderColor,
                  textColor: colors.brandColor1,
                  radius: 30,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  margin: EdgeInsets.only(bottom: 10),
                  withIcon: 'Right',
                  placeholder: 'View Floor Plan  '),
            ),
          ),
        ],
      ),
    );
  }

  _buildUnitDetails(BuildContext context, int index) {
    List<String> features = [
      'Master Bedroom',
      'Master Bedroom Ensuite',
      'Bedroom(1)',
      'Bedroom(2) - Ensuite',
      'Ironing Area',
      'Storage',
      'Power Room',
      'Corridor'
    ];
    List<int> units = [10, 20, 30, 10, 25, 04, 50, 10];
    return Column(
      children: [
        Image.network(unitImage,
            fit: BoxFit.cover, height: 200, width: double.maxFinite),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
               sharedWidget.text(unitName,
                  size: 18, family: 'semibold-2', color: colors.textColor),
              SizedBox(height: 10),
               sharedWidget.text(unitDescriptions[index],
                  color: colors.textColor, size: 18, family: 'medium-2'),
              sharedWidget.applyNowButton(context,
                  unitsRemaining: 20, action: 'Buy Now'),
              SizedBox(height: 10),
               sharedWidget.text('Functional Space',
                  color: colors.textColor, size: 22, family: 'medium'),
              Text(
                '* size in sq.mt',
                style: TextStyle(
                    color: colors.textColor,
                    fontSize: 18,
                    fontFamily: 'regular'),
              ),
              Column(
                children: [0, 1, 2, 3, 4, 5, 6, 7]
                    .map((index) => Row(
                          children: <Widget>[
                             sharedWidget.text(features[index], family: 'regular'),
                            SizedBox(width: 20),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                   sharedWidget.text(units[index].toString(),
                                      color: colors.greyColor),
                                ],
                              ),
                            )
                          ],
                        ))
                    .toList(),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(color: colors.borderColor, width: 2),
                        bottom:
                            BorderSide(color: colors.borderColor, width: 2))),
                child: Row(
                  children: [
                     sharedWidget.text('Gross Floor Area', family: 'medium-2', size: 18),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                           sharedWidget.text(unitSize,
                              family: 'medium-2', color: colors.textColor),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

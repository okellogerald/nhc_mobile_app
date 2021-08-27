import 'package:nhc/PROJECTS/project_details.dart';
import 'package:nhc/PROPERTIES/gallery.dart';
import 'package:nhc/Styles/source.dart';

class PropertyUnit extends StatefulWidget {
  PropertyUnit({Key? key}) : super(key: key);

  @override
  _PropertyUnitState createState() => _PropertyUnitState();
}

class _PropertyUnitState extends State<PropertyUnit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView(
        children: [
          Container(
            width: double.maxFinite,
            child: Image.network('https://i.pinimg.com/564x/35/31/6f/35316fb096bb1454ad8389fd8a6fca55.jpg',
                height: 280, fit: BoxFit.fill),
          ),
          SizedBox(height: 10),
          _buildPropertyDetails(),
        ],
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: sharedWidget.text('Property Details',
          family: 'semibold-2', color: colors.textColor, size: 18),
      backgroundColor: colors.scaffoldColor,
      elevation: 2,
      iconTheme: IconThemeData(color: colors.brandColor3),
      actions: [
        Icon(EvaIcons.bookmarkOutline, color: colors.brandColor1),
        SizedBox(width: 20)
      ],
    );
  }

  _buildPropertyDetails() {
    List<String> amenities = [
      'Parking space',
      'Security system',
      'Club house',
      'Gymnasium',
      'Swimming pool',
      'Kids playing are'
    ];
    List<IconData> amenitiesIcons = [
      Icons.local_parking,
      Icons.security,
      Icons.groups,
      Icons.fitness_center,
      Icons.pool,
      Icons.child_care
    ];

    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              sharedWidget.customizedContainer(
                  containerColor: colors.brandColor1,
                  borderColor: Colors.transparent,
                  textColor: colors.white,
                  placeholder: 'For Sale',
                  withIcon: '',
                  radius: 5),
              sharedWidget.text('Tzs 50,000 /unit', family: 'medium', size: 24),
            ],
          ),
          SizedBox(height: 10),
          sharedWidget.text('2 bedroom Apartment',
              size: 18, family: 'semibold-2', color: colors.textColor),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              sharedWidget.text('Victoria Place Project',
                  size: 18, family: 'medium-2', color: colors.textColor),
              SizedBox(width: 20),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProjectDetails(
                            projectSize: '43,555',
                            spaces: ['Residential', 'Commercial', 'Amenities'],
                            projectLocation: 'Kinondoni, Dar-es-Salaam',
                            projectImage:
                                'http://cs402620.vk.me/v402620834/c404/i4wd1e4JoK4.jpg',
                            projectName: 'Victoria Place')));
                  },
                  child: Icon(EvaIcons.externalLinkOutline,
                      color: colors.brandColor2))
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(EvaIcons.pinOutline),
              sharedWidget.text(' Makumbusho, Kinondoni',
                  family: "medium-2", size: 18),
            ],
          ),
          sharedWidget.applyNowButton(context,
              unitsRemaining: 4, action: 'Apply Now'),
          sharedWidget.text('Features:',
              size: 22, family: 'medium', color: colors.textColor),
          SizedBox(height: 10),
          Container(
            width: double.maxFinite,
            child: Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                children: [0, 1, 2, 3, 4, 5]
                    .map((index) => Container(
                          height: 45,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          margin: EdgeInsets.only(right: 10, top: 5),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                  color: colors.borderColor, width: 1)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                  index == 0
                                      ? Icons.bed
                                      : index == 1
                                          ? Icons.bathroom_outlined
                                          : index == 2
                                              ? Icons.kitchen
                                              : index == 3
                                                  ? Icons.tv
                                                  : index == 4
                                                      ? EvaIcons.gridOutline
                                                      : EvaIcons.npmOutline,
                                  size: 22),
                              SizedBox(width: 10),
                              sharedWidget.text(
                                  index == 0
                                      ? '2 bedrooms'
                                      : index == 1
                                          ? '3 bathrooms'
                                          : index == 2
                                              ? 'Kitchen'
                                              : index == 3
                                                  ? 'Living room'
                                                  : index == 4
                                                      ? 'All rooms: 9'
                                                      : '4,565 sq.mt',
                                  family: "medium-2",
                                  size: 16),
                            ],
                          ),
                        ))
                    .toList()),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PropertyGallery()));
              },
              child: sharedWidget.customizedContainer(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  containerColor: colors.inActiveColor,
                  textColor: colors.brandColor1,
                  radius: 10,
                  withIcon: 'Right',
                  iconColor: colors.iconColor,
                  placeholder: 'Gallery'),
            ),
          ),
          sharedWidget.text('Description:',
              size: 22, family: 'medium', color: colors.textColor),
          sharedWidget.text(
              'The 2 bedroom apartment provides comfort and style without compromising functionality of space, creating an exclusive, distinguished home for your small family.',
              size: 18,
              family: 'medium-2',
              color: colors.greyColor),
          SizedBox(height: 20),
          sharedWidget.text('Amenities:',
              size: 22, family: 'medium', color: colors.textColor),
          SizedBox(height: 10),
          Container(
            width: double.maxFinite,
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              children: [0, 1, 2, 3, 4, 5]
                  .map((index) => sharedWidget.customizedContainer(
                      borderColor: colors.borderColor,
                      radius: 10,
                      margin: EdgeInsets.only(right: 10, bottom: 10),
                      containerColor: colors.transparent,
                      textColor: colors.textColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      icon: amenitiesIcons[index],
                      withIcon: 'Top',
                      placeholder: amenities[index]))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}

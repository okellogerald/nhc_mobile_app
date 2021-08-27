import 'package:nhc/PROJECTS/project_residential_units.dart';
import 'package:nhc/Styles/source.dart';

class ProjectDetails extends StatelessWidget {
  final String projectName, projectImage, projectSize, projectLocation;
  final List<String> spaces;
  const ProjectDetails(
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
      backgroundColor: colors.scaffoldColor,
      body: ListView(padding: EdgeInsets.only(bottom: 10), children: [
        Image.network(projectImage),
        sharedWidget.projectAboutDetails(
            location: projectLocation,
            size: projectSize,
            videoLink: 'https://www.youtube.com/watch?v=dZnM3uDHU0c',
            about:
                'For 40 years, Steven Emmanuel, lived at former Victoria House on new Bagamoyo road and never thought of moving. Two things made him fall in love with his place all this time, the convenience and privacy. On these same plots, NHC has built the all-modern VICTORIA PLACE, a blend of 2, 3 and 3 bedroom apartments that gives you the same things that made Steve a tenant for 40 years. Come build everlasting memories in these modern apartments with well-equipped gymnasium, swimming pool and surrounded by schools, retail shopping center, financial institutions and offices.',
            showAbout: _showAbout),
        _buildResidentialUnits(context),
        _buildCommercialUnits(),
        _buildAmenities(),
  
        sharedWidget.callCenter(projectName)
      ]),
    );
  }

  

  _buildResidentialUnits(BuildContext context) {
    List<String> imagesList = [
      'https://i.pinimg.com/564x/16/de/4c/16de4ce44853b1e29ccd0fb7f0daf128.jpg',
      'https://i.pinimg.com/564x/cf/d7/bf/cfd7bfb51bb2a92b4f7199033e85968e.jpg',
      'https://i.pinimg.com/236x/80/00/dc/8000dc8f61266c973fc6fbebdebdd391.jpg',
      'https://i.pinimg.com/236x/fa/8f/5f/fa8f5f27a3755934613e1dfea28f90d0.jpg'
    ];

    List<int> unitSizes = [97, 121, 159, 167];
    List<int> units = [70, 150, 120, 50];
    List<String> unitNames = [
      '2 bedroom apartments',
      '3 bedroom apartments',
      '3 bedroom duplex',
      '4 bedroom duplex'
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10, top: 15),
          child:  sharedWidget.text('Residential Units', size: 22),
        ),
        SizedBox(
          height: 240,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [0, 1, 2, 3]
                .map((index) => Container(
                    width: 250,
                    height: 220,
                    margin: EdgeInsets.only(
                        top: 5, right: 20, left: index == 0 ? 10 : 0),
                    decoration: BoxDecoration(
                        color: colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: Image.network(imagesList[index],
                              height: 100, width: 250, fit: BoxFit.cover),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 sharedWidget.text(unitNames[index],
                                    size: 18,
                                    family: 'medium-2',
                                    color: colors.textColor),
                                 sharedWidget.text('Units: ' + units[index].toString(),
                                    family: 'medium-2',
                                    size: 18,
                                    color: colors.greyColor),
                                Row(
                                  children: <Widget>[
                                     sharedWidget.text('Unit size: ',
                                        family: 'medium-2',
                                        size: 18,
                                        color: colors.greyColor),
                                     sharedWidget.text(unitSizes[index].toString() + ' sq.mt',
                                        family: 'medium-2',
                                        size: 18,
                                        color: colors.greyColor)
                                  ],
                                ),
                              ],
                            )),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ProjectResidentialUnits(
                                        unitImage: imagesList[index],
                                        unitSize: unitSizes[index].toString(),
                                        unitName: unitNames[index],
                                        units: units[index].toString(),
                                      )));
                            },
                            child: sharedWidget.customizedContainer(
                                containerColor: colors.inActiveColor,
                                textColor: colors.brandColor1,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                radius: 30,
                                withIcon: 'Right',
                                placeholder: 'Explore'),
                          ),
                        )
                      ],
                    )))
                .toList(),
          ),
        ),
      ],
    );
  }

  _buildCommercialUnits() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           sharedWidget.text('Commercial Space', size: 22, color: colors.textColor),
          SizedBox(height: 5),
           sharedWidget.text(
              'Victoria Place offers min shopping mall suitable for line stores, dedicated space for the banking hall, entertainment lounges and commercial restaurants for the general public.',
              color: colors.greyColor,
              family: 'medium-2',
              size: 18)
        ],
      ),
    );
  }

  _buildAmenities() {
    List<IconData> icons = [
      Icons.pool,
      Icons.security,
      Icons.fitness_center,
      Icons.child_care
    ];
    List<String> amenities = [
      'Swimming Pool',
      'Security System',
      'Gymnasium',
      'Kids playing Area'
    ];
    List<String> description = [
      'With three fabulous swimming pools for Kids, ladies and gents.',
      'Fitness center equipped with modern facilities',
      'Sand Pond, Children playing area and Special swimming pool for kids.',
      'The system that filters access within the building based on nature and category of the users profile.'
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
         sharedWidget.text('Amenities', size: 22, color: colors.textColor),
        Column(
            children: [0, 1, 2, 3]
                .map((index) => ListTile(
                      leading: Icon(icons[index]),
                      title:
                           sharedWidget.text(amenities[index], family: 'medium-2', size: 18),
                      subtitle:  sharedWidget.text(description[index],
                          family: 'medium-2',
                          size: 16,
                          color: colors.greyColor),
                    ))
                .toList())
      ]),
    );
  }
}

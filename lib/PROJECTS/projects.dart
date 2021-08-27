import 'package:nhc/Styles/source.dart';

class OngoingProjects extends StatefulWidget {
  OngoingProjects({Key? key}) : super(key: key);

  @override
  _OngoingProjectsState createState() => _OngoingProjectsState();
}

class _OngoingProjectsState extends State<OngoingProjects> {
  List<List<String>> _spaces = [
    ['Residential', 'Commercial', 'Amenities'],
    ['Residential', 'Amenities'],
    ['Residential', 'Commercial', 'Amenities'],
    ['Residential', 'Commercial', 'Office', 'Hotel'],
  ];

  List<String> _projectLocations = [
    'Kinondoni, Dar-es-Salaam',
    'Kinondoni, Dar-es-Salaam',
    'Iyumbu, Dodoma',
    'Kinondoni, Dar-es-Salaam',
  ];

  List<String> _projectNames = [
    'Victoria Place',
    'My Home, My Life',
    'Iyumbu Satellite Center',
    'Morocco Square'
  ];
  List<String> _images = [
    'http://cs402620.vk.me/v402620834/c404/i4wd1e4JoK4.jpg',
    'https://images.pexels.com/photos/1642125/pexels-photo-1642125.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
    'https://marcopolis.net/images/stories/tanzania-report/2017/stories/nhc/National_Housing_Corporation_of_Tanzania_mega_project_in_Dodoma.jpg',
    'https://farm8.staticflickr.com/7577/16091267030_a185b4e0dc_o.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colors.scaffoldColor,
        appBar:
            sharedWidget.appBar3(context, title: 'Ongoing Projects'),
        body: ListView(
          padding: EdgeInsets.only(top: 15, bottom: 15),
          children: [
            sharedWidget.searchedLocation(),
            Column(
              children: [0, 1, 2, 3]
                  .map((index) => Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right:15, bottom:15),
                        child: sharedWidget.project(context,
                            spaces: _spaces[index],
                            screen: Screens.projects,
                            projectName: _projectNames[index],
                            projectLocation: _projectLocations[index],
                            projectImage: _images[index]),
                      ))
                  .toList(),
            )
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:nhc/HOUSING_UNITS/housing_units.dart';
import 'package:nhc/PLOTS/plots.dart';
import 'package:nhc/PROJECTS/projects.dart';
import 'package:nhc/pages/featured_page.dart';
import '../Styles/source.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: sharedWidget.appBar(context),
        backgroundColor: colors.scaffoldColor,
        body: _buildHomePageBody2());
  }

  Widget _buildHomePageBody2() {
    return ListView(
      children: [
        Padding(
            padding: EdgeInsets.only(left: 15, bottom: 10, top: 20),
            child: sharedWidget.text('Property Types',
                family: 'medium', color: colors.brandColor3, size: 20)),
        SizedBox(
            height: 170,
            child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        switch (index) {
                          case 0:
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HousingUnits(
                                      acquiringType: 'for lease',
                                    )));
                            break;
                          case 1:
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => HousingUnits(
                                      acquiringType: 'for sale',
                                    )));
                            break;
                          case 2:
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => PlotsPage()));
                            break;
                          case 3:
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => OngoingProjects()));
                            break;
                          default:
                        }
                      },
                      child: _buildOptions(index));
                })),
        SizedBox(height: 10),
        _buildFeaturedProperties(
          title: 'Featured Residential Units',
        ),
        _buildFeaturedProperties(title: 'Featured Commercial Units'),
      ],
    );
  }

  Widget _buildOptions(int index) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(left: index == 0 ? 15 : 0, right: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Image.network(
                index == 0
                    ? 'https://i.pinimg.com/236x/30/11/a7/3011a7427bfcac7ccc3e43f15545947e.jpg'
                    : index == 1
                        ? 'https://i.pinimg.com/236x/8f/0d/89/8f0d89be7d1596f94d33790938621e3f.jpg'
                        : index == 2
                            ? 'https://i.pinimg.com/236x/23/a9/8c/23a98c201063f84339f8b1d185a8e829.jpg'
                            : 'https://i.pinimg.com/236x/d8/51/42/d85142b1389baddb13865c98d49d4828.jpg',
                height: 80,
                width: 200,
                fit: BoxFit.cover),
          ),
          SizedBox(height: 10),
          sharedWidget.text(
              index == 0
                  ? 'Housing Units for Lease'
                  : index == 1
                      ? 'Housing units for sale'
                      : index == 2
                          ? 'Land Plots'
                          : 'Ongoing Projects',
              size: 18,
              family: 'regular',
              color: colors.textColor),
          sharedWidget.customizedContainer(
              withIcon: '',
              placeholder: 'Explore',
              radius: 30,
              textColor: colors.white,
              containerColor: colors.brandColor2,
              borderColor: colors.transparent,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              margin: EdgeInsets.symmetric(vertical: 5))
        ],
      ),
    );
  }

  _buildFeaturedProperties({
    Screens screen = Screens.housing_units,
    required String title,
  }) {
    late List<String> _images, _locations, _names;
    if (title.contains('Commercial')) {
      _images = commercialImages;
      _locations = commercialLocations;
      _names = commercialNames;
    } else {
      _images = images;
      _locations = locations;
      _names = names;
    }
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                sharedWidget.text(title, size: 20, color: colors.textColor),
                GestureDetector(
                  onTap: () {
                    FeaturedPage.navigateTo(context,
                      title: title,
                      images: _images,
                      locations: _locations,
                      names: _names
                     );
                  },
                  child: sharedWidget.customizedContainer(
                      containerColor: colors.inActiveColor,
                      borderColor: Colors.transparent,
                      textColor: colors.brandColor1,
                      withIcon: 'Right',
                      fontSize: 16,
                      radius: 10,
                      fontFamily: 'semibold-2',
                      placeholder: 'See All'),
                )
              ],
            ),
          ),
          SizedBox(
            height: 337,
            child: ListView.builder(
                padding: EdgeInsets.only(right: 20),
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return sharedWidget.property2(
                      projectImage: _images[index],
                      projectName: _names[index],
                      projectLocation: _locations[index],
                      width: 330,
                      screen: screen,
                      acquiringType: 'For Sale',
                      margin: EdgeInsets.only(left: 15, top: 10),
                      context: context);
                }),
          )
        ],
      ),
    );
  }
}

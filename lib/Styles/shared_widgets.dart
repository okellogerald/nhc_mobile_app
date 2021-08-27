import 'dart:math';
import 'package:nhc/NOTIFICATIONS/notifications.dart';
import 'package:nhc/PLOTS/plot.dart';
import 'package:nhc/PROFILE/profile_page.dart';
import 'package:nhc/PROJECTS/project_details.dart';
import 'package:nhc/PROPERTIES/contact_page.dart';
import 'package:nhc/PROPERTIES/propertyUnit.dart';
import 'package:nhc/filters.dart';
import 'package:nhc/form/applicationFormDetails.dart';
import 'package:nhc/form/purchasing_process.dart';
import 'package:nhc/searchOperations.dart';
import 'package:nhc/Styles/source.dart';
import 'package:provider/provider.dart';

class SharedWidgets {


  Widget text(String data,
      {Color color = Colors.black87,
      String family = 'medium',
      TextAlign alignment = TextAlign.start,
      bool withPadding = false,
      EdgeInsets padding = EdgeInsets.zero,
      TextDecoration decoration = TextDecoration.none,
      int size = 20}) {
    return withPadding
        ? Padding(
            padding: padding,
            child: Text(data,
                textAlign: alignment,
                style: TextStyle(
                  decoration: decoration,
                  fontSize: size.toDouble(),
                  fontFamily: family,
                  color: color,
                )))
        : Text(data,
            textAlign: alignment,
            style: TextStyle(
              fontSize: size.toDouble(),
              decoration: decoration,
              fontFamily: family,
              color: color,
            ));
  }

  AppBar appBar3(BuildContext context,
      {required String title, int results = 122}) {
    return AppBar(
        title: text(title, family: 'medium-2', size: 18, color: colors.textColor),
        automaticallyImplyLeading: no,
        backgroundColor: colors.scaffoldColor,
        actions: [],
        bottom: PreferredSize(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 10, right: 15),
              child: Row(
                children: [
                  sharedWidget.text('$results results',
                      family: 'medium-2',
                      color: colors.greyColor,
                      size: 18),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                          onTap: () {
                            functions.navigateTo(context, page: Filters());
                          },
                          child:
                              Icon(EvaIcons.options2, color: colors.brandColor1)),
                      SizedBox(width: 10),
                    ],
                  ))
                ],
              ),
            ),
            preferredSize: Size.fromHeight(20)));
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      elevation: 1,
      title: Text('NHC',
          style: TextStyle(
              color: colors.brandColor3, fontSize: 24, fontFamily: 'logo')),
      backgroundColor: colors.scaffoldColor,
      automaticallyImplyLeading: false,
      actions: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            GestureDetector(
              onTap: () {
                functions.navigateTo(context, page: Notifications());
              },
              child: Container(
                  alignment: Alignment.center,
                  child: Icon(EvaIcons.bellOutline, color: colors.iconColor)),
            ),
            Positioned(
              right: 0,
              top: 15,
              child: Container(
                height: 5,
                width: 5,
                decoration: BoxDecoration(
                  color: colors.brandColor2,
                  shape: BoxShape.circle,
                ),
              ),
            )
          ],
        ),
        SizedBox(width: 25),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider(
                    create: (context) => ShownListOfBookmarks(),
                    child: ProfilePage())));
          },
          child: Hero(
            tag: 'notifications',
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/4085856/pexels-photo-4085856.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
            ),
          ),
        ),
        SizedBox(width: 20)
      ],
    );
  }

  Container customizedContainer(
      {Color containerColor = const Color(0xff171515),
      Color borderColor = Colors.grey,
      int radius = 10,
      int fontSize = 16,
      String placeholder2 = 'text',
      Color iconColor = Colors.black,
      Color textColor = Colors.white,
      IconData icon = EvaIcons.arrowForwardOutline,
      required String withIcon,
      EdgeInsetsGeometry padding =
          const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin = const EdgeInsets.only(right: 10),
      String fontFamily = "medium-2",
      required String placeholder}) {
    return Container(
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: containerColor,
          border: Border.all(
            width: 1,
            color: borderColor,
          ),
          borderRadius: BorderRadius.all(Radius.circular(radius.toDouble())),
        ),
        child: withIcon == 'Right'
            ? Row(mainAxisSize: MainAxisSize.min, children: [
                text(placeholder,
                    size: fontSize, color: textColor, family: 'medium-2'),
                SizedBox(width: 10),
                Icon(icon, color: iconColor, size: 18)
              ])
            : withIcon == 'TopText'
                ? Column(
                    children: <Widget>[
                      text(placeholder2,
                          size: fontSize, color: textColor, family: 'medium'),
                      SizedBox(width: 10),
                      text(placeholder,
                          size: fontSize, color: textColor, family: 'medium-2'),
                    ],
                  )
                : withIcon == 'Top'
                    ? Column(
                        children: <Widget>[
                          Icon(icon, color: iconColor, size: 18),
                          SizedBox(width: 10),
                          text(placeholder,
                              size: fontSize,
                              color: textColor,
                              family: 'medium-2'),
                        ],
                      )
                    : withIcon == 'Left'
                        ? Row(mainAxisSize: MainAxisSize.min, children: [
                            Icon(icon, color: iconColor, size: 18),
                            SizedBox(width: 10),
                            text(placeholder,
                                size: fontSize,
                                color: textColor,
                                family: 'medium-2'),
                          ])
                        : text(placeholder,
                            size: fontSize,
                            color: textColor,
                            family: 'medium-2'));
  }


  Widget searchLocation(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(EvaIcons.arrowBackOutline)),
                SizedBox(width: 20),
                Expanded(
                  child: SizedBox(
                      height: 50,
                      child: TextField(
                        controller: _controller,
                        onChanged: (value) {
                          searchBarTextNotifier.value = value;
                        },
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'medium-2',
                            color: colors.textColor),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            contentPadding: EdgeInsets.only(top: 15, left: 25),
                            filled: true,
                            fillColor: colors.white,
                            isDense: true,
                            labelText: 'search location',
                            suffixIcon: GestureDetector(
                              onTap: () {
                                _controller.clear();
                              },
                              child: Icon(EvaIcons.close,
                                  color: colors.iconColor, size: 24),
                            ),
                            labelStyle: TextStyle(
                                fontSize: 18,
                                fontFamily: 'medium-2',
                                color: colors.textColor)),
                      )),
                ),
              ],
            ),
            ValueListenableBuilder<String>(
                valueListenable: searchBarTextNotifier,
                builder: (context, searchBarText, snapshot) {
                  if (searchBarText == '') {
                    return Column(
                        children: allLocations
                            .map((location) => GestureDetector(
                                  onTap: () {
                                    locationNotifier.value = location;
                                    searchBarTextNotifier.value = '';
                                    Navigator.of(context).pop();
                                  },
                                  child: ListTile(
                                      title: text(location,
                                          family: 'medium-2',
                                          size: 18,
                                          color: colors.greyColor)),
                                ))
                            .toList());
                  } else {
                    List<String> newList = [];
                    allLocations.forEach((element) {
                      if (element.toLowerCase().startsWith(searchBarText)) {
                        newList.add(element);
                      }
                    });
                    if (newList.length == 0) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: text('no location matches that search',
                            family: 'medium-2',
                            size: 18,
                            color: colors.greyColor),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                            children: newList
                                .map((location) => GestureDetector(
                                      onTap: () {
                                        locationNotifier.value = location;
                                        searchBarTextNotifier.value = '';
                                        Navigator.of(context).pop();
                                      },
                                      child: ListTile(
                                        title: text(location,
                                            family: 'medium-2',
                                            size: 18,
                                            color: colors.greyColor),
                                      ),
                                    ))
                                .toList()),
                      );
                    }
                  }
                })
          ],
        ));
  }

  Widget property2(
      {int filteredResults: 0,
      required Screens screen,
      EdgeInsets margin = const EdgeInsets.only(top: 10, left: 10),
      String acquiringType = 'For sale',
      required String projectName,
      required String projectImage,
      required String projectLocation,
      required int width,
      required BuildContext context}) {
    return Container(
        width: width.toDouble(),
        padding: EdgeInsets.only(bottom: 10),
        //   height: 335,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        margin: margin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PropertyUnit()));
                    },
                    child: Image.network(
                      projectImage,
                      height: 180,
                      width: width.toDouble(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                acquiringType == ''
                    ? Container()
                    : Positioned(
                        bottom: 5,
                        left: 5,
                        child: sharedWidget.customizedContainer(
                            containerColor: colors.brandColor1,
                            borderColor: Colors.transparent,
                            radius: 5,
                            textColor: colors.white,
                            withIcon: '',
                            placeholder: acquiringType)),
                Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(right: 5, top: 5),
                      decoration: BoxDecoration(
                          color: colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Icon(EvaIcons.bookmarkOutline,
                          color: colors.brandColor1)),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(right: 10, left: 10, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text('\Tzs 50,000 /sq.mt'),
                  text(projectName, family: "medium-2", size: 18),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(EvaIcons.pinOutline),
                      text(projectLocation, family: "medium-2", size: 18),
                    ],
                  ),
                  screen == Screens.plots || screen == Screens.projects
                      ? Container(
                          height: 40,
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
                            children: [
                              Icon(EvaIcons.npmOutline, size: 22),
                              SizedBox(width: 10),
                              text('4,565 sq.mt', family: "medium-2", size: 16),
                            ],
                          ),
                        )
                      : Row(
                          children: [
                            SizedBox(
                                height: 50,
                                child: ListView.builder(
                                    itemCount: 3,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        height: 40,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        margin:
                                            EdgeInsets.only(right: 10, top: 5),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            border: Border.all(
                                                color: colors.borderColor,
                                                width: 1)),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                                index == 0
                                                    ? Icons.bed
                                                    : index == 1
                                                        ? Icons
                                                            .bathroom_outlined
                                                        : EvaIcons.npmOutline,
                                                size: 22),
                                            SizedBox(width: 10),
                                            text(
                                                index == 0
                                                    ? '2'
                                                    : index == 1
                                                        ? '3'
                                                        : '4,565 sq.mt',
                                                family: "medium-2",
                                                size: 16),
                                          ],
                                        ),
                                      );
                                    }))
                          ],
                        ),
                ],
              ),
            )
          ],
        ));
  }

  Widget project(BuildContext context,
      {required List<String> spaces,
      required Screens screen,
      required String projectName,
      String projectSize = '34,445',
      required String projectLocation,
      required String projectImage}) {
    return Container(
        decoration: BoxDecoration(
            color: colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: GestureDetector(
                onTap: () {
                  switch (screen) {
                    case Screens.projects:
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProjectDetails(
                              projectImage: projectImage,
                              projectLocation: projectLocation,
                              projectName: projectName,
                              projectSize: projectSize,
                              spaces: spaces)));
                      break;
                    case Screens.plots:
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PlotDetails(
                              projectImage: projectImage,
                              projectLocation: projectLocation,
                              projectName: projectName,
                              projectSize: projectSize,
                              spaces: spaces)));
                      break;
                    default:
                  }
                },
                child: Image.network(projectImage,
                    fit: BoxFit.cover, height: 180, width: double.maxFinite),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text(projectName.toUpperCase(), color: colors.textColor),
                  Row(
                    children: <Widget>[
                      Icon(EvaIcons.pinOutline, size: 20),
                      SizedBox(width: 10),
                      text(projectLocation,
                          family: 'medium-2', size: 18, color: colors.textColor)
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Icon(EvaIcons.npmOutline, size: 20),
                      SizedBox(width: 10),
                      text(projectSize + ' sq.mt',
                          family: 'medium-2', size: 18, color: colors.textColor)
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            SizedBox(
              height: 45,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(right: 10),
                  children: spaces
                      .map((space) => sharedWidget.customizedContainer(
                          icon: space == 'Residential'
                              ? Icons.apartment
                              : space == 'Commercial'
                                  ? Icons.business_outlined
                                  : space.contains('Industries')
                                      ? Icons.precision_manufacturing_outlined
                                      : space == 'Office'
                                          ? Icons.meeting_room_outlined
                                          : space == 'Hotel'
                                              ? Icons.hotel
                                              : Icons.dashboard_outlined,
                          containerColor: colors.transparent,
                          margin: EdgeInsets.only(left: 10, bottom: 10),
                          textColor: colors.textColor,
                          withIcon: 'Left',
                          placeholder: space))
                      .toList()),
            )
          ],
        ));
  }

  projectAboutDetails(
      {required String location,
      required String size,
      required String videoLink,
      required String about,
      required ValueNotifier<bool> showAbout}) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(EvaIcons.pinOutline, size: 22),
                    SizedBox(width: 10),
                    text(location,
                        family: 'medium-2', size: 18, color: colors.textColor)
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Icon(EvaIcons.npmOutline, size: 22),
                    SizedBox(width: 10),
                    text(size + ' sq.mt',
                        family: 'medium-2', size: 18, color: colors.textColor)
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    text('Video',
                        family: 'medium-2', color: colors.textColor, size: 18),
                    SizedBox(width: 10),
                    GestureDetector(
                        onTap: () {
                          functions.launchUrl(url: videoLink);
                        },
                        child: Icon(EvaIcons.externalLinkOutline,
                            color: colors.brandColor2))
                  ],
                ),
              ],
            )),
        ValueListenableBuilder<bool>(
            valueListenable: showAbout,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 10),
              color: colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text('About'),
                  SizedBox(height: 10),
                  text(about,
                      family: 'medium-2', size: 16, color: colors.textColor),
                  GestureDetector(
                    onTap: () {
                      showAbout.value = !showAbout.value;
                    },
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        width: double.maxFinite,
                        color: colors.transparent,
                        child:
                            Icon(Icons.expand_less, color: colors.brandColor1)),
                  )
                ],
              ),
            ),
            builder: (context, isShowAbout, _child) {
              if (isShowAbout) {
                return _child!;
              } else {
                return GestureDetector(
                  onTap: () {
                    showAbout.value = !showAbout.value;
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    color: colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text('About', color: colors.textColor),
                        Icon(EvaIcons.chevronDownOutline,
                            color: colors.brandColor1)
                      ],
                    ),
                  ),
                );
              }
            }),
      ],
    );
  }

  AppBar appBar2({bool withIndicator = false, required String title}) {
    return AppBar(
      backgroundColor: colors.scaffoldColor,
      automaticallyImplyLeading: withIndicator,
      elevation: 2,
      iconTheme: IconThemeData(color: colors.brandColor3),
      title: sharedWidget.text(title, family: 'semibold-2', size: 18),
    );
  }

  Widget applyNowButton(BuildContext context,
      {required int unitsRemaining, required String action}) {
    void _viewFile() async {
      final _url =
          'https://www.nhc.co.tz/kit/NHC_Purchase_Application_form.pdf';
      if (await canLaunch(_url)) {
        await launch(_url);
      } else {
        print('Something went wrong');
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 120,
            width: double.maxFinite,
            margin: EdgeInsets.symmetric(vertical: 20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: colors.inActiveColor,
                borderRadius: BorderRadius.all(Radius.circular(40))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                text('$unitsRemaining units remaining',
                    color: colors.textColor, family: 'medium'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ContactPage()));
                      },
                      child: sharedWidget.customizedContainer(
                          margin: EdgeInsets.zero,
                          padding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                          containerColor: colors.transparent,
                          textColor: colors.brandColor1,
                          radius: 10,
                          withIcon: '',
                          borderColor: colors.transparent,
                          iconColor: colors.brandColor1,
                          placeholder: 'Contact Us'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ApplicationFormDetails()));
                      },
                      child: sharedWidget.customizedContainer(
                          withIcon: '',
                          containerColor: colors.brandColor2,
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          margin: EdgeInsets.zero,
                          radius: 30,
                          borderColor: Colors.transparent,
                          textColor: Colors.white,
                          placeholder: action),
                    ),
                  ],
                ),
              ],
            )),
        GestureDetector(
          onTap: () {
            _viewFile();
          },
          child: text('Pass through the application form ?',
              size: 18, family: 'medium-2', color: colors.brandColor1),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => PurchasingProcess()));
          },
          child: text('Purchasing process',
              size: 18, family: 'medium-2', color: colors.brandColor1),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget callCenter(String projectName) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text('Contacts', size: 22),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  text(projectName,
                      family: 'medium-2', color: colors.textColor, size: 18),
                  text('Sales Team',
                      family: 'medium-2', color: colors.greyColor, size: 16),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        {'option': 'Call', 'icon': EvaIcons.phoneOutline},
                        {
                          'option': 'Chat',
                          'icon': EvaIcons.messageCircleOutline
                        },
                        {'option': 'Email', 'icon': EvaIcons.emailOutline}
                      ]
                          .map((Map item) => GestureDetector(
                                onTap: () {
                                  if (item['option'] == 'Call') {
                                    functions.sendCall();
                                  } else if (item['option'] == 'Chat') {
                                    functions.sendSms();
                                  } else {
                                    functions.sendEmail();
                                  }
                                },
                                child: sharedWidget.customizedContainer(
                                    margin: EdgeInsets.only(top: 10, right: 10),
                                    containerColor: colors.white,
                                    radius: 20,
                                    icon: item['icon'],
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    textColor: colors.brandColor1,
                                    withIcon: "Left",
                                    placeholder: item['option'].toString()),
                              ))
                          .toList())
                ],
              )),
        ],
      ),
    );
  }

  Widget searchedLocation() {
    return ValueListenableBuilder<String>(
        valueListenable: locationNotifier,
        builder: (context, location, child) {
          if (location == '') {
            return Container();
          } else {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              color: colors.inActiveColor,
              child: Row(
                children: [
                  SizedBox(width: 20),
                  Container(
                      color: colors.brandColor3,
                      margin: EdgeInsets.only(top: 0),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Row(
                        children: [
                          sharedWidget.text(location,
                              family: 'medium-2',
                              color: colors.white,
                              size: 16),
                          SizedBox(width: 20),
                          GestureDetector(
                              onTap: () {
                                locationNotifier.value = '';
                              },
                              child: Icon(EvaIcons.close,
                                  color: colors.white, size: 18))
                        ],
                      ))
                ],
              ),
            );
          }
        });
  }
}

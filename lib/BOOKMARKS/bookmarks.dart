import 'package:nhc/Styles/source.dart';
import 'package:provider/provider.dart';

class Bookmarks extends StatefulWidget {
  const Bookmarks({Key? key}) : super(key: key);

  @override
  _BookmarksState createState() => _BookmarksState();
}

class _BookmarksState extends State<Bookmarks> {
  @override
  Widget build(BuildContext context) {
    final list = context.watch<ShownListOfBookmarks>();
    return Scaffold(
      backgroundColor: colors.scaffoldColor,
      appBar:
          sharedWidget.appBar2(title: 'Watchlisted Items', withIndicator: true),
      body: Column(
        children: [_buildItemsGrid(list: list.lists, object: list)],
      ),
    );
  }


  _buildItemsGrid(
      {required List<int> list, required ShownListOfBookmarks object}) {
    List<String> images = [
      'https://th.bing.com/th/id/R.c81bc111fe5843b55c119ddb352e383c?rik=4JfrIXn40CxGQA&riu=http%3a%2f%2f3.bp.blogspot.com%2f-CrJrLotBhcU%2fVgVDlTJ2arI%2fAAAAAAAACoI%2fPe-BenphFgk%2fs1600%2fsmall-living-room-decorating-ideas-3.jpg&ehk=rKtIthC%2bnEmgpikCdxQlBen7Da90x9VLvMLaC%2bEphWU%3d&risl=&pid=ImgRaw&r=0',
      'https://images.pexels.com/photos/129494/pexels-photo-129494.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      'https://i.pinimg.com/564x/49/78/8c/49788c37216a62adf23215a3678808e4.jpg',
      'https://www.dakotacommercial.com/wp-content/uploads/2018/12/IMG_8381.jpg',
      'https://i.pinimg.com/564x/d2/84/ad/d284add569a8594e9b9474e7d1d72a30.jpg',
      'https://i.pinimg.com/564x/12/f8/f6/12f8f6d080bd7f9e517a7f3ee60fcd72.jpg',
      'https://images.pexels.com/photos/7061673/pexels-photo-7061673.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
    ];

    List<String> projectNames = [
      'Mwongozo Housing Estate',
      'Iyumbu Satellite Center Phase II',
      'Safari City',
      'Morocco Square',
      'Salama Creek',
      'Levolosi Residential',
      'Golden Anniversaries',
    ];

    List<String> titles = [
      '2 bedroom apartments',
      'Project',
      'Land plots',
      '29 sq.mt Commercial unit',
      'Project',
      'Project',
      '3 Bedroom Duplex Apartment'
    ];

    List<String> locations = [
      'Dar-es-salaam',
      'Dodoma',
      'Arusha',
      'Dar-es-salaam',
      'Dar-es-salaam',
      'Dar-es-salaam',
      'Dar-es-salaam'
    ];
    return Expanded(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: EdgeInsets.only(top: 20, bottom: 15),
        children: list
            .map((index) => Container(
                decoration: BoxDecoration(
                  color: colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Image.network(images[index],
                            height: 100,
                            fit: BoxFit.cover,
                            width: double.maxFinite),
                        GestureDetector(
                          onTap: () {
                            Future.delayed(Duration(milliseconds: 400)).then(
                                (value) => object.deleteIndex(index: index));
                          },
                          child: Container(
                            padding: EdgeInsets.all(2.5),
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Icon(EvaIcons.bookmark,
                                color: colors.brandColor1),
                          ),
                        )
                      ],
                    ),
                  sharedWidget.text(titles[index],
                        family: 'semibold-2',
                        withPadding: true,
                        padding: EdgeInsets.only(left: 5),
                        size: 16,
                        color: colors.textColor),
                  sharedWidget.text(projectNames[index],
                        withPadding: true,
                        padding: EdgeInsets.only(left: 5),
                        family: 'medium-2',
                        size: 16,
                        color: colors.textColor),
                  sharedWidget.text(locations[index],
                        withPadding: true,
                        padding: EdgeInsets.only(left: 5),
                        family: 'medium-2',
                        size: 16,
                        color: colors.greyColor)
                  ],
                )))
            .toList(),
      ),
    ));
  }
}

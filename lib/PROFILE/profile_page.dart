import 'package:nhc/BOOKMARKS/bookmarks.dart';
import 'package:nhc/MENU/faqs.dart';
import 'package:nhc/MENU/help_and_feedback.dart';
import 'package:nhc/PROFILE/bills.dart';
import 'package:nhc/PROFILE/settings.dart';
import 'package:nhc/Styles/source.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final bookmarksList = context.watch<ShownListOfBookmarks>();
    return Scaffold(
      backgroundColor: colors.scaffoldColor,
      appBar: sharedWidget.appBar2(title: "My Profile", withIndicator: true),
      body: ListView(
        padding: EdgeInsets.only(top: 20, right: 15, left: 15),
        children: [
          _buildClientdetails(),
          _buildImportantProfileDetails(bookmarksList),
          _buildPaymentDetails(),
          _buildProfileSettings(),
          _buildOneItemCard(
              icon: EvaIcons.settings2Outline,
              iconColor: colors.brandColor1,
              textColor: colors.textColor,
              title: 'Settings'),
        ],
      ),
    );
  }

  _buildImportantProfileDetails(ShownListOfBookmarks bookmarksList) {
    List<IconData> icons = [EvaIcons.bookmark, Icons.description];
    List<String> details = ['Watchlist', 'My Lease'];
    navigator(int index) {
      switch (index) {
        case 0:
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider.value(
                  value: bookmarksList, child: Bookmarks())));
          break;
        case 1:
          break;
        default:
      }
    }

    return Column(
      children: [
        Container(
          width: double.maxFinite,
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [0, 1]
                .map((index) => GestureDetector(
                      onTap: () {
                        navigator(index);
                      },
                      child: Container(
                        color: colors.transparent,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Icon(icons[index], color: colors.brandColor1),
                            SizedBox(height: 20),
                          sharedWidget.text(details[index],
                                family: 'medium-2', size: 16)
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
        SizedBox(height: 15),
        Divider(height: 2, color: colors.greyColor),
        SizedBox(height: 15),
      ],
    );
  }

  _buildClientdetails() {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  'https://images.pexels.com/photos/4085856/pexels-photo-4085856.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             sharedWidget.text('Sara James',
                  color: colors.brandColor3),
            
              sharedWidget.text('sarajames@gmail.com',
                  family: 'medium-2', color: colors.greyColor, size: 16)
            ],
          )
        ],
      ),
    );
  }

  _buildPaymentDetails() {
    List<String> bills = ['This month', 'Previous month', 'Older'];
    List<String> amounts = ['200,000', '400,000', '250,000'];
    return Card(
        elevation: .2,
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 sharedWidget.text('Bills payments'),
                  sharedWidget.text('Amounts in Tanzania Shillings',
                      family: 'regular', size: 18, color: colors.greyColor)
                ],
              ),
              Column(
                children: [0, 1, 2]
                    .map(
                      (index) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          sharedWidget.text(bills[index],
                              family: 'medium-2',
                              withPadding: true,
                              padding: EdgeInsets.only(top: 10),
                              size: 18,
                              color: colors.textColor),
                          sharedWidget.text(amounts[index].toString(),
                              family: 'medium-2',
                              size: 18,
                              withPadding: true,
                              padding: EdgeInsets.only(top: 10),
                              color: colors.textColor)
                        ],
                      ),
                    )
                    .toList(),
              ),
              SizedBox(height: 10),
              Divider(height: 3, color: colors.borderColor),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  functions.navigateTo(context, page: BillsScreen());
                },
                child:  sharedWidget.text('View payments history',
                    family: 'medium-2', size: 16, color: colors.brandColor1),
              )
            ],
          ),
        ));
  }

  _buildProfileSettings() {
    List<IconData> icons = [
      EvaIcons.questionMarkCircleOutline,
      Icons.headset_mic_outlined,
      EvaIcons.starOutline,
      EvaIcons.shareOutline,
    ];
    List<String> details = [
      'FAQs',
      'Help Center',
      'Rate Us',
      'Invite Friends',
    ];
    navigator(int index) {
      switch (index) {
        case 0:
          functions.navigateTo(context, page: Faqs());
          break;
        case 1:
          functions.navigateTo(context, page: HelpAndFeedback());
          break;
        case 2:
          functions.launchUrl(
              url:
                  'https://play.google.com/store/apps/details?id=com.google.android.youtube');
          break;
        case 3:
          Share.share('https//:flutter.dev/');
          break;
        default:
      }
    }

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Card(
        elevation: .2,
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            color: Colors.white,
            child: Column(
              children: [0, 1, 2, 3]
                  .map((index) => GestureDetector(
                        onTap: () {
                          navigator(index);
                        },
                        child: ListTile(
                          leading:
                              Icon(icons[index], color: colors.brandColor1),
                          title:  sharedWidget.text(details[index],
                              family: 'medium-2', size: 18),
                        ),
                      ))
                  .toList(),
            )),
      ),
    );
  }

  _buildOneItemCard(
      {required IconData icon,
      required Color iconColor,
      required Color textColor,
      required String title}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: () {
          functions.navigateTo(context, page: Settings());
        },
        child: Card(
            elevation: .2,
            child: Container(
                child: ListTile(
                    leading: Icon(icon, color: iconColor),
                    title:  sharedWidget.text(title,
                        color: textColor, family: 'medium-2', size: 18)))),
      ),
    );
  }
}

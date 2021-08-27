import 'package:nhc/Styles/source.dart';

class HelpAndFeedback extends StatelessWidget {
  const HelpAndFeedback({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<IconData> icons = [
      EvaIcons.phone,
      EvaIcons.email,
      EvaIcons.messageCircle,
    ];

    List<String> message = ['Call', 'Email', 'Chat'];
    List<String> details = [
      '+255 22 2105 002',
      'dg@nhc.co.tz',
      '+255 736 11 44 33'
    ];
    return Scaffold(
      appBar:
          sharedWidget.appBar2(title: 'Help & Feedback', withIndicator: true),
      backgroundColor: colors.scaffoldColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        children: [
           sharedWidget.text('NHC Help Desk', color: colors.textColor, family: 'regular'),
          Column(
              children: [0, 1, 2]
                  .map((index) => GestureDetector(
                        onTap: () {
                          switch (index) {
                            case 0:
                              functions.sendCall();
                              break;
                            case 1:
                              functions.sendEmail();
                              break;
                            case 2:
                              functions.sendSms();
                              break;
                            default:
                          }
                        },
                        child: ListTile(
                          leading:
                              Icon(icons[index], color: colors.brandColor1),
                          title:  sharedWidget.text(message[index]),
                          trailing: Icon(EvaIcons.arrowIosForward),
                          subtitle:  sharedWidget.text(details[index],
                              family: 'medium-2',
                              color: colors.greyColor,
                              size: 18),
                        ),
                      ))
                  .toList()),
          ListTile(
            title:  sharedWidget.text('Physical Address'),
            leading: Icon(EvaIcons.pin, color: colors.brandColor1),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 sharedWidget.text(
                    'Kambarage House,\n6 Ufukoni Street,\nP.O BOX 2977,\n11101 Dar es salaam,\nTanzania.',
                    color: colors.greyColor,
                    family: 'medium-2',
                    size: 18)
              ],
            ),
          )
        ],
      ),
    );
  }
}

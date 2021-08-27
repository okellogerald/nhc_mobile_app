import 'package:nhc/Styles/source.dart';

class ContactPage extends StatefulWidget {
  ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sharedWidget.appBar2(title: 'Contacts', withIndicator: true),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              functions.sendEmail();
            },
            child: ListTile(
                leading: Icon(EvaIcons.email, color: colors.brandColor1),
                trailing: Icon(EvaIcons.arrowForward),
                subtitle:  sharedWidget.text('dg@nhc.co.tz',
                    family: 'medium-2', size: 18, color: colors.greyColor),
                title:  sharedWidget.text('Email', family: 'medium-2', size: 18)),
          ),
          GestureDetector(
            onTap: () {
              functions.sendCall();
            },
            child: ListTile(
                leading: Icon(EvaIcons.phone, color: colors.brandColor1),
                trailing: Icon(EvaIcons.arrowForward),
                subtitle:  sharedWidget.text('+255 22 2105 002',
                    family: 'medium-2', size: 18, color: colors.greyColor),
                title:  sharedWidget.text('Phone', family: 'medium-2', size: 18)),
          ),
          GestureDetector(
            onTap: () {
              functions.sendSms();
            },
            child: ListTile(
                leading:
                    Icon(EvaIcons.messageCircle, color: colors.brandColor1),
                trailing: Icon(EvaIcons.arrowForward),
                subtitle:  sharedWidget.text('+255 736 114 433',
                    family: 'medium-2', size: 18, color: colors.greyColor),
                title:  sharedWidget.text('Chat', family: 'medium-2', size: 18)),
          ),
        ],
      ),
    );
  }
}

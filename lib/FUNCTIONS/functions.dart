import 'package:nhc/Styles/source.dart';
import 'package:url_launcher/url_launcher.dart';

class Functions {
  launchUrl({required String url}) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Something went wrong');
    }
  }

  sendEmail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'dg@nhc.co.tz',
      query: 'subject=Victoria Place Apartments&body=Hello there!',
    );

    var url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  sendCall() {
    launch("tel://255222105002");
  }

  sendSms() async {
    const uri = 'sms:0736114433?body=Hello%20there!';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      // iOS
      /*   const uri = 'sms:0039-222-060-888?body=hello%20there';
        if (await canLaunch(uri)) {
          await launch(uri);
        } else {
          throw 'Could not launch $uri';
        } */
    }
  }

  navigateTo(BuildContext context, {required Widget page}) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
  }
}

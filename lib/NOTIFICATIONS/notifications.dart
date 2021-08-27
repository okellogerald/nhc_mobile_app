import 'package:nhc/Styles/source.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            sharedWidget.appBar2(title: 'Notifications', withIndicator: true),
        backgroundColor: colors.scaffoldColor,
        body: ListView(
          padding: EdgeInsets.only(right: 10, left: 10),
          children: [
            _notification(
                index: 0,
                notification: 'New Properties Listed',
                message:
                    'The Salama Creek Project is now completed. It comes with residential units and commercial units as well as office spaces, both for lease and sale. ',
                action: 'View Project',
                images: [
                  'https://images.pexels.com/photos/681335/pexels-photo-681335.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                  'https://images.pexels.com/photos/7061333/pexels-photo-7061333.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                  'https://images.pexels.com/photos/7061330/pexels-photo-7061330.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
                ],
                imagesAvailable: yes),
            _notification(
                index: 1,
                notification: 'Application Approved',
                message:
                    'Your application was reviwed thoroughly and we\'re excited to invite you at Victoria Place Apartments as per our Lease agreement starting 12 August, 2021.',
                action: 'View Details',
                imagesAvailable: no),
            _notification(
                index: 2,
                notification: 'Update Available',
                message:
                    'We have updated our NHC app from version 1.0.0 to 1.1.0. It solves existed bugs and improves user experience.',
                action: "Update",
                imagesAvailable: no)
          ],
        ));
  }

  _notification(
      {required String notification,
      required String message,
      required String action,
      required int index,
      required bool imagesAvailable,
      List<String> images = const []}) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Card(
        child: Container(
            padding: EdgeInsets.all(10),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   sharedWidget.text(notification,
                        color: colors.textColor, family: 'medium-2', size: 18),
                    Icon(EvaIcons.close, color: colors.iconColor)
                  ],
                ),
                SizedBox(height: 10),
                imagesAvailable
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: images
                              .map((image) => Expanded(
                                  child: Image.network(image,
                                      height: 100, fit: BoxFit.cover)))
                              .toList(),
                        ),
                      )
                    : Container(),
                 sharedWidget.text(message, color: colors.greyColor, size: 18),
                SizedBox(height: 10),
                Divider(height: 2, color: colors.brandColor3),
                SizedBox(height: 10),
                sharedWidget.customizedContainer(
                    containerColor: colors.transparent,
                    borderColor: colors.transparent,
                    textColor: colors.brandColor1,
                    withIcon: '',
                    placeholder: action),
                //  SizedBox(height: 10)
              ],
            )),
      ),
    );
  }
}

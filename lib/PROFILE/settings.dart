import 'package:nhc/Styles/source.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sharedWidget.appBar2(title: 'Settings', withIndicator: true),
      backgroundColor: colors.scaffoldColor,
      body: Padding(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          children: [_buildBodyDetails()],
        ),
      ),
    );
  }

  _buildBodyDetails() {
    List<String> items = [
      'About',
      'Terms of Services',
      'Privacy Policy',
      'Version'
    ];
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _oneItemCard(title: 'Edit Profile'),
          SizedBox(height: 10),
          Card(
            elevation: .2,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(left: 10, right: 10, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [0, 1, 2, 3]
                    .map((index) => index == 3
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                             sharedWidget.text(items[index],
                                  withPadding: true,
                                  padding: EdgeInsets.only(bottom: 15),
                                  family: 'medium-2',
                                  color: colors.textColor,
                                  size: 18),
                              sharedWidget.text('1.0.0',
                                  withPadding: true,
                                  padding: EdgeInsets.only(bottom: 15),
                                  family: 'medium-2',
                                  color: colors.greyColor,
                                  size: 18)
                            ],
                          )
                        :  sharedWidget.text(items[index],
                            withPadding: true,
                            padding: EdgeInsets.only(bottom: 15),
                            family: 'medium-2',
                            color: colors.textColor,
                            size: 18))
                    .toList(),
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _oneItemCard(
                  title: 'Sign out',
                  color: Colors.white,
                  alignment: TextAlign.center,
                  containerColor: Colors.red),
              SizedBox(
                height: 10,
              )
            ],
          ))
        ],
      ),
    );
  }

  Widget _oneItemCard(
      {required String title,
      Color color = Colors.black,
      TextAlign alignment = TextAlign.start,
      containerColor = Colors.white}) {
    return Card(
        elevation: .2,
        child: Container(
            color: containerColor,
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child:  sharedWidget.text(title,
                alignment: alignment,
                family: 'medium-2',
                size: 18,
                color: color)));
  }
}

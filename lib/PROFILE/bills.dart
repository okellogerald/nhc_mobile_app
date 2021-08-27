import 'package:nhc/Styles/source.dart';

class BillsScreen extends StatelessWidget {
  const BillsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:sharedWidget.appBar2(title: 'Bills Details', withIndicator: true),
      backgroundColor: colors.scaffoldColor,
      body: ListView(
        padding: EdgeInsets.only(left: 15, right: 15, top: 20),
        children: [
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child:  sharedWidget.text(
                'This month'.toUpperCase(),
                family: 'medium-2',
              )),
          _bill('Pending'),
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child:  sharedWidget.text(
                'Previous month'.toUpperCase(),
                family: 'medium-2',
              )),
          _bill('Incomplete'),
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child:  sharedWidget.text(
                'Older bills'.toUpperCase(),
                family: 'medium-2',
              )),
          _bill('Unpaid'),
          _bill('Paid')
        ],
      ),
    );
  }



  _bill(String status) {
    return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 10, bottom: 20),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 sharedWidget.text('Monthly Rent - April, 19', family: 'medium-2', size: 18),
                sharedWidget.customizedContainer(
                    withIcon: '',
                    containerColor: status == 'Unpaid'
                        ? Color(0xff4F0000)
                        : status == "Paid"
                            ? colors.brandColor1
                            : colors.brandColor2,
                    textColor: Colors.white,
                    margin: EdgeInsets.zero,
                    borderColor: Colors.transparent,
                    radius: 5,
                    placeholder: status)
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 sharedWidget.text('Total amount:', family: 'medium', size: 20),
                 sharedWidget.text('Tzs 500,000', family: 'medium-2', size: 18)
              ],
            ),
            status == 'Pending'
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       sharedWidget.text('Due date:', family: 'medium', size: 20),
                       sharedWidget.text('August 26, 2021', family: 'medium-2', size: 18)
                    ],
                  )
                : status == 'Incomplete'
                    ? Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               sharedWidget.text('Paid amount:', family: 'medium', size: 20),
                               sharedWidget.text('Tzs 300,000', family: 'medium-2', size: 18)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               sharedWidget.text('Paid on:', family: 'medium', size: 20),
                               sharedWidget.text('October 03, 2021',
                                  family: 'medium-2', size: 18)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               sharedWidget.text('Balance:', family: 'medium', size: 20),
                               sharedWidget.text('Tzs 200,000',
                                  family: 'medium-2',
                                  size: 18,
                                  color: colors.textColor)
                            ],
                          ),
                        ],
                      )
                    : status == 'Unpaid'
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               sharedWidget.text('Due date was on:',
                                  family: 'medium', size: 20),
                               sharedWidget.text('12 April, 2019',
                                  family: 'medium-2', size: 18)
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               sharedWidget.text('Paid on:', family: 'medium', size: 20),
                               sharedWidget.text('12 July, 2019',
                                  family: 'medium-2', size: 18)
                            ],
                          ),
            Row(
              mainAxisAlignment: status == 'Paid'
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.spaceAround,
              children: [
                sharedWidget.customizedContainer(
                    withIcon: 'Left',
                    icon: EvaIcons.infoOutline,
                    containerColor: colors.inActiveColor,
                    textColor: colors.textColor,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    radius: 30,
                    margin: EdgeInsets.only(top: 10),
                    placeholder: 'View'),
                status != 'Paid'
                    ? sharedWidget.customizedContainer(
                        containerColor: colors.inActiveColor,
                        textColor: colors.brandColor1,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        radius: 30,
                        margin: EdgeInsets.only(top: 10),
                        withIcon: '',
                        placeholder: 'Request Control Number')
                    : Container()
              ],
            ),
          ],
        ));
  }
}

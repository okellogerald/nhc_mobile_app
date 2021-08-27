import 'package:nhc/Styles/source.dart';

class Faqs extends StatelessWidget {
  const Faqs({Key? key}) : super(key: key);

  static ValueNotifier<int> faqQnsIndexNotifier = ValueNotifier<int>(-1);

  @override
  Widget build(BuildContext context) {
    String subtitle =
        'After the applicant receives the letter of offer for house purchase application, she/he will be given 90 calendar days from the date of the letter, to finalize payment of the remaining 90% of the house purchase price. The payment plan can be evidenced either by cash deposited in the project account or by confirmation of mortgage offered to him by one of the participating financial partner. The banks that customers may access mortgage finance are as follows:';
    List<String> questions = [
      'What are the payment options for a leased or bought property?',
      'How do I apply for NHC properties?',
      'How do I know if my application was approved?',
      'In which regions does NHC operate?'
    ];
    return Scaffold(
      appBar: sharedWidget.appBar2(title: 'FAQs', withIndicator: true),
      backgroundColor: colors.scaffoldColor,
      body: ListView(padding: EdgeInsets.only(bottom: 15, top: 10), children: [
        Column(
          children: [0, 1, 2, 3]
              .map((index) => ValueListenableBuilder<int>(
                  valueListenable: faqQnsIndexNotifier,
                  builder: (context, notifierIdnex, snapshot) {
                    if (index == notifierIdnex) {
                      return ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          tileColor: colors.white,
                          subtitle:  sharedWidget.text(subtitle,
                              size: 16,
                              color: colors.greyColor,
                              family: 'medium-2'),
                          trailing: GestureDetector(
                              onTap: () {
                                faqQnsIndexNotifier.value = -1;
                              },
                              child: Icon(EvaIcons.arrowIosUpward,
                                  color: colors.brandColor1)),
                          title:  sharedWidget.text(questions[index],
                              color: colors.brandColor1));
                    } else {
                      return ListTile(
                          trailing: GestureDetector(
                              onTap: () {
                                faqQnsIndexNotifier.value = index;
                              },
                              child: Icon(EvaIcons.arrowIosDownward)),
                          title:  sharedWidget.text(questions[index],
                              family: 'regular'));
                    }
                  }))
              .toList(),
        )
      ]),
    );
  }
}

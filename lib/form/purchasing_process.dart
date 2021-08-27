import 'package:nhc/Styles/source.dart';

class PurchasingProcess extends StatelessWidget {
  const PurchasingProcess({Key? key}) : super(key: key);

  static List<String> applicationProcess = [
    'Collection of the ‘House Purchase Application Form’ from any of NHC Regional Office countrywide for Tshs. 2,500/- or downloading them for free from the NHC website',
    'Submission of the dully filled “House Purchase Application Form” together with the proof of payment of application fee of Tshs. 10,000 and the down payment of 10% of the house purchase price, as commitment by the applicant of his desire and ability to purchase the house. The applicant is also required to submit copy of Identity card showing nationality of the applicant and one passport size.',
    'Scrutinizing the received ‘House Purchase Application Form” and shortlisting all those that meet all the set criteria for house purchase based on first come, first served criteria.',
    'After the applicant receives the letter of offer for house purchase application, she/he will be given 90 calendar days from the date of the letter, to finalize payment of the remaining 90% of the house purchase price. The payment plan can be evidenced either by cash deposited in the project account or by confirmation of mortgage offered to him by one of the participating financial partner. The banks that customers may access mortgage finance are as follows:',
    'Upon the expiry of these 90 days without the submission of the proof of payment plan, NHC will allocate the house to another prospecting client from the waiting list. The 10% down payment paid by the client, will be given a choice of either being used to apply for another house in other NHC projects or to be refunded to the applicant, subject to deduction of 2% .',
    'After finalizing 100% payment of the House Purchase Price (Through cash or mortgage finance) the client will be provided with Sales Agreement and handover process will follow after completion of the construction.'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sharedWidget.appBar2(
          title: 'Purchasing process', withIndicator: true),
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          children: [0, 1, 2, 3, 4, 5]
              .map((index) => ListTile(
                    minVerticalPadding: 10,
                    title: sharedWidget.text('Step ${index + 1}'),
                    subtitle: sharedWidget.text(applicationProcess[index],
                        color: colors.greyColor, family: 'regular', size: 18),
                  ))
              .toList()),
    );
  }
}

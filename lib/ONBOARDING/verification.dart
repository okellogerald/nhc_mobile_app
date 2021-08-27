import 'package:nhc/ONBOARDING/option_data_screen.dart';
import 'package:nhc/Styles/source.dart';

class Verification extends StatelessWidget {
  final String valueOfPhoneOrEmail;
  const Verification({Key? key, required this.valueOfPhoneOrEmail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.scaffoldColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        children: [
          _buildVerification(context),
        ],
      ),
    );
  }

  _buildVerification(BuildContext context) {
    late String _options, _wrongContact;
    if (usedPhoneOrEmailOnSigningUpNotifier.value == SigningUpOptions.phone) {
      _options = 'phone number';
      _wrongContact = 'Number';
    } else {
      _options = 'email address';
      _wrongContact = 'Email';
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
       sharedWidget.text('Verification',
            family: 'semibold-2', size: 22),
        SizedBox(height: 10),
       sharedWidget.text(
            'A verification code has been sent on your $_options.',
            family: 'medium-2',
            color: colors.greyColor,
            size: 18),
        SizedBox(height: 10),
        Row(
          children: [
            sharedWidget.text('$valueOfPhoneOrEmail',
                decoration: TextDecoration.underline,
                family: 'medium-2',
                size: 18,
                color: colors.textColor),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: sharedWidget.text('Wrong $_wrongContact?',
                  family: 'medium-2', size: 16, color: colors.brandColor1),
            ),
          ],
        ),
        SizedBox(height: 30),
        SizedBox(
            height: 50,
            child: Row(
              children: [0, 1, 2, 3, 4, 5]
                  .map((index) => Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: SizedBox(
                            width: 50,
                            child: TextField(
                              style: TextStyle(
                                  fontFamily: 'semibold-2',
                                  color: colors.textColor,
                                  fontSize: 18),
                              keyboardType: TextInputType.number,
                              textInputAction: index == 5
                                  ? TextInputAction.done
                                  : TextInputAction.next,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 10),
                                  filled: true,
                                  fillColor: colors.inActiveColor,
                                  border: OutlineInputBorder(),
                                  hintText: '#',
                                  hintStyle: TextStyle(
                                      fontFamily: 'medium-2',
                                      color: colors.greyColor,
                                      fontSize: 18)),
                              onChanged: (value) {
                                if (value.length == 1) {
                                  if (index == 5) {
                                    FocusScope.of(context).unfocus();
                                  } else {
                                    FocusScope.of(context).nextFocus();
                                  }
                                }
                              },
                            )),
                      ))
                  .toList(),
            )),
        SizedBox(height: 50),
        MaterialButton(
            onPressed: () {
              functions.navigateTo(context, page: OptionData());
            },
            minWidth: double.maxFinite,
            height: 45,
            color: colors.brandColor2,
            child:  sharedWidget.text('Verify',
                family: 'medium-2', color: colors.textColor, size: 18)),
        SizedBox(height: 20),
        Row(
          children: [
            sharedWidget.text('Didn\'t get the code?',
                family: 'medium-2', size: 18, color: colors.textColor),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () {},
              child: sharedWidget.text('Send Code',
                  family: 'semibold-2', size: 16, color: colors.brandColor1),
            ),
          ],
        ),
      ],
    );
  }
}

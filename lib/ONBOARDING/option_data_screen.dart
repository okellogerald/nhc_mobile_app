import 'package:nhc/Styles/source.dart';

class OptionData extends StatelessWidget {
  const OptionData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.scaffoldColor,
      body: ListView(
          padding: EdgeInsets.only(left: 15, right: 15, top: 50, bottom: 20),
          children: [
            _buildTitle(context),
            _buildTextFields(),
            _buildSubmitButton(context)
          ]),
    );
  }

  _buildTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       sharedWidget.text('Your Account is successfully created.',
            family: 'semibold-2', color: colors.textColor),
        SizedBox(height: 10),
       sharedWidget.text('One more step to get started.',
            family: 'medium-2', color: colors.textColor, size: 18),
        SizedBox(height: 20),
      ],
    );
  }

  _buildSubmitButton(
    BuildContext context,
  ) {
    return Column(
      children: [
        SizedBox(height: 50),
        MaterialButton(
            onPressed: () {
            },
            minWidth: double.maxFinite,
            height: 45,
            color: colors.brandColor2,
            child:  sharedWidget.text('Submit',
                family: 'medium-2', color: colors.textColor, size: 18)),
      ],
    );
  }

  _buildTextFields() {
    return ValueListenableBuilder<SigningUpOptions>(
        valueListenable: usedPhoneOrEmailOnSigningUpNotifier,
        builder: (context, option, snapshot) {
          TextInputType _type = TextInputType.name;
          TextCapitalization _capitalization = TextCapitalization.words;

          List<String> fields = [
            'First Name',
            'Last Name',
            'Username',
            option == SigningUpOptions.email ? 'Phone Number' : 'Email Address',
            'Password',
            'Confirm Password'
          ];
          List<String> examples = [
            'John',
            'Smith',
            'johnsmith',
            option == SigningUpOptions.email
                ? '0745677899'
                : 'johnsmith@work.com',
            '123456',
            '123456'
          ];
          return Column(
            children: [0, 1, 2, 3, 4, 5].map((index) {
              switch (index) {
                case 2:
                  _capitalization = TextCapitalization.none;
                  break;
                case 3:
                  _type = TextInputType.number;
                  break;
                case 4:
                case 5:
                  _type = TextInputType.visiblePassword;
                  break;
                default:
              }
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     sharedWidget.text(fields[index]),
                    SizedBox(
                        height: 55,
                        child: TextField(
                          textCapitalization: _capitalization,
                          keyboardType: _type,
                          textInputAction: index == 5
                              ? TextInputAction.done
                              : TextInputAction.next,
                          decoration: InputDecoration(
                              hintText: 'e.g. ${examples[index]}',
                              hintStyle: TextStyle(
                                  fontSize: 16,
                                  color: colors.greyColor,
                                  fontFamily: 'medium-2')),
                        ))
                  ],
                ),
              );
            }).toList(),
          );
        });
  }
}

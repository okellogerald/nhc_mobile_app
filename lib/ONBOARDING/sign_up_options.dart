import 'package:nhc/ONBOARDING/log_in.dart';
import 'package:nhc/ONBOARDING/verification.dart';
import 'package:nhc/Styles/source.dart';

class SignUpOptions extends StatelessWidget {
  const SignUpOptions({Key? key}) : super(key: key);

  static TextEditingController _controller1 = TextEditingController();
  static TextEditingController _controller2 = TextEditingController();
  static GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  static GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.scaffoldColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        children: [
          _buildTitle(),
          _buildTextField(),
          _buildSubmitButton(
            context,
          ),
          _buildSignUpOptions(context)
        ],
      ),
    );
  }

  _buildTextField() {
    return ValueListenableBuilder(
        valueListenable: usedPhoneOrEmailOnSigningUpNotifier,
        builder: (context, usedOption, snapshot) {
          if (usedOption == SigningUpOptions.phone) {
            return _buildPhoneTextField();
          } else if (usedOption == SigningUpOptions.email) {
            return _buildEmailTextField();
          }
          return Container();
        });
  }

  _buildEmailTextField() {
    return Form(
      key: _formKey2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           sharedWidget.text('Fill your email address below.',
              family: 'medium-2', size: 16, color: colors.greyColor),
          SizedBox(height: 10),
          TextFormField(
            controller: _controller2,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              fontSize: 18,
              color: colors.textColor,
              fontFamily: 'semibold-2',
            ),
            decoration: InputDecoration(
                fillColor: colors.inActiveColor,
                filled: true,
                hintText: 'e.g johnsmith@work.com',
                errorStyle: TextStyle(
                    fontSize: 16, color: Colors.red, fontFamily: 'medium-2'),
                hintStyle: TextStyle(
                    fontSize: 16,
                    color: colors.greyColor,
                    fontFamily: 'medium-2')),
            validator: (value) {
              RegExp emailValid = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

              if (value!.length == 0) {
                return 'This field can\'t be empty';
              } else {
                if (!emailValid.hasMatch(value)) {
                  return 'This isn\'t a correct email address';
                }
              }
            },
          ),
        ],
      ),
    );
  }

  _buildSubmitButton(
    BuildContext context,
  ) {
    return Column(
      children: [
        SizedBox(height: 50),
        ValueListenableBuilder<SigningUpOptions>(
            valueListenable: usedPhoneOrEmailOnSigningUpNotifier,
            builder: (context, usedOption, snapshot) {
              return MaterialButton(
                  onPressed: () {
                    if (usedOption == SigningUpOptions.phone) {
                      if (_formKey1.currentState!.validate()) {
                        functions.navigateTo(context,
                            page: Verification(
                                valueOfPhoneOrEmail: _controller1.text));
                      }
                    } else {
                      if (_formKey2.currentState!.validate()) {
                        functions.navigateTo(context,
                            page: Verification(
                                valueOfPhoneOrEmail: _controller2.text));
                      }
                    }
                  },
                  minWidth: double.maxFinite,
                  height: 45,
                  color: colors.brandColor2,
                  child:  sharedWidget.text('Submit',
                      family: 'medium-2', color: colors.textColor, size: 18));
            }),
        SizedBox(height: 50),
      ],
    );
  }

  _buildPhoneTextField() {
    return Form(
      key: _formKey1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           sharedWidget.text('Fill your phone number below.',
              family: 'medium-2', size: 16, color: colors.greyColor),
          SizedBox(height: 10),
          TextFormField(
            controller: _controller1,
            keyboardType: TextInputType.number,
            style: TextStyle(
                fontSize: 18,
                color: colors.textColor,
                fontFamily: 'semibold-2',
                letterSpacing: 1.5),
            decoration: InputDecoration(
                fillColor: colors.inActiveColor,
                filled: true,
                hintText: 'e.g 0743788991',
                errorStyle: TextStyle(
                    fontSize: 16, color: Colors.red, fontFamily: 'medium-2'),
                hintStyle: TextStyle(
                    fontSize: 16,
                    color: colors.greyColor,
                    fontFamily: 'medium-2')),
            validator: (value) {
              if (value!.length == 0) {
                return 'This field can\'t be empty';
              } else {
                if (value.length != 10) {
                  return 'A phone number should  contain only 10 digits.';
                }
              }
            },
          ),
        ],
      ),
    );
  }

  _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 50),
        sharedWidget.text('Sign Up',
            size: 22, color: colors.textColor, family: 'medium-2'),
        SizedBox(height: 10),
        sharedWidget.text(
            'Craete account with either a phone number or an email address.',
            size: 18,
            color: colors.greyColor,
            family: 'medium-2'),
        SizedBox(height: 50),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                usedPhoneOrEmailOnSigningUpNotifier.value =
                    SigningUpOptions.phone;
                _controller2.clear();
              },
              child: ValueListenableBuilder<SigningUpOptions>(
                  valueListenable: usedPhoneOrEmailOnSigningUpNotifier,
                  builder: (context, usedOption, snapshot) {
                    return sharedWidget.customizedContainer(
                        containerColor: usedOption == SigningUpOptions.phone
                            ? colors.inActiveColor
                            : colors.transparent,
                        borderColor: usedOption == SigningUpOptions.phone
                            ? colors.borderColor
                            : colors.transparent,
                        icon: EvaIcons.phone,
                        textColor: colors.textColor,
                        margin: EdgeInsets.only(right: 20, bottom: 20),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        withIcon: 'Left',
                        placeholder: 'Phone');
                  }),
            ),
            GestureDetector(
              onTap: () {
                usedPhoneOrEmailOnSigningUpNotifier.value =
                    SigningUpOptions.email;
                _controller1.clear();
              },
              child: ValueListenableBuilder<SigningUpOptions>(
                  valueListenable: usedPhoneOrEmailOnSigningUpNotifier,
                  builder: (context, usedOption, snapshot) {
                    return sharedWidget.customizedContainer(
                        containerColor: usedOption == SigningUpOptions.email
                            ? colors.inActiveColor
                            : colors.transparent,
                        borderColor: usedOption == SigningUpOptions.email
                            ? colors.borderColor
                            : colors.transparent,
                        textColor: colors.textColor,
                        icon: EvaIcons.email,
                        margin: EdgeInsets.only(left: 20, bottom: 20),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        withIcon: 'Left',
                        placeholder: "Email");
                  }),
            )
          ],
        ),
      ],
    );
  }

  _buildSignUpOptions(BuildContext context) {
    List<String> _options = ['Google', 'Facebook'];

    return Column(
      children: [
        SizedBox(height: 20),
       sharedWidget.text('Or sign up with',
            family: 'medium-2', size: 20, color: colors.textColor),
        SizedBox(height: 20),
        Column(
          children: [0, 1]
              .map(
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: MaterialButton(
                      onPressed: () {
                        functions.navigateTo(context,
                            page: FirstPageOnScreen());
                      },
                      minWidth: double.maxFinite,
                      height: 45,
                      color: index == 0 ? Color(0xffEB4338) : Color(0xff385895),
                      child:  sharedWidget.text(_options[index],
                          family: 'medium-2', color: colors.white, size: 16)),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

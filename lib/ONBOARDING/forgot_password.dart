import 'package:nhc/ONBOARDING/log_in.dart';
import 'package:nhc/Styles/source.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  static GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.scaffoldColor,
      body: ListView(
        padding: EdgeInsets.only(top: 40, left: 15, right: 15),
        children: [
          _buildTitle(),
          _buildTextField(),
          _buildSubmitButton(context)
        ],
      ),
    );
  }

  _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      sharedWidget.text('Forgot Password',
            size: 22, family: 'semibold-2'),
        SizedBox(height: 10),
       sharedWidget.text(
            'Fill the email address below to recover your password',
            color: colors.greyColor),
        SizedBox(height: 30),
      ],
    );
  }

  _buildTextField() {
    return Form(
      key: _formKey,
      child: TextFormField(
        style: TextStyle(
            fontFamily: 'semibold-2', color: colors.textColor, fontSize: 18),
        keyboardType: TextInputType.emailAddress,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 10, left: 10),
            filled: true,
            fillColor: colors.inActiveColor,
            border: OutlineInputBorder(),
            hintText: 'Email address',
            hintStyle: TextStyle(
                fontFamily: 'medium-2',
                color: colors.greyColor,
                fontSize: 18)),
        validator: (value) {
          RegExp emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
          if (!emailValid.hasMatch(value!)) {
            return 'This isn\'t a correct email address';
          }
        },
      ),
    );
  }

  _buildSubmitButton(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        MaterialButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                functions.navigateTo(context, page: FirstPageOnScreen());
              }
            },
            minWidth: double.maxFinite,
            height: 45,
            color: colors.brandColor2,
            child:  sharedWidget.text('Submit',
                family: 'medium-2', color: colors.textColor, size: 18)),
      ],
    );
  }
}

import 'package:nhc/ONBOARDING/forgot_password.dart';
import 'package:nhc/ONBOARDING/sign_up_options.dart';
import 'package:nhc/HOMEPAGE/homepage.dart';
import 'package:nhc/Styles/source.dart';

class FirstPageOnScreen extends StatefulWidget {
  FirstPageOnScreen({Key? key}) : super(key: key);

  @override
  _FirstPageOnScreenState createState() => _FirstPageOnScreenState();
}

class _FirstPageOnScreenState extends State<FirstPageOnScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.scaffoldColor,
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        children: [_buildTitle(), _buildLogInProcess()],
      ),
    );
  }

  _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
       sharedWidget.text('Welcome,',
            size: 26, color: colors.textColor),
       sharedWidget.text('Log in to get started',
            family: 'medium-2'),
        SizedBox(height: 50),
      ],
    );
  }

  _buildLogInProcess() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
            children: [0, 1]
                .map((index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextField(
                        style: TextStyle(
                          color: colors.textColor,
                          fontFamily: 'medium-2',
                          fontSize: 18,
                        ),
                        textInputAction: index == 0
                            ? TextInputAction.next
                            : TextInputAction.done,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: colors.inActiveColor,
                          prefixIcon: Icon(
                              index == 0 ? EvaIcons.person : EvaIcons.lock),
                          contentPadding: EdgeInsets.only(left: 10, top: 15),
                          hintStyle: TextStyle(
                            color: colors.greyColor,
                            fontFamily: 'medium-2',
                            fontSize: 16,
                          ),
                          hintText: index == 0
                              ? 'Username / email address'
                              : 'Password',
                        ),
                      ),
                    ))
                .toList()),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: GestureDetector(
            onTap: () {
              functions.navigateTo(context, page: ForgotPassword());
            },
            child: sharedWidget.text('Forgot Password?',
                size: 18, family: 'regular', color: colors.brandColor1),
          ),
        ),
        Column(
          children: [
            SizedBox(height: 30),
            MaterialButton(
                onPressed: () {
                  functions.navigateTo(context, page: HomePage());
                },
                minWidth: double.maxFinite,
                height: 45,
                color: colors.brandColor2,
                child:  sharedWidget.text('Log in',
                    family: 'medium-2', color: colors.textColor, size: 18)),
          ],
        ),
        SizedBox(height: 50),
        Center(
            child:  sharedWidget.text('Or continue with:',
                family: 'medium-2', size: 20)),
        SizedBox(height: 20),
        MaterialButton(
            onPressed: () {
            
            },
            minWidth: double.maxFinite,
            height: 45,
            color: Color(0xffEB4338),
            child:  sharedWidget.text('Google',
                family: 'medium-2', color: colors.white, size: 16)),
        SizedBox(height: 20),
        MaterialButton(
            onPressed: () {
           
            },
            minWidth: double.maxFinite,
            height: 45,
            color: Color(0xff385895),
            child:  sharedWidget.text('Facebook',
                family: 'medium-2', color: colors.white, size: 16)),
        SizedBox(height: 30),
        Center(
            child: Row(
          children: [
            sharedWidget.text('Not a member yet? ',
                family: 'medium-2', size: 18),
            GestureDetector(
              onTap: () {
                functions.navigateTo(context, page: SignUpOptions());
              },
              child: sharedWidget.text('Sign up',
                  family: 'medium-2', size: 18, color: colors.brandColor1),
            ),
          ],
        )),
      ],
    );
  }
}

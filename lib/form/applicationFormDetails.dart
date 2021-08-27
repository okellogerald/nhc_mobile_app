import 'package:nhc/Styles/source.dart';

class ApplicationFormDetails extends StatefulWidget {
  ApplicationFormDetails({Key? key}) : super(key: key);

  @override
  _ApplicationFormDetailsState createState() => _ApplicationFormDetailsState();
}

class _ApplicationFormDetailsState extends State<ApplicationFormDetails> {
  ValueNotifier<int> _nationalityCheckedIndexNotifier = ValueNotifier<int>(-1);
  ValueNotifier<int> _fundingCheckedIndexNotifier = ValueNotifier<int>(-1);
  ValueNotifier<bool> _applicationFillingProcessDoneNotifier =
      ValueNotifier<bool>(false);
  ValueNotifier<String> _firstNameHintNotifier =
      ValueNotifier<String>('First Name');
  ValueNotifier<String> _lastNameHintNotifier =
      ValueNotifier<String>('Last Name');
  ValueNotifier<String> _phoneNumberHintNotifier =
      ValueNotifier<String>('Phone Number');
  ValueNotifier<String> _emailHintNotifier = ValueNotifier<String>('Email');
  ValueNotifier<String> _additionalInfoHintNotifier =
      ValueNotifier<String>('Additional Information');

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
/*   TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _additionalInformationController =
      TextEditingController(); */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.scaffoldColor,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(height: 40),
              Center(
                  child:  sharedWidget.text('Application Form'.toUpperCase(),
                      withPadding: true,
                      padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                      size: 22,
                      color: colors.textColor)),
              _buildForm(),
            ],
          ),
          _buildSubmitButton()
        ],
      ),
    );
  }

  Widget _buildSubmitButton() {
    return ValueListenableBuilder<bool>(
        valueListenable: _applicationFillingProcessDoneNotifier,
        builder: (context, isDone, snapshot) {
          if (isDone) {
            return GestureDetector(
              onTap: () {
                _formKey.currentState!.validate();
                Navigator.of(context).pop();
              },
              child: Container(
                  width: double.maxFinite,
                  color: colors.brandColor1,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child:  sharedWidget.text('Submit',
                      alignment: TextAlign.center,
                      family: 'medium-2',
                      color: colors.white)),
            );
          } else {
            return Container();
          }
        });
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: SizedBox(
        height: 750,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildTextField(index: 0),
            _buildTextField(index: 1),
             sharedWidget.text('Nationality',
                padding: EdgeInsets.only(left: 10),
                withPadding: true,
                family: 'semibold-2',
                size: 18,
                color: colors.textColor),
            _buildOptions(
                itemsList: ['Tanzanian', 'Non Tanzanian'],
                notifier: _nationalityCheckedIndexNotifier),
            _buildTextField(index: 2),
            _buildTextField(index: 3),
             sharedWidget.text('Source of Funding',
                padding: EdgeInsets.only(left: 10),
                withPadding: true,
                family: 'semibold-2',
                size: 18,
                color: colors.textColor),
            _buildOptions(itemsList: [
              'Private Source',
              'Savings',
              'Mortgage Finance',
              'Other'
            ], notifier: _fundingCheckedIndexNotifier),
            _buildTextField(index: 4),
          ],
        ),
      ),
    );
  }

  _buildTextField({
    required int index,
  }) {
    TextInputType type = TextInputType.name;
    TextInputAction action = TextInputAction.next;
    TextCapitalization capitalization = TextCapitalization.characters;
    bool filled = false;
    late ValueNotifier<String> _hintNotifier;
    late String hint;
    late String hintReplacer;
    List<ValueNotifier<String>> notifiers = [
      _firstNameHintNotifier,
      _lastNameHintNotifier,
      _phoneNumberHintNotifier,
      _emailHintNotifier,
      _additionalInfoHintNotifier
    ];

    String emptyErrorText = 'This field can\'t be empty';

    List<String> replacers = [
      'e.g JOHN',
      'e.g SMITH',
      'e.g 0743788822',
      'e.g johnsmith@work.com',
      'I have a loan from another bank'
    ];

    List<String> hints = [
      'First Name',
      'Last Name',
      'Phone Number',
      'Email',
      'Additional Information'
    ];
    hintReplacer = replacers[index];
    _hintNotifier = notifiers[index];
    hint = hints[index];
    switch (index) {
      case 2:
        type = TextInputType.number;
        capitalization = TextCapitalization.words;
        filled = false;
        break;
      case 3:
        type = TextInputType.emailAddress;
        capitalization = TextCapitalization.none;
        filled = false;

        break;
      case 4:
        type = TextInputType.multiline;
        action = TextInputAction.done;
        capitalization = TextCapitalization.sentences;
        filled = true;
        break;
      default:
    }
    return ValueListenableBuilder<String>(
        valueListenable: _hintNotifier,
        builder: (context, _hint, snapshot) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: filled ? 150 : 55,
            child: TextFormField(
              validator: (value) {
                RegExp emailValid = RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                print(value);
                if (index != 4) {
                  if (value!.length == 0) {
                    return emptyErrorText;
                  }
                }
                if (index == 2) {
                  if (double.tryParse(value!) == null) {
                    return 'This field should only contain numbers';
                  } else if (value.length != 10) {
                    return 'The phone number should only contain ten numbers';
                  }
                }
                if (index == 3) {
                  if (!emailValid.hasMatch(value!)) {
                    return 'Fill a correct email address';
                  }
                }
              },
              onFieldSubmitted: (value) {
                int newIndex = index + 1;
                if (index == 4) {
                  newIndex = 0;
                  _applicationFillingProcessDoneNotifier.value = true;
                }
                notifiers[newIndex].value = replacers[newIndex];
              },
              onTap: () {
                _hintNotifier.value = hintReplacer;
              },
              textInputAction: action,
              keyboardType: type,
              maxLines: filled ? null : 1,
              minLines: filled ? null : 1,
              expands: filled ? true : false,
              textCapitalization: capitalization,
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontFamily: 'medium-2',
                  fontSize: 18,
                  color: colors.textColor),
              decoration: InputDecoration(
                  labelText: hint,
                  errorStyle: TextStyle(
                      fontFamily: 'medium-2', fontSize: 16, color: Colors.red),
                  labelStyle: TextStyle(
                      height: 0.1,
                      fontFamily: 'medium-2',
                      fontSize: 18,
                      color: colors.greyColor),
                  filled: filled,
                  isDense: true,
                  contentPadding: !filled
                      ? EdgeInsets.zero
                      : EdgeInsets.only(left: 10, right: 10, top: 5),
                  fillColor: colors.white,
                  hintText: _hint,
                  hintStyle: TextStyle(
                      fontFamily: 'medium-2',
                      fontSize: 18,
                      color: colors.greyColor)),
            ),
          );
        });
  }

  _buildOptions(
      {required List<String> itemsList, required ValueNotifier<int> notifier}) {
    return ValueListenableBuilder<int>(
        valueListenable: notifier,
        builder: (context, checkedIndex, snapshot) {
          return Container(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
            width: double.maxFinite,
            child: Wrap(
              children: itemsList
                  .map((option) => Padding(
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () {
                            notifier.value = itemsList.indexOf(option);
                          },
                          child: Row(mainAxisSize: MainAxisSize.min, children: [
                            Icon(
                              checkedIndex != itemsList.indexOf(option)
                                  ? EvaIcons.square
                                  : EvaIcons.checkmarkSquare2,
                            ),
                            SizedBox(width: 20),
                             sharedWidget.text(option,
                                family: 'medium-2',
                                size: 18,
                                color: colors.greyColor)
                          ]),
                        ),
                      ))
                  .toList(),
            ),
          );
        });
  }
}

import 'package:nhc/Styles/source.dart';

class Filters extends StatefulWidget {
  Filters({Key? key}) : super(key: key);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  final ValueNotifier<RangeValues> _priceRangeValuesNotifier =
      ValueNotifier<RangeValues>(RangeValues(0, 200));
  final ValueNotifier<RangeValues> _sizeRangeValuesNotifier =
      ValueNotifier<RangeValues>(RangeValues(0, 5000));
  final ValueNotifier<int> _locationIndexNotifier = ValueNotifier<int>(-1);
  final ValueNotifier<int> _projectTypeIndexNotifier = ValueNotifier<int>(-1);
  final ValueNotifier<int> _usageIndexNotifier = ValueNotifier<int>(-1);
  final ValueNotifier<int> _typeIndexNotifier = ValueNotifier<int>(-1);
  final ValueNotifier<int> _bedroomIndexNotifier = ValueNotifier<int>(-1);
  final ValueNotifier<bool> _anyLocationButtonSelectedNotifier =
      ValueNotifier<bool>(false);
  final ValueNotifier<String> _regionSelectedNotifier =
      ValueNotifier<String>('');
  final ValueNotifier<String> _districtSelectedNotifier =
      ValueNotifier<String>('');

  List<String> districts = [
    'Ilala',
    'Kigamboni',
    'Kinondoni',
    'Ubungo',
    'Temeke'
  ];
  List<String> regions = [
    'Arusha',
    'Dar es Salaam',
    'Dodoma',
    'Geita',
    'Iringa',
    'Kagera',
    'Katavi',
    'Kigoma',
    'Kilimanjaro',
    'Lindi',
    'Manyara',
    'Mara',
    'Mbeya',
    'Morogoro',
    'Mtwara',
    'Mwanza',
    'Njombe',
    'Rukwa',
    'Ruvuma',
    'Shinyanga',
    'Simiyu',
    'Singida',
    'Songwe',
    'Tabora',
    'Tanga'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildFiltersAppBar(),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [_buildFilters(), _applyFiltersButton()],
      ),
    );
  }

  _buildFiltersAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title:  sharedWidget.text('Filters', size: 20, family: 'medium-2', color: Colors.white),
      backgroundColor: colors.brandColor1,
    );
  }

  Widget _applyFiltersButton() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
          width: double.maxFinite,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: colors.brandColor3,
          ),
          height: 55,
          child:  sharedWidget.text('Apply Filters',
              color: Colors.white, size: 18, family: 'thin-2')),
    );
  }

  Widget _buildFilters() {
    return ValueListenableBuilder<Screens>(
        valueListenable: screensNotifier,
        builder: (context, screen, snapshot) {
          return ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                screen == Screens.homepage
                    ? _filterOption(
                        items: ['Any', 'Housing Units', 'Land Plots'],
                        filterType: "Property Type",
                        indexNotifier: _projectTypeIndexNotifier)
                    : Container(),
                _filterOption(
                    items: ['Any', 'For Sale', 'For Lease'],
                    filterType: screen == Screens.housing_units
                        ? 'Housing units'
                        : screen == Screens.plots
                            ? 'Land plots'
                            : 'Housing units / Land plots',
                    indexNotifier: _typeIndexNotifier),
                _filterOption(
                    items: ['Any', 'Commercial', 'Residential'],
                    filterType: 'Usage',
                    indexNotifier: _usageIndexNotifier),
                _loactionFilterOption(filterType: "Location"),
                _valueSlider(
                    filterType: 'Price(Tzs)',
                    values: _priceRangeValuesNotifier),
                screen == Screens.housing_units || screen == Screens.homepage
                    ? _filterOption(
                        items: ['Any', ' 1 ', ' 2  ', ' 3 ', ' 4 ', ' 5+ '],
                        filterType: 'Bedrooms',
                        indexNotifier: _bedroomIndexNotifier)
                    : Container(),
                _valueSlider(
                    filterType: 'Surface Area (sq.km)',
                    values: _sizeRangeValuesNotifier),
                SizedBox(height: 80)
              ]);
        });
  }

  _filterOption({
    required List<String> items,
    required String filterType,
    required ValueNotifier<int> indexNotifier,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
         sharedWidget.text(filterType, size: 22),
        SizedBox(height: 10),
        Wrap(
          children: items
              .map((item) => ValueListenableBuilder<Object>(
                  valueListenable: indexNotifier,
                  builder: (context, optionIndex, snapshot) {
                    return GestureDetector(
                      onTap: () {
                        indexNotifier.value = items.indexOf(item);
                      },
                      child: sharedWidget.customizedContainer(
                          withIcon: '',
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          placeholder: item,
                          margin: EdgeInsets.only(right: 20, bottom: 10),
                          borderColor: optionIndex == items.indexOf(item)
                              ? Colors.transparent
                              : colors.borderColor,
                          containerColor: optionIndex == items.indexOf(item)
                              ? colors.brandColor3
                              : Colors.grey.withOpacity(.3),
                          textColor: optionIndex == items.indexOf(item)
                              ? Colors.white70
                              : Colors.black),
                    );
                  }))
              .toList(),
        ),
      ],
    );
  }

  Widget _loactionFilterOption({required String filterType}) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: 20),
       sharedWidget.text(filterType),
      Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 10),
        child: ValueListenableBuilder<String>(
            valueListenable: _regionSelectedNotifier,
            builder: (context, region, snapshot) {
              return ValueListenableBuilder<String>(
                  valueListenable: _districtSelectedNotifier,
                  builder: (context, district, snapshot) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _anyLocationButtonSelectedNotifier.value = true;
                                _regionSelectedNotifier.value = '';
                                _districtSelectedNotifier.value = '';
                              },
                              child: ValueListenableBuilder<bool>(
                                  valueListenable:
                                      _anyLocationButtonSelectedNotifier,
                                  builder: (context, isShow, snapshot) {
                                    return sharedWidget.customizedContainer(
                                      withIcon: '',
                                      placeholder: 'Any',
                                      textColor: isShow
                                          ? Colors.white70
                                          : colors.textColor,
                                      borderColor: isShow
                                          ? Colors.transparent
                                          : colors.borderColor,
                                      containerColor: isShow
                                          ? colors.brandColor3
                                          : Colors.grey.withOpacity(.3),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      margin: EdgeInsets.only(right: 20),
                                    );
                                  }),
                            ),
                            district == ''
                                ? region == ''
                                    ? Container()
                                    : sharedWidget.customizedContainer(
                                        withIcon: '',
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 15),
                                        margin: EdgeInsets.only(right: 20),
                                        radius: 10,
                                        textColor: Colors.white70,
                                        borderColor: Colors.transparent,
                                        placeholder: region)
                                : sharedWidget.customizedContainer(
                                    withIcon: '',
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 15),
                                    margin: EdgeInsets.only(right: 20),
                                    radius: 10,
                                    textColor: Colors.white70,
                                    borderColor: Colors.transparent,
                                    placeholder: '$district, $region'),
                          ],
                        ),
                        SizedBox(height: district == '' ? 15 : 0),
                        district == ''
                            ? GestureDetector(
                                onTap: () {
                                  _anyLocationButtonSelectedNotifier.value =
                                      false;
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return _locationDialog();
                                      });
                                },
                                child: sharedWidget.customizedContainer(
                                  withIcon: '',
                                  radius: 5,
                                  textColor: colors.brandColor1,
                                  containerColor: colors.inActiveColor,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  placeholder: region == ''
                                      ? 'Choose location'
                                      : 'Choose district ?',
                                ),
                              )
                            : Container()
                      ],
                    );
                  });
            }),
      )
    ]);
  }

  _locationDialog() {
    return ValueListenableBuilder<String>(
        valueListenable: _regionSelectedNotifier,
        builder: (context, region, snapshot) {
          List<String> list = region == '' ? regions : districts;
          return Dialog(
              insetPadding: EdgeInsets.all(20),
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            color: colors.inActiveColor,
                            icon:
                                Icon(EvaIcons.close, color: colors.iconColor))),
                     sharedWidget.text(region == '' ? 'Select Region' : 'Select District'),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView(
                          children: list
                              .map((listItem) => _locationListTile(
                                  regionName: listItem,
                                  regionIndex: list.indexOf(listItem)))
                              .toList()),
                    )
                  ],
                ),
              ));
        });
  }

  Widget _locationListTile(
      {required String regionName, required int regionIndex}) {
    return ValueListenableBuilder<String>(
        valueListenable: _regionSelectedNotifier,
        builder: (context, region, snapshot) {
          return ValueListenableBuilder<int>(
              valueListenable: _locationIndexNotifier,
              builder: (context, index, child) {
                print('$regionIndex: $index');
                return GestureDetector(
                  onTap: () {
                    _locationIndexNotifier.value = regionIndex;
                    region == ''
                        ? _regionSelectedNotifier.value = regions[regionIndex]
                        : _districtSelectedNotifier.value =
                            districts[regionIndex];
                    Future.delayed(Duration(milliseconds: 0))
                        .then((value) => Navigator.pop(context));
                  },
                  child: ListTile(
                      leading: Icon(
                          regionIndex == index
                              ? EvaIcons.checkmarkSquare2Outline
                              : EvaIcons.squareOutline,
                          color: regionIndex == index
                              ? Colors.white
                              : colors.iconColor),
                      tileColor:
                          regionIndex == index ? Colors.black54 : Colors.white,
                      title: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child:  sharedWidget.text(regionName,
                            color: regionIndex == index
                                ? Colors.white
                                : colors.textColor),
                      )),
                );
              });
        });
  }

  Widget _valueSlider(
      {required String filterType,
      required ValueNotifier<RangeValues> values}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            sharedWidget.text(filterType),
            Expanded(
              child: Container(
                  width: 3000,
                  height: 40,
                  padding: EdgeInsets.only(top: 5),
                  alignment: Alignment.centerRight,
                  child: sharedWidget.text(
                    'Up to ${filterType == "Price(Tzs)" ? '300' : '200'}',
                    family: 'medium-2',
                    size: 18,
                    color: colors.textColor,
                  )),
            )
          ],
        ),
        ValueListenableBuilder<RangeValues>(
            valueListenable: values,
            builder: (context, child, snapshot) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RangeSlider(
                      values: values.value,
                      activeColor: Colors.black54,
                      inactiveColor: Colors.black12,
                      labels: RangeLabels(values.value.start.toString(),
                          values.value.end.toString()),
                      min: 0,
                      max: filterType == "Price(Tzs)" ? 900 : 10000,
                      onChanged: (RangeValues value) {
                        values.value = value;
                      }),
                ],
              );
            }),
      ],
    );
  }
}

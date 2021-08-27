export 'package:flutter/material.dart';
export 'package:eva_icons_flutter/eva_icons_flutter.dart';
export 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import 'package:nhc/FUNCTIONS/functions.dart';
import 'package:nhc/Styles/colors.dart';
import 'package:nhc/Styles/shared_widgets.dart';

GlobalKey<ScaffoldState> homepageScaffoldKey = new GlobalKey<ScaffoldState>();
SharedWidgets sharedWidget = SharedWidgets();
ThemeColors colors = ThemeColors();
ValueNotifier<Screens> screensNotifier =
    ValueNotifier<Screens>(Screens.housing_units);
bool yes = true;
bool no = false;
Functions functions = Functions();
ValueNotifier<bool> isSearchBarExpanded = ValueNotifier<bool>(no);
ValueNotifier<String> searchBarTextNotifier = ValueNotifier<String>('');
ValueNotifier<String> locationNotifier = ValueNotifier<String>('');
ValueNotifier<SigningUpOptions> usedPhoneOrEmailOnSigningUpNotifier =
    ValueNotifier<SigningUpOptions>(SigningUpOptions.phone);

enum Screens { homepage, housing_units, plots, projects }
enum SigningUpOptions { phone, email, google, facebook }

//list that deletes the deleted indices and notifies the listeners about the change, used on the bookmarks page
class ShownListOfBookmarks extends ChangeNotifier {
  List<int> lists = [0, 1, 2, 3, 4, 5, 6];

  deleteIndex({required int index}) {
    lists.remove(index);
    notifyListeners();
  }
  
}

//lists


///for housing units
List<String> images = [
  'https://i.pinimg.com/564x/52/30/85/523085fc02cc1ad3b1e3f4ef7a2f254e.jpg',
  'https://images.pexels.com/photos/5997993/pexels-photo-5997993.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
  'https://i.pinimg.com/564x/46/3f/39/463f395b5b2b66f4b9df1172f27782e9.jpg',
  'https://i.pinimg.com/564x/21/22/fa/2122fa8a8548cde1347fd3e6f976f65f.jpg',
  'https://images.pexels.com/photos/3958958/pexels-photo-3958958.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
];

List<String> names = [
  'Mwongozo Housing Estate',
  'Levolosi Residential',
  'Medelli Residential',
  'Rahaleo',
  'Iyumbu Phase II'
];

List<String> locations = [
  'Kigamboni, Dar-es-Salaam',
  'Levolosi Road, Arusha',
  'Chamwino, Dodoma',
  'Tandahimba, Mtwara',
  'Iyumbu, Dodoma'
];

///for commercial units
List<String> commercialImages = [
  'https://i.pinimg.com/564x/5a/e5/50/5ae5505990bdcb22af5a5f982e4f694d.jpg',
  'https://www.zarnaassociates.com/wp-content/uploads/2011/04/siddharth_upscalce.jpg',
  'https://th.bing.com/th/id/R.06cd2373b114c5f227e7754bb7e5176d?rik=ZSDHMfpOCQshpg&riu=http%3a%2f%2fi0.wp.com%2fkitchendecor.org.in%2fwp-content%2fuploads%2f2016%2f09%2fcommercial-complex1.jpg&ehk=FlGAZ9viM39xQP2NrRocxQiokBsthdvw48%2fD7IJTgIc%3d&risl=&pid=ImgRaw&r=0',
  'https://i.pinimg.com/564x/36/0f/fd/360ffd6b37cd22fd126829d5e2a4eea5.jpg',
  'https://i.pinimg.com/564x/ba/de/d5/baded5c6ca3f4539d1b26fb7b308ca88.jpg'
];

List<String> commercialNames = [
  'Mtukula Complex',
  'Rahaleo Complex',
  'Morocco Square',
  'Victoria Place',
  'Mukendo Plaza'
];

List<String> commercialLocations = [
  'Karagwe, Kagera',
  'Tandahimba, Mtwara',
  'Kinondoni, Dar-es-Salaam',
  'Kinondoni, Dar-es-Salaam',
  'Musoma, Mara'
];

///
List<String> allLocations = [
  'Karagwe, Kagera',
  'Tandahimba, Mtwara',
  'Kinondoni, Dar-es-Salaam',
  'Musoma, Mara',
  'Kigamboni, Dar-es-Salaam',
  'Levolosi Road, Arusha',
  'Chamwino, Dodoma',
  'Tandahimba, Mtwara',
  'Iyumbu, Dodoma',
  'Kawe, Dar-es-Salaam'
];

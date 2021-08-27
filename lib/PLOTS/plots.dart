import 'package:nhc/Styles/source.dart';

class PlotsPage extends StatelessWidget {
  const PlotsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> projects = [
      'Safari City',
      'Mhongozo Estate',
      '117 @Kawe',
      'salama creek',
      'Mtukula Complex'
    ];

    List<String> images = [
      'https://i.pinimg.com/564x/d3/e8/c1/d3e8c1df9c9ef767f525014a7be286e2.jpg',
      'https://images.pexels.com/photos/636342/pexels-photo-636342.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
      'https://images.pexels.com/photos/2897193/pexels-photo-2897193.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      'https://images.pexels.com/photos/3158805/pexels-photo-3158805.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      'https://images.pexels.com/photos/2464066/pexels-photo-2464066.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
    ];

    return Scaffold(
      backgroundColor: colors.scaffoldColor,
      appBar: sharedWidget.appBar3(context, title: 'Land Plots'),
      body: ListView(
        children: [
       sharedWidget.searchedLocation(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [0, 1, 2, 3, 4]
                  .map(
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: sharedWidget.project(context,
                          screen: Screens.plots,
                          spaces: [
                            'Residential',
                            'Commercial',
                            'Light Industries'
                          ],
                          projectName: projects[index],
                          projectLocation: ' Mateves, Arusha',
                          projectImage: images[index]),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}

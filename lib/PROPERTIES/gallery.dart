import 'package:nhc/Styles/source.dart';

class PropertyGallery extends StatelessWidget {
  const PropertyGallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List<String>> galleryImages = [
      [
        'https://cdn.houseplansservices.com/product/6qrop5e5dbbgupihv2rsp6nool/w600.jpg?v=21'
      ],
      [
        'https://i.pinimg.com/564x/9a/93/f3/9a93f330eea30a92746a22553bb04e33.jpg',
        'https://images.pexels.com/photos/1743229/pexels-photo-1743229.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
      ],
      [
        'https://i.pinimg.com/564x/3e/61/48/3e61483919132ac50c9f99986904e405.jpg'
      ],
      [
        'https://images.pexels.com/photos/3637739/pexels-photo-3637739.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
      ],
      [
        'https://images.pexels.com/photos/1648776/pexels-photo-1648776.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
      ],
      [
        'https://images.pexels.com/photos/7937274/pexels-photo-7937274.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
      ],
    ];

    List<IconData> galleryIcons = [
      EvaIcons.mapOutline,
      Icons.bed,
      Icons.bathroom_outlined,
      Icons.kitchen,
      Icons.tv,
      Icons.satellite_outlined
    ];

    List<String> galleryItemsList = [
      'Floor plan',
      'Bedrooms',
      'Bathrooms',
      'Kitchen',
      'Living room',
      'Outdoors'
    ];

    return Scaffold(
      appBar: sharedWidget.appBar2(title: 'Gallery', withIndicator: true),
      backgroundColor: colors.scaffoldColor,
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          children: [0, 1, 2, 3, 4, 5]
              .map((index) => _buildGallery(
                  icon: galleryIcons[index],
                  item: galleryItemsList[index],
                  imagesList: galleryImages[index]))
              .toList()),
    );
  }

  Widget _buildGallery(
      {required String item,
      required IconData icon,
      required List<String> imagesList}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15),
        Center(
            child: sharedWidget.text(item,
                withPadding: true, padding: EdgeInsets.only(top: 20))),
        Column(
            children: imagesList
                .map((image) => Padding(
                      padding: const EdgeInsets.only(bottom: 10, top: 10),
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Image.network(image)),
                    ))
                .toList())
      ],
    );
  }
}

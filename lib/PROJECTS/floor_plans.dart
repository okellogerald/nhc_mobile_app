import 'package:extended_image/extended_image.dart';
import 'package:nhc/Styles/source.dart';

class FloorPlansViewer extends StatelessWidget {
  final String image;
  const FloorPlansViewer({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: sharedWidget.appBar2(title: 'Floor Plan', withIndicator: true),
      backgroundColor: colors.scaffoldColor,
      body: Column(
        children: [
          Expanded(
            child: ExtendedImage.asset(
              'images/floor_plan.png',
              mode: ExtendedImageMode.gesture,
              initGestureConfigHandler: (state) {
                return GestureConfig(
                  minScale: 0.9,
                  animationMinScale: 0.7,
                  maxScale: 3.0,
                  animationMaxScale: 3.5,
                  speed: 1.0,
                  inertialSpeed: 100.0,
                  initialScale: 1.0,
                  inPageView: false,
                  initialAlignment: InitialAlignment.center,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

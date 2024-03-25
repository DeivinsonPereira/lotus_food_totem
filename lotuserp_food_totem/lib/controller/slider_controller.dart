import 'package:get/get.dart';
import 'package:lotus_food_totem/services/dependencies.dart';
import 'package:lotus_food_totem/shared/components/endpoints.dart';
import 'package:lotus_food_totem/shared/isar_local_db/isar_service.dart';

import '../collections/image_path.dart';

class SliderController extends GetxController {
  var configController = Dependencies.configController();
  IsarService service = IsarService();

  var urlImagesSlide = [].obs;
  var urlImagesBackground = ''.obs;
  var urlImagesLogo = ''.obs;

  image_path background = image_path('', '');
  List<image_path> slide = <image_path>[];
  image_path logo = image_path('', '');

  var logoImage = ''.obs;
  var backgroundImage = ''.obs;
  var slideImages = [].obs;

  Future<void> setUrlImages() async {
    urlImagesSlide.clear();
    for (int i = 0; i < 3; i++) {
      urlImagesSlide
          .add(Endpoints().endpointSearchImageDIV('TOTEM_SLIDE${(i + 1)}.PNG'));
    }
    urlImagesBackground.value =
        Endpoints().endpointSearchImageDIV('TOTEM_MARCA_DAGUA.PNG');
    urlImagesLogo.value =
        Endpoints().endpointSearchImageDIV('TOTEM_LOGO_EMPRESA.PNG');
  }

  Future<void> setImages() async {
    logo = await service.getImageLogoPath();
    background = await service.getImageBackgroundPath();
    slide = await service.getImageSlidePath();
  }

  Future<void> getImagePath() async {
    logoImage.value = logo.path_image!;
    backgroundImage.value = background.path_image!;
    slideImages.clear();
    slideImages.value = [...slide];
  }
}

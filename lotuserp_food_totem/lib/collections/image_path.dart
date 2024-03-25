// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:isar/isar.dart';

part 'image_path.g.dart';

@Collection()
class image_path {
  late Id id = Isar.autoIncrement;
  late String? file_image;
  late String? path_image;

  image_path(
    this.file_image,
    this.path_image,
  );
}



class ImageAssets {
  const ImageAssets();

  static const String _path = 'assets/images/';

  String _png(String name) => '$_path$name.png';

  String get logo => _png('logo');
}

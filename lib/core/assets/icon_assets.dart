class IconAssets {
  const IconAssets();

  static const String _path = 'assets/icons/';

  String _svg(String name) => '$_path$name.svg';

  String get logo => _svg('logo');
}

class LottieAssets {
  const LottieAssets();

  static const String _path = 'assets/lotties/';

  String _json(String name) => '$_path$name.json';

  String get logo => _json('logo');
}

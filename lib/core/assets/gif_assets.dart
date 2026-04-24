class GifAssets {
  const GifAssets();

  static const String _path = 'assets/gifs/';

  String _gif(String name) => '$_path$name.gif';

  String get logo => _gif('logo');
}

abstract final class ApiRoutes {
  static final auth = _AuthRoutes();
  static final users = _UserRoutes();
  static final products = _ProductRoutes();
}

final class _AuthRoutes {
  const _AuthRoutes();

  final String login = '/auth/login';
  final String register = '/auth/register';
  final String refreshToken = '/auth/refresh';
  final String logout = '/auth/logout';
}

final class _UserRoutes {
  const _UserRoutes();

  final String list = '/users';
  String detail(int id) => '/users/$id';
}

final class _ProductRoutes {
  const _ProductRoutes();

  final String list = '/products';
  String detail(int id) => '/products/$id';
}

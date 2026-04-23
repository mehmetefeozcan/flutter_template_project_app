import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

mixin BaseViewMixin<T extends StatefulWidget> on State<T> {
  final List<ReactionDisposer> _disposers = [];

  /// Override in page
  void onInit() {}

  /// Override in page
  void onDispose() {}

  void addReaction(ReactionDisposer disposer) {
    _disposers.add(disposer);
  }

  @override
  void initState() {
    super.initState();
    onInit();
  }

  @override
  void dispose() {
    for (final d in _disposers) {
      d();
    }
    onDispose();
    super.dispose();
  }
}

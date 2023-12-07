import 'package:cryptos/core/mixins/loader.dart';
import 'package:cryptos/core/mixins/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseState<T extends StatefulWidget, C extends BlocBase>
    extends State<T> with Loader, MySnackBar {
  late final C controller;

  @override
  void initState() {
    super.initState();
    controller = context.read<C>();
  }
}

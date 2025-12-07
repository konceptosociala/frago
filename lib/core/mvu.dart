import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart' show Task;

typedef Update<M, Msg> = Task<M> Function(M model, Msg msg);
typedef View<M, Msg> = Widget Function(
  M model, 
  void Function(Msg msg) dispatch,
);

class MVU<M, Msg> extends StatefulWidget {
  final M initialModel;
  final Update<M, Msg> update;
  final View<M, Msg> view;

  const MVU({
    super.key,
    required this.initialModel,
    required this.update,
    required this.view,
  });

  @override
  MVUState<M, Msg> createState() => MVUState<M, Msg>();
}

class MVUState<M, Msg> extends State<MVU<M, Msg>> {
  late M model;

  @override
  void initState() {
    super.initState();
    model = widget.initialModel;
  }

  void dispatch(Msg msg) async {
    final newModel = await widget.update(model, msg).run();

    setState(() {
      model = newModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.view(model, dispatch);
  }
}
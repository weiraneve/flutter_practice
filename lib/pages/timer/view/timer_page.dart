import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/component/base_scaffold.dart';
import 'package:flutter_practice/pages/timer/view/stopwatch_widget.dart';
import 'package:flutter_practice/pages/timer/view/timer_tool.dart';

import '../bloc/bloc.dart';
import 'record_panel.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  StopWatchBloc get stopWatchBloc => BlocProvider.of<StopWatchBloc>(context);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Column(
        children: [
          const SizedBox(height: 20),
          buildStopwatchPanel(),
          buildRecordPanel(),
          buildTools()
        ],
      ),
    );
  }

  Widget buildStopwatchPanel() {
    double radius = MediaQuery.of(context).size.shortestSide / 2 * 0.75;
    return BlocBuilder<StopWatchBloc, StopWatchState>(
      buildWhen: (p, n) => p.duration != n.duration,
      builder: (_, state) => StopwatchWidget(
        duration: state.duration,
        radius: radius,
        themeColor: Theme.of(context).primaryColor,
        secondDuration: state.secondDuration,
      ),
    );
  }

  Widget buildTools() {
    return BlocBuilder<StopWatchBloc, StopWatchState>(
      buildWhen: (p, n) => p.type != n.type,
      builder: (_, state) => TimerTool(
        state: state.type,
        onRecorder: onRecorder,
        onReset: onReset,
        toggle: toggle,
      ),
    );
  }

  void onReset() => stopWatchBloc.add(const ResetStopWatch());

  void onRecorder() => stopWatchBloc.add(const RecordeStopWatch());

  void toggle() => stopWatchBloc.add(const ToggleStopWatch());

  Widget buildRecordPanel() {
    return Expanded(
      child: BlocBuilder<StopWatchBloc, StopWatchState>(
        buildWhen: (p, n) => p.durationRecord != n.durationRecord,
        builder: (_, state) => RecordPanel(
          record: state.durationRecord,
        ),
      ),
    );
  }
}

class Right2LeftRouter<T> extends PageRouteBuilder<T> {
  final Widget child;
  final int durationMs;
  final Curve curve;

  Right2LeftRouter(
      {required this.child,
      this.durationMs = 200,
      this.curve = Curves.fastOutSlowIn})
      : super(
            transitionDuration: Duration(milliseconds: durationMs),
            pageBuilder: (ctx, a1, a2) => child,
            transitionsBuilder: (ctx, a1, a2, child) => SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1.0, 0.0),
                    end: const Offset(0.0, 0.0),
                  ).animate(CurvedAnimation(parent: a1, curve: curve)),
                  child: child,
                ));
}

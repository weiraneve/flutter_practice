import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/component/base_scaffold.dart';
import 'package:flutter_practice/pages/timer/view/stopwatch_widget.dart';
import 'package:flutter_practice/pages/timer/view/timer_tools.dart';
import 'package:flutter_practice/res/string/strings.dart';
import 'package:flutter_practice/res/theme/dimens.dart';

import '../bloc/bloc.dart';
import 'record_panel.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  StopWatchBloc get stopWatchBloc => BlocProvider.of<StopWatchBloc>(context);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: stringRes(R.timerTitle),
      body: Column(
        children: [
          const SizedBox(height: Dimens.dp32),
          buildStopwatchPanel(),
          buildRecordPanel(),
          buildTools()
        ],
      ),
    );
  }

  void onReset() => stopWatchBloc.add(const ResetStopWatch());

  void onRecord() => stopWatchBloc.add(const RecordStopWatch());

  void toggle() => stopWatchBloc.add(const ToggleStopWatch());

  Widget buildTools() {
    return BlocBuilder<StopWatchBloc, StopWatchState>(
      buildWhen: (p, n) => p.type != n.type,
      builder: (_, state) => TimerTools(
        state: state.type,
        onRecord: onRecord,
        onReset: onReset,
        toggle: toggle,
      ),
    );
  }

  Widget buildStopwatchPanel() {
    double radius = MediaQuery.of(context).size.shortestSide / 3;
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

import 'package:flutter/material.dart';

import '../bloc/bloc.dart';

class TimerTool extends StatelessWidget {
  final StopWatchType state;
  final VoidCallback? onReset;
  final VoidCallback? toggle;
  final VoidCallback? onRecorder;

  const TimerTool({
    super.key,
    required this.state,
    this.onRecorder,
    this.onReset,
    this.toggle,
  });

  @override
  Widget build(BuildContext context) {
    bool running = state == StopWatchType.running;
    bool stopped = state == StopWatchType.stopped;
    Color activeColor = Colors.black;
    Color inactiveColor = Colors.grey;
    Color resetColor = stopped ? activeColor : inactiveColor;
    Color flagColor = activeColor;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 50,
        children: [
          if (state != StopWatchType.initial)
            GestureDetector(
              onTap: stopped ? onReset : null,
              child: Icon(Icons.refresh, size: 28, color: resetColor),
            ),
          FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: toggle,
            child:
                running ? const Icon(Icons.stop) : const Icon(Icons.play_arrow),
          ),
          if (state != StopWatchType.initial)
            GestureDetector(
              onTap: onRecorder,
              child: Icon(Icons.flag_outlined, size: 28, color: flagColor),
            ),
        ],
      ),
    );
  }
}

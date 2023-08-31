part of 'bloc.dart';

abstract class StopWatchEvent {
  const StopWatchEvent();
}

class ResetStopWatch extends StopWatchEvent {
  const ResetStopWatch();
}

class ToggleStopWatch extends StopWatchEvent {
  const ToggleStopWatch();
}

class _UpdateDuration extends StopWatchEvent {
  final Duration duration;

  _UpdateDuration(this.duration);
}

class RecordStopWatch extends StopWatchEvent {
  const RecordStopWatch();
}

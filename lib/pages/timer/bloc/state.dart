part of 'bloc.dart';

enum StopWatchType {
  initial,
  stopped,
  running,
}

class StopWatchState {
  final StopWatchType type;
  final List<TimeRecord> durationRecord;
  final Duration duration;

  Duration get secondDuration {
    if (durationRecord.isNotEmpty) {
      return duration - durationRecord.last.record;
    }
    return duration;
  }

  const StopWatchState({
    this.type = StopWatchType.initial,
    this.durationRecord = const [],
    this.duration = Duration.zero,
  });

  StopWatchState copyWith({
    StopWatchType? type,
    List<TimeRecord>? durationRecord,
    Duration? duration,
  }) {
    return StopWatchState(
      type: type ?? this.type,
      durationRecord: durationRecord ?? this.durationRecord,
      duration: duration ?? this.duration,
    );
  }
}

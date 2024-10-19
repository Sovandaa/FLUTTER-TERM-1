class MyDuration {
  final int _milliseconds;

  MyDuration(this._milliseconds); // main coustructor

  MyDuration.fromHours(int hours) : _milliseconds = hours * 3600000;
  MyDuration.fromMinutes(int minutes) : _milliseconds = minutes * 60000;
  MyDuration.fromSeconds(int seconds) : _milliseconds = seconds * 1000;

  // getter
  int get duration {
    return _milliseconds;
  }

  // Overloaded Operator
  bool operator >(MyDuration other) {
    if (_milliseconds > other._milliseconds) {
      return true;
    }
    return false;
  }

  MyDuration operator +(MyDuration other) {
    return MyDuration(_milliseconds + other._milliseconds);
  }

  MyDuration operator -(MyDuration other) {
    if (_milliseconds < other._milliseconds) {
      throw Exception("Result will be negative, cannot do operation!");
    }
    return MyDuration(_milliseconds - other._milliseconds);
  }

  // Display the duration in a readable format
  @override
  String toString() {
    int seconds = (_milliseconds / 1000)
        .round(); //result in decimal: use round() to round number to nearest interget.
    int minutes =
        (seconds / 60).floor(); // get whole minute not include remaind seconds.
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }
}

void main() {
  MyDuration duration1 = MyDuration.fromHours(3); // 3 hours
  MyDuration duration2 = MyDuration.fromMinutes(45); // 45 minutes
  print("${duration1.duration} milliseconds");
  print("${duration2.duration} milliseconds");

  print(duration1 + duration2); // 3 hours, 45 minutes, 0 seconds
  print(duration1 > duration2); //true

  try {
    print(duration2 - duration1); // This will throw an exception
  } catch (e) {
    print(e);
  }
}

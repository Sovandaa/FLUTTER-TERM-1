class Distance {
  final double value; // defualt units in meters.

  Distance(this.value); // main constructor

  // named constructor
  Distance.cms(this.value);
  Distance.meters(this.value);
  Distance.kms(this.value);

  double get cms {
    return value * 0.01;
  }

  double get meters {
    return value;
  }

  double get kms {
    return value * 1000;
  }
}

void main() {
  Distance d1 = Distance.cms(3.4);
  Distance d2 = Distance(1000);
  
  //print((d1 + d2).kms);
}
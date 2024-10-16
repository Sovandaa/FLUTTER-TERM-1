class Distance {
  final double value; // defualt units in meters.

  Distance(this.value); // main constructor

  // named constructor (convert to meters unit)
  Distance.cms(double cms): value = cms * 0.01;
  Distance.meters(this.value);
  Distance.kms(double kms): value = kms * 1000;

  //add 2 distances use operator overloading
  Distance operator + (Distance other) {
    return Distance(value + other.value);
  }

  // getter (convert meters to other units)
  double get cms {
    return value * 100;
  }
  double get meters {
    return value;
  }
  double get kms {
    return value / 1000;
  }
}

void main() {
  Distance d1 = Distance.kms(3.4); // 3400 m
  Distance d2 = Distance.meters(1000); // 1000 m

  print((d1 + d2).kms);
  print((d1 + d2).meters);
  print((d1 + d2).cms);

}

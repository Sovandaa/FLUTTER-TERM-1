class Window {
  String color;
  String position;

  Window(this.color, this.position);
}

class Roof {
  String shape;

  Roof(this.shape);
}

class Door {
  String position;
  String color;

  Door(this.position, this.color);
}

class Chimney {
  int? cNum;

  Chimney({this.cNum});
}

class House {
  //List<int> stairs = [];
  List<Window> windows = [];
  List<Roof> roofs = [];
  List<Door> doors = [];
  List<Chimney> chimneys = [];

  // void stairNum(num) {
  //   this.stairs.add(num);
  // }

  void addWindow(newWindow) {
    this.windows.add(newWindow);
  }

  void addRoof(newRoof) {
    this.roofs.add(newRoof);
  }

  void addDoor(newDoor) {
    this.doors.add(newDoor);
  }

  void addChimney(newChimney) {
    this.chimneys.add(newChimney);
  }

  int get totalWindows => windows.length;
  int get totalDoors => doors.length;
}

// Create 3 differents house from Class House
void main() {
  Window w1 = Window('green', 'left-stair1');
  Roof r1 = Roof('Triangle');
  Chimney c1 = Chimney(cNum: 1);

  House h1 = House();
  h1.addWindow(w1);
  h1.addRoof(r1);
  h1.addChimney(c1);
  print("House 1 have ${h1.totalDoors} Doors , ${h1.totalWindows} windowns");

  Window w2 = Window('blue', 'left-stair0');
  Roof r2 = Roof('mid-circle');
  Door d2 = Door('right-stair0', 'black');
  Chimney c2 = Chimney(cNum: 1);

  House h2 = House();
  h2.addWindow(w2);
  h2.addRoof(r2);
  h2.addDoor(d2);
  h2.addChimney(c2);
  print("House 2 have ${h2.totalDoors} Doors , ${h2.totalWindows} windowns");

  Window w31 = Window('blue', 'left-stair1');
  Window w32 = Window('blue', 'left-stair0');
  Window w33 = Window('blue', 'right-stair0');
  Roof r3 = Roof('null');
  Door d3 = Door('center-stair0', 'black');
  Chimney c3 = Chimney(cNum: 0);

  House h3 = House();
  h3.addWindow(w31);
  h3.addWindow(w32);
  h3.addWindow(w33);
  h3.addRoof(r3);
  h3.addDoor(d3);
  h3.addChimney(c3);
  print("House 3 have ${h3.totalDoors} Doors , ${h3.totalWindows} windowns");

}

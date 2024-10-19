enum Skill { FLUTTER, DART, OTHER }

class Address {
  String _street;
  String _city;
  String _zipCode;

  Address(this._street, this._city, this._zipCode);

  @override
  String toString() {
    return "Street: $_street, City: $_city, zipCode: $_zipCode";
  }
}

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _yearOfExperience;

  Employee(this._name, this._baseSalary, this._skills , this._address, this._yearOfExperience);

  Employee.mobileDeveloper({
    required String name,
    required double baseSalary,
    required Address address,
    required int yearOfExperience,
    
  }): _name = name,
      _baseSalary = baseSalary,
      _address = address,
      _yearOfExperience = yearOfExperience,
      _skills = [Skill.FLUTTER, Skill.DART];  

  // getter method
  String get name => _name;
  double get baseSalary => _baseSalary;
  List get skill => _skills;
  Address get address => _address;
  int get yearOfExperience => _yearOfExperience;

  // void addSkill(Skill newSkill) {
  //   _skills.add(newSkill);
  // }

  void printDetails() {
    print('Employee: $_name, Base Salary: \$${_baseSalary}, ');
    print("Total Salary: ${ComputeSalary()}");
  }

  double ComputeSalary() {
    double totalSalary = _baseSalary; // get equal to baseSalary
    totalSalary += (_yearOfExperience * 2000); // each year add 2000

    for (var skill in _skills) {
      switch (skill) {
        case Skill.FLUTTER:
          totalSalary += 5000;
          break;
        case Skill.DART:
          totalSalary += 3000;
          break;
        case Skill.OTHER:
          totalSalary += 1000;
          break;
      }
    }
    return totalSalary;
  }

}

void main() {

  var emp1 = Employee.mobileDeveloper(
    name:'Ronan',
    baseSalary: 40000,
    address: Address("6A", "PP", "10100"),
    yearOfExperience: 4
  );
  emp1.printDetails();

  var emp2 = Employee('Sokea', 40000, [Skill.OTHER] ,Address("6A", "PP", "10100"), 5 );
  emp2.printDetails();

}

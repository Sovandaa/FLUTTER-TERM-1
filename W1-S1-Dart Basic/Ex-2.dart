void main() {
  // 1
  const String iLike = 'I like pizza';

  // 2
  String toppings = 'with tomatoes';
  toppings += " and cheese";

  // 3
  String message = '$iLike $toppings';
  print(message);

  // 4
  List<String> rbgColors = ['red', 'blue', 'green'];
  print(rbgColors);

  // 5
  List<String> weekDays = ['monday', 'tuesday', 'wednesday'];
  weekDays.add('thursday');
  print(weekDays);

  // 6
  List<int> scores = [45, 35, 50];
  scores = [45, 35, 50, 78];
  print(scores);
  
}

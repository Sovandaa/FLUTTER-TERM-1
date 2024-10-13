void main() {
  // List of student scores
  List<int> scores = [45, 67, 82, 49, 51, 78, 92, 30];

  // You code
  var scoresPass = scores.where((score) => score >= 50);
  print(scoresPass.toList());
  print("${scoresPass.length} students passed");
}


  // int count =0;
  // for (var i = 0; i < scores.length; i++) {
  //   if (scores[i] > 50) {
  //     print("$i.Student ${scores[i]} has passed");
  //     //print("${scores[i]}");
  //     conut++;
  //   }
  // }
  // print("$conut students passed.");
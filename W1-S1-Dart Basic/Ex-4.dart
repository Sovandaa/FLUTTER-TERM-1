void main() {
  // Map of pizza prices
  const pizzaPrices = {
    'margherita': 5.5,
    'pepperoni': 7.5,
    'vegetarian': 6.5,
  };

  // Example order
  const order = ['margherita', 'pepperoni', 'pineapple'];

  // Your code
  double totalPrices = 0;
  List<String> notInMenu = [];
  for (var aOrder in order) {
    if (pizzaPrices.containsKey(aOrder)) {
      totalPrices += pizzaPrices[aOrder] ??
          0.0; // ?? : handle null-value (in cast key missig + 0.0)
    } else {
      notInMenu.add(aOrder);
    }
  }

  print("Total: \$ $totalPrices");
  print("$notInMenu pizza is not on the menu.");

}

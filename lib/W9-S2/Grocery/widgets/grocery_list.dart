import 'package:flutter/material.dart';

import 'package:flutter_workspace/W9-S2/Grocery/models/grocery_item.dart';
import 'package:flutter_workspace/W9-S2/Grocery/models/mode.dart';
import 'package:flutter_workspace/W9-S2/Grocery/widgets/new_item.dart';
import '../data/dummy_items.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> groceryItems = dummyGroceryItems;

  // pass data, add new item to grocery list
  Future<void> addNewItem() async {
    // navigate to Newitem screen & wait for data of new item
    final newItem = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NewItem()),
    );

    // get newItem data returned from NewItem screen, add to list
    if (newItem != null) {
      setState(() {
        groceryItems.add(newItem);
      });
    }
  }

  // update order of item
  void updateOrder(int oldIndex, int newIndex) {
    setState(() {
      // adjust newIndex when moving down
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final item = groceryItems.removeAt(oldIndex);
      groceryItems.insert(newIndex, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (dummyGroceryItems.isNotEmpty) {
      content = ReorderableListView(onReorder: updateOrder, children: [
        for (var item in dummyGroceryItems)
          GroceryTile(
            item,
            key: ValueKey(item.id),
          )
      ]);
      // handle long press
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: () => {
              addNewItem(),
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}

class GroceryTile extends StatelessWidget {
  const GroceryTile(this.groceryItem, {super.key});

  final GroceryItem groceryItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(groceryItem.name),
      leading: Container(
        width: 24,
        height: 24,
        color: groceryItem.category.color,
      ),
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Text(
          groceryItem.quantity.toString(),
        ),
      ),
    );
  }
}

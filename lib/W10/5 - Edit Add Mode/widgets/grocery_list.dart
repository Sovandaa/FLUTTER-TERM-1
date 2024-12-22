import 'package:flutter/material.dart';
import '../models/grocery_item.dart';
import 'new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = [];

  void _addItem() async {
    GroceryItem? newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => const EditItem(mode: EditionMode.creating),
      ),
    );

    if (newItem != null) {
      setState(() {
        _groceryItems.add(newItem);
      });
    }
  }

  void _editItem(GroceryItem item) async {
    GroceryItem? editedItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => EditItem(
          mode: EditionMode.editing,
          editedItem: item,
        ),
      ),
    );

    if (editedItem != null) {
      int index = _groceryItems.indexOf(item);
      setState(() {
        _groceryItems[index] = editedItem;
      });
    }
  }

  void _removeItem(GroceryItem item) async {
    setState(() {
      _groceryItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (ctx, index) => Dismissible(
            key: Key(_groceryItems[index].id),
            onDismissed: (direction) => _removeItem(_groceryItems[index]),
            child: GroceryTile(
              groceryItem: _groceryItems[index],
              onEdit: _editItem,
            )),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}

class GroceryTile extends StatelessWidget {
  GroceryTile({
    super.key,
    required this.groceryItem,
    required this.onEdit,
  });

  final GroceryItem groceryItem;
  final Function(GroceryItem) onEdit;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onEdit(groceryItem),
      title: Text(groceryItem.name),
      leading: Container(
        width: 24,
        height: 24,
        color: groceryItem.category.color,
      ),
      trailing: Text(
        groceryItem.quantity.toString(),
      ),
    );
  }
}

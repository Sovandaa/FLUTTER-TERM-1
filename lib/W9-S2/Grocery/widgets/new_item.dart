import 'package:flutter/material.dart';
import 'package:flutter_workspace/W9-S2/Grocery/models/mode.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_workspace/W9-S2/Grocery/models/grocery_item.dart';
import '../models/grocery_category.dart';

class NewItem extends StatefulWidget {
  final Mode mode;
  final GroceryItem? itemToEdit;
  const NewItem({super.key, required this.mode, this.itemToEdit});
  // const NewItem({super.key});

  @override
  State<NewItem> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {
  // We create a key to access and control the state of the Form.
  final _formKey = GlobalKey<FormState>();
  Uuid uuid = const Uuid(); // instant Uuid, unquie id

  String _enteredName = '';
  int _enteredQuantity = 0;
  GroceryCategory _category = GroceryCategory.fruit;

  Future<void> _saveItem() async {
    // 1 - Validate the form
    bool isValid = _formKey.currentState!.validate();
    if (isValid) {
      // 2 - Save the form to get last entered values
      _formKey.currentState!.save();

      print("Name $_enteredName");
      print("Quantity $_enteredQuantity");
      print("Category ${_category.label}");

      // check id use existing for edit item & new id for create  

      // add new item of groceryitem
      GroceryItem item = GroceryItem(
          id: uuid.v4(),
          name: _enteredName,
          quantity: _enteredQuantity,
          category: _category);

      // pop the current screen, return data of new item
      Navigator.pop<GroceryItem>(context, item);
    }
  }

  void _resetForm() {
    // TODO: reset the form
    _formKey.currentState!.reset();
    setState(() {
      if (widget.mode == Mode.creating) {
        _enteredName = '';
        _enteredQuantity = 1;
        _category = GroceryCategory.fruit;
      } else {
        _enteredName = widget.itemToEdit!.name;
        _enteredQuantity = widget.itemToEdit!.quantity;
        _category = widget.itemToEdit!.category;
      }
    });
  }

  String? validateTitle(String? value) {
    if (value == null ||
        value.isEmpty ||
        value.trim().length <= 1 ||
        value.trim().length > 50) {
      return 'Must be between 1 and 50 characters.';
    }
    return null;
  }

  String? validateQuantity(String? value) {
    if (value == null || value.isEmpty) {
      return "Must be a valid, positive number.";
    }
    final number = int.tryParse(value);
    if (number == null || number <= 0) {
      return "Must be a valid, positive number.";
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    if (widget.mode == Mode.editing) {
      _enteredName = widget.itemToEdit!.name;
      _enteredQuantity = widget.itemToEdit!.quantity;
      _category = widget.itemToEdit!.category;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            widget.mode == Mode.creating ? Text('Add New Item') : Text("Edit Item"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                initialValue: widget.mode == Mode.editing ? _enteredName : "",
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
                validator: validateTitle,
                onSaved: (value) {
                  _enteredName = value!;
                },
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Quantity'),
                        ),
                        initialValue: widget.mode == Mode.editing
                            ? _enteredQuantity.toString()
                            : "1",
                        validator: validateQuantity,
                        onSaved: (value) {
                          _enteredQuantity = int.parse(value!);
                        }),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField<GroceryCategory>(
                      value: _category,
                      items: [
                        for (final category in GroceryCategory.values)
                          DropdownMenuItem<GroceryCategory>(
                            value: category,
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: category.color,
                                ),
                                const SizedBox(width: 6),
                                Text(category.label),
                              ],
                            ),
                          ),
                      ],
                      onChanged: (GroceryCategory? value) {
                        if (value != null) {
                          setState(() {
                            _category = value;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _resetForm,
                    child: const Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: _saveItem,
                    child: widget.mode == Mode.creating
                        ? Text('Add Item')
                        : Text("Save Edit"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}




// class _NewItemState extends State<NewItem> {
//   final _formkey = GlobalKey<FormState>();

//   void _onAddItem() {
//     if (_formkey.currentState!.validate()) {
//       print("OK");
//     }
//   }

//   String? _nameValidator(String? value) {
//     if (value == null || value.isEmpty) {
//       return "Name should contain 1 to 50 characters";
//     }
//     return null;
//   }

//   String? _amountValidator(String? value) {


//     final number = double.tryParse(value!);
//     if (number == null || number <= 0) {
//       return "Must be a valid, positive number.";
//     }
//     return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add a new item'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Form(
//           key: _formkey,
//           child: Column(
//             children: [
//               TextFormField(
//                 maxLength: 50,
//                 decoration: const InputDecoration(
//                   label: Text('Name'),
//                 ),
//                 validator: _nameValidator,
//               ),
//               const SizedBox(height: 10),
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Expanded(
//                     child: TextFormField(
//                       decoration: const InputDecoration(
//                         label: Text('Quantity'),
//                       ),
//                       initialValue: '1',
//                       validator: _amountValidator,
//                     ),
//                   ),
//                   const SizedBox(width: 8),
//                   Expanded(
//                     child: DropdownButtonFormField<GroceryCategory>(
//                       items: [
//                         for (final category in GroceryCategory.values)
//                           DropdownMenuItem<GroceryCategory>(
//                             value: category,
//                             child: Row(
//                               children: [
//                                 Container(
//                                   width: 16,
//                                   height: 16,
//                                   color: category.color,
//                                 ),
//                                 const SizedBox(width: 6),
//                                 Text(category.label),
//                               ],
//                             ),
//                           ),
//                       ],
//                       onChanged: (value) {},
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 12),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   TextButton(
//                     onPressed: () => {},
//                     child: const Text('Reset'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () => {_onAddItem()},
//                     child: const Text('Add Item'),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

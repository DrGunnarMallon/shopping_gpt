import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_gpt/theme.dart';

class ItemForm extends StatefulWidget {
  final Function(String, int) onSubmit;
  final String initialName;
  final int initialQuantity;

  ItemForm({
    required this.onSubmit,
    this.initialName = '',
    this.initialQuantity = 1,
  });

  @override
  _ItemFormState createState() => _ItemFormState();
}

class _ItemFormState extends State<ItemForm> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _name = widget.initialName;
    _quantity = widget.initialQuantity;
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.onSubmit(_name, _quantity);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              initialValue: _name,
              decoration: InputDecoration(
                labelText: 'Item Name',
                labelStyle: TextStyle(color: AppColors.textColor),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.textColor),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.textColor),
                ),
              ),
              style: TextStyle(color: AppColors.textColor),
              cursorColor: AppColors.textColor,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter an item name.';
                }
                return null;
              },
              onSaved: (value) {
                _name = value!;
              },
            ),
            TextFormField(
              initialValue: _quantity.toString(),
              decoration: InputDecoration(
                labelText: 'Quantity',
                labelStyle: TextStyle(color: AppColors.textColor),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.textColor),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.textColor),
                ),
              ),
              style: TextStyle(color: AppColors.textColor),
              cursorColor: AppColors.textColor,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty ||
                    int.tryParse(value) == null ||
                    int.parse(value) <= 0) {
                  return 'Please enter a valid quantity.';
                }
                return null;
              },
              onSaved: (value) {
                _quantity = int.parse(value!);
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Form(
//         key: _formKey,
//         child: Column(
//           children: [
//             TextFormField(
//               initialValue: _name,
//               decoration: InputDecoration(
//                   labelText: 'Item Name',
//                   labelStyle: TextStyle(color: AppColors.textColor)),
//               style: const TextStyle(color: Colors.white),
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'Please enter an item name.';
//                 }
//                 return null;
//               },
//               onSaved: (value) {
//                 _name = value!;
//               },
//             ),
//             TextFormField(
//               initialValue: _quantity.toString(),
//               decoration: InputDecoration(labelText: 'Quantity'),
//               keyboardType: TextInputType.number,
//               validator: (value) {
//                 if (value!.isEmpty ||
//                     int.tryParse(value) == null ||
//                     int.parse(value) <= 0) {
//                   return 'Please enter a valid quantity.';
//                 }
//                 return null;
//               },
//               onSaved: (value) {
//                 _quantity = int.parse(value!);
//               },
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _submit,
//               child: Text('Save'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

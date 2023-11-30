import 'package:flutter/material.dart';
import 'package:invoice_items/Core/Utils/Style/Colors.dart';
import 'package:invoice_items/Core/Utils/Style/TextStyle.dart';
import 'package:invoice_items/Core/Utils/app_sizes.dart';
import '../../../Core/Shared/Components/components.dart';
//------------------------------------------------------------
class EditableTable extends StatefulWidget {
  const EditableTable({super.key});

  @override
  _EditableTableState createState() => _EditableTableState();
}

class _EditableTableState extends State<EditableTable> {
  List<Map<String, TextEditingController>> _tableData = [];
  double _totalQuantity = 0;
  double _totalPrice = 0;
  double _totalValue = 0;

  @override
  void initState() {
    _addRow();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: _buildTable(),
        ),
        const Divider(thickness: 1,color: AppColor.black,),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child:_buildTotals()
        ),
        const Divider(thickness: 1,color: AppColor.black,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildButton(onTap: () {_addRow();  }, label: 'اضف صنف', icon: Icons.add, context: context),
            buildButton(
                onTap: () {
                if (_validateAllRows()) {
                  _showSavedRows();
                }}, label: ' حفظ الأصناف', icon: Icons.save_alt, context: context),
          ],
        ),
      ],
    );
  }
//01#build Table:
  Widget _buildTable() {
    return DataTable(
      border:  TableBorder.all(
        width: 2,
        color: AppColor.gray
      ),
      headingRowColor: MaterialStateColor.resolveWith((states) =>AppColor.teal), // Header color
      dividerThickness: 0.0,
      columns:  [
        DataColumn(label: Text('اسم الصنف',style: titleFont,),),
        DataColumn(label: Text('الوحدة',style: titleFont)),
        DataColumn(label: Text('الكمية',style: titleFont)),
        DataColumn(label: Text('السعر',style: titleFont)),
        DataColumn(label: Text('القيمة',style: titleFont)),
        DataColumn(label: Text('حذف',style: titleFont)),
      ],
      rows: _tableData.map((data) => _buildDataRow(data)).toList(),
    );
  }

  DataRow _buildDataRow(Map<String, TextEditingController> data) {
    TextEditingController itemQuantityController = data['itemQuantity']!;
    TextEditingController itemPriceController = data['itemPrice']!;
    TextEditingController valueController = data['value']!;
    void calculateValue() {
      double itemQuantity = double.tryParse(itemQuantityController.text) ?? 0;
      double itemPrice = double.tryParse(itemPriceController.text) ?? 0;
      double value = itemQuantity * itemPrice;
      valueController.text = value.toString();
    }
    return DataRow(
      cells: [
        DataCell(
          TextFormField(
            style: bodyFont,
            keyboardType: TextInputType.text,
            controller: data['productName'],
            decoration: _buildInputDecoration('اسم الصنف'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'يجب إدخال اسم الصنف';
              }
              return null;
            },
          ),
        ),
        DataCell(
          _buildUnitDropdown(data['itemUnit']!),
        ),
        DataCell(
          TextFormField(
            style: bodyFont,
            controller: itemQuantityController,
            keyboardType: TextInputType.number,
            decoration: _buildInputDecoration('الكمية'),
            onChanged: (value) {
              setState(() {
                _updateTotals();
                calculateValue();
              });
            },
            validator: (value) {
              if (!_isNumeric(value)) {
                return 'ادخل كمية صحيحة';
              }
              return null;
            },
          ),
        ),
        DataCell(
          TextFormField(
            style: bodyFont,
            controller: itemPriceController,
            keyboardType: TextInputType.number,
            decoration: _buildInputDecoration('السعر'),
            onChanged: (value) {
              setState(() {
                _updateTotals();
                calculateValue();
              });
            },
            validator: (value) {
              if (!_isNumeric(value)) {
                return 'ادخل السعر بطريقة صحيحة';
              }
              return null;
            },
          ),
        ),
        DataCell(
          TextFormField(
            controller: valueController,
            enabled: false,
            style: bodyFont,
            onChanged: (value){
              setState(() {
                _updateTotals();

              });
            },
            decoration: _buildInputDecoration('القيمة'),
            validator: (value) {
              return null;
            },
          ),
        ),
        DataCell(
          IconButton(
            icon: const Icon(Icons.delete,color: AppColor.red,),
            onPressed: () {
              setState(() {
                _tableData.remove(data);
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildUnitDropdown(TextEditingController controller) {
    String selectedValue = controller.text;
    List<String> unitOptions = ['حبة', 'كرتون'];
    return DropdownButton<String>(
      value: unitOptions.contains(selectedValue) ? selectedValue : null,
      hint: const Text('الوحدة'),
      items: unitOptions.map((unit) {
        return DropdownMenuItem<String>(
          value: unit,
          child: Text(unit),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          controller.text = value!;
        });
      },
    );
  }

  InputDecoration _buildInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle:const TextStyle(color: Colors.black54) ,
      border: InputBorder.none,
    );
  }

  void _addRow() {
    setState(() {
      _updateTotals();
      _tableData.add({
        'productName': TextEditingController(),
        'itemUnit': TextEditingController(),
        'itemQuantity': TextEditingController(),
        'itemPrice': TextEditingController(),
        'value': TextEditingController(),
      });
    });
  }

  //_buildSavedRow:
  bool _isNumeric(String? value) {
    if (value == null) {
      return false;
    }
    return double.tryParse(value) != null;
  }

  //_buildSavedRow:
  void _showSavedRows() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('حفظ الصف'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _tableData.map((data) => _buildSavedRow(data)).toList(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('موافق'),
            ),
          ],
        );
      },
    );
  }

  //_buildSavedRow:
  Widget _buildSavedRow(Map<String, TextEditingController> data) {
    return Text(
      'Product Name: ${data['productName']?.text}\n'
          'Item Unit: ${data['itemUnit']?.text}\n'
          'Item Quantity: ${data['itemQuantity']?.text}\n'
          'Item Price: ${data['itemPrice']?.text}\n'
          'Value: ${data['value']?.text}\n\n',
    );
  }

  //_validateAllRows:
  bool _validateAllRows() {
    for (var data in _tableData) {
      for (var controller in data.values) {
        if (controller.text.isEmpty) {
            buildMessage(context: context, msg: 'برجاء ملء جميع الحقول');
          return false;
        } } }
    return true;
  }


  void _updateTotals() {
    _totalQuantity = 0;
    _totalPrice = 0;
    _totalValue = 0;

    for (var data in _tableData) {
      double quantity = double.tryParse(data['itemQuantity']!.text) ?? 0;
      double price = double.tryParse(data['itemPrice']!.text) ?? 0;
      double value = double.tryParse(data['value']!.text) ?? 0;

      _totalQuantity += quantity;
      _totalPrice += price;
      _totalValue += value;
    }
  }
Widget _buildTotals() {
  return Container(
    padding: EdgeInsets.all(AppSize.padding2(context)),
    child:                     
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('الإجمالي (ريال):', style: bodyFont,),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: AppSize.padding20(context)),
          child: Text('-', style: bodyFont,),
        ),
        Padding(
          padding: EdgeInsets.only(right: AppSize.padding20(context)-10),
          child: Text(_totalQuantity.toString(), style: bodyFont),
        ),
        Padding(
          padding: EdgeInsets.only(right: AppSize.padding20(context)-9),
          child: Text(_totalPrice.toString(), style: bodyFont),
        ),
        Padding(
          padding: EdgeInsets.only(right: AppSize.padding20(context)-10),
          child: Text(_totalValue.toString(), style: bodyFont,),
        ),
      ],
    ),

  );
}
}
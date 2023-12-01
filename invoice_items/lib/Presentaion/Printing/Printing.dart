import 'package:flutter/services.dart';
import 'package:invoice_items/Data/Model/InvoicesModel/InvoiceData.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

import '../../Data/Model/ItemsModel/ItemData.dart';

PdfColor white= const PdfColor.fromInt(0xFFFFFFFF);
PdfColor teal = const PdfColor.fromInt(0xFF009688);
PdfColor gray = const PdfColor.fromInt(0xFFB4B4B3);
double? sizeTitle=35;
double? sizeSubTitle=30;
double? sizeBody=35;
void createPdf({required InvoiceData invoiceData,required int itemCounts,required List<ItemData> items}) async{
  final font = await rootBundle.load('assets/fonts/Hacen Tunisia.ttf');
  final ttf = pw.Font.ttf(font);
  final doc = pw.Document();
  doc.addPage(
      pw.Page(
        theme: pw.ThemeData.withFont(base:ttf ),
          pageFormat: PdfPageFormat.a3,
          build: (pw.Context context)
          {
            return pw.Directionality(
                textDirection: pw.TextDirection.rtl,
                child: pw. Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                  child: pw.Text(
                      'بيانات الفاتورة :',
                      style: pw.TextStyle(font: ttf,fontSize: sizeTitle,fontWeight: FontWeight.bold)
                  ),
                ),
                  headerBuild(invoice: invoiceData, quantity: itemCounts),
                pw.Padding(
                  padding: const pw.EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                  child: pw.Text(
                      'أصناف الفاتورة :',
                      style: pw.TextStyle(font: ttf,fontSize: sizeTitle,fontWeight: FontWeight.bold)
                  ),
                ),
            customTable(itemsData: items),
                customTable(itemsData: items)
              ],
            ));
          } )
  ); await Printing.layoutPdf(onLayout: (PdfPageFormat format) => doc.save()); }

///headerBuild:
pw.Container headerBuild({required InvoiceData invoice,required int quantity}){
  return  pw.Container(
      decoration: const pw.BoxDecoration(
          color: PdfColor.fromInt(0xFF009688),
          borderRadius:pw.BorderRadius.only(
              bottomLeft:pw.Radius.circular(20),
              bottomRight:pw.Radius.circular(20)
          )
      ),
      child:pw.Padding(
        padding:const pw.EdgeInsets.symmetric(vertical:30,horizontal: 30 ),
        child: pw.Column(
            mainAxisSize: pw.MainAxisSize.min,
            children: [
              pw.Column(
                  mainAxisSize: pw.MainAxisSize.max,
                  children: [
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text('رقم الفاتورة:',style:  pw.TextStyle(fontSize: sizeSubTitle,)),
                        pw.Text(invoice.invoiceNumber.toString(),style: pw.TextStyle(fontSize: sizeSubTitle,color:white)),
                      ],
                    ),
                    pw.Divider(),
                    pw.SizedBox(height:5,),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text('العملة:',style:  pw.TextStyle(fontSize: sizeSubTitle,)),
                        pw.Text(invoice.coins,style:  pw.TextStyle(fontSize: sizeSubTitle,color: white)),
                      ],
                    ),
                    pw.Divider(),
                    pw.SizedBox(height: 10,),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text('تاريخ الفاتورة:',style:  pw.TextStyle(fontSize: sizeSubTitle)),
                        pw.Text(invoice.invoiceDate,style: pw.TextStyle(fontSize: sizeSubTitle,color:white)),
                      ],
                    ),
                    pw.Divider(),
                    pw.SizedBox(height: 10,),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text('عدد الأصناف:   ',style:  pw.TextStyle(fontSize: sizeSubTitle,)),
                        pw.Text(quantity.toString(),style: pw.TextStyle(fontSize: sizeSubTitle,color:white)),
                      ],
                    ),
                    pw.Divider(),
                    pw.SizedBox(height: 10,),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,//FFFFFF
                      children: [
                        pw.Text('الإجمالي:    ',style:  pw.TextStyle(fontSize: sizeSubTitle,)),
                        pw.Text('(${invoice.total})${invoice.coins}',style: pw.TextStyle(fontSize: sizeSubTitle,color:white)),
                      ],
                    ),
                  ]
              )] ),
      )
  );
}
///customTable:
// pw.Table customTable({required List<ItemData> itemsData}) {
//   const double cellPadding = 20.0; // Adjust the padding value as needed
//       int i=0;
//   // Function to generate the header row
//   pw.TableRow buildHeaderRow() {
//     return pw.TableRow(
//       decoration: pw.BoxDecoration(color: teal),
//       children: [
//         pw.Padding(
//           padding: const pw.EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//           child: pw.Text('القيمة', style: pw.TextStyle(fontSize: sizeSubTitle)),
//         ),
//         pw.Padding(
//           padding: const pw.EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//           child: pw.Text('السعر', style: pw.TextStyle(fontSize: sizeSubTitle)),
//         ),
//         pw.Padding(
//           padding: const pw.EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//           child: pw.Text('الكمية', style: pw.TextStyle(fontSize: sizeSubTitle)),
//         ),
//         pw.Padding(
//           padding: const pw.EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//           child: pw.Text('الوحدة', style: pw.TextStyle(fontSize: sizeSubTitle)),
//         ),
//         pw.Padding(
//           padding: const pw.EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//           child: pw.Text('اسم الصنف', style: pw.TextStyle(fontSize: sizeSubTitle)),
//         ),
//       ],
//     );
//   }
//   return pw.Table(
//     border: pw.TableBorder.all(
//       color: gray,
//       width: 2,
//     ),
//     columnWidths: {
//       0: const pw.FlexColumnWidth(1),
//       1: const pw.FlexColumnWidth(1),
//       2: const pw.FlexColumnWidth(1),
//       3: const pw.FlexColumnWidth(1),
//       4: const pw.FlexColumnWidth(1),
//     },
//     children: [
//       buildHeaderRow(), // Use the function to generate the header row
//       for (var item in itemsData)
//         pw.TableRow(
//           children: [
//             pw.Padding(
//               padding: const pw.EdgeInsets.all(cellPadding),
//               child: pw.Text(item.value.toString(), style: pw.TextStyle(fontSize: sizeBody)),
//             ),
//             pw.Padding(
//               padding: const pw.EdgeInsets.all(cellPadding),
//               child: pw.Text(item.itemPrice.toString(), style: pw.TextStyle(fontSize: sizeBody)),
//             ),
//             pw.Padding(
//               padding: const pw.EdgeInsets.all(cellPadding),
//               child: pw.Text(item.itemQuantity.toString(), style: pw.TextStyle(fontSize: sizeBody)),
//             ),
//             pw.Padding(
//               padding: const pw.EdgeInsets.all(cellPadding),
//               child: pw.Text(item.itemUnit, style: pw.TextStyle(fontSize: sizeBody)),
//             ),
//             pw.Padding(
//               padding: const pw.EdgeInsets.all(cellPadding),
//               child: pw.Text(item.productName, style: pw.TextStyle(fontSize: sizeBody)),
//             ),
//           ],
//         ),
//     ],
//   );
// }
pw.Table customTable({required List<ItemData> itemsData}) {
  const double cellPadding = 20.0; // Adjust the padding value as needed

  // Create the header row
  final pw.TableRow headerRow = pw.TableRow(
    decoration: pw.BoxDecoration(color: teal),
    children: [
      pw.Padding(
        padding: const pw.EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: pw.Text('القيمة', style: pw.TextStyle(fontSize: sizeSubTitle)),
      ),
      pw.Padding(
        padding: const pw.EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: pw.Text('السعر', style: pw.TextStyle(fontSize: sizeSubTitle)),
      ),
      pw.Padding(
        padding: const pw.EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: pw.Text('الكمية', style: pw.TextStyle(fontSize: sizeSubTitle)),
      ),
      pw.Padding(
        padding: const pw.EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: pw.Text('الوحدة', style: pw.TextStyle(fontSize: sizeSubTitle)),
      ),
      pw.Padding(
        padding: const pw.EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: pw.Text('اسم الصنف', style: pw.TextStyle(fontSize: sizeSubTitle)),
      ),
    ],
  );

  return pw.Table(
    border: pw.TableBorder.all(
      color: gray,
      width: 2,
    ),
    columnWidths: {
      0: const pw.FlexColumnWidth(1),
      1: const pw.FlexColumnWidth(1),
      2: const pw.FlexColumnWidth(1),
      3: const pw.FlexColumnWidth(1),
      4: const pw.FlexColumnWidth(1),
    },
    children: [
      headerRow, // Use the header row for the first row
      for (var item in itemsData)
        pw.TableRow(
          children: [
            for (var i = 0; i < 5; i++)
              pw.Padding(
                padding: const pw.EdgeInsets.all(cellPadding),
                child: pw.Text(
                  i == 0 ? item.value.toString() :
                  i == 1 ? item.itemPrice.toString() :
                  i == 2 ? item.itemQuantity.toString() :
                  i == 3 ? item.itemUnit :
                  item.productName,
                  style: pw.TextStyle(fontSize: sizeBody),
                ),
              ),
          ],
        ),
    ],
  );
}



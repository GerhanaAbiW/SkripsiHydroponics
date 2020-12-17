import 'package:flutter/material.dart';
import 'package:hydroponics/core/Models/Cart.dart';
import 'package:hydroponics/core/Models/Order.dart';
import 'package:hydroponics/core/Providers/AppProvider.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:hydroponics/core/Providers/HydroOrderProvider.dart';
import 'package:hydroponics/core/Providers/OrderProvider.dart';
import 'package:hydroponics/core/Providers/UserProvider.dart';
import 'package:hydroponics/features/MenuAdmin/DashBoard/SmallCard.dart';
import 'package:provider/provider.dart';

class NewAdminDashboard extends StatefulWidget {
  @override
  _NewAdminDashboardState createState() => _NewAdminDashboardState();
}

class _NewAdminDashboardState extends State<NewAdminDashboard> {
  List<charts.Series<Task, String>> _seriesPieData;

  int user = 0;
  double revenue = 0;
  int transaction = 0;
  int hydroMarket=0;
  int hydroOrder=0;

  int _bibit = 0;
  int _obat = 0;
  int _pupuk = 0;
  int _alat = 0;

 void getAllCards(){
   user = Provider.of<UserProvider>(context,listen: false).listUserModel.length;
   revenue = Provider.of<OrderProvider>(context,listen: false).revenue + Provider.of<HydroOrderProvider>(context,listen: false).revenue;
   transaction = Provider.of<OrderProvider>(context,listen: false).buyers.length + Provider.of<HydroOrderProvider>(context,listen: false).buyers.length;
   hydroOrder = Provider.of<HydroOrderProvider>(context,listen: false).buyers.length;
   hydroMarket = Provider.of<OrderProvider>(context,listen: false).sales;
 }

  getCategory() {
    List<CartItemModel> cart;
    for (int i = 1; i < Provider.of<OrderProvider>(context,listen: false).buyers.length; i++) {
      if (Provider.of<OrderProvider>(context,listen: false).buyers[i].cart != null || Provider.of<OrderProvider>(context,listen: false).buyers[i].cart != []) {
        Provider.of<OrderProvider>(context,listen: false).buyers[i].cart = cart;
        if (cart[i].productCategory == "Bibit") {
          _bibit = _bibit + 1;
        } else if (cart[i].productCategory == "Pupuk") {
          _pupuk = _pupuk + 1;
        } else if (cart[i].productCategory == "Obat") {
          _obat = _obat + 1;
        } else if (cart[i].productCategory == "Alat") {
          _alat = _alat + 1;
        }
      }else{
        print("haha");
      }
    }

    //notifyListeners();
  }
  @override
  void initState() {
    super.initState();


    _seriesPieData = List<charts.Series<Task, String>>();
    _getData();
  }

  _getData() {
    var piedata = [
      new Task('Bibit', 35.8, Color(0xff3366cc)),
      new Task('Obat', 8.3, Color(0xff990099)),
      new Task('Pupuk', 10.8, Color(0xff109618)),
      new Task('Alat', 15.6, Color(0xfffdbe19)),
      //new Task('HydroOrder', 19.2, Color(0xffff9900)),
      //new Task('Other', 10.3, Color(0xffdc3912)),
    ];

    _seriesPieData.add(
      charts.Series(
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Air Pollution',
        data: piedata,
        labelAccessorFn: (Task row, _) => '${row.taskvalue}',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserProvider>(context);
    final order = Provider.of<OrderProvider>(context);
    // order.getSales();
    // order.getCategory();
    // order.getRevenue();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: 'Revenue\n',
                  style: TextStyle(fontSize: 35, color: Colors.grey)),
              TextSpan(
                  text: '\Rp. $revenue',
                  style: TextStyle(
                      fontSize: 55,
                      color: Colors.black,
                      fontWeight: FontWeight.w300)),
            ]),
          ),
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SmallCard(
                color2: Colors.indigo,
                color1: Colors.blue,
                icon: Icons.person_outline,
                value: user.listUserModel.length,
                title: 'User',
              ),
              SizedBox(
                width: 1,
              ),
              SmallCard(
                color2: Colors.green,
                color1: Colors.greenAccent,
                icon: Icons.monetization_on,
                value: transaction,
                title: 'Transaction',
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SmallCard(
              color2: Colors.deepOrange,
              color1: Colors.deepOrangeAccent,
              icon: Icons.shopping_basket,
              value: hydroMarket,
              title: 'Hydro Market',
            ),
            SmallCard(
              color2: Colors.black,
              color1: Colors.black87,
              icon: Icons.shopping_basket,
              value: hydroOrder,
              title: 'Hydro Order',
            ),
          ],
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Sales per category',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
        Expanded(
          child: Center(
            // child: Padding(
            //   padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[400],
                        offset: Offset(1.0, 1.0),
                        blurRadius: 4)
                  ]),
              width: MediaQuery.of(context).size.width / 1.2,
              height: MediaQuery.of(context).size.height - 550,
              child: Center(
                child: ListTile(
                  title: charts.PieChart(_seriesPieData,
                      animate: true,
                      animationDuration: Duration(seconds: 3),
                      behaviors: [
                        new charts.DatumLegend(
                          outsideJustification:
                              charts.OutsideJustification.endDrawArea,
                          // horizontalFirst: false,
                          desiredMaxRows: 2,
                          cellPadding:
                              new EdgeInsets.only(right: 4.0, bottom: 4.0),
                        )
                      ],
                      defaultRenderer: new charts.ArcRendererConfig(
                          //arcWidth: 30,
                          arcRendererDecorators: [
                            new charts.ArcLabelDecorator(
                                labelPosition: charts.ArcLabelPosition.inside)
                          ])),
                ),
              ),
            ),
            // ),
          ),
        )
      ],
    );
  }
}

class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}

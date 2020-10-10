import 'package:flutter/material.dart';
import 'package:hydroponics/features/MenuMyPlants/ListRecordDetailPlant.dart';

class WidgetListRecordDate extends StatelessWidget {
  final date;

  WidgetListRecordDate({this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70, //MediaQuery.of(context).size.height / 9,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
        child: Card(
          elevation: 10.0,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ListRecordDetailPlant()));
            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(date,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.date_range)),
                ]),
          ),
        ));
  }
}

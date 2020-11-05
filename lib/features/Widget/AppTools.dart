import 'dart:io';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:hydroponics/core/Constants/Colors.dart';
import 'package:select_form_field/select_form_field.dart';

Widget appButton(
    {String btnTxt,
    double btnPadding,
    Color btnColor,
    VoidCallback onBtnclicked}) {
  btnTxt == null ? btnTxt == "App Button" : btnTxt;
  btnPadding == null ? btnPadding = 0.0 : btnPadding;
  btnColor == null ? btnColor = Colors.black : btnColor;

  return Padding(
    padding: new EdgeInsets.all(btnPadding),
    child: new RaisedButton(
      color: GreenTosca,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.all(new Radius.circular(15.0))),
      onPressed: onBtnclicked,
      child: Container(
        height: 50.0,
        child: new Center(
          child: new Text(
            btnTxt,
            style: new TextStyle(color: btnColor, fontSize: 18.0),
          ),
        ),
      ),
    ),
  );
}

Widget FormTextField(
    {String textLabel,
    String textHint,
    double height,
    TextEditingController controller,
    TextInputType textType}) {
  textLabel == null ? textLabel = "Enter Title" : textLabel;
  textHint == null ? textHint = "Enter Hint" : textHint;
  height == null ? height = 50.0 : height;
  //height !=null

  return new Padding(
    padding: const EdgeInsets.only(left: 0, right: 0),
    child: new TextFormField(
      controller: controller,
      keyboardType: textType == null ? TextInputType.text : textType,
      decoration: new InputDecoration(
        contentPadding: EdgeInsets.all(12),
        //contentPadding: EdgeInsets.only(),
        labelText: textLabel,
        labelStyle: TextStyle(color: Colors.green),
        hintText: textHint,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.green,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
      ),
    ),
  );
}

Widget DateFormField(
    {String textLabel,
    String textHint,
    double height,
    TextEditingController controller,
    TextInputType textType}) {
  textLabel == null ? textLabel = "Enter Title" : textLabel;
  textHint == null ? textHint = "Enter Hint" : textHint;
  height == null ? height = 50.0 : height;
  //height !=null

  return new Padding(
    padding: const EdgeInsets.only(left: 0, right: 0),
    child: new DateTimePicker(
      firstDate: DateTime(1901, 1),
      lastDate: DateTime(2100),
      controller: controller,
      
      dateMask: 'dd MMM, yyyy',
      type: DateTimePickerType.date,
      decoration: new InputDecoration(
        contentPadding: EdgeInsets.all(12),
        //contentPadding: EdgeInsets.only(),
        suffixIcon: Icon(
          Icons.calendar_today,
          color: Colors.green,
        ),
        labelText: textLabel,
        labelStyle: TextStyle(color: Colors.green),
        hintText: textHint,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.green,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
      ),
    ),
  );
}

Widget DropdownForm(
    {String textLabel,
    String textHint,
    String selectedItem,
    double height,
    TextEditingController controller,
    List<Map<String, dynamic>> dropDownItems,
    ValueChanged<String> changedDropDownItems,
    TextInputType textType}) {
  textLabel == null ? textLabel = "Enter Title" : textLabel;
  textHint == null ? textHint = "Enter Hint" : textHint;
  height == null ? height = 50.0 : height;
  //height !=null

  return new Padding(
      padding: const EdgeInsets.only(left: 0.0, right: 0.0),
      child: SelectFormField(
        //titleText: textLabel,
        enableInteractiveSelection: true,
        labelText: textLabel,
        hintText: textHint,
        decoration: new InputDecoration(
          contentPadding: EdgeInsets.all(12),
          //contentPadding: EdgeInsets.only(),
          suffixIcon: Container(
            width: 10,
            margin: EdgeInsets.all(0),
            child: FlatButton(
              onPressed: () {},
              child: Icon(Icons.arrow_drop_down),
            ),
          ),
          labelText: textLabel,
          labelStyle: TextStyle(color: Colors.green),
          hintText: textHint,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.green,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.blue,
              width: 2.0,
            ),
          ),
        ),
        items: dropDownItems,
        //value: selectedItem,
        //dataSource: dropDownItems,
        onChanged: changedDropDownItems,
      ));
}

Widget MultilineFormTextField(
    {String textLabel,
    String textHint,
    double height,
    TextEditingController controller,
    TextInputType textType}) {
  textLabel == null ? textLabel = "Enter Title" : textLabel;
  textHint == null ? textHint = "Enter Hint" : textHint;
  //height == null ? height = 50.0 : height;
  //height !=null

  return new Padding(
    padding: const EdgeInsets.only(left: 0, right: 0),
    child: new TextFormField(
      controller: controller,
      keyboardType: textType == null ? TextInputType.text : textType,
      maxLines: 5,
      minLines: 1,
      decoration: new InputDecoration(
        contentPadding:
            new EdgeInsets.symmetric(vertical: 35.0, horizontal: 10.0),

        //contentPadding: EdgeInsets.only(),
        labelText: textLabel,
        labelStyle: TextStyle(color: Colors.green),
        hintText: textHint,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.green,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
      ),
    ),
  );
}

Widget FormDropDown(
    {String selectedItem,
    String hintText,
    String labelText,
    List<DropdownMenuItem<String>> dropDownItems,
    ValueChanged<String> changedDropDownItems}) {
  labelText == null ? labelText = "Enter Title" : labelText;

  return new Padding(
    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
    child: FormField(builder: (FormFieldState state) {
      return InputDecorator(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(11),
          //contentPadding: EdgeInsets.only(),
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.green),
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.green,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.blue,
              width: 2.0,
            ),
          ),
        ),
        child: Container(
          height: 30,
          child: new DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: new DropdownButton(
                hint: Text(
                  hintText,
                  style: TextStyle(color: Colors.green),
                ),
                value: selectedItem,
                items: dropDownItems,
                onChanged: changedDropDownItems,
              ),
            ),
          ),
        ),
      );
    }),
  );
}

Widget MultiImagePickerMap(
    {Map<int, File> imageList,
    VoidCallback addNewImage(int position),
    VoidCallback removeNewImage(int position)}) {
  int imageLength = imageList.isEmpty ? 1 : imageList.length + 1;
  bool isNull = imageList.isEmpty ? true : false;

  print("Image length is $imageLength");

  return new Padding(
    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
    child: new SizedBox(
      height: 150.0,
      child: new ListView.builder(
          itemCount: imageLength,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return imageList.isEmpty || imageList[index] == null
                ? new Padding(
                    padding: new EdgeInsets.only(left: 3.0, right: 3.0),
                    child: new GestureDetector(
                      onTap: () {
                        addNewImage(index);
                      },
                      child: new Container(
                        width: 150.0,
                        height: 150.0,
                        child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            new Icon(
                              Icons.image,
                              size: 150.0,
                              color: Theme.of(context).primaryColor,
                            ),
                            new Icon(
                              Icons.add_circle,
                              size: 25.0,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(15.0)),
                        ),
                      ),
                    ),
                  )
                : new Padding(
                    padding: new EdgeInsets.only(left: 3.0, right: 3.0),
                    child: new Stack(
                      children: <Widget>[
                        new Container(
                          width: 150.0,
                          height: 150.0,
                          decoration: new BoxDecoration(
                              color: Colors.grey.withAlpha(100),
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(15.0)),
                              image: new DecorationImage(
                                  fit: BoxFit.cover,
                                  image: new FileImage(imageList[index]))),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: new CircleAvatar(
                            backgroundColor: Colors.red[600],
                            child: new IconButton(
                                icon: new Icon(
                                  Icons.clear,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  removeNewImage(index);
                                }),
                          ),
                        )
                      ],
                    ),
                  );
          }),
    ),
  );
}

Widget MultiImagePickerList(
    {List<File> imageList, VoidCallback removeNewImage(int position)}) {
  return new Padding(
    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
    child: imageList == null || imageList.length == 0
        ? new Container()
        : new SizedBox(
            height: 150.0,
            child: new ListView.builder(
                itemCount: imageList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return new Padding(
                    padding: new EdgeInsets.only(left: 3.0, right: 3.0),
                    child: new Stack(
                      children: <Widget>[
                        new Container(
                          width: 150.0,
                          height: 150.0,
                          decoration: new BoxDecoration(
                              color: Colors.grey.withAlpha(100),
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(15.0)),
                              image: new DecorationImage(
                                  fit: BoxFit.cover,
                                  image: new FileImage(imageList[index]))),
                        ),
                        new Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: new CircleAvatar(
                            backgroundColor: Colors.red[600],
                            child: new IconButton(
                                icon: new Icon(
                                  Icons.clear,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  removeNewImage(index);
                                }),
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
  );
}

Widget buildImages({int index, Map imagesMap}) {
  return imagesMap.isEmpty
      ? new Container(
          width: 150.0,
          height: 150.0,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              new Icon(
                Icons.image,
                size: 100.0,
                color: Colors.white,
              ),
              new Icon(
                Icons.add_circle,
                color: Colors.grey,
              ),
            ],
          ),
          decoration: new BoxDecoration(
            color: Colors.grey.withAlpha(100),
          ),
        )
      : imagesMap[index] != null
          ? new Container(
              width: 150.0,
              height: 150.0,
              decoration: new BoxDecoration(
                  color: Colors.grey.withAlpha(100),
                  image: new DecorationImage(
                      fit: BoxFit.cover,
                      image: new FileImage(imagesMap[index]))),
            )
          : new Container(
              width: 150.0,
              height: 150.0,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  new Icon(
                    Icons.image,
                    size: 100.0,
                    color: Colors.white,
                  ),
                  new Icon(
                    Icons.add_circle,
                    color: Colors.grey,
                  ),
                ],
              ),
              decoration: new BoxDecoration(
                color: Colors.grey.withAlpha(100),
              ),
            );
}

List<DropdownMenuItem<String>> buildAndGetDropDownItems(List size) {
  List<DropdownMenuItem<String>> items = new List();
  for (String size in size) {
    items.add(new DropdownMenuItem(value: size, child: new Text(size)));
  }
  return items;
}

showSnackBar(String message, final scaffoldKey) {
  scaffoldKey.currentState.showSnackBar(new SnackBar(
    backgroundColor: Colors.red[600],
    content: new Text(
      message,
      style: new TextStyle(color: Colors.white),
    ),
  ));
}

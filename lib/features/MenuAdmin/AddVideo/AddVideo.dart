import 'package:flutter/material.dart';
import 'package:hydroponics/core/Services/VideoServices.dart';
import 'package:hydroponics/core/constants/App_Text_Style.dart';
import 'package:hydroponics/core/constants/Colors.dart';
import 'package:hydroponics/features/Widget/AppTools.dart';
import 'package:intl/intl.dart';

class AddVideoView extends StatefulWidget {
  @override
  _AddVideoViewState createState() => _AddVideoViewState();
}

class _AddVideoViewState extends State<AddVideoView> {
  bool isTrue = false;
  Radius topLeft;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController linkController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController dateController = new TextEditingController();
  VideoService videoService = VideoService();
  bool isLoading = false;
  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        dateController.value = TextEditingValue(
            text: DateFormat('dd/MM/yyyy').format(picked).toString());
      });
  }

  void validateAndUpload() async {
    if (_formKey.currentState.validate()) {
      setState(() => isLoading = true);
      videoService.uploadVideo({
        "video": linkController.text,
        "title": titleController.text,
        "author": authorController.text,
        "date": dateController.text,
        "description": descController.text,
      });
      _formKey.currentState.reset();
      setState(() => isLoading = false);
      Navigator.pop(context);
    } else {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  'Lengkapi Data Untuk Video',
                  style: CustomTextStyle.textFormFieldBold
                      .copyWith(color: Colors.black, fontSize: 15),
                ),
                SizedBox(
                  height: 16,
                ),
                FormTextField(
                    textLabel: "Link Video",
                    textHint: "Masukkan Link Video",
                    controller: linkController),
                SizedBox(
                  height: 16,
                ),
                FormTextField(
                    textLabel: "Judul Video",
                    textHint: "Masukkan Judul Video",
                    controller: titleController),
                SizedBox(
                  height: 16,
                ),
                DateFormField(
                    textLabel: 'Tanggal Video',
                    textHint: 'Tanggal Video',
                    controller: dateController),
                SizedBox(
                  height: 16,
                ),
                FormTextField(
                    textLabel: "Creator",
                    textHint: "Masukkan Nama Creator",
                    controller: titleController),
                SizedBox(
                  height: 16,
                ),
                MultilineFormTextField(
                    controller: descController,
                    textHint: "Masukkan Deskripsi Video",
                    textLabel: "Deskripsi Video",
                    height: 10),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    validateAndUpload();
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: GreenTosca,
                      borderRadius: BorderRadius.all(
                        Radius.circular(80),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Add Video",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



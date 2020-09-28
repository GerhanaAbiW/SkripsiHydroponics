import 'package:flutter/material.dart';
import 'package:hydroponics/core/constants/App_Text_Style.dart';
import 'package:hydroponics/core/constants/Colors.dart';
import 'package:hydroponics/core/constants/Costumized_Text_Field.dart';

class AddPlantView extends StatefulWidget {
  @override
  _AddPlantViewState createState() => _AddPlantViewState();
}

class _AddPlantViewState extends State<AddPlantView> {
  bool isTrue = false;

  @override
  void initState() {
    super.initState();

    // Provider.of<NewPatientRegistrationViewModel>(context, listen: false).init();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   unFocus(context);
      // },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: GreenTosca,
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Add Plant',
            style: CustomTextStyle.textFormFieldBold
                .copyWith(color: Colors.white, fontSize: 21),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        'Lengkapi Kriteria Tumbuhan',
                        style: CustomTextStyle.textFormFieldBold
                            .copyWith(color: Colors.black, fontSize: 15),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CustomizedTextField(
                        label: 'Nama Tumbuhan',
                        //controller: model.nameController
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CustomizedTextField(
                        label: 'Media Semai',
                        //controller: model.nameController
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CustomizedTextField(
                        label: 'Waktu Semai',
                        //controller: model.nameController
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CustomizedTextField(
                        label: 'PH Ideal',
                        //controller: model.nameController
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CustomizedTextField(
                        label: 'PPM Ideal',
                        //controller: model.nameController
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CustomizedTextField(
                        label: 'Jenis Pupuk',
                        //controller: model.nameController
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CustomizedTextField(
                        label: 'Dosis Pupuk',
                        //controller: model.nameController
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CustomizedTextField(
                        label: 'Waktu Pemberian Pupuk Tahap 1',
                        //controller: model.nameController
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CustomizedTextField(
                        label: 'Waktu Pemberian Pupuk Tahap 2',
                        //controller: model.nameController
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CustomizedTextField(
                        label: 'Waktu Pemberian Pupuk Tahap 3',
                        //controller: model.nameController
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CustomizedTextField(
                        label: 'Waktu Panen',
                        //controller: model.nameController
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      CustomizedTextField(
                        label: 'Jenis Hama',
                        //controller: model.nameController
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () {
                            //disini
                          },
                          child: Container(
                            width: double.infinity,
                            height: 40,
                            decoration: BoxDecoration(
                              color: GreenTosca,
                              // gradient: LinearGradient(
                              //     colors: [
                              //       GreenTosca,
                              //       green,
                              //       CustomColors.COLOR_GREEN
                              //     ],
                              //     end: Alignment.centerLeft,
                              //     begin: Alignment.centerRight),
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "Add Plant",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

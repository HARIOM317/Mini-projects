import 'package:aadhar/utils/constants.dart';
import 'package:aadhar/widget/get_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Variable to change User Image on Aadhar Card
  String? profilePic;
  bool isImageSelect = false;
  late File imageFile;

  // Variable to change QR Code on Aadhar Card
  String? qrPic;
  bool isQRSelect = false;
  late File qrFile;

  // Variables for First Page Details
  String name = GetDetailsPage1.name.text;
  String fatherName = GetDetailsPage1.fatherName.text;
  String gender = GetDetailsPage1.selectedGender!;
  String dob = GetDetailsPage1.dob.text;
  String townOrCityName = GetDetailsPage1.townOrCity.text;
  String districtName = GetDetailsPage1.district.text;
  String? stateName = GetDetailsPage1.selectedState;
  String pinCode = GetDetailsPage1.pinCode.text;

  // Variables for Second Page Details
  String hindiName = GetDetailsPage2.hindiName.text;
  String hindiFatherName = GetDetailsPage2.hindiFatherName.text;
  String hindiGender = GetDetailsPage2.selectedHindiGender!;
  String hindiTownOrCityName = GetDetailsPage2.hindiTownOrCity.text;
  String hindiDistrictName = GetDetailsPage2.hindiDistrict.text;
  String? hindiStateName = GetDetailsPage2.selectedHindiState;

  // Variables for Third Page Details
  String phoneNumber = GetDetailsPage3.phoneNumber.text;
  String enrolmentNumber = GetDetailsPage3.enrolmentNumber.text;
  String aadharNumber = GetDetailsPage3.aadharNumber.text;
  String vid = GetDetailsPage3.vid.text;

  @override
  Widget build(BuildContext context) {
    // Building Scaffold to Preview the PDF File
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: primaryColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
                "Aadhar Preview",
                style: TextStyle(
                    color: primaryColor,
                    fontFamily: 'OpenSans-Regular',
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
      ),
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              // Template
              Image.asset("assets/images/aadhar.png"),

              // Todo: --- SECTION-1 ---
              // Enrolment Number
              Positioned(
                  top: 160.5,
                  left: 108,
                  child: Text(
                    enrolmentNumber,
                    style: const TextStyle(fontSize: 7, color: Colors.black),
                  )),

              // Hindi Name
              Positioned(
                  top: 177,
                  left: 44,
                  child: Text(
                    hindiName,
                    style: const TextStyle(fontSize: 5, color: Colors.black),
                  )),

              // English Name
              Positioned(
                  top: 183,
                  left: 44,
                  child: Text(
                    name,
                    style: const TextStyle(fontSize: 5.5, color: Colors.black),
                  )),

              // Father's Name
              Positioned(
                  top: 189,
                  left: 44,
                  child: Text(
                    "S/O: $fatherName",
                    style: const TextStyle(fontSize: 5.5, color: Colors.black),
                  )),

              // Town or City Name
              Positioned(
                  top: 195,
                  left: 44,
                  child: Text(
                    townOrCityName,
                    style: const TextStyle(fontSize: 5.5, color: Colors.black),
                  )),

              // Address
              Positioned(
                  top: 201,
                  left: 44,
                  child: Text(
                    "$districtName $stateName - $pinCode",
                    style: const TextStyle(fontSize: 5.5, color: Colors.black),
                  )),

              // Phone Number
              Positioned(
                  top: 207,
                  left: 44,
                  child: Text(
                    phoneNumber,
                    style: const TextStyle(fontSize: 5.5, color: Colors.black),
                  )),

              // Todo: --- SECTION-2 ---
              // QR Image
              Positioned(
                  top: 250,
                  left: 115,
                  child: GestureDetector(
                    onTap: () async {
                      isQRSelect = true;
                      final XFile? pickImage = await ImagePicker().pickImage(
                          source: ImageSource.gallery, imageQuality: 100);

                      if (pickImage != null) {
                        setState(() {
                          qrPic = pickImage.path;
                          qrFile = File(qrPic!);
                        });
                      }
                    },
                    child: Container(
                        width: 52,
                        height: 52,
                        color: Colors.white,
                        child: qrPic == null
                            ? const Icon(
                                CupertinoIcons.qrcode,
                                size: 50,
                                color: Colors.black,
                              )
                            : SizedBox(
                                width: 34,
                                height: 40,
                                child: Image.file(
                                  qrFile,
                                  fit: BoxFit.cover,
                                ),
                              )),
                  )),

              // Aadhar Number
              Positioned(
                  top: 316.6,
                  left: 67,
                  child: Text(
                    aadharNumber,
                    style: const TextStyle(fontSize: 10.5, color: Colors.black),
                  )),

              // VID
              Positioned(
                  top: 326,
                  left: 81,
                  child: Text(
                    vid,
                    style: const TextStyle(fontSize: 5.6, color: Colors.black),
                  )),

              // Todo: --- SECTION-3 ---
              // User Image
              Positioned(
                  top: 370,
                  left: 34,
                  child: GestureDetector(
                    onTap: () async {
                      isImageSelect = true;
                      final XFile? pickImage = await ImagePicker().pickImage(
                          source: ImageSource.gallery, imageQuality: 100);

                      if (pickImage != null) {
                        setState(() {
                          profilePic = pickImage.path;
                          imageFile = File(profilePic!);
                        });
                      }
                    },
                    child: Container(
                        width: 34,
                        height: 40,
                        color: Colors.white,
                        child: profilePic == null
                            ? const Icon(
                                CupertinoIcons.person,
                                size: 35,
                                color: Colors.black,
                              )
                            : SizedBox(
                                width: 34,
                                height: 40,
                                child: Image.file(
                                  imageFile,
                                  fit: BoxFit.cover,
                                ),
                              )),
                  )),

              // Hindi Name
              Positioned(
                  top: 371,
                  left: 74,
                  child: Text(
                    hindiName,
                    style: const TextStyle(fontSize: 5, color: Colors.black),
                  )),

              // English Name
              Positioned(
                  top: 376.5,
                  left: 74,
                  child: Text(
                    name,
                    style: const TextStyle(fontSize: 5.2, color: Colors.black),
                  )),

              // DOB
              Positioned(
                  top: 382,
                  left: 74,
                  child: Text(
                    "जन्म तिथि/DOB: $dob",
                    style: const TextStyle(fontSize: 5.2, color: Colors.black),
                  )),

              // Gender
              Positioned(
                  top: 387.5,
                  left: 74,
                  child: Text(
                    "$hindiGender/ $gender",
                    style: const TextStyle(fontSize: 5.2, color: Colors.black),
                  )),

              // Aadhar Number
              Positioned(
                  top: 428,
                  left: 72,
                  child: Text(
                    aadharNumber,
                    style: const TextStyle(
                        fontSize: 8,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )),

              // VID
              Positioned(
                  top: 435.5,
                  left: 70,
                  child: Text(
                    "VID : $vid",
                    style: const TextStyle(fontSize: 5.5, color: Colors.black),
                  )),

              // Todo: --- SECTION-4 ---
              // Address Label
              const Positioned(
                  top: 366,
                  left: 187,
                  child: Text(
                    "पता:",
                    style: TextStyle(
                        fontSize: 4.5,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )),

              // Father's name and city name in hindi
              Positioned(
                  top: 370.5,
                  left: 187,
                  child: Text(
                    "$hindiFatherName, $hindiTownOrCityName",
                    style: const TextStyle(fontSize: 4.5, color: Colors.black),
                  )),

              // district name in hindi
              Positioned(
                  top: 375,
                  left: 187,
                  child: Text(
                    hindiDistrictName,
                    style: const TextStyle(fontSize: 4.5, color: Colors.black),
                  )),

              // state name and pin code in hindi
              Positioned(
                  top: 379.5,
                  left: 187,
                  child: Text(
                    "$hindiStateName - $pinCode",
                    style: const TextStyle(fontSize: 4.5, color: Colors.black),
                  )),

              // Father's name and city name in english
              Positioned(
                  top: 391,
                  left: 187,
                  child: Text(
                    "$fatherName, $townOrCityName",
                    style: const TextStyle(fontSize: 5.5, color: Colors.black),
                  )),

              // district name in english
              Positioned(
                  top: 396,
                  left: 187,
                  child: Text(
                    districtName,
                    style: const TextStyle(fontSize: 5.5, color: Colors.black),
                  )),

              // state name and pin code in english
              Positioned(
                  top: 401,
                  left: 187,
                  child: Text(
                    "$stateName - $pinCode",
                    style: const TextStyle(fontSize: 5.5, color: Colors.black),
                  )),

              // QR Image
              Positioned(
                  top: 371.5,
                  left: 278,
                  child: GestureDetector(
                    onTap: () async {
                      isQRSelect = true;
                      final XFile? pickImage = await ImagePicker().pickImage(
                          source: ImageSource.gallery, imageQuality: 100);

                      if (pickImage != null) {
                        setState(() {
                          qrPic = pickImage.path;
                          qrFile = File(qrPic!);
                        });
                      }
                    },
                    child: Container(
                        width: 52,
                        height: 52,
                        color: Colors.white,
                        child: qrPic == null
                            ? const Icon(
                                CupertinoIcons.qrcode,
                                size: 50,
                                color: Colors.black,
                              )
                            : SizedBox(
                                width: 34,
                                height: 40,
                                child: Image.file(
                                  qrFile,
                                  fit: BoxFit.cover,
                                ),
                              )),
                  )),

              // Aadhar Number
              Positioned(
                  top: 428,
                  left: 234,
                  child: Text(
                    aadharNumber,
                    style: const TextStyle(
                        fontSize: 8,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )),

              // VID
              Positioned(
                  top: 435.5,
                  left: 244.5,
                  child: Text(
                    vid,
                    style: const TextStyle(fontSize: 5.5, color: Colors.black),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
